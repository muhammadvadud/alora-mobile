import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';

import 'package:alora_mobile/core/storage/hive_boxes.dart';
import 'package:alora_mobile/core/utils/paginated.dart';
import 'package:alora_mobile/features/catalog/data/datasources/catalog_local_ds.dart';
import 'package:alora_mobile/features/catalog/data/dto/category_dto.dart';
import 'package:alora_mobile/features/catalog/data/dto/product_dto.dart';

ProductDto _product(String id) =>
    ProductDto(id: id, category: 'c1', name: 'Mahsulot $id', code: 'K-$id');

Paginated<ProductDto> _page(List<String> ids, {String? next}) =>
    Paginated(next: next, previous: null, results: ids.map(_product).toList());

void main() {
  late Directory tempDir;
  late CatalogLocalDataSource ds;

  setUpAll(() async {
    tempDir = await Directory.systemTemp.createTemp('catalog_local_ds_');
    Hive.init(tempDir.path);
  });

  setUp(() async {
    ds = CatalogLocalDataSource();
    await Hive.openBox<dynamic>(HiveBoxes.catalogProducts);
    await Hive.openBox<dynamic>(HiveBoxes.catalogCategories);
  });

  tearDown(() async {
    await Hive.box<dynamic>(HiveBoxes.catalogProducts).clear();
    await Hive.box<dynamic>(HiveBoxes.catalogCategories).clear();
  });

  tearDownAll(() async {
    await Hive.close();
    await tempDir.delete(recursive: true);
  });

  group('CatalogLocalDataSource (rules §11 — TTL 24 soat, DTO JSON)', () {
    test("bo'sh kesh → null", () async {
      expect(await ds.getCachedProducts('all'), isNull);
      expect(await ds.getCachedCategories(), isNull);
      expect(await ds.getCachedProductDetail('p1'), isNull);
    });

    test('saqlangan mahsulotlar entity sifatida qaytadi', () async {
      await ds.saveProducts('cat=c1', _page(['p1', 'p2'], next: 'cursor2'));
      final cached = await ds.getCachedProducts('cat=c1');
      expect(cached, isNotNull);
      expect(cached!.results.map((p) => p.id), ['p1', 'p2']);
      expect(cached.next, 'cursor2');
      expect(cached.results.first.name, 'Mahsulot p1');
    });

    test('filter kaliti bo\'yicha alohida keshlanadi', () async {
      await ds.saveProducts('a', _page(['p1']));
      await ds.saveProducts('b', _page(['p9']));
      expect((await ds.getCachedProducts('a'))!.results.single.id, 'p1');
      expect((await ds.getCachedProducts('b'))!.results.single.id, 'p9');
    });

    test('saveProductsMerged: yangi sahifa eskisiga qo\'shiladi, dublikatsiz', () async {
      await ds.saveProducts('all', _page(['p1', 'p2'], next: 'c2'));
      await ds.saveProductsMerged('all', _page(['p2', 'p3'], next: null));
      final cached = await ds.getCachedProductsDto('all');
      expect(cached!.results.map((p) => p.id), ['p1', 'p2', 'p3']);
      expect(cached.next, isNull);
    });

    test('saveProductsMerged: kesh bo\'lmasa oddiy saqlash', () async {
      await ds.saveProductsMerged('x', _page(['p5']));
      expect((await ds.getCachedProducts('x'))!.results.single.id, 'p5');
    });

    test('mahsulot tafsiloti keshi', () async {
      await ds.saveProductDetail(_product('p7'));
      final p = await ds.getCachedProductDetail('p7');
      expect(p?.code, 'K-p7');
    });

    test('kategoriyalar keshi', () async {
      await ds.saveCategories(
        const Paginated(
          next: null,
          previous: null,
          results: [
            CategoryDto(id: 'c1', name: 'Matolar', slug: 'matolar', sortOrder: 0, isActive: true),
          ],
        ),
      );
      final cached = await ds.getCachedCategories();
      expect(cached!.results.single.name, 'Matolar');
    });

    test('TTL (24 soat) o\'tgan yozuv → null (stale)', () async {
      final box = Hive.box<dynamic>(HiveBoxes.catalogProducts);
      final old = DateTime.now().subtract(const Duration(hours: 25));
      await box.put(
        'all',
        jsonEncode({
          'saved_at': old.toIso8601String(),
          'data': {
            'next': null,
            'previous': null,
            'results': [_product('p1').toJson()],
          },
        }),
      );
      expect(await ds.getCachedProducts('all'), isNull);
      await box.put(
        'detail_p1',
        jsonEncode({'saved_at': old.toIso8601String(), 'data': _product('p1').toJson()}),
      );
      expect(await ds.getCachedProductDetail('p1'), isNull);
    });

    test('buzilgan JSON → null, xato tashlanmaydi', () async {
      final box = Hive.box<dynamic>(HiveBoxes.catalogProducts);
      await box.put('all', '{not json');
      await box.put('detail_p1', '[]');
      expect(await ds.getCachedProducts('all'), isNull);
      expect(await ds.getCachedProductDetail('p1'), isNull);
      await Hive.box<dynamic>(HiveBoxes.catalogCategories).put('all', '{"x":1}');
      expect(await ds.getCachedCategories(), isNull);
    });
  });
}
