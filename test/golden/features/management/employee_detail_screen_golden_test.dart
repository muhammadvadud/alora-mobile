import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/theme/app_theme.dart';
import 'package:alora_mobile/features/management/application/providers.dart';
import 'package:alora_mobile/features/management/presentation/screens/employee_detail_screen.dart';
import 'package:alora_mobile/shared/models/role.dart';

import '../../../helpers/fake_team_repository.dart';
import '../../../helpers/fake_usage_repository.dart';

void main() {
  setUpAll(() async {
    await loadAppFonts();
  });

  testGoldens('S-21 Xodim sahifasi - Light & Dark', (tester) async {
    final teamRepository = FakeTeamRepository()
      ..employeeResult = testEmployee(
        id: 'employee-1',
        fullName: 'Akmal Karimov',
        phone: '+998901112233',
        role: Role.manager,
        lastLoginAt: DateTime(2026, 9, 16, 9, 30),
        isActive: true,
      );
    final usageRepository = FakeUsageRepository();

    Widget widgetFor(ThemeMode mode) {
      return ProviderScope(
        overrides: [
          teamRepositoryProvider.overrideWithValue(teamRepository),
          usageRepositoryProvider.overrideWithValue(usageRepository),
        ],
        child: MaterialApp(
          theme: AppTheme.light(),
          darkTheme: AppTheme.dark(),
          themeMode: mode,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          locale: const Locale('uz'),
          home: const EmployeeDetailScreen(employeeId: 'employee-1'),
        ),
      );
    }

    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: [Device.phone])
      ..addScenario(name: 'Light', widget: widgetFor(ThemeMode.light))
      ..addScenario(name: 'Dark', widget: widgetFor(ThemeMode.dark));

    await tester.pumpDeviceBuilder(builder);
    await tester.pumpAndSettle();
    await screenMatchesGolden(tester, 'employee_detail_screen');
  });
}
