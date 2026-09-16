// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_curtain_part_dto.freezed.dart';
part 'order_curtain_part_dto.g.dart';

@freezed
abstract class OrderCurtainPartDto with _$OrderCurtainPartDto {
  const factory OrderCurtainPartDto({
    required String id,
    Map<String, dynamic>? variant,
    String? role,
    @JsonKey(name: 'width_m') String? widthM,
    @JsonKey(name: 'height_m') String? heightM,
    String? coefficient,
    @JsonKey(name: 'area_sqm') String? areaSqm,
    @JsonKey(name: 'price_per_sqm') String? pricePerSqm,
    String? total,
    @JsonKey(name: 'sort_order') int? sortOrder,
  }) = _OrderCurtainPartDto;

  factory OrderCurtainPartDto.fromJson(Map<String, dynamic> json) =>
      _$OrderCurtainPartDtoFromJson(json);
}
