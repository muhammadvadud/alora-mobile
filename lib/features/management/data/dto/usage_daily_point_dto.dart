import 'package:json_annotation/json_annotation.dart';

import '../utils/cost_parser.dart';

part 'usage_daily_point_dto.g.dart';

/// `usage/summary/` ichidagi kunlik sarf nuqtasi (ixtiyoriy).
@JsonSerializable()
class UsageDailyPointDto {
  @JsonKey(name: 'date')
  final String? date;

  @JsonKey(name: 'cost_uzs')
  final String? costUzs;

  const UsageDailyPointDto({this.date, this.costUzs});

  factory UsageDailyPointDto.fromJson(Map<String, dynamic> json) =>
      _$UsageDailyPointDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UsageDailyPointDtoToJson(this);

  int get cost => parseCostUzs(costUzs) ?? 0;
}
