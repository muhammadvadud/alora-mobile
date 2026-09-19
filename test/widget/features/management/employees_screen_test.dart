import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/theme/app_theme.dart';
import 'package:alora_mobile/core/error/failure.dart';
import 'package:alora_mobile/features/management/application/providers.dart';
import 'package:alora_mobile/features/management/presentation/screens/employees_screen.dart';
import 'package:alora_mobile/features/management/presentation/widgets/employee_row.dart';
import 'package:alora_mobile/shared/widgets/empty_state.dart';
import 'package:alora_mobile/shared/widgets/error_state.dart';
import 'package:alora_mobile/shared/widgets/skeleton.dart';

import '../../../helpers/fake_team_repository.dart';
import '../../../helpers/fake_usage_repository.dart';

Future<void> _pumpEmployees(
  WidgetTester tester, {
  required FakeTeamRepository teamRepository,
  required FakeUsageRepository usageRepository,
}) async {
  final container = ProviderContainer(
    overrides: [
      teamRepositoryProvider.overrideWithValue(teamRepository),
      usageRepositoryProvider.overrideWithValue(usageRepository),
    ],
  );
  addTearDown(container.dispose);

  await tester.pumpWidget(
    UncontrolledProviderScope(
      container: container,
      child: MaterialApp(
        theme: AppTheme.light(),
        locale: const Locale('uz'),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        home: const EmployeesScreen(),
      ),
    ),
  );
}

void main() {
  late FakeTeamRepository teamRepository;
  late FakeUsageRepository usageRepository;

  setUp(() {
    teamRepository = FakeTeamRepository()
      ..employeesResult = [
        testEmployee(id: 'employee-1', fullName: 'Akmal Karimov'),
        testEmployee(id: 'employee-2', fullName: 'Jasur Toshmatov'),
      ];
    usageRepository = FakeUsageRepository()..summaryResult = testUsageSummary(costUzs: 50000);
  });

  testWidgets('yuklangach xodimlar ro\'yxati ko\'rinadi', (tester) async {
    await _pumpEmployees(tester, teamRepository: teamRepository, usageRepository: usageRepository);
    await tester.pumpAndSettle();

    expect(find.byType(SkeletonBox), findsNothing);
    expect(find.byType(EmployeeRow), findsNWidgets(2));
    expect(find.text('Akmal Karimov'), findsOneWidget);
    expect(find.text('Jasur Toshmatov'), findsOneWidget);
  });

  testWidgets('qidiruv client-side filtrlaydi (debounce 300ms)', (tester) async {
    await _pumpEmployees(tester, teamRepository: teamRepository, usageRepository: usageRepository);
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField), 'jasur');
    expect(find.byType(EmployeeRow), findsNWidgets(2)); // debounce davomida

    await tester.pump(const Duration(milliseconds: 350));
    await tester.pumpAndSettle();

    expect(find.byType(EmployeeRow), findsOneWidget);
    expect(find.text('Jasur Toshmatov'), findsOneWidget);
  });

  testWidgets('bo\'sh ro\'yxat EmptyState ko\'rsatadi', (tester) async {
    teamRepository.employeesResult = [];
    await _pumpEmployees(tester, teamRepository: teamRepository, usageRepository: usageRepository);
    await tester.pumpAndSettle();

    expect(find.byType(EmployeeRow), findsNothing);
    expect(find.byType(EmptyState), findsOneWidget);
  });

  testWidgets('xatolik ErrorState ko\'rsatadi va retry qayta yuklaydi', (tester) async {
    teamRepository.employeesFailure = const Failure.network();
    await _pumpEmployees(tester, teamRepository: teamRepository, usageRepository: usageRepository);
    await tester.pumpAndSettle();

    expect(find.byType(ErrorState), findsOneWidget);

    teamRepository.employeesFailure = null;
    await tester.tap(find.text('Qayta urinish'));
    await tester.pumpAndSettle();

    expect(find.byType(ErrorState), findsNothing);
    expect(find.byType(EmployeeRow), findsNWidgets(2));
  });
}
