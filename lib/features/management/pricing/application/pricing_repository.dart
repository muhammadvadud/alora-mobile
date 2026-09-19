import 'package:alora_mobile/core/network/dio_client.dart';
import 'package:alora_mobile/features/management/pricing/data/datasources/pricing_remote_ds.dart';
import 'package:alora_mobile/features/management/pricing/data/mappers/pricing_mapper.dart';
import 'package:alora_mobile/features/management/pricing/domain/entities/calc_rule.dart';
import 'package:alora_mobile/features/management/pricing/domain/entities/discount_policy.dart';
import 'package:alora_mobile/features/management/pricing/domain/entities/discount_tier.dart';
import 'package:alora_mobile/features/management/pricing/domain/entities/order_defaults.dart';
import 'package:alora_mobile/features/management/pricing/domain/entities/service_price.dart';
import 'package:alora_mobile/features/management/pricing/data/dto/calc_preview_dto.dart';
import 'package:alora_mobile/features/chat/domain/entities/quote.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pricing_repository.g.dart';

class PricingRepository {
  final PricingRemoteDataSource _remoteDs;

  PricingRepository(this._remoteDs);

  Future<Quote> calcPreview(CalcPreviewRequestDto request) async {
    final dto = await _remoteDs.calcPreview(request);
    return PricingMapper.toQuote(dto);
  }

  Future<List<CalcRule>> getCalcRules() async {
    final dtos = await _remoteDs.getCalcRules();
    return dtos.map(PricingMapper.toCalcRule).toList();
  }

  Future<CalcRule> patchCalcRule(String key, String value) async {
    final dto = await _remoteDs.patchCalcRule(key, {'value': value});
    return PricingMapper.toCalcRule(dto);
  }

  Future<List<ServicePrice>> getServices() async {
    final dtos = await _remoteDs.getServices();
    return dtos.map(PricingMapper.toServicePrice).toList();
  }

  Future<List<DiscountTier>> getDiscountTiers() async {
    final dtos = await _remoteDs.getDiscountTiers();
    return dtos.map(PricingMapper.toDiscountTier).toList();
  }

  Future<DiscountTier> createDiscountTier(int minAmount, double percent) async {
    final dto = await _remoteDs.createDiscountTier({
      'min_amount': minAmount.toString(),
      'percent': percent.toString(),
    });
    return PricingMapper.toDiscountTier(dto);
  }

  Future<DiscountTier> patchDiscountTier(String id, int minAmount, double percent) async {
    final dto = await _remoteDs.patchDiscountTier(id, {
      'min_amount': minAmount.toString(),
      'percent': percent.toString(),
    });
    return PricingMapper.toDiscountTier(dto);
  }

  Future<void> deleteDiscountTier(String id) async {
    await _remoteDs.deleteDiscountTier(id);
  }

  Future<DiscountPolicy> getDiscountPolicy() async {
    final dto = await _remoteDs.getDiscountPolicy();
    return PricingMapper.toDiscountPolicy(dto);
  }

  Future<DiscountPolicy> patchDiscountPolicy(
    double employeeMax,
    double managerMax, {
    bool? stackWithTier,
  }) async {
    final dto = await _remoteDs.patchDiscountPolicy({
      'manual_max_percent_employee': employeeMax.toString(),
      'manual_max_percent_manager': managerMax.toString(),
      'stack_with_tier': ?stackWithTier,
    });
    return PricingMapper.toDiscountPolicy(dto);
  }

  Future<OrderDefaults> getOrderDefaults() async {
    final dto = await _remoteDs.getOrderDefaults();
    return PricingMapper.toOrderDefaults(dto);
  }

  Future<OrderDefaults> patchOrderDefaults(
    double prepayment,
    int deliveryAmount,
    int deadlineDays,
  ) async {
    final dto = await _remoteDs.patchOrderDefaults({
      'prepayment_percent': prepayment.toString(),
      'delivery_amount': deliveryAmount.toString(),
      'deadline_days': deadlineDays.toString(),
    });
    return PricingMapper.toOrderDefaults(dto);
  }
}

@riverpod
PricingRepository pricingRepository(Ref ref) {
  final dio = ref.watch(dioProvider);
  return PricingRepository(PricingRemoteDataSourceImpl(dio));
}
