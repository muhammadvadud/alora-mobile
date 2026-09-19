import 'package:freezed_annotation/freezed_annotation.dart';
// ignore_for_file: invalid_annotation_target

part 'chat_dto.freezed.dart';
part 'chat_dto.g.dart';

@freezed
abstract class MessageDto with _$MessageDto {
  const factory MessageDto({
    required String id,
    required String role,
    required String content,
    @JsonKey(name: 'tool_calls') List<Map<String, dynamic>>? toolCalls,
    @JsonKey(name: 'tool_result') Map<String, dynamic>? toolResult,
    @JsonKey(name: 'audio_url') String? audioUrl,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _MessageDto;

  factory MessageDto.fromJson(Map<String, dynamic> json) => _$MessageDtoFromJson(json);
}

@freezed
abstract class SendMessageContextDto with _$SendMessageContextDto {
  const factory SendMessageContextDto({
    @JsonKey(name: 'customer_mode') required bool customerMode,
    String? stage,
  }) = _SendMessageContextDto;

  factory SendMessageContextDto.fromJson(Map<String, dynamic> json) =>
      _$SendMessageContextDtoFromJson(json);
}

@freezed
abstract class SendMessageRequestDto with _$SendMessageRequestDto {
  const factory SendMessageRequestDto({
    required String content,
    required String locale,
    required SendMessageContextDto context,
  }) = _SendMessageRequestDto;

  factory SendMessageRequestDto.fromJson(Map<String, dynamic> json) =>
      _$SendMessageRequestDtoFromJson(json);
}

@freezed
abstract class UsageDto with _$UsageDto {
  const factory UsageDto({
    @JsonKey(name: 'prompt_tokens') required int promptTokens,
    @JsonKey(name: 'completion_tokens') required int completionTokens,
    @JsonKey(name: 'total_tokens') required int totalTokens,
    @JsonKey(name: 'cost_uzs') required String costUzs,
  }) = _UsageDto;

  factory UsageDto.fromJson(Map<String, dynamic> json) => _$UsageDtoFromJson(json);
}
