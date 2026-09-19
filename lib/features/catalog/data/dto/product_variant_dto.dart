import 'package:alora_mobile/shared/models/price_unit.dart';
import 'package:json_annotation/json_annotation.dart';

import 'product_image_dto.dart';

part 'product_variant_dto.g.dart';

/// Mahsulot varianti (API-CONTRACT 3.2 — `variants` bloki)
@JsonSerializable()
class ProductVariantDto {
  final String id;
  final String sku;
  final String colorName;
  final String colorHex;
  final double widthM;
  final String price;
  @JsonKey(unknownEnumValue: PriceUnit.unknown)
  final PriceUnit priceUnit;
  final String? oldPrice;
  final String? costPrice;
  final bool isActive;
  final List<ProductImageDto> images;

  const ProductVariantDto({
    required this.id,
    required this.sku,
    required this.colorName,
    required this.colorHex,
    this.widthM = 0,
    required this.price,
    this.priceUnit = PriceUnit.unknown,
    this.oldPrice,
    this.costPrice,
    this.isActive = true,
    this.images = const [],
  });

  factory ProductVariantDto.fromJson(Map<String, dynamic> json) =>
      _$ProductVariantDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProductVariantDtoToJson(this);
}
