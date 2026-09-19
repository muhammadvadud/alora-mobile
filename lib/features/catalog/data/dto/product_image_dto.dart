import 'package:json_annotation/json_annotation.dart';

part 'product_image_dto.g.dart';

/// Mahsulot rasmi (API-CONTRACT 3.2 — `images` bloki)
@JsonSerializable()
class ProductImageDto {
  final String id;
  final String product;
  final String variant;

  @JsonKey(name: 'image')
  final String imageUrl;

  final String? alt;
  final int sortOrder;
  final bool isPrimary;
  final bool isActive;

  const ProductImageDto({
    required this.id,
    required this.product,
    required this.variant,
    required this.imageUrl,
    this.alt,
    this.sortOrder = 0,
    this.isPrimary = false,
    this.isActive = true,
  });

  factory ProductImageDto.fromJson(Map<String, dynamic> json) => _$ProductImageDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProductImageDtoToJson(this);
}
