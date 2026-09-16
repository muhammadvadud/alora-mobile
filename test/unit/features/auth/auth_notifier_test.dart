import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:alora_mobile/core/error/failure.dart';
import 'package:alora_mobile/features/auth/application/auth_notifier.dart';
import 'package:alora_mobile/features/auth/application/auth_state.dart';
import 'package:alora_mobile/features/auth/application/providers.dart';
import 'package:alora_mobile/shared/models/role.dart';

import 'auth_test_helpers.dart';

void main() {
  late ProviderContainer container;
  late FakeAuthRepository repository;

  setUp(() {
    repository = FakeAuthRepository();
    container = ProviderContainer(
      overrides: [authRepositoryProvider.overrideWithValue(repository)],
    );
    addTearDown(() async {
      await repository.dispose();
      container.dispose();
    });
  });

  AuthState state() => container.read(authProvider);

  test('boshlang\'ich holat unknown bo\'ladi', () async {
    expect(state().maybeWhen(unknown: () => true, orElse: () => false), isTrue);
  });

  test('refresh token yo\'q bo\'lsa unauthenticated bo\'ladi', () async {
    state(); // trigger provider creation and _initialize
    await pumpEventQueue();

    expect(
      state().maybeWhen(unauthenticated: () => true, orElse: () => false),
      isTrue,
    );
  });

  test(
    'refresh token bo\'lsa refresh + me orqali authenticated bo\'ladi',
    () async {
      repository.refreshToken = 'r1';
      repository.user = testUser(role: Role.manager);

      state(); // trigger provider creation and _initialize
      await pumpEventQueue();

      expect(
        state().maybeWhen(
          authenticated: (user) => user.role == Role.manager,
          orElse: () => false,
        ),
        isTrue,
      );
    },
  );

  test('refresh xatosi sessiyani tozalab unauthenticated qiladi', () async {
    repository.refreshToken = 'r1';
    repository.refreshFailure = const Failure.auth();

    state(); // trigger provider creation and _initialize
    await pumpEventQueue();

    expect(repository.clearSessionCalls, 1);
    expect(
      state().maybeWhen(unauthenticated: () => true, orElse: () => false),
      isTrue,
    );
  });

  test('me xatosi sessiyani tozalab unauthenticated qiladi', () async {
    repository.refreshToken = 'r1';
    repository.meFailure = const Failure.auth();

    state(); // trigger provider creation and _initialize
    await pumpEventQueue();

    expect(repository.clearSessionCalls, 1);
    expect(
      state().maybeWhen(unauthenticated: () => true, orElse: () => false),
      isTrue,
    );
  });

  test('muvaffaqiyatli login authenticated holatga o\'tkazadi', () async {
    repository.user = testUser(role: Role.employee);

    final failure = await container
        .read(authProvider.notifier)
        .login(phone: '+998901234567', password: 'parol');

    expect(failure, isNull);
    expect(repository.loginCalls, 1);
    expect(
      state().maybeWhen(
        authenticated: (user) => user.role == Role.employee,
        orElse: () => false,
      ),
      isTrue,
    );
  });

  test('login xatosi Failure qaytaradi va holat o\'zgarmaydi', () async {
    repository.loginFailure = const Failure.auth();

    final failure = await container
        .read(authProvider.notifier)
        .login(phone: '+998901234567', password: 'xato');

    expect(failure, isNotNull);
    expect(
      state().maybeWhen(unauthenticated: () => true, orElse: () => false),
      isTrue,
    );
  });

  test(
    'logout repository logout chaqiradi va unauthenticated bo\'ladi',
    () async {
      repository.refreshToken = 'r1';
      repository.user = testUser();

      state(); // trigger provider creation
      await pumpEventQueue();
      await container.read(authProvider.notifier).logout();

      expect(repository.logoutCalls, 1);
      expect(
        state().maybeWhen(unauthenticated: () => true, orElse: () => false),
        isTrue,
      );
    },
  );

  test('session tugashi hodisasi unauthenticated holatga o\'tkazadi', () async {
    repository.refreshToken = 'r1';
    repository.user = testUser();

    state(); // trigger provider creation
    await pumpEventQueue();

    repository.emitSessionExpired();
    await pumpEventQueue();

    expect(
      state().maybeWhen(unauthenticated: () => true, orElse: () => false),
      isTrue,
    );
  });

  test('login detail matni xato kodi bilan saqlanadi', () async {
    repository.loginFailure = const Failure.unknown(
      'Parol yoki telefon noto\'g\'ri',
    );

    final failure = await container
        .read(authProvider.notifier)
        .login(phone: '+998901234567', password: 'xato');

    final detail = failure!.maybeWhen(
      unknown: (detail) => detail,
      orElse: () => '',
    );
    expect(detail, 'Parol yoki telefon noto\'g\'ri');
  });
}
