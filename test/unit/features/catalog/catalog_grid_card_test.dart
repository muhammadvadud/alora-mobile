import 'package:flutter_test/flutter_test.dart';
import 'package:alora_mobile/features/catalog/domain/entities/product.dart';
import 'package:alora_mobile/features/catalog/domain/entities/product_image.dart';
import 'package:alora_mobile/features/catalog/domain/entities/product_variant.dart';
import 'package:alora_mobile/features/catalog/presentation/widgets/catalog_grid_card.dart';
import 'package:alora_mobile/shared/models/price_unit.dart';

Product _makeProduct({List<ProductVariant>? variants}) => Product(
  id: 'prod-1',
  categoryId: 'cat-1',
  categoryData: null,
  name: 'Velvet Milano',
  code: 'VLM-204',
  variants: variants ?? const [],
);

ProductVariant _makeVariant({
  required String id,
  bool isActive = true,
  String colorName = 'Grafit',
  int price = 180000,
  List<ProductImage> images = const [],
}) => ProductVariant(
  id: id,
  sku: 'SKU',
  colorName: colorName,
  colorHex: '#4A4A4A',
  widthM: 1.5,
  price: price,
  priceUnit: PriceUnit.perSqm,
  isActive: isActive,
  images: images,
);

ProductImage _makeImage({required String id, bool isPrimary = false}) => ProductImage(
  id: id,
  productId: 'prod-1',
  variantId: 'var-1',
  imageUrl: 'https://example.com/$id.jpg',
  isPrimary: isPrimary,
);

void main() {
  group('productToCardData', () {
    test('first active variant is used', () {
      final product = _makeProduct(
        variants: [
          _makeVariant(id: 'inactive', isActive: false),
          _makeVariant(id: 'active', isActive: true, price: 90000),
        ],
      );

      final card = productToCardData(product);

      expect(card.id, 'prod-1');
      expect(card.name, 'Velvet Milano');
      expect(card.price, 90000);
    });

    test('primary image is selected', () {
      final product = _makeProduct(
        variants: [
          _makeVariant(
            id: 'var-1',
            images: [
              _makeImage(id: 'img-1', isPrimary: false),
              _makeImage(id: 'img-2', isPrimary: true),
            ],
          ),
        ],
      );

      final card = productToCardData(product);

      expect(card.imageUrl, 'https://example.com/img-2.jpg');
    });

    test('fallback to first image if none primary', () {
      final product = _makeProduct(
        variants: [
          _makeVariant(
            id: 'var-1',
            images: [
              _makeImage(id: 'img-1', isPrimary: false),
              _makeImage(id: 'img-2', isPrimary: false),
            ],
          ),
        ],
      );

      final card = productToCardData(product);

      expect(card.imageUrl, 'https://example.com/img-1.jpg');
    });

    test('empty variants → price 0, imageUrl null', () {
      final product = _makeProduct(variants: []);
      final card = productToCardData(product);

      expect(card.price, 0);
      expect(card.imageUrl, isNull);
      expect(card.colorHex, '000000');
      expect(card.colorName, isEmpty);
    });

    test('variant with no images → imageUrl null', () {
      final product = _makeProduct(
        variants: [_makeVariant(id: 'var-1', images: [])],
      );

      final card = productToCardData(product);
      expect(card.imageUrl, isNull);
    });
  });
}
