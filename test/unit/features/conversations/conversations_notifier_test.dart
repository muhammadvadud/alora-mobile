import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:alora_mobile/core/error/failure.dart';
import 'package:alora_mobile/features/conversations/application/conversations_notifier.dart';
import 'package:alora_mobile/features/conversations/application/conversations_state.dart';
import 'package:alora_mobile/features/conversations/application/providers.dart';
import 'package:alora_mobile/features/conversations/domain/entities/conversation.dart';
import 'package:alora_mobile/features/conversations/domain/entities/conversation_stage.dart';

import 'conversations_test_helpers.dart';

void main() {
  late ProviderContainer container;
  late FakeConversationsRepository repository;

  setUp(() {
    repository = FakeConversationsRepository();
    container = ProviderContainer(
      overrides: [
        conversationsRepositoryProvider.overrideWithValue(repository),
      ],
    );
    addTearDown(container.dispose);
  });

  ConversationsState state() => container.read(conversationsProvider);

  ConversationsNotifier notifier() =>
      container.read(conversationsProvider.notifier);

  test('boshlang\'ich holat initial bo\'ladi', () {
    expect(state().maybeWhen(initial: () => true, orElse: () => false), isTrue);
  });

  test('yuklash: repository chaqiriladi va loaded bo\'ladi', () async {
    repository.listResult = ([testConversation(id: 'c1', title: 'Ali')], null);

    state(); // provider yaratilishi
    await pumpEventQueue();

    expect(repository.listCalls, 1);
    expect(
      state().maybeWhen(
        loaded: (items, _, _, _, _) =>
            items.length == 1 && items.first.title == 'Ali',
        orElse: () => false,
      ),
      isTrue,
    );
  });

  test('bo\'sh ro\'yxat -> empty holat', () async {
    state();
    await pumpEventQueue();

    expect(
      state().maybeWhen(empty: (_, _) => true, orElse: () => false),
      isTrue,
    );
  });

  test('xatolik -> error holat va retry qayta yuklaydi', () async {
    repository.listFailure = const Failure.network();
    state();
    await pumpEventQueue();

    expect(
      state().maybeWhen(error: (_, _, _) => true, orElse: () => false),
      isTrue,
    );

    repository.listFailure = null;
    repository.listResult = ([testConversation()], null);

    await notifier().retry();
    await pumpEventQueue();

    expect(repository.listCalls, 2);
    expect(
      state().maybeWhen(loaded: (_, _, _, _, _) => true, orElse: () => false),
      isTrue,
    );
  });

  test('qidiruv 300ms debounce bilan repository chaqiradi', () async {
    repository.listResult = (
      [testConversation(), testConversation(id: 'c2')],
      null,
    );
    state();
    await pumpEventQueue();

    notifier().search('ali');
    notifier().search('aliy');
    notifier().search('alisher');
    expect(repository.listCalls, 1); // debounce davomida chaqiruv yo'q

    await Future<void>.delayed(const Duration(milliseconds: 350));
    await pumpEventQueue();

    expect(repository.listCalls, 2);
    expect(repository.lastSearch, 'alisher');
  });

  test('setFilter client-side filtrlaydi (hasOrder)', () async {
    repository.listResult = (
      [
        testConversation(id: 'a', orderId: 'o1'),
        testConversation(id: 'b', title: 'B', stage: ConversationStage.order),
      ],
      null,
    );
    state();
    await pumpEventQueue();

    notifier().setFilter(ConversationFilterType.hasOrder);

    final filtered = state().maybeWhen(
      loaded: (items, _, _, _, filterType) =>
          applyConversationFilter(items, filterType),
      orElse: () => <Conversation>[],
    );
    expect(filtered.length, 1);
    expect(filtered.first.id, 'a');
  });

  test('archive optimistic — ro\'yxatdan darhol olib tashlanadi', () async {
    repository.listResult = (
      [testConversation(id: 'a'), testConversation(id: 'b')],
      null,
    );
    state();
    await pumpEventQueue();

    await notifier().archive('a');

    final remaining = state().maybeWhen(
      loaded: (items, _, _, _, _) => items,
      orElse: () => <Conversation>[],
    );
    expect(remaining.map((c) => c.id), ['b']);
    expect(repository.archiveCalls, 1);
    expect(repository.lastArchivedId, 'a');
  });

  test('create yangi suhbatni ro\'yxat boshiga qo\'yadi', () async {
    repository.listResult = ([testConversation(id: 'a')], null);
    state();
    await pumpEventQueue();

    repository.createResult = testConversation(id: 'new');

    final id = await notifier().create();

    expect(id, 'new');
    final items = state().maybeWhen(
      loaded: (items, _, _, _, _) => items,
      orElse: () => <Conversation>[],
    );
    expect(items.first.id, 'new');
  });

  test('keyingi sahifa loadMore orqali yuklanadi', () async {
    repository.listResult = ([testConversation(id: 'a')], 'cursor-1');
    state();
    await pumpEventQueue();

    final before = state().maybeWhen(
      loaded: (items, next, _, _, _) => (items.length, next),
      orElse: () => (0, null),
    );
    expect(before, (1, 'cursor-1'));

    // keyingi sahifa: oldingi sirli cursor ichida yuklaymiz
    repository.listResult = ([testConversation(id: 'b')], null);

    await notifier().loadMore();

    final after = state().maybeWhen(
      loaded: (items, next, isLoadingMore, _, _) =>
          (items.length, next, isLoadingMore),
      orElse: () => (0, null, true),
    );
    expect(after, (2, null, false));
    expect(repository.lastCursor, 'cursor-1');
  });
}
