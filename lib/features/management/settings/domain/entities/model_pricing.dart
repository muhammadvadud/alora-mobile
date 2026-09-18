import 'package:freezed_annotation/freezed_annotation.dart';

part 'model_pricing.freezed.dart';

@freezed
abstract class ModelPricing with _$ModelPricing {
  const factory ModelPricing({
    required String id,
    required String provider,
    required String model,
    required double inputPer1m,
    required double outputPer1m,
    required double cachedInputPer1m,
    required double sttPerMinute,
    required double ttsPer1kChars,
    required double usdToUzs,
    @Default(true) bool isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _ModelPricing;
}
