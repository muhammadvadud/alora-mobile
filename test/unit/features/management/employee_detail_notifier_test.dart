import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:alora_mobile/core/error/failure.dart';
import 'package:alora_mobile/features/management/application/employee_detail_notifier.dart';
import 'package:alora_mobile/features/management/application/employee_detail_state.dart';
import 'package:alora_mobile/features/management/application/providers.dart';
import 'package:alora_mobile/shared/models/role.dart';

import '../../../helpers/fake_team_repository.dart';

void main() {
  late ProviderContainer container;
  late FakeTeamRepository teamRepository;

  setUp(() {
    teamRepository = FakeTeamRepository();
    container = ProviderContainer(
      overrides: [teamRepositoryProvider.overrideWithValue(teamRepository)],
    );
    addTearDown(container.dispose);
  });

  EmployeeDetailState state() =>
      container.read(employeeDetailProvider('employee-1'));

  EmployeeDetailNotifier notifier() =>
      container.read(employeeDetailProvider('employee-1').notifier);

  test('load: employee tafsiloti olinadi va loaded bo\'ladi', () async {
    teamRepository.employeeResult = testEmployee(
      id: 'employee-1',
      fullName: 'Akmal Karimov',
      role: Role.manager,
      isActive: false,
    );

    container.read(employeeDetailProvider('employee-1'));
    await pumpEventQueue();

    expect(teamRepository.employeeIds, ['employee-1']);
    final employee = state().maybeWhen(loaded: (e, _) => e, orElse: () => null);
    expect(employee?.fullName, 'Akmal Karimov');
    expect(employee?.isBlocked, isTrue);
    expect(
      state().maybeWhen(loaded: (_, _) => true, orElse: () => false),
      isTrue,
    );
  });

  test('xatolik error holatga olib keladi va load() qayta yuklaydi', () async {
    teamRepository.employeeFailure = const Failure.server();
    container.read(employeeDetailProvider('employee-1'));
    await pumpEventQueue();

    expect(state().maybeWhen(error: (_) => true, orElse: () => false), isTrue);

    teamRepository.employeeFailure = null;
    await notifier().load();
    await pumpEventQueue();

    expect(
      state().maybeWhen(loaded: (_, _) => true, orElse: () => false),
      isTrue,
    );
  });

  test(
    'setLimit: body to\'g\'ri uzatiladi va limit state ga yoziladi',
    () async {
      teamRepository.employeeResult = testEmployee(id: 'employee-1');
      teamRepository.setLimitResult = testUsageLimit(
        id: 'limit-1',
        isUnlimited: false,
        maxCostUzs: '500000.00',
      );
      container.read(employeeDetailProvider('employee-1'));
      await pumpEventQueue();

      await notifier().setLimit(
        body: {'is_unlimited': false, 'period': 'daily'},
      );

      expect(teamRepository.setLimits.single.id, 'employee-1');
      expect(teamRepository.setLimits.single.body['is_unlimited'], isFalse);

      final limit = state().maybeWhen(loaded: (_, l) => l, orElse: () => null);
      expect(limit?.id, 'limit-1');
      expect(limit?.maxCost, 500000);
    },
  );

  test('setLimit loaded bo\'lmagan holatda state ni o\'zgartirmaydi', () async {
    teamRepository.employeeFailure = const Failure.network();
    container.read(employeeDetailProvider('employee-1'));
    await pumpEventQueue();

    await notifier().setLimit(body: {'is_unlimited': true});

    expect(state().maybeWhen(error: (_) => true, orElse: () => false), isTrue);
    expect(notifier().limit, isNull);
  });

  test('updateProfile: ism va rol patch bilan yuboriladi', () async {
    teamRepository.employeeResult = testEmployee(
      id: 'employee-1',
      fullName: 'Yangi Ism',
      role: Role.manager,
    );
    container.read(employeeDetailProvider('employee-1'));
    await pumpEventQueue();

    await notifier().updateProfile(fullName: 'Yangi Ism', role: Role.manager);

    expect(teamRepository.updates.single.id, 'employee-1');
    expect(teamRepository.updates.single.patch, {
      'full_name': 'Yangi Ism',
      'role': 'manager',
    });
  });

  test(
    'toggleBlocked: is_active patch bilan teskari holatga o\'tkazadi',
    () async {
      teamRepository.employeeResult = testEmployee(
        id: 'employee-1',
        isActive: true,
      );
      container.read(employeeDetailProvider('employee-1'));
      await pumpEventQueue();
      teamRepository.updates.clear();

      await notifier().toggleBlocked(true);

      expect(teamRepository.updates.single.patch, {'is_active': false});
    },
  );

  test('updateProfile Failure bo\'lsa qayta throw qiladi', () async {
    teamRepository.employeeResult = testEmployee(id: 'employee-1');
    container.read(employeeDetailProvider('employee-1'));
    await pumpEventQueue();

    teamRepository.updateFailure = const Failure.server();

    await expectLater(
      notifier().updateProfile(fullName: 'Yangi Ism', role: Role.manager),
      throwsA(isA<Failure>()),
    );
  });

  test('toggleBlocked Failure bo\'lsa qayta throw qiladi', () async {
    teamRepository.employeeResult = testEmployee(id: 'employee-1');
    container.read(employeeDetailProvider('employee-1'));
    await pumpEventQueue();

    teamRepository.updateFailure = const Failure.network();

    await expectLater(notifier().toggleBlocked(true), throwsA(isA<Failure>()));
  });
}
