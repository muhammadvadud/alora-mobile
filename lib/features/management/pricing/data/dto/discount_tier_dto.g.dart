// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'discount_tier_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DiscountTierDto _$DiscountTierDtoFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_DiscountTierDto',
  json,
  ($checkedConvert) {
    final val = _DiscountTierDto(
      id: $checkedConvert('id', (v) => v as String),
      minAmount: $checkedConvert('min_amount', (v) => v as String),
      percent: $checkedConvert('percent', (v) => v as String),
      isActive: $checkedConvert('is_active', (v) => v as bool),
      createdAt: $checkedConvert('created_at', (v) => v as String),
      updatedAt: $checkedConvert('updated_at', (v) => v as String),
    );
    return val;
  },
  fieldKeyMap: const {
    'minAmount': 'min_amount',
    'isActive': 'is_active',
    'createdAt': 'created_at',
    'updatedAt': 'updated_at',
  },
);

Map<String, dynamic> _$DiscountTierDtoToJson(_DiscountTierDto instance) => <String, dynamic>{
  'id': instance.id,
  'min_amount': instance.minAmount,
  'percent': instance.percent,
  'is_active': instance.isActive,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
};
