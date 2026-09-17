import 'package:json_annotation/json_annotation.dart';

part 'profile_limit_dto.g.dart';

/// `auth/me/` javobidagi `limit` blo'gi (API-CONTRACT 1.4).
/// `limit` null bo'lishi mumkin; `is_unlimited` bo'lsa maydonlar ixtiyoriy.
@JsonSerializable()
class ProfileLimitDto {
  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'user_id')
  final String userId;

  @JsonKey(name: 'period')
  final String period;

  @JsonKey(name: 'is_unlimited')
  final bool isUnlimited;

  @JsonKey(name: 'max_tokens')
  final int? maxTokens;

  @JsonKey(name: 'max_cost_uzs')
  final String? maxCostUzs;

  @JsonKey(name: 'max_messages')
  final int? maxMessages;

  @JsonKey(name: 'on_exceed')
  final String onExceed;

  @JsonKey(name: 'is_active')
  final bool isActive;

  const ProfileLimitDto({
    required this.id,
    required this.userId,
    required this.period,
    required this.isUnlimited,
    this.maxTokens,
    this.maxCostUzs,
    this.maxMessages,
    required this.onExceed,
    required this.isActive,
  });

  factory ProfileLimitDto.fromJson(Map<String, dynamic> json) =>
      _$ProfileLimitDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileLimitDtoToJson(this);
}