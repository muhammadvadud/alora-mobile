// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'discount_policy_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DiscountPolicyDto _$DiscountPolicyDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_DiscountPolicyDto',
      json,
      ($checkedConvert) {
        final val = _DiscountPolicyDto(
          id: $checkedConvert('id', (v) => v as String),
          manualMaxPercentEmployee: $checkedConvert(
            'manual_max_percent_employee',
            (v) => v as String,
          ),
          manualMaxPercentManager: $checkedConvert(
            'manual_max_percent_manager',
            (v) => v as String,
          ),
          stackWithTier: $checkedConvert(
            'stack_with_tier',
            (v) => v as bool? ?? true,
          ),
          isActive: $checkedConvert('is_active', (v) => v as bool? ?? true),
          createdAt: $checkedConvert('created_at', (v) => v as String),
          updatedAt: $checkedConvert('updated_at', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {
        'manualMaxPercentEmployee': 'manual_max_percent_employee',
        'manualMaxPercentManager': 'manual_max_percent_manager',
        'stackWithTier': 'stack_with_tier',
        'isActive': 'is_active',
        'createdAt': 'created_at',
        'updatedAt': 'updated_at',
      },
    );

Map<String, dynamic> _$DiscountPolicyDtoToJson(_DiscountPolicyDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'manual_max_percent_employee': instance.manualMaxPercentEmployee,
      'manual_max_percent_manager': instance.manualMaxPercentManager,
      'stack_with_tier': instance.stackWithTier,
      'is_active': instance.isActive,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
