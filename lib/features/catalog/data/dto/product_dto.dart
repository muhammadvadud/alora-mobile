import 'package:json_annotation/json_annotation.dart';

import '../../../../core/utils/json_converters.dart';
import '../../domain/entities/product_enums.dart';
import 'category_dto.dart';
import 'product_variant_dto.dart';

part 'product_dto.g.dart';

/// Mahsulot (API-CONTRACT 3.2)
@JsonSerializable()
class ProductDto {
  final String id;
  final String category;
  final CategoryDto? categoryData;
  final String name;
  final String code;
  final String? description;
  final String? fabricType;
  @JsonKey(unknownEnumValue: ProductStyle.unknown)
  final ProductStyle style;
  @JsonKey(unknownEnumValue: ProductPattern.unknown)
  final ProductPattern pattern;
  @JsonKey(unknownEnumValue: ProductTransparency.unknown)
  final ProductTransparency transparency;
  @JsonKey(unknownEnumValue: ProductDensity.unknown)
  final ProductDensity density;
  final String? composition;
  final String? care;
  final List<String> recommendedRooms;
  @JsonKey(fromJson: doubleFromJson, toJson: doubleToJson)
  final double? recommendedCoef;
  @JsonKey(fromJson: doubleFromJson, toJson: doubleToJson)
  final double? defaultWidthM;
  final bool isSewingRequired;
  @JsonKey(unknownEnumValue: ProductSegment.unknown)
  final ProductSegment segment;
  final List<String> tags;
  final int sortOrder;
  final bool isActive;
  final List<ProductVariantDto> variants;

  const ProductDto({
    required this.id,
    required this.category,
    this.categoryData,
    required this.name,
    required this.code,
    this.description,
    this.fabricType,
    this.style = ProductStyle.unknown,
    this.pattern = ProductPattern.unknown,
    this.transparency = ProductTransparency.unknown,
    this.density = ProductDensity.unknown,
    this.composition,
    this.care,
    this.recommendedRooms = const [],
    this.recommendedCoef,
    this.defaultWidthM,
    this.isSewingRequired = true,
    this.segment = ProductSegment.unknown,
    this.tags = const [],
    this.sortOrder = 0,
    this.isActive = true,
    this.variants = const [],
  });

  factory ProductDto.fromJson(Map<String, dynamic> json) => _$ProductDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDtoToJson(this);
}
