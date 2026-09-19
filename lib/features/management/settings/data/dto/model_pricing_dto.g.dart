// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'model_pricing_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ModelPricingDto _$ModelPricingDtoFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_ModelPricingDto',
  json,
  ($checkedConvert) {
    final val = _ModelPricingDto(
      id: $checkedConvert('id', (v) => v as String),
      provider: $checkedConvert('provider', (v) => v as String),
      model: $checkedConvert('model', (v) => v as String),
      inputPer1m: $checkedConvert('input_per_1m', (v) => _parseDouble(v)),
      outputPer1m: $checkedConvert('output_per_1m', (v) => _parseDouble(v)),
      cachedInputPer1m: $checkedConvert('cached_input_per_1m', (v) => _parseDouble(v)),
      sttPerMinute: $checkedConvert('stt_per_minute', (v) => _parseDouble(v)),
      ttsPer1kChars: $checkedConvert('tts_per_1k_chars', (v) => _parseDouble(v)),
      usdToUzs: $checkedConvert('usd_to_uzs', (v) => _parseDouble(v)),
      isActive: $checkedConvert('is_active', (v) => v as bool? ?? true),
      createdAt: $checkedConvert(
        'created_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      updatedAt: $checkedConvert(
        'updated_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'inputPer1m': 'input_per_1m',
    'outputPer1m': 'output_per_1m',
    'cachedInputPer1m': 'cached_input_per_1m',
    'sttPerMinute': 'stt_per_minute',
    'ttsPer1kChars': 'tts_per_1k_chars',
    'usdToUzs': 'usd_to_uzs',
    'isActive': 'is_active',
    'createdAt': 'created_at',
    'updatedAt': 'updated_at',
  },
);

Map<String, dynamic> _$ModelPricingDtoToJson(_ModelPricingDto instance) => <String, dynamic>{
  'id': instance.id,
  'provider': instance.provider,
  'model': instance.model,
  'input_per_1m': instance.inputPer1m,
  'output_per_1m': instance.outputPer1m,
  'cached_input_per_1m': instance.cachedInputPer1m,
  'stt_per_minute': instance.sttPerMinute,
  'tts_per_1k_chars': instance.ttsPer1kChars,
  'usd_to_uzs': instance.usdToUzs,
  'is_active': instance.isActive,
  'created_at': ?instance.createdAt?.toIso8601String(),
  'updated_at': ?instance.updatedAt?.toIso8601String(),
};
