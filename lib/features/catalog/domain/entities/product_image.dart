import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_image.freezed.dart';

@Freezed(makeCollectionsUnmodifiable: false)
abstract class ProductImage with _$ProductImage {
  const factory ProductImage({
    required String id,
    required String productId,
    required String variantId,
    required String imageUrl,
    String? alt,
    @Default(0) int sortOrder,
    @Default(false) bool isPrimary,
  }) = _ProductImage;
}
