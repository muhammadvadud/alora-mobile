import 'package:json_annotation/json_annotation.dart';
import 'package:alora_mobile/shared/models/price_unit.dart';
import 'package:alora_mobile/core/utils/json_converters.dart';

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
  @JsonKey(fromJson: doubleFromJson, toJson: doubleToJson)
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

  factory ProductWriteDto.fromJson(Map<String, dynamic> json) => _$ProductWriteDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ProductWriteDtoToJson(this);
}

@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake)
class VariantWriteDto {
  final String? id;
  final String sku;
  final String colorName;
  final String colorHex;
  @JsonKey(fromJson: doubleFromJson, toJson: doubleToJson)
  final double? widthM;
  final String price;
  final String? costPrice;
  final PriceUnit priceUnit;
  final bool? isActive;

  const VariantWriteDto({
    this.id,
    required this.sku,
    required this.colorName,
    required this.colorHex,
    this.widthM,
    required this.price,
    this.costPrice,
    required this.priceUnit,
    this.isActive,
  });

  factory VariantWriteDto.fromJson(Map<String, dynamic> json) => _$VariantWriteDtoFromJson(json);
  Map<String, dynamic> toJson() => _$VariantWriteDtoToJson(this);

  VariantWriteDto copyWith({
    String? id,
    String? sku,
    String? colorName,
    String? colorHex,
    double? widthM,
    String? price,
    String? costPrice,
    PriceUnit? priceUnit,
    bool? isActive,
  }) {
    return VariantWriteDto(
      id: id ?? this.id,
      sku: sku ?? this.sku,
      colorName: colorName ?? this.colorName,
      colorHex: colorHex ?? this.colorHex,
      widthM: widthM ?? this.widthM,
      price: price ?? this.price,
      costPrice: costPrice ?? this.costPrice,
      priceUnit: priceUnit ?? this.priceUnit,
      isActive: isActive ?? this.isActive,
    );
  }
}

@JsonSerializable(fieldRename: FieldRename.snake)
class BulkPriceDto {
  final List<String> variantIds;
  @JsonKey(fromJson: doubleFromJsonRequired, toJson: doubleToJson)
  final double value;
  final String type;

  const BulkPriceDto({required this.variantIds, required this.value, required this.type});

  factory BulkPriceDto.fromJson(Map<String, dynamic> json) => _$BulkPriceDtoFromJson(json);
  Map<String, dynamic> toJson() => _$BulkPriceDtoToJson(this);
}
