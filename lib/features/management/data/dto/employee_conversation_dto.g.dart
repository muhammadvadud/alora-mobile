// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'employee_conversation_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeConversationDto _$EmployeeConversationDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'EmployeeConversationDto',
  json,
  ($checkedConvert) {
    final val = EmployeeConversationDto(
      id: $checkedConvert('id', (v) => v as String),
      sessionId: $checkedConvert('session_id', (v) => v as String?),
      title: $checkedConvert('title', (v) => v as String),
      status: $checkedConvert('status', (v) => v as String),
      stage: $checkedConvert('stage', (v) => v as String),
      mode: $checkedConvert('mode', (v) => v as String),
      lastMessageAt: $checkedConvert('last_message_at', (v) => v as String?),
      startedAt: $checkedConvert('started_at', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'sessionId': 'session_id',
    'lastMessageAt': 'last_message_at',
    'startedAt': 'started_at',
  },
);

Map<String, dynamic> _$EmployeeConversationDtoToJson(
  EmployeeConversationDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'session_id': ?instance.sessionId,
  'title': instance.title,
  'status': instance.status,
  'stage': instance.stage,
  'mode': instance.mode,
  'last_message_at': ?instance.lastMessageAt,
  'started_at': ?instance.startedAt,
};
