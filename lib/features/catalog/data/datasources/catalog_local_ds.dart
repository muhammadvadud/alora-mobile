import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

import 'package:alora_mobile/core/storage/hive_boxes.dart';
import 'package:alora_mobile/core/utils/app_logger.dart';
import 'package:alora_mobile/core/utils/paginated.dart';

import '../../domain/entities/category.dart';
import '../../domain/entities/product.dart';
import '../dto/category_dto.dart';
import '../dto/product_dto.dart';
import '../mappers/catalog_mapper.dart';

/// Katalog keshi (Hive): stale-while-revalidate, TTL 24 soat.
///
/// `catalog_products` va `catalog_categories` box'larida xom DTO JSON
/// saqlanadi; o'qilganda DTO → entity mapper'dan o'tadi.
class CatalogLocalDataSource {
  CatalogLocalDataSource();

  static const Duration ttl = Duration(hours: 24);

  static const _categoriesKey = 'all';

  Future<Box<dynamic>> _productsBox() async {
    if (Hive.isBoxOpen(HiveBoxes.catalogProducts)) {
      return Hive.box(HiveBoxes.catalogProducts);
    }
    return Hive.openBox(HiveBoxes.catalogProducts);
  }

  Future<Box<dynamic>> _categoriesBox() async {
    if (Hive.isBoxOpen(HiveBoxes.catalogCategories)) {
      return Hive.box(HiveBoxes.catalogCategories);
    }
    return Hive.openBox(HiveBoxes.catalogCategories);
  }

  bool _isExpired(DateTime savedAt) {
    return DateTime.now().difference(savedAt) > ttl;
  }

  /// Kategoriyalarni keshlangan holda qaytaradi (TTL ichida bo'lsa).
  Future<Paginated<Category>?> getCachedCategories() async {
    final box = await _categoriesBox();
    final raw = box.get(_categoriesKey);
    if (raw is! String || raw.isEmpty) return null;
    try {
      final decoded = jsonDecode(raw) as Map<String, dynamic>;
      final savedAt = DateTime.parse(decoded['saved_at'] as String).toLocal();
      if (_isExpired(savedAt)) return null;
      final paginated = Paginated.fromJson(
        Map<String, dynamic>.from(decoded['data'] as Map),
        (e) => CategoryDto.fromJson(Map<String, dynamic>.from(e as Map)),
      );
      return Paginated(
        next: paginated.next,
        previous: paginated.previous,
        results: paginated.results.map(categoryDtoToEntity).toList(),
      );
    } catch (error) {
      logger.w("Keshlangan kategoriyalarni o'qishda xato: $error");
      return null;
    }
  }

  Future<void> saveCategories(Paginated<CategoryDto> categories) async {
    final box = await _categoriesBox();
    final data = {
      'next': categories.next,
      'previous': categories.previous,
      'results': categories.results.map((c) => c.toJson()).toList(),
    };
    await box.put(
      _categoriesKey,
      jsonEncode({'saved_at': DateTime.now().toIso8601String(), 'data': data}),
    );
  }

  /// Mahsulotlar ro'yxatini keshlangan holda qaytaradi (TTL ichida bo'lsa).
  Future<Paginated<Product>?> getCachedProducts(String filterKey) async {
    final cached = await getCachedProductsDto(filterKey);
    if (cached == null) return null;
    return Paginated(
      next: cached.next,
      previous: cached.previous,
      results: cached.results.map(productDtoToEntity).toList(),
    );
  }

  /// Xom DTO keshi (merging va o'qish uchun umumiy asos).
  Future<Paginated<ProductDto>?> getCachedProductsDto(String filterKey) async {
    final box = await _productsBox();
    final raw = box.get(filterKey);
    if (raw is! String || raw.isEmpty) return null;
    try {
      final decoded = jsonDecode(raw) as Map<String, dynamic>;
      final savedAt = DateTime.parse(decoded['saved_at'] as String).toLocal();
      if (_isExpired(savedAt)) return null;
      return Paginated.fromJson(
        Map<String, dynamic>.from(decoded['data'] as Map),
        (e) => ProductDto.fromJson(Map<String, dynamic>.from(e as Map)),
      );
    } catch (error) {
      logger.w("Keshlangan mahsulotlarni o'qishda xato: $error");
      return null;
    }
  }

  Future<void> saveProducts(
    String filterKey,
    Paginated<ProductDto> products,
  ) async {
    final box = await _productsBox();
    final data = {
      'next': products.next,
      'previous': products.previous,
      'results': products.results.map((p) => p.toJson()).toList(),
    };
    await box.put(
      filterKey,
      jsonEncode({'saved_at': DateTime.now().toIso8601String(), 'data': data}),
    );
  }

  /// Bitta mahsulotni keshlangan holda qaytaradi (TTL ichida bo'lsa).
  Future<Product?> getCachedProductDetail(String id) async {
    final box = await _productsBox();
    final raw = box.get('detail_$id');
    if (raw is! String || raw.isEmpty) return null;
    try {
      final decoded = jsonDecode(raw) as Map<String, dynamic>;
      final savedAt = DateTime.parse(decoded['saved_at'] as String).toLocal();
      if (_isExpired(savedAt)) return null;
      final dto = ProductDto.fromJson(
        Map<String, dynamic>.from(decoded['data'] as Map),
      );
      return productDtoToEntity(dto);
    } catch (error) {
      logger.w("Keshlangan mahsulotni o'qishda xato: $error");
      return null;
    }
  }

  Future<void> saveProductDetail(ProductDto product) async {
    final box = await _productsBox();
    await box.put(
      'detail_${product.id}',
      jsonEncode({
        'saved_at': DateTime.now().toIso8601String(),
        'data': product.toJson(),
      }),
    );
  }

  /// Yangi sahifa kelganda eski sahifani orqasiga qo'shib saqlaydi.
  Future<void> saveProductsMerged(
    String filterKey,
    Paginated<ProductDto> products,
  ) async {
    final existing = await getCachedProductsDto(filterKey);
    if (existing == null) {
      await saveProducts(filterKey, products);
      return;
    }
    final existingIds = existing.results.map((e) => e.id).toSet();
    final merged = [
      ...existing.results,
      ...products.results.where((p) => !existingIds.contains(p.id)),
    ];
    await saveProducts(
      filterKey,
      Paginated(
        next: products.next,
        previous: products.previous,
        results: merged,
      ),
    );
  }
}
