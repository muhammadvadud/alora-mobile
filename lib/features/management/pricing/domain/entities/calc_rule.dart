import 'package:freezed_annotation/freezed_annotation.dart';

part 'calc_rule.freezed.dart';

@freezed
abstract class CalcRule with _$CalcRule {
  const factory CalcRule({
    required String id,
    required String key,
    required double value,
    required String unit,
    required String description,
    required String appliesTo,
    required bool isActive,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _CalcRule;
}
