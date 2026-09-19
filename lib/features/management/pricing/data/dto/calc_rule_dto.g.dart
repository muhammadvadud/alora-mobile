// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'calc_rule_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CalcRuleDto _$CalcRuleDtoFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_CalcRuleDto',
  json,
  ($checkedConvert) {
    final val = _CalcRuleDto(
      id: $checkedConvert('id', (v) => v as String),
      key: $checkedConvert('key', (v) => v as String),
      value: $checkedConvert('value', (v) => v as String),
      unit: $checkedConvert('unit', (v) => v as String),
      description: $checkedConvert('description', (v) => v as String),
      appliesTo: $checkedConvert('applies_to', (v) => v as String),
      isActive: $checkedConvert('is_active', (v) => v as bool),
      createdAt: $checkedConvert('created_at', (v) => v as String),
      updatedAt: $checkedConvert('updated_at', (v) => v as String),
    );
    return val;
  },
  fieldKeyMap: const {
    'appliesTo': 'applies_to',
    'isActive': 'is_active',
    'createdAt': 'created_at',
    'updatedAt': 'updated_at',
  },
);

Map<String, dynamic> _$CalcRuleDtoToJson(_CalcRuleDto instance) => <String, dynamic>{
  'id': instance.id,
  'key': instance.key,
  'value': instance.value,
  'unit': instance.unit,
  'description': instance.description,
  'applies_to': instance.appliesTo,
  'is_active': instance.isActive,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
};
