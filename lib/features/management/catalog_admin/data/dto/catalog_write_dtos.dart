import 'package:json_annotation/json_annotation.dart';
import 'package:alora_mobile/shared/models/price_unit.dart';

part 'catalog_write_dtos.g.dart';

@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake)
class ProductWriteDto {
  final String name;
  final String code;
  final String category;
  final String? description;
  final String? fabricType;
  final String style;
  final String pattern;
  final String transparency;
  final List<String> recommendedRooms;
  final double? defaultWidthM;
  final String segment;
  final String? composition;
  final String? care;
  final bool? isActive;
  final List<VariantWriteDto>? variants;

  const ProductWriteDto({
    required this.name,
    required this.code,
    required this.category,
    this.description,
    this.fabricType,
    required this.style,
    required this.pattern,
    required this.transparency,
    required this.recommendedRooms,
    this.defaultWidthM,
    required this.segment,
    this.composition,
    this.care,
    this.isActive,
    this.variants,
  });

  factory ProductWriteDto.fromJson(Map<String, dynamic> json) =>
      _$ProductWriteDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ProductWriteDtoToJson(this);
}

@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake)
class VariantWriteDto {
  final String? id;
  final String sku;
  final String colorName;
  final String colorHex;
  final double? widthM;
  final String price;
  final PriceUnit priceUnit;
  final bool? isActive;

  const VariantWriteDto({
    this.id,
    required this.sku,
    required this.colorName,
    required this.colorHex,
    this.widthM,
    required this.price,
    required this.priceUnit,
    this.isActive,
  });

  factory VariantWriteDto.fromJson(Map<String, dynamic> json) =>
      _$VariantWriteDtoFromJson(json);
  Map<String, dynamic> toJson() => _$VariantWriteDtoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class BulkPriceDto {
  final List<String> variantIds;
  final String? percent;
  final String? amount;

  const BulkPriceDto({required this.variantIds, this.percent, this.amount});

  factory BulkPriceDto.fromJson(Map<String, dynamic> json) =>
      _$BulkPriceDtoFromJson(json);
  Map<String, dynamic> toJson() => _$BulkPriceDtoToJson(this);
}
