import 'package:json_annotation/json_annotation.dart';

import '../utils/cost_parser.dart';

part 'conversion_stats_dto.g.dart';

/// `analytics/conversion/` javob tanasi (API-CONTRACT 10.4).
/// Backend hozircha `conversion_rate` qaytarmaydi — ixtiyoriy qilib olindi.
@JsonSerializable()
class ConversionStatsDto {
  @JsonKey(name: 'total_conversations')
  final int totalConversations;

  @JsonKey(name: 'with_order')
  final int withOrder;

  @JsonKey(name: 'conversion_rate')
  final String? conversionRate;

  const ConversionStatsDto({this.totalConversations = 0, this.withOrder = 0, this.conversionRate});

  factory ConversionStatsDto.fromJson(Map<String, dynamic> json) =>
      _$ConversionStatsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ConversionStatsDtoToJson(this);

  double? get rate => parseCostUzs(conversionRate)?.toDouble();
}
