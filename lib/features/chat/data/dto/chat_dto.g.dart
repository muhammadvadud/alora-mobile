// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'chat_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MessageDto _$MessageDtoFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_MessageDto',
  json,
  ($checkedConvert) {
    final val = _MessageDto(
      id: $checkedConvert('id', (v) => v as String),
      role: $checkedConvert('role', (v) => v as String),
      content: $checkedConvert('content', (v) => v as String),
      toolCalls: $checkedConvert(
        'tool_calls',
        (v) => (v as List<dynamic>?)
            ?.map((e) => e as Map<String, dynamic>)
            .toList(),
      ),
      toolResult: $checkedConvert(
        'tool_result',
        (v) => v as Map<String, dynamic>?,
      ),
      audioUrl: $checkedConvert('audio_url', (v) => v as String?),
      createdAt: $checkedConvert(
        'created_at',
        (v) => DateTime.parse(v as String),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'toolCalls': 'tool_calls',
    'toolResult': 'tool_result',
    'audioUrl': 'audio_url',
    'createdAt': 'created_at',
  },
);

Map<String, dynamic> _$MessageDtoToJson(_MessageDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'role': instance.role,
      'content': instance.content,
      'tool_calls': ?instance.toolCalls,
      'tool_result': ?instance.toolResult,
      'audio_url': ?instance.audioUrl,
      'created_at': instance.createdAt.toIso8601String(),
    };

_SendMessageContextDto _$SendMessageContextDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_SendMessageContextDto',
  json,
  ($checkedConvert) {
    final val = _SendMessageContextDto(
      customerMode: $checkedConvert('customer_mode', (v) => v as bool),
      stage: $checkedConvert('stage', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {'customerMode': 'customer_mode'},
);

Map<String, dynamic> _$SendMessageContextDtoToJson(
  _SendMessageContextDto instance,
) => <String, dynamic>{
  'customer_mode': instance.customerMode,
  'stage': ?instance.stage,
};

_SendMessageRequestDto _$SendMessageRequestDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_SendMessageRequestDto', json, ($checkedConvert) {
  final val = _SendMessageRequestDto(
    content: $checkedConvert('content', (v) => v as String),
    locale: $checkedConvert('locale', (v) => v as String),
    context: $checkedConvert(
      'context',
      (v) => SendMessageContextDto.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$SendMessageRequestDtoToJson(
  _SendMessageRequestDto instance,
) => <String, dynamic>{
  'content': instance.content,
  'locale': instance.locale,
  'context': instance.context.toJson(),
};

_UsageDto _$UsageDtoFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_UsageDto',
  json,
  ($checkedConvert) {
    final val = _UsageDto(
      promptTokens: $checkedConvert('prompt_tokens', (v) => (v as num).toInt()),
      completionTokens: $checkedConvert(
        'completion_tokens',
        (v) => (v as num).toInt(),
      ),
      totalTokens: $checkedConvert('total_tokens', (v) => (v as num).toInt()),
      costUzs: $checkedConvert('cost_uzs', (v) => v as String),
    );
    return val;
  },
  fieldKeyMap: const {
    'promptTokens': 'prompt_tokens',
    'completionTokens': 'completion_tokens',
    'totalTokens': 'total_tokens',
    'costUzs': 'cost_uzs',
  },
);

Map<String, dynamic> _$UsageDtoToJson(_UsageDto instance) => <String, dynamic>{
  'prompt_tokens': instance.promptTokens,
  'completion_tokens': instance.completionTokens,
  'total_tokens': instance.totalTokens,
  'cost_uzs': instance.costUzs,
};
