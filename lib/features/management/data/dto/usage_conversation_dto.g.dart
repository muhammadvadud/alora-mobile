// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'usage_conversation_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsageConversationDto _$UsageConversationDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'UsageConversationDto',
  json,
  ($checkedConvert) {
    final val = UsageConversationDto(
      conversationId: $checkedConvert('conversation_id', (v) => v as String),
      costUzs: $checkedConvert('cost_uzs', (v) => v as String?),
      tokens: $checkedConvert('tokens', (v) => (v as num?)?.toInt() ?? 0),
      messages: $checkedConvert('messages', (v) => (v as num?)?.toInt() ?? 0),
    );
    return val;
  },
  fieldKeyMap: const {
    'conversationId': 'conversation_id',
    'costUzs': 'cost_uzs',
  },
);

Map<String, dynamic> _$UsageConversationDtoToJson(
  UsageConversationDto instance,
) => <String, dynamic>{
  'conversation_id': instance.conversationId,
  'cost_uzs': ?instance.costUzs,
  'tokens': instance.tokens,
  'messages': instance.messages,
};
