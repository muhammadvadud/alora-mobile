import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mocktail/mocktail.dart';

import 'package:alora_mobile/core/error/error_reporter.dart';
import 'package:alora_mobile/features/auth/application/auth_notifier.dart';
import 'package:alora_mobile/features/auth/application/providers.dart';
import 'package:alora_mobile/features/auth/domain/entities/user.dart';
import 'package:alora_mobile/features/conversations/application/conversations_notifier.dart';
import 'package:alora_mobile/features/conversations/application/conversations_state.dart';
import 'package:alora_mobile/features/conversations/application/providers.dart';
import 'package:alora_mobile/shared/models/role.dart';

import '../conversations/conversations_test_helpers.dart';
import 'auth_test_helpers.dart';

class MockErrorReporter extends Mock implements ErrorReporter {}

void main() {
  late ProviderContainer container;
  late FakeAuthRepository authRepository;
  late FakeConversationsRepository conversationsRepository;
  late MockErrorReporter errorReporter;

  setUp(() {
    authRepository = FakeAuthRepository();
    conversationsRepository = FakeConversationsRepository();
    errorReporter = MockErrorReporter();

    when(
      () => errorReporter.setUser(
        id: any(named: 'id'),
        role: any(named: 'role'),
      ),
    ).thenReturn(null);
    when(() => errorReporter.clearUser()).thenReturn(null);

    container = ProviderContainer(
      overrides: [
        authRepositoryProvider.overrideWithValue(authRepository),
        errorReporterProvider.overrideWithValue(errorReporter),
        conversationsRepositoryProvider.overrideWithValue(conversationsRepository),
      ],
    );
    addTearDown(() async {
      await authRepository.dispose();
      container.dispose();
    });
  });

  User userB() => const User(
        id: 'user-2',
        phone: '+998902223344',
        fullName: 'User B',
        role: Role.employee,
        tenant: 'alora-pardalar',
      );

  Future<void> loginAsA() async {
    authRepository.user = testUser();
    conversationsRepository.listResult = (
      [testConversation(id: 'conv-a', title: 'A suhbati')],
      null,
    );
    final failure = await container
        .read(authProvider.notifier)
        .login(phone: '+998901234567', password: 'parol');
    expect(failure, isNull);
  }

  Future<void> loadConversations() async {
    container.listen(conversationsProvider, (_, _) {}, fireImmediately: true);
    await pumpEventQueue();
  }

  List<String> loadedConversationIds() {
    return container.read(conversationsProvider).maybeWhen(
          loaded: (items, _, _, _, _) => items.map((c) => c.id).toList(),
          orElse: () => const [],
        );
  }

  test('logout suhbat keshlari tozalanadi va provider qayta yuklanadi', () async {
    await loginAsA();
    await loadConversations();

    expect(loadedConversationIds(), ['conv-a']);

    // Login paytida yuklab olingan eski suhbatlar logout'da tozalanishi kerak.
    conversationsRepository.listResult = ([], null);
    container.read(conversationsProvider.notifier);
    final callsBeforeLogout = conversationsRepository.listCalls;

    await container.read(authProvider.notifier).logout();
    await pumpEventQueue();

    expect(conversationsRepository.listCalls, greaterThan(callsBeforeLogout));
    final state = container.read(conversationsProvider);
    expect(state.maybeWhen(empty: (_, _) => true, orElse: () => false), isTrue,
        reason: 'logout dan keyin eski foydalanuvchi suhbatlari qolmagan bo\'lishi kerak');
  });

  test('B akkaunti A foydalanuvchisining suhbatlarini ko\'rmaydi', () async {
    await loginAsA();
    await loadConversations();
    expect(loadedConversationIds(), ['conv-a']);

    // B'ga tegishli yangi suhbatlar — login'dan keyin qayta yuklanishi kerak.
    authRepository.user = userB();
    conversationsRepository.listResult = (
      [testConversation(id: 'conv-b', title: 'B suhbati')],
      null,
    );

    await container.read(authProvider.notifier).logout();
    await pumpEventQueue();

    final failure = await container
        .read(authProvider.notifier)
        .login(phone: '+998902223344', password: 'parol');
    expect(failure, isNull);
    await pumpEventQueue();

    expect(loadedConversationIds(), ['conv-b'],
        reason: 'B akkaunti faqat o\'z suhbatlarini ko\'rishi kerak — A ma\'lumoti yo\'q');
  });
}