import 'package:flutter_test/flutter_test.dart';
import 'package:alora_mobile/features/catalog/application/catalog_query_mapper.dart';
import 'package:alora_mobile/features/catalog/application/catalog_filter.dart';
import 'package:alora_mobile/features/catalog/domain/entities/product_enums.dart';

void main() {
  group('CatalogQueryMapper.toQuery', () {
    test('empty filter → empty map', () {
      final q = CatalogQueryMapper.toQuery(const CatalogFilter());
      expect(q, isEmpty);
    });

    test('type fabric → price_unit per_sqm', () {
      final q = CatalogQueryMapper.toQuery(
        const CatalogFilter(type: ProductType.fabric),
      );
      expect(q, {'price_unit': 'per_sqm'});
    });

    test('type accessory → price_unit per_piece', () {
      final q = CatalogQueryMapper.toQuery(
        const CatalogFilter(type: ProductType.accessory),
      );
      expect(q, {'price_unit': 'per_piece'});
    });

    test('type unknown → price_unit not sent', () {
      final q = CatalogQueryMapper.toQuery(
        const CatalogFilter(type: ProductType.unknown),
      );
      expect(q, isEmpty);
    });

    test('style → correct value', () {
      expect(
        CatalogQueryMapper.toQuery(
          const CatalogFilter(style: ProductStyle.klassik),
        ),
        {'style': 'klassik'},
      );
      expect(
        CatalogQueryMapper.toQuery(
          const CatalogFilter(style: ProductStyle.zamonaviy),
        ),
        {'style': 'zamonaviy'},
      );
      expect(
        CatalogQueryMapper.toQuery(
          const CatalogFilter(style: ProductStyle.minimalist),
        ),
        {'style': 'minimalist'},
      );
    });

    test('room → correct snake_case value', () {
      expect(
        CatalogQueryMapper.toQuery(
          const CatalogFilter(room: ProductRoom.mehmonxona),
        ),
        {'room': 'mehmonxona'},
      );
      expect(
        CatalogQueryMapper.toQuery(
          const CatalogFilter(room: ProductRoom.bolalarXonasi),
        ),
        {'room': 'bolalar_xonasi'},
      );
    });

    test('segment → correct value', () {
      expect(
        CatalogQueryMapper.toQuery(
          const CatalogFilter(segment: ProductSegment.economy),
        ),
        {'segment': 'economy'},
      );
    });

    test('min_price and max_price → string values', () {
      final q = CatalogQueryMapper.toQuery(
        const CatalogFilter(minPrice: 60000, maxPrice: 220000),
      );
      expect(q['min_price'], '60000');
      expect(q['max_price'], '220000');
    });

    test('pattern and transparency are NOT sent to backend', () {
      final q = CatalogQueryMapper.toQuery(
        const CatalogFilter(
          pattern: ProductPattern.gulli,
          transparency: ProductTransparency.yorug,
        ),
      );
      expect(q, isEmpty);
    });

    test('combined filter produces all keys', () {
      final q = CatalogQueryMapper.toQuery(
        const CatalogFilter(
          type: ProductType.accessory,
          style: ProductStyle.zamonaviy,
          room: ProductRoom.oshxona,
          segment: ProductSegment.standard,
          minPrice: 10000,
          maxPrice: 50000,
        ),
      );
      expect(q, {
        'price_unit': 'per_piece',
        'style': 'zamonaviy',
        'room': 'oshxona',
        'segment': 'standard',
        'min_price': '10000',
        'max_price': '50000',
      });
    });
  });

  group('CatalogQueryMapper.filterKey', () {
    test('same filter → same key', () {
      final f = const CatalogFilter(
        style: ProductStyle.klassik,
        minPrice: 10000,
      );
      expect(CatalogQueryMapper.filterKey(f), CatalogQueryMapper.filterKey(f));
    });

    test('different filter → different key', () {
      final a = const CatalogFilter(style: ProductStyle.klassik);
      final b = const CatalogFilter(style: ProductStyle.zamonaviy);
      expect(
        CatalogQueryMapper.filterKey(a),
        isNot(CatalogQueryMapper.filterKey(b)),
      );
    });
  });
}
