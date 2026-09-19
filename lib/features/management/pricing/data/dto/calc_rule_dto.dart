import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/utils/json_converters.dart';

part 'calc_rule_dto.freezed.dart';
part 'calc_rule_dto.g.dart';

@freezed
abstract class CalcRuleDto with _$CalcRuleDto {
  const factory CalcRuleDto({
    required String id,
    required String key,
    required String value,
    required String unit,
    required String description,
    @JsonKey(name: 'applies_to', fromJson: mapFromJson) @Default({}) Map<String, dynamic> appliesTo,
    @JsonKey(name: 'is_active') required bool isActive,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
  }) = _CalcRuleDto;

  factory CalcRuleDto.fromJson(Map<String, dynamic> json) => _$CalcRuleDtoFromJson(json);
}
