import 'package:json_annotation/json_annotation.dart';

import '../utils/cost_parser.dart';
import 'usage_daily_point_dto.dart';

part 'usage_summary_dto.g.dart';

/// `usage/summary/` javob tanasi (API-CONTRACT 10.1).
@JsonSerializable()
class UsageSummaryDto {
  @JsonKey(name: 'period')
  final String period;

  @JsonKey(name: 'date_from')
  final String? dateFrom;

  @JsonKey(name: 'date_to')
  final String? dateTo;

  @JsonKey(name: 'tokens')
  final int tokens;

  @JsonKey(name: 'cost_uzs')
  final String? costUzs;

  @JsonKey(name: 'messages')
  final int messages;

  @JsonKey(name: 'conversations')
  final int conversations;

  @JsonKey(name: 'orders')
  final int orders;

  @JsonKey(name: 'conversion')
  final String? conversion;

  @JsonKey(name: 'daily', defaultValue: [])
  final List<UsageDailyPointDto> daily;

  const UsageSummaryDto({
    required this.period,
    this.dateFrom,
    this.dateTo,
    this.tokens = 0,
    this.costUzs,
    this.messages = 0,
    this.conversations = 0,
    this.orders = 0,
    this.conversion,
    this.daily = const [],
  });

  factory UsageSummaryDto.fromJson(Map<String, dynamic> json) =>
      _$UsageSummaryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UsageSummaryDtoToJson(this);

  int get cost => parseCostUzs(costUzs) ?? 0;
}
