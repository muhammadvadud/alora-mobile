import 'package:json_annotation/json_annotation.dart';

part 'limit_dto.g.dart';

/// GET /auth/me/ javobidagi `limit` blo'gi (API-CONTRACT 1.4).
/// `limit` null bo'lishi mumkin, is_unlimited bo'lsa maydonlar ixtiyoriy.
@JsonSerializable()
class LimitDto {
  final String id;
  final String userId;
  final String period;
  final bool isUnlimited;
  final int? maxTokens;
  final String? maxCostUzs;
  final int? maxMessages;
  final String onExceed;
  final bool isActive;

  const LimitDto({
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

  factory LimitDto.fromJson(Map<String, dynamic> json) => _$LimitDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LimitDtoToJson(this);
}
