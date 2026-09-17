// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'usage_limit_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsageLimitDto _$UsageLimitDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'UsageLimitDto',
      json,
      ($checkedConvert) {
        final val = UsageLimitDto(
          id: $checkedConvert('id', (v) => v as String),
          userId: $checkedConvert('user_id', (v) => v as String),
          period: $checkedConvert('period', (v) => v as String),
          isUnlimited: $checkedConvert('is_unlimited', (v) => v as bool),
          maxTokens: $checkedConvert('max_tokens', (v) => (v as num?)?.toInt()),
          maxCostUzs: $checkedConvert('max_cost_uzs', (v) => v as String?),
          maxMessages: $checkedConvert(
            'max_messages',
            (v) => (v as num?)?.toInt(),
          ),
          onExceed: $checkedConvert('on_exceed', (v) => v as String),
          isActive: $checkedConvert('is_active', (v) => v as bool),
        );
        return val;
      },
      fieldKeyMap: const {
        'userId': 'user_id',
        'isUnlimited': 'is_unlimited',
        'maxTokens': 'max_tokens',
        'maxCostUzs': 'max_cost_uzs',
        'maxMessages': 'max_messages',
        'onExceed': 'on_exceed',
        'isActive': 'is_active',
      },
    );

Map<String, dynamic> _$UsageLimitDtoToJson(UsageLimitDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'period': instance.period,
      'is_unlimited': instance.isUnlimited,
      'max_tokens': ?instance.maxTokens,
      'max_cost_uzs': ?instance.maxCostUzs,
      'max_messages': ?instance.maxMessages,
      'on_exceed': instance.onExceed,
      'is_active': instance.isActive,
    };
