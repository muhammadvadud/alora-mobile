import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/theme/app_theme.dart';
import 'package:alora_mobile/features/management/pricing/presentation/screens/pricing_rules_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alora_mobile/features/management/pricing/application/pricing_repository.dart';
import 'package:mocktail/mocktail.dart';
import 'package:alora_mobile/features/management/pricing/domain/entities/calc_rule.dart';
import 'package:alora_mobile/features/management/pricing/domain/entities/discount_tier.dart';
import 'package:alora_mobile/features/management/pricing/domain/entities/discount_policy.dart';
import 'package:alora_mobile/features/management/pricing/domain/entities/order_defaults.dart';
import 'package:alora_mobile/features/management/pricing/data/dto/calc_preview_dto.dart';
import 'package:alora_mobile/features/chat/domain/entities/quote.dart';

class MockPricingRepository extends Mock implements PricingRepository {}

void main() {
  late MockPricingRepository mockRepo;

  setUp(() {
    mockRepo = MockPricingRepository();
    registerFallbackValue(const CalcPreviewRequestDto(measurements: [], services: []));
    when(() => mockRepo.getCalcRules()).thenAnswer(
      (_) async => [
        CalcRule(
          id: '1',
          key: 'fabric_coef',
          value: 2.5,
          unit: '',
          description: 'Mato koeffitsienti',
          appliesTo: '',
          isActive: true,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
      ],
    );
    when(() => mockRepo.getServices()).thenAnswer((_) async => []);
    when(() => mockRepo.getDiscountTiers()).thenAnswer(
      (_) async => [
        DiscountTier(
          id: '1',
          minAmount: 5000000,
          percent: 3.0,
          isActive: true,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
      ],
    );
    when(() => mockRepo.getDiscountPolicy()).thenAnswer(
      (_) async => DiscountPolicy(
        id: '1',
        manualMaxPercentEmployee: 5.0,
        manualMaxPercentManager: 15.0,
        isActive: true,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    );
    when(() => mockRepo.getOrderDefaults()).thenAnswer(
      (_) async => OrderDefaults(
        id: '1',
        defaultPrepaymentPercent: 50,
        defaultDeliveryAmount: 50000,
        isActive: true,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    );
  });

  testWidgets('PricingRulesScreen preview so\'rov shakli', (WidgetTester tester) async {
    final quote = const Quote(
      fabrics: [],
      accessories: [],
      services: [],
      wasteWarnings: [],
      formula: '',
      subtotal: 0,
      discount: 0,
      delivery: 0,
      total: 100000,
    );
    when(() => mockRepo.calcPreview(any())).thenAnswer((_) async => quote);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [pricingRepositoryProvider.overrideWithValue(mockRepo)],
        child: MaterialApp(
          locale: const Locale('uz'),
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          theme: AppTheme.light(),
          home: const PricingRulesScreen(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    // Open bottom sheet
    await tester.tap(find.byType(IconButton).last);
    // Wait for bottom sheet animation
    await tester.pumpAndSettle();

    // Press calculate
    await tester.tap(find.text('Hisoblash'));
    await tester.pump();

    verify(() => mockRepo.calcPreview(any())).called(1);
  });
}
