import 'package:freezed_annotation/freezed_annotation.dart';

part 'model_pricing_dto.freezed.dart';
part 'model_pricing_dto.g.dart';

@freezed
abstract class ModelPricingDto with _$ModelPricingDto {
  const factory ModelPricingDto({
    required String id,
    required String provider,
    required String model,
    @JsonKey(name: 'input_per_1m', fromJson: _parseDouble) required double inputPer1m,
    @JsonKey(name: 'output_per_1m', fromJson: _parseDouble) required double outputPer1m,
    @JsonKey(name: 'cached_input_per_1m', fromJson: _parseDouble) required double cachedInputPer1m,
    @JsonKey(name: 'stt_per_minute', fromJson: _parseDouble) required double sttPerMinute,
    @JsonKey(name: 'tts_per_1k_chars', fromJson: _parseDouble) required double ttsPer1kChars,
    @JsonKey(name: 'usd_to_uzs', fromJson: _parseDouble) required double usdToUzs,
    @JsonKey(name: 'is_active') @Default(true) bool isActive,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _ModelPricingDto;

  factory ModelPricingDto.fromJson(Map<String, dynamic> json) => _$ModelPricingDtoFromJson(json);
}

double _parseDouble(dynamic value) {
  if (value is String) {
    return double.tryParse(value) ?? 0.0;
  }
  if (value is num) {
    return value.toDouble();
  }
  return 0.0;
}
