// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'knowledge_rule_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_KnowledgeRuleDto _$KnowledgeRuleDtoFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_KnowledgeRuleDto',
  json,
  ($checkedConvert) {
    final val = _KnowledgeRuleDto(
      id: $checkedConvert('id', (v) => v as String),
      kind: $checkedConvert('kind', (v) => v as String),
      condition: $checkedConvert(
        'condition',
        (v) => (v as List<dynamic>).map((e) => e as String).toList(),
      ),
      recommendation: $checkedConvert('recommendation', (v) => v as String),
      priority: $checkedConvert('priority', (v) => (v as num).toInt()),
      isActive: $checkedConvert('is_active', (v) => v as bool),
      createdAt: $checkedConvert('created_at', (v) => DateTime.parse(v as String)),
      updatedAt: $checkedConvert('updated_at', (v) => DateTime.parse(v as String)),
    );
    return val;
  },
  fieldKeyMap: const {
    'isActive': 'is_active',
    'createdAt': 'created_at',
    'updatedAt': 'updated_at',
  },
);

Map<String, dynamic> _$KnowledgeRuleDtoToJson(_KnowledgeRuleDto instance) => <String, dynamic>{
  'id': instance.id,
  'kind': instance.kind,
  'condition': instance.condition,
  'recommendation': instance.recommendation,
  'priority': instance.priority,
  'is_active': instance.isActive,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
};
