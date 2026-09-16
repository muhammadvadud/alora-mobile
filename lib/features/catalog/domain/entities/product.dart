import 'package:freezed_annotation/freezed_annotation.dart';

import 'category.dart';
import 'product_enums.dart';
import 'product_variant.dart';

part 'product.freezed.dart';

@Freezed(makeCollectionsUnmodifiable: false)
abstract class Product with _$Product {
  const factory Product({
    required String id,
    required String categoryId,
    required Category? categoryData,
    required String name,
    required String code,
    String? description,
    String? fabricType,
    ProductStyle? style,
    ProductPattern? pattern,
    ProductTransparency? transparency,
    ProductDensity? density,
    String? composition,
    String? care,
    @Default([]) List<String> recommendedRooms,
    double? recommendedCoef,
    double? defaultWidthM,
    @Default(true) bool isSewingRequired,
    ProductSegment? segment,
    @Default([]) List<String> tags,
    @Default(0) int sortOrder,
    @Default(true) bool isActive,
    @Default([]) List<ProductVariant> variants,
  }) = _Product;
}
