import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:alora_mobile/core/error/failure.dart';
import 'package:alora_mobile/features/auth/application/auth_notifier.dart';
import 'package:alora_mobile/features/auth/application/auth_state.dart';
import 'package:alora_mobile/features/auth/application/providers.dart';
import 'package:alora_mobile/features/profile/application/profile_spend_notifier.dart';
import 'package:alora_mobile/features/profile/application/providers.dart';
import 'package:alora_mobile/shared/models/role.dart';

import '../auth/auth_test_helpers.dart';
import '../../../helpers/fake_profile_repository.dart';

void main() {
  late ProviderContainer container;
  late FakeAuthRepository authRepository;
  late FakeProfileRepository profileRepository;

  setUp(() {
    authRepository = FakeAuthRepository();
    profileRepository = FakeProfileRepository();
    container = ProviderContainer(
      overrides: [
        authRepositoryProvider.overrideWithValue(authRepository),
        profileRepositoryProvider.overrideWithValue(profileRepository),
      ],
    );
    addTearDown(container.dispose);
  });

  Future<void> authenticate({Role role = Role.manager}) async {
    authRepository.refreshToken = 'refresh-token';
    authRepository.user = testUser(role: role);
    container.read(authProvider);
    await pumpEventQueue();
    expect(
      container
          .read(authProvider)
          .maybeWhen(authenticated: (_) => true, orElse: () => false),
      isTrue,
      reason: 'auth holati authenticated bo\'lishi kerak',
    );
  }

  test(
    'unauthenticated holatda bo\'sh data qaytadi, repo chaqirilmaydi',
    () async {
      container.read(authProvider);
      await pumpEventQueue();

      final data = await container.read(profileSpendProvider.future);

      expect(profileRepository.limitCalls, 0);
      expect(profileRepository.todayCostCalls, 0);
      expect(data.limit, isNull);
      expect(data.todayCost, isNull);
    },
  );

  test('manager: limit va bugungi sarf olinadi', () async {
    profileRepository.limit = testProfileLimit(maxCostUzs: '100000.00');
    profileRepository.todayCost = 45000;
    await authenticate(role: Role.manager);

    final data = await container.read(profileSpendProvider.future);

    expect(profileRepository.limitCalls, 1);
    expect(profileRepository.todayCostCalls, 1);
    expect(profileRepository.todayCostUsers, ['user-1']);
    expect(data.limit?.maxCost, 100000);
    expect(data.todayCost, 45000);
  });

  test('employee: limit olinadi lekin bugungi sarf chiqarilmaydi', () async {
    profileRepository.limit = testProfileLimit(isUnlimited: true);
    profileRepository.todayCost = 123;
    await authenticate(role: Role.employee);

    final data = await container.read(profileSpendProvider.future);

    expect(profileRepository.limitCalls, 1);
    expect(profileRepository.todayCostCalls, 0);
    expect(data.limit?.isUnlimited, isTrue);
    expect(data.todayCost, isNull);
  });

  test('getTodayCost xatosi sarf null qoladi (limit saqlanadi)', () async {
    profileRepository.limit = testProfileLimit(maxCostUzs: '50000.00');
    profileRepository.todayCostFailure = const Failure.network();
    await authenticate(role: Role.manager);

    final data = await container.read(profileSpendProvider.future);

    expect(data.limit?.isUnlimited, isFalse);
    expect(data.todayCost, isNull);
  });

  test('getLimit xatosi provider error holatiga o\'tadi', () async {
    profileRepository.limitFailure = const Failure.network();
    await authenticate(role: Role.employee);

    container.read(profileSpendProvider);
    await pumpEventQueue();

    final av = container.read(profileSpendProvider);
    expect(av.hasError, isTrue);
    expect(av.error, isA<Failure>());
  });
}
