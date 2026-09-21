import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:alora_mobile/core/error/failure.dart';
import 'package:alora_mobile/features/management/application/employees_notifier.dart';
import 'package:alora_mobile/features/management/application/employees_state.dart';
import 'package:alora_mobile/features/management/application/providers.dart';
import 'package:alora_mobile/features/management/domain/entities/employee.dart';
import 'package:alora_mobile/features/management/domain/entities/usage_period.dart';

import '../../../helpers/fake_team_repository.dart';
import '../../../helpers/fake_usage_repository.dart';

void main() {
  late ProviderContainer container;
  late FakeTeamRepository teamRepository;
  late FakeUsageRepository usageRepository;

  setUp(() {
    teamRepository = FakeTeamRepository();
    usageRepository = FakeUsageRepository();
    container = ProviderContainer(
      overrides: [
        teamRepositoryProvider.overrideWithValue(teamRepository),
        usageRepositoryProvider.overrideWithValue(usageRepository),
      ],
    );
    addTearDown(container.dispose);
  });

  // AutoDispose provider'ni jonli ushlab turish (build test ichida, natijalar sozlangach).
  void keepAlive() => addTearDown(container.listen(employeesProvider, (_, _) {}).close);

  EmployeesState state() => container.read(employeesProvider);

  List<Employee> loadedItems() {
    return state().maybeWhen(loaded: (items, _) => items, orElse: () => <Employee>[]);
  }

  test('boshlang\'ich holat initial bo\'ladi', () async {
    expect(state().maybeWhen(initial: () => true, orElse: () => false), isTrue);
    await pumpEventQueue();
  });

  test('yuklash: ro\'yxat todayCost bilan boyitiladi', () async {
    teamRepository.employeesResult = [
      testEmployee(id: 'employee-1', fullName: 'Akmal Karimov'),
      testEmployee(id: 'employee-2', fullName: 'Jasur Toshmatov'),
    ];
    usageRepository.summaryResult = testUsageSummary(costUzs: 42000);

    keepAlive();
    await pumpEventQueue();

    expect(teamRepository.employeesCalls, 1);
    expect(usageRepository.summaryCalls.length, 2);
    expect(usageRepository.summaryCalls[0].period, UsagePeriod.day);
    expect(usageRepository.summaryCalls[0].userId, 'employee-1');

    final employees = loadedItems();
    expect(employees.length, 2);
    expect(employees[0].todayCost, 42000);
    expect(state().maybeWhen(loaded: (_, _) => true, orElse: () => false), isTrue);
  });

  test('summary xatosi bo\'lsa todayCost null qoladi', () async {
    teamRepository.employeesResult = [testEmployee(id: 'employee-1')];
    usageRepository.summaryFailure = const Failure.network();

    keepAlive();
    await pumpEventQueue();

    expect(loadedItems().single.todayCost, isNull);
  });

  test('bo\'sh ro\'yxat empty holatga olib keladi', () async {
    keepAlive();
    await pumpEventQueue();

    expect(state().maybeWhen(empty: (query) => query.isEmpty, orElse: () => false), isTrue);
  });

  test('xatolik error holatga olib keladi va retry qayta yuklaydi', () async {
    teamRepository.employeesFailure = const Failure.network();

    keepAlive();
    await pumpEventQueue();

    expect(state().maybeWhen(error: (_, _) => true, orElse: () => false), isTrue);

    teamRepository.employeesFailure = null;
    teamRepository.employeesResult = [testEmployee()];

    await container.read(employeesProvider.notifier).retry();
    await pumpEventQueue();

    expect(teamRepository.employeesCalls, 2);
    expect(state().maybeWhen(loaded: (_, _) => true, orElse: () => false), isTrue);
  });

  test('qidiruv 300ms debounce bilan client-side filtrlaydi', () async {
    teamRepository.employeesResult = [
      testEmployee(id: 'employee-1', fullName: 'Akmal Karimov'),
      testEmployee(id: 'employee-2', fullName: 'Jasur Toshmatov'),
    ];

    keepAlive();
    await pumpEventQueue();

    container.read(employeesProvider.notifier).search('ak');
    container.read(employeesProvider.notifier).search('akma');
    expect(teamRepository.employeesCalls, 1); // debounce davomida chaqiruv yo'q

    await Future<void>.delayed(const Duration(milliseconds: 350));
    await pumpEventQueue();

    final items = loadedItems();
    expect(items.length, 1);
    expect(items.single.id, 'employee-1');
  });

  test('qidiruv natija topilmasa empty qaytaradi', () async {
    teamRepository.employeesResult = [testEmployee(id: 'employee-1', fullName: 'Akmal Karimov')];

    keepAlive();
    await pumpEventQueue();

    container.read(employeesProvider.notifier).search('yo\'q xodim');
    await Future<void>.delayed(const Duration(milliseconds: 350));
    await pumpEventQueue();

    final query = state().maybeWhen(empty: (query) => query, orElse: () => null);
    expect(query, 'yo\'q xodim');
  });

  test('refresh() loaded holatda qayta yuklaydi va query saqlanadi', () async {
    teamRepository.employeesResult = [
      testEmployee(id: 'employee-1', fullName: 'Akmal Karimov'),
      testEmployee(id: 'employee-2', fullName: 'Jasur Toshmatov'),
    ];

    keepAlive();
    await pumpEventQueue();

    final notifier = container.read(employeesProvider.notifier);
    notifier.search('ak');
    await Future<void>.delayed(const Duration(milliseconds: 350));
    await pumpEventQueue();
    expect(loadedItems().single.id, 'employee-1');

    teamRepository.employeesResult = [
      testEmployee(id: 'employee-1', fullName: 'Akmal Karimov'),
      testEmployee(id: 'employee-2', fullName: 'Jasur Toshmatov'),
      testEmployee(id: 'employee-3', fullName: 'Akmal Anvarov'),
    ];

    await notifier.refresh();
    await pumpEventQueue();

    expect(teamRepository.employeesCalls, 2);
    expect(state().maybeWhen(loaded: (_, q) => q, orElse: () => null), 'ak');
    final items = loadedItems();
    expect(items.map((e) => e.fullName), ['Akmal Karimov', 'Akmal Anvarov']);
  });

  test('refresh() empty holatda qayta yuklaydi', () async {
    keepAlive();
    await pumpEventQueue();
    expect(state().maybeWhen(empty: (_) => true, orElse: () => false), isTrue);

    teamRepository.employeesResult = [testEmployee(id: 'employee-1')];

    await container.read(employeesProvider.notifier).refresh();
    await pumpEventQueue();

    expect(teamRepository.employeesCalls, 2);
    expect(state().maybeWhen(loaded: (_, _) => true, orElse: () => false), isTrue);
  });

  test('empty holatda qidiruv holatni o\'zgartirmaydi', () async {
    keepAlive();
    await pumpEventQueue();
    expect(state().maybeWhen(empty: (_) => true, orElse: () => false), isTrue);

    teamRepository.employeesResult = [testEmployee(id: 'employee-1')];
    container.read(employeesProvider.notifier).search('xodim');
    await Future<void>.delayed(const Duration(milliseconds: 350));
    await pumpEventQueue();

    expect(state().maybeWhen(empty: (_) => true, orElse: () => false), isTrue);
  });

  test('error holatda qidiruv holatni o\'zgartirmaydi', () async {
    teamRepository.employeesFailure = const Failure.network();

    keepAlive();
    await pumpEventQueue();
    expect(state().maybeWhen(error: (_, _) => true, orElse: () => false), isTrue);

    teamRepository.employeesFailure = null;
    teamRepository.employeesResult = [testEmployee(id: 'employee-1')];

    final notifier = container.read(employeesProvider.notifier);
    notifier.search('ak');
    await Future<void>.delayed(const Duration(milliseconds: 350));
    await pumpEventQueue();

    expect(state().maybeWhen(error: (_, _) => true, orElse: () => false), isTrue);
  });
}
