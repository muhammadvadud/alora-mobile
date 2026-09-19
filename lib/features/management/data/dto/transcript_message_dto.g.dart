// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'transcript_message_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TranscriptMessageDto _$TranscriptMessageDtoFromJson(Map<String, dynamic> json) => $checkedCreate(
  'TranscriptMessageDto',
  json,
  ($checkedConvert) {
    final val = TranscriptMessageDto(
      role: $checkedConvert('role', (v) => v as String),
      content: $checkedConvert('content', (v) => v as String? ?? ''),
      toolCalls: $checkedConvert('tool_calls', (v) => v as List<dynamic>?),
      toolResult: $checkedConvert('tool_result', (v) => v),
      createdAt: $checkedConvert('created_at', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'toolCalls': 'tool_calls',
    'toolResult': 'tool_result',
    'createdAt': 'created_at',
  },
);

Map<String, dynamic> _$TranscriptMessageDtoToJson(TranscriptMessageDto instance) =>
    <String, dynamic>{
      'role': instance.role,
      'content': instance.content,
      'tool_calls': ?instance.toolCalls,
      'tool_result': ?instance.toolResult,
      'created_at': ?instance.createdAt,
    };
