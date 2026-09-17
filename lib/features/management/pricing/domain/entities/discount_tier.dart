import 'package:freezed_annotation/freezed_annotation.dart';

part 'discount_tier.freezed.dart';

@freezed
abstract class DiscountTier with _$DiscountTier {
  const factory DiscountTier({
    required String id,
    required int minAmount,
    required double percent,
    required bool isActive,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _DiscountTier;
}
