import 'package:alora_mobile/features/management/pricing/application/pricing_repository.dart';
import 'package:alora_mobile/features/management/pricing/domain/entities/calc_rule.dart';
import 'package:alora_mobile/features/management/pricing/domain/entities/discount_policy.dart';
import 'package:alora_mobile/features/management/pricing/domain/entities/discount_tier.dart';
import 'package:alora_mobile/features/management/pricing/domain/entities/order_defaults.dart';
import 'package:alora_mobile/features/management/pricing/domain/entities/service_price.dart';
import 'package:alora_mobile/features/management/pricing/data/dto/calc_preview_dto.dart';
import 'package:alora_mobile/features/chat/domain/entities/quote.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pricing_notifier.freezed.dart';
part 'pricing_notifier.g.dart';

@freezed
abstract class PricingState with _$PricingState {
  const factory PricingState({
    @Default([]) List<CalcRule> calcRules,
    @Default([]) List<ServicePrice> services,
    @Default([]) List<DiscountTier> discountTiers,
    DiscountPolicy? discountPolicy,
    OrderDefaults? orderDefaults,
    @Default(false) bool isLoading,
    String? error,
  }) = _PricingState;
}

@riverpod
class PricingNotifier extends _$PricingNotifier {
  @override
  PricingState build() {
    // loadData build tugagandan keyin ishga tushadi — aks holda riverpod-3 da
    // build() ichida synchronous `state=` "uninitialized provider" xatosi beradi.
    Future.microtask(loadData);
    return const PricingState(isLoading: true);
  }

  Future<void> loadData() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final repo = ref.read(pricingRepositoryProvider);
      final results = await Future.wait([
        repo.getCalcRules(),
        repo.getServices(),
        repo.getDiscountTiers(),
        repo.getDiscountPolicy(),
        repo.getOrderDefaults(),
      ]);

      state = state.copyWith(
        isLoading: false,
        calcRules: results[0] as List<CalcRule>,
        services: results[1] as List<ServicePrice>,
        discountTiers: results[2] as List<DiscountTier>,
        discountPolicy: results[3] as DiscountPolicy?,
        orderDefaults: results[4] as OrderDefaults?,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> updateCalcRule(String key, String value) async {
    try {
      final repo = ref.read(pricingRepositoryProvider);
      final updatedRule = await repo.patchCalcRule(key, value);
      state = state.copyWith(
        calcRules: state.calcRules.map((r) => r.key == key ? updatedRule : r).toList(),
      );
    } catch (e) {
      state = state.copyWith(error: e.toString());
      rethrow;
    }
  }

  Future<void> updateService(ServicePrice service, int price) async {
    try {
      final repo = ref.read(pricingRepositoryProvider);
      final updated = await repo.patchService(service, price);
      state = state.copyWith(
        services: state.services.map((item) => item.key == service.key ? updated : item).toList(),
      );
    } catch (e) {
      state = state.copyWith(error: e.toString());
      rethrow;
    }
  }

  Future<void> addDiscountTier(int minAmount, double percent) async {
    try {
      final repo = ref.read(pricingRepositoryProvider);
      final newTier = await repo.createDiscountTier(minAmount, percent);
      state = state.copyWith(discountTiers: [...state.discountTiers, newTier]);
    } catch (e) {
      state = state.copyWith(error: e.toString());
      rethrow;
    }
  }

  Future<void> deleteDiscountTier(String id) async {
    try {
      final repo = ref.read(pricingRepositoryProvider);
      await repo.deleteDiscountTier(id);
      state = state.copyWith(discountTiers: state.discountTiers.where((t) => t.id != id).toList());
    } catch (e) {
      state = state.copyWith(error: e.toString());
      rethrow;
    }
  }

  Future<void> updateDiscountPolicy(
    double employeeMax,
    double managerMax, {
    bool? stackWithTier,
  }) async {
    try {
      final repo = ref.read(pricingRepositoryProvider);
      final updated = await repo.patchDiscountPolicy(
        employeeMax,
        managerMax,
        stackWithTier: stackWithTier,
      );
      state = state.copyWith(discountPolicy: updated);
    } catch (e) {
      state = state.copyWith(error: e.toString());
      rethrow;
    }
  }

  Future<void> updateOrderDefaults(double prepayment, int deliveryAmount, int deadlineDays) async {
    try {
      final repo = ref.read(pricingRepositoryProvider);
      final updated = await repo.patchOrderDefaults(prepayment, deliveryAmount, deadlineDays);
      state = state.copyWith(orderDefaults: updated);
    } catch (e) {
      state = state.copyWith(error: e.toString());
      rethrow;
    }
  }

  Future<Quote> calcPreview(CalcPreviewRequestDto request) async {
    final repo = ref.read(pricingRepositoryProvider);
    return await repo.calcPreview(request);
  }
}
