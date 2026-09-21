// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../shared/models/price_unit.dart';

part 'order_variant_dto.freezed.dart';
part 'order_variant_dto.g.dart';

@freezed
abstract class OrderVariantDto with _$OrderVariantDto {
  const factory OrderVariantDto({
    required String id,
    String? sku,
    @JsonKey(name: 'color_name') String? colorName,
    @JsonKey(name: 'product_name') String? productName,
    @JsonKey(name: 'price_unit', unknownEnumValue: PriceUnit.unknown) PriceUnit? priceUnit,
  }) = _OrderVariantDto;

  factory OrderVariantDto.fromJson(Map<String, dynamic> json) => _$OrderVariantDtoFromJson(json);
}
