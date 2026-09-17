import 'package:json_annotation/json_annotation.dart';

import '../utils/cost_parser.dart';

part 'usage_conversation_dto.g.dart';

/// `usage/conversations/` javob satri (API-CONTRACT 10.3).
@JsonSerializable()
class UsageConversationDto {
  @JsonKey(name: 'conversation_id')
  final String conversationId;

  @JsonKey(name: 'cost_uzs')
  final String? costUzs;

  @JsonKey(name: 'tokens')
  final int tokens;

  @JsonKey(name: 'messages')
  final int messages;

  const UsageConversationDto({
    required this.conversationId,
    this.costUzs,
    this.tokens = 0,
    this.messages = 0,
  });

  factory UsageConversationDto.fromJson(Map<String, dynamic> json) =>
      _$UsageConversationDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UsageConversationDtoToJson(this);

  int get cost => parseCostUzs(costUzs) ?? 0;
}
