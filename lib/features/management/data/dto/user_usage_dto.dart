import 'package:json_annotation/json_annotation.dart';

import '../utils/cost_parser.dart';

part 'user_usage_dto.g.dart';

/// `usage/by-user/` javob elementlari (API-CONTRACT 10.2).
@JsonSerializable()
class UserUsageDto {
  @JsonKey(name: 'user_id')
  final String userId;

  @JsonKey(name: 'full_name')
  final String? fullName;

  @JsonKey(name: 'tokens')
  final int tokens;

  @JsonKey(name: 'cost_uzs')
  final String? costUzs;

  @JsonKey(name: 'messages')
  final int messages;

  @JsonKey(name: 'conversations')
  final int conversations;

  const UserUsageDto({
    required this.userId,
    this.fullName,
    this.tokens = 0,
    this.costUzs,
    this.messages = 0,
    this.conversations = 0,
  });

  factory UserUsageDto.fromJson(Map<String, dynamic> json) => _$UserUsageDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserUsageDtoToJson(this);

  int get cost => parseCostUzs(costUzs) ?? 0;
}
