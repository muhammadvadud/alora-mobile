// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'conversation_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConversationDto _$ConversationDtoFromJson(Map<String, dynamic> json) => $checkedCreate(
  'ConversationDto',
  json,
  ($checkedConvert) {
    final val = ConversationDto(
      id: $checkedConvert('id', (v) => v as String),
      sessionId: $checkedConvert('session_id', (v) => v as String),
      title: $checkedConvert('title', (v) => v as String),
      mode: $checkedConvert('mode', (v) => v as String),
      status: $checkedConvert('status', (v) => v as String),
      stage: $checkedConvert('stage', (v) => v as String),
      order: $checkedConvert('order', (v) => v as String?),
      startedAt: $checkedConvert(
        'started_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      lastMessageAt: $checkedConvert(
        'last_message_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
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
    'sessionId': 'session_id',
    'startedAt': 'started_at',
    'lastMessageAt': 'last_message_at',
    'createdAt': 'created_at',
    'updatedAt': 'updated_at',
  },
);

Map<String, dynamic> _$ConversationDtoToJson(ConversationDto instance) => <String, dynamic>{
  'id': instance.id,
  'session_id': instance.sessionId,
  'title': instance.title,
  'mode': instance.mode,
  'status': instance.status,
  'stage': instance.stage,
  'order': ?instance.order,
  'started_at': ?instance.startedAt?.toIso8601String(),
  'last_message_at': ?instance.lastMessageAt?.toIso8601String(),
  'created_at': ?instance.createdAt?.toIso8601String(),
  'updated_at': ?instance.updatedAt?.toIso8601String(),
};
