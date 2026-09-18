import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

import 'package:alora_mobile/core/network/api_paths.dart';
import 'package:alora_mobile/core/network/dio_client.dart';
import 'package:alora_mobile/features/management/application/employee_detail_notifier.dart';
import 'package:alora_mobile/features/management/application/employee_detail_state.dart';
import 'package:alora_mobile/features/management/application/employees_notifier.dart';
import 'package:alora_mobile/features/management/application/employees_state.dart';
import 'package:alora_mobile/features/management/application/management_period_notifier.dart';
import 'package:alora_mobile/features/management/application/providers.dart';
import 'package:alora_mobile/features/management/domain/entities/usage_period.dart';

void main() {
  late Dio dio;
  late DioAdapter adapter;

  setUp(() {
    dio = Dio(BaseOptions(baseUrl: 'https://api.example.com'));
    adapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
  });

  ProviderContainer container() {
    final c = ProviderContainer(
      overrides: [dioProvider.overrideWithValue(dio)],
    );
    addTearDown(c.dispose);
    return c;
  }

  test('real usageRepositoryProvider summary qaytaradi', () async {
    adapter.onGet(
      ApiPaths.usageSummary,
      (server) => server.reply(200, {
        'period': 'day',
        'tokens': 120,
        'cost_uzs': '2748000.00',
        'messages': 45,
        'conversations': 12,
        'orders': 4,
      }),
      queryParameters: {'period': 'day'},
    );

    final summary = await container()
        .read(usageRepositoryProvider)
        .summary(period: UsagePeriod.day);

    expect(summary.period, 'day');
    expect(summary.costUzs, 2748000);
  });

  test('real usageRepositoryProvider byUser qaytaradi', () async {
    adapter.onGet(
      ApiPaths.usageByUser,
      (server) => server.reply(200, [
        {
          'user_id': 'employee-1',
          'full_name': 'Akmal Karimov',
          'tokens': 500,
          'cost_uzs': '120000.00',
          'messages': 10,
          'conversations': 3,
        },
      ]),
      queryParameters: {'period': 'month'},
    );

    final rows = await container()
        .read(usageRepositoryProvider)
        .byUser(period: UsagePeriod.month);

    expect(rows.single.userId, 'employee-1');
    expect(rows.single.costUzs, 120000);
  });

  test('real teamRepositoryProvider employees qaytaradi', () async {
    adapter.onGet(
      ApiPaths.employees,
      (server) => server.reply(200, [
        {
          'id': 'employee-1',
          'phone': '+998901112233',
          'full_name': 'Akmal Karimov',
          'role': 'employee',
          'is_active': true,
          'created_at': '2024-01-01T00:00:00',
        },
      ]),
    );

    final employees = await container()
        .read(teamRepositoryProvider)
        .employees();

    expect(employees.single.id, 'employee-1');
    expect(employees.single.fullName, 'Akmal Karimov');
  });

  test('overrideWithValue override ishlaydi', () {
    final c = ProviderContainer(
      overrides: [
        employeesProvider.overrideWithValue(
          const EmployeesState.loaded(items: [], searchQuery: ''),
        ),
        managementPeriodProvider.overrideWithValue(UsagePeriod.week),
        employeeDetailProvider('employee-1')
            .overrideWithValue(const EmployeeDetailState.loading()),
      ],
    );
    addTearDown(c.dispose);

    expect(
      c
          .read(employeesProvider)
          .maybeWhen(loaded: (items, _) => items.isEmpty, orElse: () => false),
      isTrue,
    );
    expect(c.read(managementPeriodProvider), UsagePeriod.week);
    expect(
      c
          .read(employeeDetailProvider('employee-1'))
          .maybeWhen(loading: () => true, orElse: () => false),
      isTrue,
    );
  });

  test('provider toString konsistent', () {
    expect(employeeDetailProvider.toString(), 'employeeDetailProvider');
    expect(
      employeeDetailProvider('employee-1').toString(),
      contains('employeeDetailProvider'),
    );
    expect(employeesProvider.toString(), contains('employeesProvider'));
    expect(
      managementPeriodProvider.toString(),
      contains('managementPeriodProvider'),
    );
  });
}
