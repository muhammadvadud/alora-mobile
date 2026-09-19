import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail/mocktail.dart';

import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/theme/app_theme.dart';
import 'package:alora_mobile/features/management/pricing/application/pricing_repository.dart';
import 'package:alora_mobile/features/management/pricing/domain/entities/calc_rule.dart';
import 'package:alora_mobile/features/management/pricing/domain/entities/discount_policy.dart';
import 'package:alora_mobile/features/management/pricing/domain/entities/discount_tier.dart';
import 'package:alora_mobile/features/management/pricing/domain/entities/order_defaults.dart';
import 'package:alora_mobile/features/management/pricing/domain/entities/service_price.dart';
import 'package:alora_mobile/features/management/pricing/presentation/screens/pricing_rules_screen.dart';

class _MockPricingRepository extends Mock implements PricingRepository {}

final _ts = DateTime(2026, 9, 1);

void main() {
  late _MockPricingRepository repo;

  setUpAll(() async {
    await loadAppFonts();
  });

  setUp(() {
    repo = _MockPricingRepository();
    when(() => repo.getCalcRules()).thenAnswer(
      (_) async => [
        CalcRule(
          id: '1',
          key: 'fabric_coef',
          value: 2.5,
          unit: 'x',
          description: 'Burma koeffitsienti (standart)',
          appliesTo: 'fabric',
          isActive: true,
          createdAt: _ts,
          updatedAt: _ts,
        ),
        CalcRule(
          id: '2',
          key: 'waste_percent',
          value: 0.1,
          unit: '%',
          description: 'Chiqindi ulushi',
          appliesTo: 'fabric',
          isActive: true,
          createdAt: _ts,
          updatedAt: _ts,
        ),
      ],
    );
    when(() => repo.getServices()).thenAnswer(
      (_) async => [
        ServicePrice(
          id: 's1',
          key: 'sewing',
          name: 'Tikuv',
          price: 125000,
          unit: 'per_meter',
          isActive: true,
          createdAt: _ts,
          updatedAt: _ts,
        ),
      ],
    );
    when(() => repo.getDiscountTiers()).thenAnswer(
      (_) async => [
        DiscountTier(
          id: 't1',
          minAmount: 5000000,
          percent: 3.0,
          isActive: true,
          createdAt: _ts,
          updatedAt: _ts,
        ),
        DiscountTier(
          id: 't2',
          minAmount: 10000000,
          percent: 5.0,
          isActive: true,
          createdAt: _ts,
          updatedAt: _ts,
        ),
      ],
    );
    when(() => repo.getDiscountPolicy()).thenAnswer(
      (_) async => DiscountPolicy(
        id: 'p1',
        manualMaxPercentEmployee: 5.0,
        manualMaxPercentManager: 15.0,
        isActive: true,
        createdAt: _ts,
        updatedAt: _ts,
      ),
    );
    when(() => repo.getOrderDefaults()).thenAnswer(
      (_) async => OrderDefaults(
        id: 'd1',
        defaultPrepaymentPercent: 50,
        defaultDeliveryAmount: 80000,
        deadlineDays: 14,
        isActive: true,
        createdAt: _ts,
        updatedAt: _ts,
      ),
    );
  });

  Widget widgetFor(ThemeMode mode) {
    return ProviderScope(
      overrides: [pricingRepositoryProvider.overrideWithValue(repo)],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
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
        home: const PricingRulesScreen(),
      ),
    );
  }

  testGoldens("S-23 Narx va hisob qoidalari — yorug'/qorong'i", (tester) async {
    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: [Device.phone])
      ..addScenario(name: 'Light', widget: widgetFor(ThemeMode.light))
      ..addScenario(name: 'Dark', widget: widgetFor(ThemeMode.dark));

    await tester.pumpDeviceBuilder(builder);
    await tester.pumpAndSettle();
    await screenMatchesGolden(tester, 'pricing_rules_screen');
  });
}
