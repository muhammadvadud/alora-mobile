import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:alora_mobile/features/management/pricing/application/pricing_notifier.dart';
import 'package:alora_mobile/features/management/pricing/application/pricing_repository.dart';
import 'package:alora_mobile/features/management/pricing/domain/entities/calc_rule.dart';
import 'package:alora_mobile/features/management/pricing/domain/entities/discount_tier.dart';
import 'package:alora_mobile/features/management/pricing/domain/entities/discount_policy.dart';
import 'package:alora_mobile/features/management/pricing/domain/entities/order_defaults.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MockPricingRepository extends Mock implements PricingRepository {}

void main() {
  late MockPricingRepository mockRepo;
  late ProviderContainer container;
  late ProviderSubscription<PricingState> sub;

  setUp(() {
    mockRepo = MockPricingRepository();

    when(() => mockRepo.getCalcRules()).thenAnswer((_) async => []);
    when(() => mockRepo.getServices()).thenAnswer((_) async => []);
    when(() => mockRepo.getDiscountTiers()).thenAnswer((_) async => []);
    when(() => mockRepo.getDiscountPolicy()).thenAnswer(
      (_) async => DiscountPolicy(
        id: '1',
        manualMaxPercentEmployee: 0,
        manualMaxPercentManager: 0,
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

    container = ProviderContainer(
      overrides: [pricingRepositoryProvider.overrideWithValue(mockRepo)],
    );
    container.read(pricingProvider);
    sub = container.listen(pricingProvider, (_, _) {});
  });

  tearDown(() {
    sub.close();
    container.dispose();
  });

  test('inline qiymat -> PATCH {value}', () async {
    final notifier = container.read(pricingProvider.notifier);
    // Wait for initial load
    await Future.delayed(Duration.zero);

    final updatedRule = CalcRule(
      id: '1',
      key: 'test_key',
      value: 12.0,
      unit: 'm',
      description: 'test',
      appliesTo: '',
      isActive: true,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    when(() => mockRepo.patchCalcRule('test_key', '12.0'))
        .thenAnswer((_) async => updatedRule);

    // Inject a dummy rule
    container.read(pricingProvider.notifier).state = PricingState(
      calcRules: [
        CalcRule(
          id: '1',
          key: 'test_key',
          value: 10.0,
          unit: 'm',
          description: '',
          appliesTo: '',
          isActive: true,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
      ],
    );

    await notifier.updateCalcRule('test_key', '12.0');

    verify(() => mockRepo.patchCalcRule('test_key', '12.0')).called(1);
    final state = container.read(pricingProvider);
    expect(state.calcRules.first.value, 12.0);
  });

  test('tier qo\'shish/o\'chirish', () async {
    final notifier = container.read(pricingProvider.notifier);
    await Future.delayed(Duration.zero);

    final newTier = DiscountTier(
      id: 't1',
      minAmount: 10000,
      percent: 5.0,
      isActive: true,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    when(() => mockRepo.createDiscountTier(10000, 5.0))
        .thenAnswer((_) async => newTier);
    when(() => mockRepo.deleteDiscountTier('t1')).thenAnswer((_) async => {});

    await notifier.addDiscountTier(10000, 5.0);
    verify(() => mockRepo.createDiscountTier(10000, 5.0)).called(1);

    var state = container.read(pricingProvider);
    expect(state.discountTiers.length, 1);
    expect(state.discountTiers.first.id, 't1');

    await notifier.deleteDiscountTier('t1');
    verify(() => mockRepo.deleteDiscountTier('t1')).called(1);

    state = container.read(pricingProvider);
    expect(state.discountTiers.isEmpty, true);
  });
}
