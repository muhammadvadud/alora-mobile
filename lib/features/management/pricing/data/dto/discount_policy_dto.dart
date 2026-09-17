import 'package:freezed_annotation/freezed_annotation.dart';

part 'discount_policy_dto.freezed.dart';
part 'discount_policy_dto.g.dart';

@freezed
abstract class DiscountPolicyDto with _$DiscountPolicyDto {
  const factory DiscountPolicyDto({
    required String id,
    @JsonKey(name: 'manual_max_percent_employee')
    required String manualMaxPercentEmployee,
    @JsonKey(name: 'manual_max_percent_manager')
    required String manualMaxPercentManager,
    @JsonKey(name: 'is_active') required bool isActive,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
  }) = _DiscountPolicyDto;

  factory DiscountPolicyDto.fromJson(Map<String, dynamic> json) =>
      _$DiscountPolicyDtoFromJson(json);
}
