import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:alora_mobile/core/sse/sse_event.dart';
import 'package:alora_mobile/core/utils/paginated.dart';
import 'package:alora_mobile/features/chat/application/chat_notifier.dart';
import 'package:alora_mobile/features/chat/application/chat_state.dart';
import 'package:alora_mobile/features/chat/domain/entities/message.dart';
import 'package:alora_mobile/features/chat/domain/repositories/chat_repository.dart';
import 'package:alora_mobile/features/chat/application/providers.dart' as chat_providers;
import 'package:alora_mobile/features/customer_mode/application/providers.dart' as cm_providers;

class MockChatRepository extends Mock implements ChatRepository {}

void main() {
  late MockChatRepository mockRepo;
  late StreamController<SseEvent> sseController;
  late ProviderContainer container;

  setUp(() {
    mockRepo = MockChatRepository();
    sseController = StreamController<SseEvent>.broadcast();

    // Yuklash oqimga xalaqit bermasligi uchun getMessages'ni kutmaymiz
    // (alohida "Yuklash" testida real natija stublanadi).
    final pendingLoad = Completer<Paginated<Message>>();
    when(() => mockRepo.getMessages(any(), cursor: any(named: 'cursor')))
        .thenAnswer((_) => pendingLoad.future);

    when(
      () => mockRepo.sendMessage(
        any(),
        any(),
        any(),
        any(),
        any(),
        cancelToken: any(named: 'cancelToken'),
      ),
    ).thenAnswer((_) => sseController.stream);

    when(() => mockRepo.parseToolResult(any(), any()))
        .thenReturn(const RichBlock.toolChip(tool: 'unknown', state: ToolChipState.done));

    container = ProviderContainer(
      overrides: [
        chat_providers.chatRepositoryProvider.overrideWithValue(mockRepo),
        cm_providers.customerModeEnabledProvider.overrideWithValue(false),
      ],
    );
  });

  tearDown(() {
    // Avval container disposable — bunda onDispose _activeStream'ni bekor qiladi,
    // keyin controller yopilganda onDone'dan keyingi state yozuvi xavfsiz bo'lmaydi.
    container.dispose();
    if (!sseController.isClosed) {
      sseController.close();
    }
  });

  ChatState readState(String conversationId) => container.read(chatProvider(conversationId));

  // Har bir SSE xabarining throttle (50 ms) commit qilinishini kafolatlash
  Future<void> chunkGap() => Future<void>.delayed(const Duration(milliseconds: 60));

  group('Holat o\'tishlari', () {
    test('Boshlang\'ich holat — bo\'sh xabarlar, streaming yo\'q', () {
      final state = readState('conv-1');
      expect(state.messages, isEmpty);
      expect(state.isStreaming, isFalse);
      expect(state.error, isNull);
    });

    test('start → content×3 → done — oxirgi xabar content va done holatiga o\'tadi', () async {
      final notifier = container.read(chatProvider('conv-1').notifier);

      when(
        () => mockRepo.sendMessage(
          any(),
          any(),
          any(),
          any(),
          any(),
          cancelToken: any(named: 'cancelToken'),
        ),
      ).thenAnswer((_) => sseController.stream);

      // Start sending in background
      unawaited(notifier.sendMessage('Salom'));

      // Wait for stream to be set up
      await Future<void>.delayed(Duration.zero);

      // Emit events — har biri o'rtasida 50 ms throttle commit kutamiz
      sseController.add(const SseEvent.start());
      await chunkGap();
      sseController.add(const SseEvent.content('Salom '));
      await chunkGap();
      sseController.add(const SseEvent.content('dunyo'));
      await chunkGap();
      sseController.add(const SseEvent.content('!'));
      await chunkGap();
      sseController.add(const SseEvent.done());
      await chunkGap();
      // Oqim yopilishi — onDone: isStreaming=false va user done
      await sseController.close();

      // Let the throttle timer fire
      await Future<void>.delayed(const Duration(milliseconds: 100));

      final state = readState('conv-1');
      expect(state.isStreaming, isFalse);
      expect(state.messages, hasLength(2));

      final assistantMsg = state.messages.firstWhere((m) => m.role == MessageRole.assistant);
      expect(assistantMsg.content, 'Salom dunyo!');
      expect(assistantMsg.status, MessageStatus.done);

      final userMsg = state.messages.firstWhere((m) => m.role == MessageRole.user);
      expect(userMsg.content, 'Salom');
      expect(userMsg.status, MessageStatus.done);
    });

    test('tool_call → tool_result — richBlocks yangilanadi', () async {
      final notifier = container.read(chatProvider('conv-2').notifier);

      when(
        () => mockRepo.sendMessage(
          any(),
          any(),
          any(),
          any(),
          any(),
          cancelToken: any(named: 'cancelToken'),
        ),
      ).thenAnswer((_) => sseController.stream);

      unawaited(notifier.sendMessage('Hisobla'));
      await Future<void>.delayed(Duration.zero);

      sseController.add(const SseEvent.start());
      sseController.add(const SseEvent.toolCall('curtain_calculate'));
      await chunkGap();
      sseController.add(const SseEvent.toolResult('curtain_calculate', '{}'));
      await chunkGap();
      sseController.add(const SseEvent.done());

      await Future<void>.delayed(const Duration(milliseconds: 100));

      final state = readState('conv-2');
      final assistantMsg = state.messages.firstWhere((m) => m.role == MessageRole.assistant);

      expect(assistantMsg.richBlocks, hasLength(2));
      expect(assistantMsg.richBlocks[0], isA<RichBlock>());

      final chip = assistantMsg.richBlocks[0];
      chip.maybeWhen(
        toolChip: (tool, chipState, resultText, rawArgs, rawResult) {
          expect(tool, 'curtain_calculate');
          expect(chipState, ToolChipState.done);
        },
        orElse: () => fail('Birinchi block toolChip bo\'lishi kerak'),
      );
    });

    test('content — qisman matn to\'planadi', () async {
      final notifier = container.read(chatProvider('conv-3').notifier);

      when(
        () => mockRepo.sendMessage(
          any(),
          any(),
          any(),
          any(),
          any(),
          cancelToken: any(named: 'cancelToken'),
        ),
      ).thenAnswer((_) => sseController.stream);

      unawaited(notifier.sendMessage('Test'));
      await Future<void>.delayed(Duration.zero);

      sseController.add(const SseEvent.content('Bir'));
      await chunkGap();
      sseController.add(const SseEvent.content(' '));
      await chunkGap();
      sseController.add(const SseEvent.content('ikki'));
      await chunkGap();
      sseController.add(const SseEvent.done());

      await Future<void>.delayed(const Duration(milliseconds: 100));

      final state = readState('conv-3');
      final assistant = state.messages.firstWhere((m) => m.role == MessageRole.assistant);
      expect(assistant.content, 'Bir ikki');
    });
  });

  group('50 ms throttle', () {
    test('100 ta content chunk — state yangilanishi ≤ 3 ta har 50 ms', () async {
      final notifier = container.read(chatProvider('throttle-1').notifier);

      when(
        () => mockRepo.sendMessage(
          any(),
          any(),
          any(),
          any(),
          any(),
          cancelToken: any(named: 'cancelToken'),
        ),
      ).thenAnswer((_) => sseController.stream);

      unawaited(notifier.sendMessage('Test'));
      await Future<void>.delayed(Duration.zero);

      int stateUpdateCount = 0;
      final sub = container.listen<ChatState>(
        chatProvider('throttle-1'),
        (_, _) => stateUpdateCount++,
      );

      // 100 ta content chunk tez ketma-ket yuboriladi
      for (var i = 0; i < 100; i++) {
        sseController.add(const SseEvent.content('x'));
      }
      sseController.add(const SseEvent.done());

      // Throttle commit uchun 50 ms va zahira kutamiz
      await Future<void>.delayed(const Duration(milliseconds: 250));

      final state = readState('throttle-1');
      final assistant = state.messages.firstWhere((m) => m.role == MessageRole.assistant);
      expect(assistant.status, MessageStatus.done);
      // 100 ta chunk uchun commit soni 3 dan oshmaydi (throttle birlashadi)...
      expect(stateUpdateCount, lessThanOrEqualTo(3));
      // ...lekin birorta chunk yo'qolmaydi (bufer, §3.4).
      expect(assistant.content, 'x' * 100);

      sub.close();
    });
  });

  group('Xatolik holatlari', () {
    test('Stream xatosi — qisman matn saqlanadi + error', () async {
      final notifier = container.read(chatProvider('err-1').notifier);

      when(
        () => mockRepo.sendMessage(
          any(),
          any(),
          any(),
          any(),
          any(),
          cancelToken: any(named: 'cancelToken'),
        ),
      ).thenAnswer((_) => sseController.stream);

      unawaited(notifier.sendMessage('Test'));
      await Future<void>.delayed(Duration.zero);

      sseController.add(const SseEvent.content('Qisman'));
      await chunkGap();
      sseController.add(const SseEvent.content(' matn'));
      await chunkGap();
      sseController.addError('Tarmoq xatosi');
      await Future<void>.delayed(const Duration(milliseconds: 100));

      final state = readState('err-1');
      expect(state.isStreaming, isFalse);
      expect(state.error, isNotNull);

      final assistant = state.messages.firstWhere((m) => m.role == MessageRole.assistant);
      expect(assistant.content, 'Qisman matn');
      expect(assistant.status, MessageStatus.error);
    });

    test(
      'error SSE event — assistant xabari error, state.error to\'ldiriladi, oqim to\'xtaydi',
      () async {
        final notifier = container.read(chatProvider('err-2').notifier);

        when(
          () => mockRepo.sendMessage(
            any(),
            any(),
            any(),
            any(),
            any(),
            cancelToken: any(named: 'cancelToken'),
          ),
        ).thenAnswer((_) => sseController.stream);

        unawaited(notifier.sendMessage('Xato test'));
        await Future<void>.delayed(Duration.zero);

        sseController.add(const SseEvent.error('Server xatosi'));
        await Future<void>.delayed(const Duration(milliseconds: 100));

        final state = readState('err-2');
        final assistant = state.messages.firstWhere((m) => m.role == MessageRole.assistant);
        expect(assistant.status, MessageStatus.error);
        expect(state.error, isNotNull);
        expect(state.isStreaming, isFalse);
      },
    );
  });

  group('Retry', () {
    test('retry — oxirgi user xabarini qayta yuboradi', () async {
      final notifier = container.read(chatProvider('retry-1').notifier);

      // First send
      when(
        () => mockRepo.sendMessage(
          any(),
          any(),
          any(),
          any(),
          any(),
          cancelToken: any(named: 'cancelToken'),
        ),
      ).thenAnswer((_) => sseController.stream);

      unawaited(notifier.sendMessage('Birinchi xabar'));
      await Future<void>.delayed(Duration.zero);

      // Dart stream xatosi (onError → _handleError to'g'ri ishlaydi)
      sseController.addError('Xato');
      await Future<void>.delayed(const Duration(milliseconds: 100));

      final stateBefore = readState('retry-1');
      expect(stateBefore.error, isNotNull);
      expect(stateBefore.isStreaming, isFalse);

      // Second send (retry)
      final sseController2 = StreamController<SseEvent>.broadcast();
      when(
        () => mockRepo.sendMessage(
          any(),
          any(),
          any(),
          any(),
          any(),
          cancelToken: any(named: 'cancelToken'),
        ),
      ).thenAnswer((_) => sseController2.stream);

      unawaited(notifier.sendMessage('Birinchi xabar'));
      await Future<void>.delayed(Duration.zero);

      sseController2.add(const SseEvent.done());
      await Future<void>.delayed(const Duration(milliseconds: 100));
      // Oqim yopilishi onDone → _handleDone: isStreaming=false, user done
      await sseController2.close();
      await Future<void>.delayed(const Duration(milliseconds: 100));
      // Birinchi (xato bo'lgan) oqimni ham yopamiz — leaked subscription onDone
      // container dispose'dan oldin ishlashi uchun.
      await sseController.close();
      await Future<void>.delayed(const Duration(milliseconds: 100));

      final stateAfter = readState('retry-1');
      expect(stateAfter.error, isNull);
      expect(stateAfter.isStreaming, isFalse);

      // Verify the same content was sent
      final sentMessages = stateAfter.messages.where((m) => m.role == MessageRole.user).toList();
      expect(sentMessages.length, 2);
      expect(sentMessages.every((m) => m.content == 'Birinchi xabar'), isTrue);

      await sseController2.close();
    });
  });

  group('retryLast', () {
    test("xato bo'lgan javob o'chiriladi, oxirgi user xabari 1 marta qayta yuboriladi", () async {
      final notifier = container.read(chatProvider('retry-2').notifier);
      when(
        () => mockRepo.sendMessage(
          any(),
          any(),
          any(),
          any(),
          any(),
          cancelToken: any(named: 'cancelToken'),
        ),
      ).thenAnswer((_) => sseController.stream);

      unawaited(notifier.sendMessage('Parda kerak'));
      await Future<void>.delayed(Duration.zero);
      sseController.addError('Uzilish');
      await Future<void>.delayed(const Duration(milliseconds: 100));
      expect(readState('retry-2').error, isNotNull);

      final sseController2 = StreamController<SseEvent>.broadcast();
      when(
        () => mockRepo.sendMessage(
          any(),
          any(),
          any(),
          any(),
          any(),
          cancelToken: any(named: 'cancelToken'),
        ),
      ).thenAnswer((_) => sseController2.stream);

      unawaited(notifier.retryLast());
      await Future<void>.delayed(Duration.zero);
      sseController2.add(const SseEvent.content('Albatta'));
      sseController2.add(const SseEvent.done());
      await sseController2.close();
      await sseController.close();
      await Future<void>.delayed(const Duration(milliseconds: 100));

      final state = readState('retry-2');
      expect(state.error, isNull);
      // Xato bo'lgan juftlik o'chirilgan: faqat 1 user + 1 assistant xabar.
      final users = state.messages.where((m) => m.role == MessageRole.user);
      expect(users.length, 1);
      expect(users.single.content, 'Parda kerak');
      expect(state.messages.any((m) => m.status == MessageStatus.error), isFalse);
      verify(
        () => mockRepo.sendMessage(
          any(),
          'Parda kerak',
          any(),
          any(),
          any(),
          cancelToken: any(named: 'cancelToken'),
        ),
      ).called(2);
    });
  });

  group('CancelToken', () {
    test('cancelStream — cancelToken bekor qilinadi', () async {
      final notifier = container.read(chatProvider('cancel-1').notifier);

      when(
        () => mockRepo.sendMessage(
          any(),
          any(),
          any(),
          any(),
          any(),
          cancelToken: any(named: 'cancelToken'),
        ),
      ).thenAnswer((_) => sseController.stream);

      unawaited(notifier.sendMessage('Bekor qilinadi'));
      await Future<void>.delayed(Duration.zero);

      expect(readState('cancel-1').isStreaming, isTrue);

      notifier.cancelStream();

      expect(readState('cancel-1').isStreaming, isFalse);
    });
  });

  group('Quick replies', () {
    test('sendMessage — quickReplies tozalanadi', () async {
      final notifier = container.read(chatProvider('qr-1').notifier);

      when(
        () => mockRepo.sendMessage(
          any(),
          any(),
          any(),
          any(),
          any(),
          cancelToken: any(named: 'cancelToken'),
        ),
      ).thenAnswer((_) => sseController.stream);

      unawaited(notifier.sendMessage('Test'));
      await Future<void>.delayed(Duration.zero);

      final state = readState('qr-1');
      expect(state.quickReplies, isEmpty);
    });
  });

  group('Dispose', () {
    test('Container dispose — xatoliksiz', () {
      final localContainer = ProviderContainer(
        overrides: [
          chat_providers.chatRepositoryProvider.overrideWithValue(mockRepo),
          cm_providers.customerModeEnabledProvider.overrideWithValue(false),
        ],
      );
      localContainer.read(chatProvider('dispose-test').notifier);
      // Should not throw
      localContainer.dispose();
    });
  });

  group('Tool args', () {
    test('toolArgs — oxirgi toolChip block rawArgs ni yangilaydi', () async {
      final notifier = container.read(chatProvider('args-1').notifier);

      when(
        () => mockRepo.sendMessage(
          any(),
          any(),
          any(),
          any(),
          any(),
          cancelToken: any(named: 'cancelToken'),
        ),
      ).thenAnswer((_) => sseController.stream);

      unawaited(notifier.sendMessage('Hisobla'));
      await Future<void>.delayed(Duration.zero);

      sseController.add(const SseEvent.toolCall('product_search'));
      await chunkGap();
      sseController.add(const SseEvent.toolArgs('product_search', '{"query":"velvet"}'));
      await chunkGap();
      sseController.add(const SseEvent.done());

      await Future<void>.delayed(const Duration(milliseconds: 100));

      final state = readState('args-1');
      final assistant = state.messages.firstWhere((m) => m.role == MessageRole.assistant);
      final chipBlock = assistant.richBlocks.first;
      chipBlock.maybeWhen(
        toolChip: (tool, chipState, resultText, rawArgs, rawResult) {
          expect(rawArgs, '{"query":"velvet"}');
        },
        orElse: () => fail('Block toolChip bo\'lishi kerak'),
      );
    });
  });

  group('resetConversation', () {
    test('reset — state tozalanadi', () async {
      final notifier = container.read(chatProvider('reset-1').notifier);

      when(() => mockRepo.resetConversation(any())).thenAnswer((_) async {});

      // First send a message
      when(
        () => mockRepo.sendMessage(
          any(),
          any(),
          any(),
          any(),
          any(),
          cancelToken: any(named: 'cancelToken'),
        ),
      ).thenAnswer((_) => sseController.stream);

      unawaited(notifier.sendMessage('Test'));
      await Future<void>.delayed(Duration.zero);

      sseController.add(const SseEvent.done());
      await Future<void>.delayed(const Duration(milliseconds: 100));

      // Now reset
      await notifier.resetConversation();

      final state = readState('reset-1');
      expect(state.messages, isEmpty);
      expect(state.isStreaming, isFalse);
      expect(state.error, isNull);
    });
  });

  group('Done — user xabar status', () {
    test('done event + oqim yopilishi — user xabari done, streaming tugaydi', () async {
      final notifier = container.read(chatProvider('done-1').notifier);

      when(
        () => mockRepo.sendMessage(
          any(),
          any(),
          any(),
          any(),
          any(),
          cancelToken: any(named: 'cancelToken'),
        ),
      ).thenAnswer((_) => sseController.stream);

      unawaited(notifier.sendMessage('Test xabar'));
      await Future<void>.delayed(Duration.zero);

      sseController.add(const SseEvent.done());
      await chunkGap();
      // Stream yopilsa onDone → _handleDone (user done, isStreaming false)
      await sseController.close();
      await Future<void>.delayed(const Duration(milliseconds: 100));

      final state = readState('done-1');
      expect(state.isStreaming, isFalse);

      final userMsg = state.messages.firstWhere((m) => m.role == MessageRole.user);
      expect(userMsg.status, MessageStatus.done);

      final assistant = state.messages.firstWhere((m) => m.role == MessageRole.assistant);
      expect(assistant.status, MessageStatus.done);
    });
  });

  group('Yuklash (loadMessages)', () {
    test('Tarix yuklanishi birinchi yuborilgan xabarlarni ustidan yozmaydi', () async {
      final historyCompleter = Completer<Paginated<Message>>();
      final loadRepo = MockChatRepository();
      when(() => loadRepo.getMessages(any(), cursor: any(named: 'cursor')))
          .thenAnswer((_) => historyCompleter.future);
      when(
        () => loadRepo.sendMessage(
          any(),
          any(),
          any(),
          any(),
          any(),
          cancelToken: any(named: 'cancelToken'),
        ),
      ).thenAnswer((_) => const Stream<SseEvent>.empty());

      final container2 = ProviderContainer(
        overrides: [
          chat_providers.chatRepositoryProvider.overrideWithValue(loadRepo),
          cm_providers.customerModeEnabledProvider.overrideWithValue(false),
        ],
      );
      final notifier = container2.read(chatProvider('load-race-1').notifier);

      unawaited(notifier.sendMessage('Birinchi xabar'));
      await Future<void>.delayed(Duration.zero);

      historyCompleter.complete(const Paginated<Message>(next: null, previous: null, results: []));
      await Future<void>.delayed(const Duration(milliseconds: 20));

      final loadedState = container2.read(chatProvider('load-race-1'));
      expect(loadedState.messages, hasLength(2));
      expect(loadedState.messages.any((message) => message.content == 'Birinchi xabar'), isTrue);

      container2.dispose();
    });

    test('Xabarlar yuklanadi', () async {
      final loadRepo = MockChatRepository();
      when(() => loadRepo.getMessages(any(), cursor: any(named: 'cursor'))).thenAnswer(
        (_) async => Paginated<Message>(
          next: null,
          previous: null,
          results: [
            Message(
              id: 'msg-1',
              role: MessageRole.user,
              content: 'Salom',
              createdAt: DateTime(2026),
              status: MessageStatus.done,
            ),
          ],
        ),
      );

      final container2 = ProviderContainer(
        overrides: [
          chat_providers.chatRepositoryProvider.overrideWithValue(loadRepo),
          cm_providers.customerModeEnabledProvider.overrideWithValue(false),
        ],
      );

      // load'ni ishga tushirish (build → _loadMessages)
      container2.read(chatProvider('load-1'));

      // Wait for async load
      await Future<void>.delayed(const Duration(milliseconds: 100));

      final loadedState = container2.read(chatProvider('load-1'));
      expect(loadedState.messages, hasLength(1));
      expect(loadedState.messages.first.content, 'Salom');

      container2.dispose();
    });
  });

  group('Quick replies done keyin', () {
    test('quickReplies bo\'sh qaytadi', () async {
      final notifier = container.read(chatProvider('qr-done').notifier);

      when(
        () => mockRepo.sendMessage(
          any(),
          any(),
          any(),
          any(),
          any(),
          cancelToken: any(named: 'cancelToken'),
        ),
      ).thenAnswer((_) => sseController.stream);

      unawaited(notifier.sendMessage('Variantlar'));
      await Future<void>.delayed(Duration.zero);

      sseController.add(const SseEvent.done());
      await Future<void>.delayed(const Duration(milliseconds: 100));

      final state = readState('qr-done');
      // quickReplies is emptied on send, and done event doesn't populate them
      // in current implementation (quick_replies not parsed from done)
      expect(state.quickReplies, isEmpty);
    });
  });
}
