import 'package:json_annotation/json_annotation.dart';

part 'category_dto.g.dart';

/// GET /catalog/categories/ elementi (API-CONTRACT 3.1)
@JsonSerializable()
class CategoryDto {
  final String id;
  final String name;
  final String slug;
  final String? parent;
  final int sortOrder;
  final bool isActive;

  const CategoryDto({
    required this.id,
    required this.name,
    required this.slug,
    this.parent,
    this.sortOrder = 0,
    this.isActive = true,
  });

  factory CategoryDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryDtoToJson(this);
}
