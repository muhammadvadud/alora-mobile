import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:alora_mobile/core/sse/sse_event.dart';
import 'package:alora_mobile/core/utils/paginated.dart';
import 'package:alora_mobile/features/chat/application/chat_notifier.dart';
import 'package:alora_mobile/features/chat/application/providers.dart' as chat_providers;
import 'package:alora_mobile/features/chat/domain/entities/message.dart';
import 'package:alora_mobile/features/chat/domain/repositories/chat_repository.dart';
import 'package:alora_mobile/features/customer_mode/application/providers.dart' as cm_providers;

class MockChatRepository extends Mock implements ChatRepository {}

Message _message(
  String id,
  MessageRole role,
  String content,
  DateTime createdAt, {
  MessageStatus status = MessageStatus.done,
}) {
  return Message(
    id: id,
    role: role,
    content: content,
    createdAt: createdAt,
    status: status,
  );
}

void main() {
  late MockChatRepository repo;
  late StreamController<SseEvent> sseController;
  late ProviderContainer container;

  final base = DateTime.utc(2026, 1, 1, 12);
  DateTime at(int minutes) => base.add(Duration(minutes: minutes));

  ProviderContainer buildContainer() {
    return ProviderContainer(
      overrides: [
        chat_providers.chatRepositoryProvider.overrideWithValue(repo),
        cm_providers.customerModeEnabledProvider.overrideWithValue(false),
      ],
    );
  }

  setUp(() {
    repo = MockChatRepository();
    sseController = StreamController<SseEvent>.broadcast();

    when(() => repo.getCachedMessages(any())).thenAnswer((_) async => []);
    when(
      () => repo.sendMessage(
        any(),
        any(),
        any(),
        any(),
        any(),
        cancelToken: any(named: 'cancelToken'),
      ),
    ).thenAnswer((_) => sseController.stream);
    when(() => repo.parseToolResult(any(), any()))
        .thenReturn(const RichBlock.toolChip(tool: 'unknown', state: ToolChipState.done));
  });

  tearDown(() {
    container.dispose();
    if (!sseController.isClosed) {
      unawaited(sseController.close());
    }
  });

  /// Barcha xabarlar qat'iy kamayuvchi `createdAt` tartibida (yangi birinchi).
  void expectNewestFirst(List<Message> messages) {
    for (var i = 1; i < messages.length; i++) {
      final previous = messages[i - 1].createdAt;
      final current = messages[i].createdAt;
      expect(
        previous.isBefore(current),
        isFalse,
        reason: 'messages[$i] (${messages[i].id}) tartibdan tashqarida',
      );
    }
  }

  group('Kesh + server birlashuvi', () {
    test('kesh va server dedupe qilinadi, hech biri yo\'qolmaydi, tartib createdAt bo\'yicha',
        () async {
      // Keshda eski nusxa: m2, m1 (yangi birinchi).
      when(() => repo.getCachedMessages('conv-merge')).thenAnswer(
        (_) async => [
          _message('m2', MessageRole.user, 'Ikkinchi', at(2)),
          _message('m1', MessageRole.user, 'Birinchi', at(1)),
        ],
      );
      // Server: m3 (yangi), m2 (kesh bilan bir xil id), m1 (kesh bilan bir xil id).
      when(() => repo.getMessages('conv-merge', cursor: null)).thenAnswer(
        (_) async => Paginated(
          next: null,
          previous: null,
          results: [
            _message('m3', MessageRole.assistant, 'Uchinchi', at(3)),
            _message('m2', MessageRole.user, 'Ikkinchi', at(2)),
            _message('m1', MessageRole.user, 'Birinchi', at(1)),
          ],
        ),
      );

      container = buildContainer();
      container.read(chatProvider('conv-merge').notifier);
      await Future<void>.delayed(const Duration(milliseconds: 20));

      final state = container.read(chatProvider('conv-merge'));
      expect(state.messages.map((m) => m.id), ['m3', 'm2', 'm1']);
      expect(state.messages, hasLength(3));
      expectNewestFirst(state.messages);
    });

    test('ayni id uchun server nusxasi keshdan ustun turadi (server asosiy)', () async {
      when(() => repo.getCachedMessages('conv-stale')).thenAnswer(
        (_) async => [
          _message('m1', MessageRole.assistant, 'ESKI matn', at(1)),
        ],
      );
      when(() => repo.getMessages('conv-stale', cursor: null)).thenAnswer(
        (_) async => Paginated(
          next: null,
          previous: null,
          results: [
            _message('m1', MessageRole.assistant, 'YANGI matn', at(1)),
          ],
        ),
      );

      container = buildContainer();
      container.read(chatProvider('conv-stale').notifier);
      await Future<void>.delayed(const Duration(milliseconds: 20));

      final state = container.read(chatProvider('conv-stale'));
      expect(state.messages, hasLength(1));
      expect(state.messages.single.content, 'YANGI matn');
    });

    test('optimistik temp xabar server tasdiqlagach almashtiriladi, dublikat qolmaydi', () async {
      final historyCompleter = Completer<Paginated<Message>>();
      when(() => repo.getMessages('conv-temp', cursor: null))
          .thenAnswer((_) => historyCompleter.future);

      container = buildContainer();
      final notifier = container.read(chatProvider('conv-temp').notifier);
      await Future<void>.delayed(Duration.zero);

      // Server hali javob bermaganda foydalanuvchi yozadi (optimistik juftlik).
      unawaited(notifier.sendMessage('Salom'));
      await Future<void>.delayed(Duration.zero);
      sseController.add(const SseEvent.content('Salomga javob'));
      sseController.add(const SseEvent.done());
      await Future<void>.delayed(const Duration(milliseconds: 60));

      // Serverda allaqachon saqlangan juftlik qaytadi.
      historyCompleter.complete(
        Paginated(
          next: null,
          previous: null,
          results: [
            _message('real-a', MessageRole.assistant, 'Salomga javob', at(2)),
            _message('real-u', MessageRole.user, 'Salom', at(1)),
          ],
        ),
      );
      await Future<void>.delayed(const Duration(milliseconds: 20));

      final state = container.read(chatProvider('conv-temp'));
      // Temp nusxalar server nusxalari bilan almashtirildi.
      expect(state.messages.any((m) => m.id.startsWith('temp_')), isFalse);
      final greetings = state.messages.where((m) => m.content == 'Salom');
      expect(greetings, hasLength(1));
      expect(greetings.single.id, 'real-u');
      expect(state.messages.map((m) => m.id), ['real-a', 'real-u']);
    });
  });

  group('Pagination', () {
    const page2Cursor = 'https://api/v1/conversations/conv-page/messages/?cursor=PAGE2';
    const page3Cursor = 'https://api/v1/conversations/conv-page/messages/?cursor=PAGE3';

    test('sahifalar to\'g\'ri joylashadi va barchasi yagona tartibda qoladi', () async {
      when(() => repo.getMessages('conv-page', cursor: null)).thenAnswer(
        (_) async => Paginated(
          next: page2Cursor,
          previous: null,
          results: [
            _message('p1-3', MessageRole.user, '1-3', at(6)),
            _message('p1-2', MessageRole.assistant, '1-2', at(5)),
            _message('p1-1', MessageRole.user, '1-1', at(4)),
          ],
        ),
      );
      when(() => repo.getMessages('conv-page', cursor: page2Cursor)).thenAnswer(
        (_) async => Paginated(
          next: page3Cursor,
          previous: null,
          results: [
            _message('p2-3', MessageRole.user, '2-3', at(3)),
            _message('p2-2', MessageRole.assistant, '2-2', at(2)),
            _message('p2-1', MessageRole.user, '2-1', at(1)),
          ],
        ),
      );
      when(() => repo.getMessages('conv-page', cursor: page3Cursor)).thenAnswer(
        (_) async => Paginated(
          next: null,
          previous: null,
          results: [
            _message('p3-1', MessageRole.user, '3-1', at(0)),
          ],
        ),
      );

      container = buildContainer();
      final notifier = container.read(chatProvider('conv-page').notifier);
      await Future<void>.delayed(const Duration(milliseconds: 20));

      expect(container.read(chatProvider('conv-page')).nextCursor, page2Cursor);

      await notifier.loadOlderMessages();
      expect(container.read(chatProvider('conv-page')).nextCursor, page3Cursor);

      await notifier.loadOlderMessages();
      final state = container.read(chatProvider('conv-page'));
      expect(state.nextCursor, isNull);
      expect(state.isLoadingOlder, isFalse);

      expect(
        state.messages.map((m) => m.id),
        ['p1-3', 'p1-2', 'p1-1', 'p2-3', 'p2-2', 'p2-1', 'p3-1'],
      );
      expectNewestFirst(state.messages);

      // nextCursor null bo'lgach birinchi sahifadan tashqari so'rov yuborilmaydi.
      await notifier.loadOlderMessages();
      verify(() => repo.getMessages('conv-page', cursor: null)).called(1);
    });
  });

  group('Yangi yuborilgan xabar', () {
    test('tarix yuklangach yuborilgan xabar ro\'yxat boshida (pastda) qoladi', () async {
      when(() => repo.getMessages('conv-send', cursor: null)).thenAnswer(
        (_) async => Paginated(
          next: null,
          previous: null,
          results: [
            _message('h2', MessageRole.assistant, 'Eski javob', at(2)),
            _message('h1', MessageRole.user, 'Eski savol', at(1)),
          ],
        ),
      );

      container = buildContainer();
      final notifier = container.read(chatProvider('conv-send').notifier);
      await Future<void>.delayed(const Duration(milliseconds: 20));
      expect(container.read(chatProvider('conv-send')).messages, hasLength(2));

      unawaited(notifier.sendMessage('Yangi savol'));
      await Future<void>.delayed(Duration.zero);

      var state = container.read(chatProvider('conv-send'));
      expect(state.messages[0].role, MessageRole.assistant);
      expect(state.messages[1].content, 'Yangi savol');
      expect(state.messages.map((m) => m.id).toList().sublist(2), ['h2', 'h1']);
      expectNewestFirst(state.messages);

      sseController.add(const SseEvent.content('Yangi javob'));
      sseController.add(const SseEvent.done());
      await Future<void>.delayed(const Duration(milliseconds: 60));

      state = container.read(chatProvider('conv-send'));
      expect(state.messages[0].content, 'Yangi javob');
      expect(state.messages.map((m) => m.id).toList().sublist(2), ['h2', 'h1']);
      expectNewestFirst(state.messages);
    });

    test('tarix kechikib kelsa ham yuborilgan xabar boshida qoladi', () async {
      final historyCompleter = Completer<Paginated<Message>>();
      when(() => repo.getMessages('conv-race', cursor: null))
          .thenAnswer((_) => historyCompleter.future);

      container = buildContainer();
      final notifier = container.read(chatProvider('conv-race').notifier);
      await Future<void>.delayed(Duration.zero);

      unawaited(notifier.sendMessage('Yangi savol'));
      await Future<void>.delayed(Duration.zero);

      historyCompleter.complete(
        Paginated(
          next: null,
          previous: null,
          results: [
            _message('h2', MessageRole.assistant, 'Eski javob', at(2)),
            _message('h1', MessageRole.user, 'Eski savol', at(1)),
          ],
        ),
      );
      await Future<void>.delayed(const Duration(milliseconds: 20));

      final state = container.read(chatProvider('conv-race'));
      expect(state.messages[0].role, MessageRole.assistant);
      expect(state.messages[1].content, 'Yangi savol');
      expect(state.messages.map((m) => m.id).toList().sublist(2), ['h2', 'h1']);
      expectNewestFirst(state.messages);
    });
  });
}
