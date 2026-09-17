import 'package:freezed_annotation/freezed_annotation.dart';

part 'discount_tier_dto.freezed.dart';
part 'discount_tier_dto.g.dart';

@freezed
abstract class DiscountTierDto with _$DiscountTierDto {
  const factory DiscountTierDto({
    required String id,
    @JsonKey(name: 'min_amount') required String minAmount,
    required String percent,
    @JsonKey(name: 'is_active') required bool isActive,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
  }) = _DiscountTierDto;

  factory DiscountTierDto.fromJson(Map<String, dynamic> json) =>
      _$DiscountTierDtoFromJson(json);
}
