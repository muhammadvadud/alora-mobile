import 'package:alora_mobile/shared/models/price_unit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'product_image.dart';

part 'product_variant.freezed.dart';

@Freezed(makeCollectionsUnmodifiable: false)
abstract class ProductVariant with _$ProductVariant {
  const factory ProductVariant({
    required String id,
    required String sku,
    required String colorName,
    required String colorHex,
    required double widthM,
    required int price,
    required PriceUnit priceUnit,
    int? oldPrice,
    int? costPrice,
    @Default(true) bool isActive,
    @Default([]) List<ProductImage> images,
  }) = _ProductVariant;
}
