import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/theme/app_theme.dart';
import 'package:alora_mobile/features/management/application/providers.dart';
import 'package:alora_mobile/features/management/presentation/screens/management_screen.dart';

import '../../../helpers/fake_usage_repository.dart';

void main() {
  setUpAll(() async {
    await loadAppFonts();
  });

  testGoldens('S-19 Boshqaruv bosh sahifasi - Light & Dark', (tester) async {
    final usageRepository = FakeUsageRepository();
    usageRepository.summaryResult = testUsageSummary(
      period: 'day',
      costUzs: 725000,
      conversations: 12,
      orders: 3,
      daily: [
        testUsageDailyPoint(date: DateTime(2026, 9, 14), costUzs: 95000),
        testUsageDailyPoint(date: DateTime(2026, 9, 15), costUzs: 180000),
        testUsageDailyPoint(date: DateTime(2026, 9, 16), costUzs: 240000),
      ],
    );
    usageRepository.conversionResult = testConversionStats(
      totalConversations: 12,
      withOrder: 3,
      conversionRate: 25,
    );
    usageRepository.byUserResult = [
      testUserUsage(userId: 'employee-1', costUzs: 420000, conversations: 7),
      testUserUsage(userId: 'employee-2', costUzs: 180000, conversations: 3),
      testUserUsage(userId: 'employee-3', fullName: null, costUzs: 125000),
    ];

    Widget widgetFor(ThemeMode mode) {
      return ProviderScope(
        overrides: [usageRepositoryProvider.overrideWithValue(usageRepository)],
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
          home: const ManagementScreen(),
        ),
      );
    }

    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: [Device.phone])
      ..addScenario(name: 'Light', widget: widgetFor(ThemeMode.light))
      ..addScenario(name: 'Dark', widget: widgetFor(ThemeMode.dark));

    await tester.pumpDeviceBuilder(builder);
    await tester.pumpAndSettle();
    await screenMatchesGolden(tester, 'management_screen');
  });
}
