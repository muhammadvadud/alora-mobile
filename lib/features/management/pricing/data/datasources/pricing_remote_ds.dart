import 'package:alora_mobile/features/management/pricing/data/dto/calc_preview_dto.dart';
import 'package:alora_mobile/features/management/pricing/data/dto/calc_rule_dto.dart';
import 'package:alora_mobile/features/management/pricing/data/dto/discount_policy_dto.dart';
import 'package:alora_mobile/features/management/pricing/data/dto/discount_tier_dto.dart';
import 'package:alora_mobile/features/management/pricing/data/dto/order_defaults_dto.dart';
import 'package:alora_mobile/features/management/pricing/data/dto/service_price_dto.dart';
import 'package:dio/dio.dart';
import 'package:alora_mobile/core/network/api_paths.dart';

abstract class PricingRemoteDataSource {
  Future<CalcPreviewResponseDto> calcPreview(CalcPreviewRequestDto request);
  Future<List<CalcRuleDto>> getCalcRules();
  Future<List<CalcRuleDto>> patchCalcRules(List<Map<String, dynamic>> rules);
  Future<CalcRuleDto> patchCalcRule(String key, Map<String, dynamic> data);
  Future<List<ServicePriceDto>> getServices();
  Future<List<ServicePriceDto>> patchServices(List<Map<String, dynamic>> services);
  Future<List<DiscountTierDto>> getDiscountTiers();
  Future<DiscountTierDto> createDiscountTier(Map<String, dynamic> data);
  Future<DiscountTierDto> patchDiscountTier(String id, Map<String, dynamic> data);
  Future<void> deleteDiscountTier(String id);
  Future<DiscountPolicyDto> getDiscountPolicy();
  Future<DiscountPolicyDto> patchDiscountPolicy(Map<String, dynamic> data);
  Future<OrderDefaultsDto> getOrderDefaults();
  Future<OrderDefaultsDto> patchOrderDefaults(Map<String, dynamic> data);
}

class PricingRemoteDataSourceImpl implements PricingRemoteDataSource {
  final Dio _dio;

  PricingRemoteDataSourceImpl(this._dio);

  @override
  Future<CalcPreviewResponseDto> calcPreview(CalcPreviewRequestDto request) async {
    final res = await _dio.post(ApiPaths.calcPreview, data: request.toJson());
    return CalcPreviewResponseDto.fromJson(res.data as Map<String, dynamic>);
  }

  @override
  Future<List<CalcRuleDto>> getCalcRules() async {
    final res = await _dio.get(ApiPaths.calcRules);
    return (res.data as List).map((e) => CalcRuleDto.fromJson(e as Map<String, dynamic>)).toList();
  }

  @override
  Future<List<CalcRuleDto>> patchCalcRules(List<Map<String, dynamic>> rules) async {
    final res = await _dio.patch(ApiPaths.calcRules, data: {'items': rules});
    if (res.data is List) {
      return (res.data as List).map((e) => CalcRuleDto.fromJson(e as Map<String, dynamic>)).toList();
    }
    return [];
  }
  
  @override
  Future<CalcRuleDto> patchCalcRule(String key, Map<String, dynamic> data) async {
    final res = await _dio.patch(ApiPaths.calcRule(key), data: data);
    return CalcRuleDto.fromJson(res.data as Map<String, dynamic>);
  }

  @override
  Future<List<ServicePriceDto>> getServices() async {
    final res = await _dio.get(ApiPaths.services);
    return (res.data as List).map((e) => ServicePriceDto.fromJson(e as Map<String, dynamic>)).toList();
  }

  @override
  Future<List<ServicePriceDto>> patchServices(List<Map<String, dynamic>> services) async {
    final res = await _dio.patch(ApiPaths.services, data: {'items': services});
    if (res.data is List) {
      return (res.data as List).map((e) => ServicePriceDto.fromJson(e as Map<String, dynamic>)).toList();
    }
    return [];
  }

  @override
  Future<List<DiscountTierDto>> getDiscountTiers() async {
    final res = await _dio.get(ApiPaths.discountTiers);
    if (res.data is Map<String, dynamic> && (res.data as Map<String, dynamic>)['results'] != null) {
      return ((res.data as Map<String, dynamic>)['results'] as List).map((e) => DiscountTierDto.fromJson(e as Map<String, dynamic>)).toList();
    }
    return (res.data as List).map((e) => DiscountTierDto.fromJson(e as Map<String, dynamic>)).toList();
  }

  @override
  Future<DiscountTierDto> createDiscountTier(Map<String, dynamic> data) async {
    final res = await _dio.post(ApiPaths.discountTiers, data: data);
    return DiscountTierDto.fromJson(res.data as Map<String, dynamic>);
  }

  @override
  Future<DiscountTierDto> patchDiscountTier(String id, Map<String, dynamic> data) async {
    final res = await _dio.patch('\${ApiPaths.discountTiers}$id/', data: data);
    return DiscountTierDto.fromJson(res.data as Map<String, dynamic>);
  }

  @override
  Future<void> deleteDiscountTier(String id) async {
    await _dio.delete('\${ApiPaths.discountTiers}$id/');
  }

  @override
  Future<DiscountPolicyDto> getDiscountPolicy() async {
    final res = await _dio.get(ApiPaths.discountPolicy);
    return DiscountPolicyDto.fromJson(res.data as Map<String, dynamic>);
  }

  @override
  Future<DiscountPolicyDto> patchDiscountPolicy(Map<String, dynamic> data) async {
    final res = await _dio.patch(ApiPaths.discountPolicy, data: data);
    return DiscountPolicyDto.fromJson(res.data as Map<String, dynamic>);
  }

  @override
  Future<OrderDefaultsDto> getOrderDefaults() async {
    final res = await _dio.get(ApiPaths.orderDefaults);
    return OrderDefaultsDto.fromJson(res.data as Map<String, dynamic>);
  }

  @override
  Future<OrderDefaultsDto> patchOrderDefaults(Map<String, dynamic> data) async {
    final res = await _dio.patch(ApiPaths.orderDefaults, data: data);
    return OrderDefaultsDto.fromJson(res.data as Map<String, dynamic>);
  }
}
