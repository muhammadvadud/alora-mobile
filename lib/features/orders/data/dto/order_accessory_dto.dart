// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

import 'order_variant_dto.dart';

part 'order_accessory_dto.freezed.dart';
part 'order_accessory_dto.g.dart';

@freezed
abstract class OrderAccessoryDto with _$OrderAccessoryDto {
  const factory OrderAccessoryDto({
    required String id,
    OrderVariantDto? variant,
    String? qty,
    String? unit,
    @JsonKey(name: 'unit_price') String? unitPrice,
    String? total,
    @JsonKey(name: 'sort_order') int? sortOrder,
  }) = _OrderAccessoryDto;

  factory OrderAccessoryDto.fromJson(Map<String, dynamic> json) =>
      _$OrderAccessoryDtoFromJson(json);
}
