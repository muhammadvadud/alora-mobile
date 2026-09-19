import 'package:flutter_test/flutter_test.dart';

import 'package:alora_mobile/features/catalog/data/dto/category_dto.dart';
import 'package:alora_mobile/features/catalog/data/dto/product_dto.dart';
import 'package:alora_mobile/features/catalog/data/mappers/catalog_mapper.dart';
import 'package:alora_mobile/shared/models/price_unit.dart';

/// Backend `GET catalog/products/{id}/` javobiga mos namuna (API-CONTRACT §3).
Map<String, dynamic> _productJson() => {
  'id': 'p1',
  'category': 'c1',
  'category_data': {
    'id': 'c1',
    'name': 'Matolar',
    'slug': 'matolar',
    'parent': null,
    'sort_order': 1,
    'is_active': true,
  },
  'name': 'Belgiya parda',
  'code': 'BEL-001',
  'description': 'Zich mato',
  'style': 'classic',
  'segment': 'premium',
  'recommended_rooms': ['living', 'bedroom'],
  'recommended_coef': 2.5,
  'default_width_m': 2.8,
  'tags': ['yangi'],
  'variants': [
    {
      'id': 'v1',
      'sku': 'BEL-001-01',
      'color_name': 'Zumrad',
      'color_hex': '#0E5751',
      'width_m': 2.8,
      'price': '180000.00',
      'price_unit': 'per_sqm',
      'old_price': '200000.00',
      'cost_price': null,
      'is_active': true,
      'images': [
        {
          'id': 'i1',
          'product': 'p1',
          'variant': 'v1',
          'image': 'https://cdn/img1.jpg',
          'alt': 'Zumrad',
          'sort_order': 0,
          'is_primary': true,
          'is_active': true,
        },
      ],
    },
  ],
};

void main() {
  group('parsePriceString (§9.3 — int so\'m)', () {
    test(
      '"180000.00" → 180000',
      () => expect(parsePriceString('180000.00'), 180000),
    );
    test('kasr yaxlitlanadi: "2748000.50" → 2748001', () {
      expect(parsePriceString('2748000.50'), 2748001);
    });
    test('null / bo\'sh / buzilgan → 0', () {
      expect(parsePriceString(null), 0);
      expect(parsePriceString(''), 0);
      expect(parsePriceString('abc'), 0);
    });
  });

  group('categoryDtoToEntity', () {
    test('barcha maydonlar ko\'chadi', () {
      final dto = CategoryDto.fromJson(
        _productJson()['category_data'] as Map<String, dynamic>,
      );
      final c = categoryDtoToEntity(dto);
      expect(c.id, 'c1');
      expect(c.name, 'Matolar');
      expect(c.slug, 'matolar');
      expect(c.parent, isNull);
      expect(c.sortOrder, 1);
      expect(c.isActive, isTrue);
    });
  });

  group('productDtoToEntity', () {
    test('DTO → entity: narx int, birlik enum, variant va rasm ichma-ich', () {
      final product = productDtoToEntity(ProductDto.fromJson(_productJson()));

      expect(product.id, 'p1');
      expect(product.categoryId, 'c1');
      expect(product.categoryData?.name, 'Matolar');
      expect(product.name, 'Belgiya parda');
      expect(product.recommendedRooms, ['living', 'bedroom']);
      expect(product.recommendedCoef, 2.5);
      expect(product.variants, hasLength(1));

      final v = product.variants.single;
      expect(v.price, 180000);
      expect(v.oldPrice, 200000);
      expect(v.costPrice, 0, reason: 'cost_price null → 0 (UI yashiradi)');
      expect(v.priceUnit, PriceUnit.perSqm);
      expect(v.images.single.imageUrl, 'https://cdn/img1.jpg');
      expect(v.images.single.productId, 'p1');
      expect(v.images.single.isPrimary, isTrue);
    });

    test(
      'category_data yo\'q bo\'lsa null, variantsiz mahsulot bo\'sh ro\'yxat',
      () {
        final json = _productJson()
          ..remove('category_data')
          ..['variants'] = <Map<String, dynamic>>[];
        final product = productDtoToEntity(ProductDto.fromJson(json));
        expect(product.categoryData, isNull);
        expect(product.variants, isEmpty);
      },
    );
  });
}
