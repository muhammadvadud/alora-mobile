import 'package:json_annotation/json_annotation.dart';

part 'transcript_message_dto.g.dart';

/// `conversations/{id}/transcript/` javob elementlari.
@JsonSerializable()
class TranscriptMessageDto {
  @JsonKey(name: 'role')
  final String role;

  @JsonKey(name: 'content')
  final String content;

  @JsonKey(name: 'tool_calls')
  final List<dynamic>? toolCalls;

  @JsonKey(name: 'tool_result')
  final dynamic toolResult;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  const TranscriptMessageDto({
    required this.role,
    this.content = '',
    this.toolCalls,
    this.toolResult,
    this.createdAt,
  });

  factory TranscriptMessageDto.fromJson(Map<String, dynamic> json) =>
      _$TranscriptMessageDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TranscriptMessageDtoToJson(this);
}
