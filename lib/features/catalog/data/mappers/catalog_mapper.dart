import 'package:alora_mobile/core/utils/app_logger.dart';
import 'package:alora_mobile/features/catalog/data/dto/category_dto.dart';
import 'package:alora_mobile/features/catalog/data/dto/product_dto.dart';
import 'package:alora_mobile/features/catalog/data/dto/product_image_dto.dart';
import 'package:alora_mobile/features/catalog/data/dto/product_variant_dto.dart';
import 'package:alora_mobile/features/catalog/domain/entities/category.dart';
import 'package:alora_mobile/features/catalog/domain/entities/product.dart';
import 'package:alora_mobile/features/catalog/domain/entities/product_image.dart';
import 'package:alora_mobile/features/catalog/domain/entities/product_variant.dart';

/// Backend narxlarni `"180000.00"` (string, 2 kasr) formatidan
/// tiyinsiz so'm soniga aylantiradi. Muvaffaqiyatsiz bo'lsa 0 qaytaradi.
int parsePriceString(String? value) {
  if (value == null || value.isEmpty) return 0;
  final parsed = double.tryParse(value);
  if (parsed == null) {
    logger.w('Narx formatini o\'qib bo\'lmadi: $value');
    return 0;
  }
  return parsed.round();
}

Category categoryDtoToEntity(CategoryDto dto) {
  return Category(
    id: dto.id,
    name: dto.name,
    slug: dto.slug,
    parent: dto.parent,
    sortOrder: dto.sortOrder,
    isActive: dto.isActive,
  );
}

ProductImage productImageDtoToEntity(ProductImageDto dto) {
  return ProductImage(
    id: dto.id,
    productId: dto.product,
    variantId: dto.variant,
    imageUrl: dto.imageUrl,
    alt: dto.alt,
    sortOrder: dto.sortOrder,
    isPrimary: dto.isPrimary,
  );
}

ProductVariant productVariantDtoToEntity(ProductVariantDto dto) {
  return ProductVariant(
    id: dto.id,
    sku: dto.sku,
    colorName: dto.colorName,
    colorHex: dto.colorHex,
    widthM: dto.widthM,
    price: parsePriceString(dto.price),
    priceUnit: dto.priceUnit,
    oldPrice: parsePriceString(dto.oldPrice),
    costPrice: parsePriceString(dto.costPrice),
    isActive: dto.isActive,
    images: dto.images.map(productImageDtoToEntity).toList(),
  );
}

Product productDtoToEntity(ProductDto dto) {
  return Product(
    id: dto.id,
    categoryId: dto.category,
    categoryData: dto.categoryData == null ? null : categoryDtoToEntity(dto.categoryData!),
    name: dto.name,
    code: dto.code,
    description: dto.description,
    fabricType: dto.fabricType,
    style: dto.style,
    pattern: dto.pattern,
    transparency: dto.transparency,
    density: dto.density,
    composition: dto.composition,
    care: dto.care,
    recommendedRooms: dto.recommendedRooms,
    recommendedCoef: dto.recommendedCoef,
    defaultWidthM: dto.defaultWidthM,
    isSewingRequired: dto.isSewingRequired,
    segment: dto.segment,
    tags: dto.tags,
    sortOrder: dto.sortOrder,
    isActive: dto.isActive,
    variants: dto.variants.map(productVariantDtoToEntity).toList(),
  );
}
