import 'package:freezed_annotation/freezed_annotation.dart';

part 'discount_policy.freezed.dart';

@freezed
abstract class DiscountPolicy with _$DiscountPolicy {
  const factory DiscountPolicy({
    required String id,
    required double manualMaxPercentEmployee,
    required double manualMaxPercentManager,
    required bool isActive,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _DiscountPolicy;
}
