import 'package:json_annotation/json_annotation.dart';

part 'employee_conversation_dto.g.dart';

/// `team/employees/{id}/conversations/` javob elementi (API-CONTRACT 2.6).
@JsonSerializable()
class EmployeeConversationDto {
  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'session_id')
  final String? sessionId;

  @JsonKey(name: 'title')
  final String title;

  @JsonKey(name: 'status')
  final String status;

  @JsonKey(name: 'stage')
  final String stage;

  @JsonKey(name: 'mode')
  final String mode;

  @JsonKey(name: 'last_message_at')
  final String? lastMessageAt;

  @JsonKey(name: 'started_at')
  final String? startedAt;

  const EmployeeConversationDto({
    required this.id,
    this.sessionId,
    required this.title,
    required this.status,
    required this.stage,
    required this.mode,
    this.lastMessageAt,
    this.startedAt,
  });

  factory EmployeeConversationDto.fromJson(Map<String, dynamic> json) =>
      _$EmployeeConversationDtoFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeConversationDtoToJson(this);
}
