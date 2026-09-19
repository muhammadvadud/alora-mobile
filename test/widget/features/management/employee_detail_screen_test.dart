import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/theme/app_theme.dart';
import 'package:alora_mobile/core/error/failure.dart';
import 'package:alora_mobile/features/management/application/providers.dart';
import 'package:alora_mobile/features/management/presentation/screens/employee_detail_screen.dart';
import 'package:alora_mobile/shared/models/role.dart';
import 'package:alora_mobile/shared/widgets/error_state.dart';
import 'package:alora_mobile/shared/widgets/skeleton.dart';

import '../../../helpers/fake_team_repository.dart';
import '../../../helpers/fake_usage_repository.dart';

Future<void> _pumpDetail(
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
        home: const EmployeeDetailScreen(employeeId: 'employee-1'),
      ),
    ),
  );
}

void main() {
  late FakeTeamRepository teamRepository;
  late FakeUsageRepository usageRepository;

  setUp(() {
    teamRepository = FakeTeamRepository();
    usageRepository = FakeUsageRepository();
  });

  testWidgets('xodim profili ko\'rinadi (ism, telefon, rol)', (tester) async {
    teamRepository.employeeResult = testEmployee(
      id: 'employee-1',
      fullName: 'Akmal Karimov',
      phone: '+998901112233',
      role: Role.manager,
    );
    await _pumpDetail(tester, teamRepository: teamRepository, usageRepository: usageRepository);
    await tester.pumpAndSettle();

    expect(find.byType(SkeletonBox), findsNothing);
    expect(find.text('Xodim profili'), findsOneWidget);
    expect(find.text('Akmal Karimov'), findsWidgets);
    expect(find.text('+998901112233'), findsOneWidget);
    expect(find.text('Saqlash'), findsWidgets);
    expect(find.text('Menejer'), findsWidgets);
  });

  testWidgets('bloklash: switch bosilganda tasdiq dialogi va patch jo\'natiladi', (tester) async {
    teamRepository.employeeResult = testEmployee(
      id: 'employee-1',
      fullName: 'Akmal Karimov',
      isActive: true,
    );
    await _pumpDetail(tester, teamRepository: teamRepository, usageRepository: usageRepository);
    await tester.pumpAndSettle();

    final blockSwitch = find.descendant(
      of: find.widgetWithText(ListTile, 'Bloklash'),
      matching: find.byType(Switch),
    );
    
    // If not found with ListTile, try checking the exact widget or just pick the last switch.
    // In our new design, it's an AppListTile but we can just find by text 'Bloklash' and tap the switch next to it, or just tap the widget with text 'Bloklash' since it's a ListTile!
    final blockTile = find.text('Bloklash');
    await tester.ensureVisible(blockTile);
    await tester.pumpAndSettle();
    
    await tester.tap(blockTile);
    await tester.pumpAndSettle();

    expect(find.text('Xodimni bloklash?'), findsOneWidget);
    await tester.tap(find.text('Bloklash').last);
    await tester.pumpAndSettle();

    expect(teamRepository.updates.single.id, 'employee-1');
    expect(teamRepository.updates.single.patch, {'is_active': false});
  });

  testWidgets('xatolik ErrorState ko\'rsatadi va retry qayta yuklaydi', (tester) async {
    teamRepository.employeeFailure = const Failure.network();
    await _pumpDetail(tester, teamRepository: teamRepository, usageRepository: usageRepository);
    await tester.pumpAndSettle();

    expect(find.byType(ErrorState), findsOneWidget);

    teamRepository.employeeFailure = null;
    teamRepository.employeeResult = testEmployee(id: 'employee-1', fullName: 'Akmal Karimov');
    await tester.tap(find.text('Qayta urinish'));
    await tester.pumpAndSettle();

    expect(find.byType(ErrorState), findsNothing);
    expect(find.text('Akmal Karimov'), findsWidgets);
  });
}
