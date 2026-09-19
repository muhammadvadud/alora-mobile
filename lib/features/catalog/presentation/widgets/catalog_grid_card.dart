import 'package:alora_mobile/features/catalog/domain/entities/product.dart';
import 'package:alora_mobile/features/catalog/domain/entities/product_image.dart';
import 'package:alora_mobile/features/catalog/domain/entities/product_variant.dart';
import 'package:alora_mobile/shared/models/price_unit.dart';
import 'package:alora_mobile/shared/models/product_card_data.dart';

/// [Product]'ni [ProductCardData]'ga aylantiruvchi yordamchi.
///
/// Grid kartasi uchun birinchi faol variant va uning asosiy rasmi olinadi.
ProductCardData productToCardData(Product product) {
  final ProductVariant? variant = product.variants.isEmpty
      ? null
      : product.variants.firstWhere((v) => v.isActive, orElse: () => product.variants.first);
  final List<ProductImage> images = variant?.images ?? const [];
  final ProductImage? image = images.isEmpty
      ? null
      : images.firstWhere((i) => i.isPrimary, orElse: () => images.first);

  return ProductCardData(
    id: product.id,
    name: product.name,
    imageUrl: image?.imageUrl,
    price: variant?.price ?? 0,
    priceUnit: variant?.priceUnit ?? PriceUnit.unknown,
    colorHex: variant?.colorHex ?? '000000',
    colorName: variant?.colorName ?? '',
  );
}
