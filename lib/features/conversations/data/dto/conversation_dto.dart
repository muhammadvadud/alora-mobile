import 'package:json_annotation/json_annotation.dart';

part 'conversation_dto.g.dart';

/// GET/POST conversations/ javob tanasi (API-CONTRACT 6.1)
@JsonSerializable()
class ConversationDto {
  final String id;
  final String sessionId;
  final String title;
  final String mode;
  final String status;
  final String stage;
  final String? order;
  final DateTime? startedAt;
  final DateTime? lastMessageAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const ConversationDto({
    required this.id,
    required this.sessionId,
    required this.title,
    required this.mode,
    required this.status,
    required this.stage,
    this.order,
    this.startedAt,
    this.lastMessageAt,
    this.createdAt,
    this.updatedAt,
  });

  factory ConversationDto.fromJson(Map<String, dynamic> json) => _$ConversationDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ConversationDtoToJson(this);
}
