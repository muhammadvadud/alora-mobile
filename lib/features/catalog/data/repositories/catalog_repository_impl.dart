import 'package:alora_mobile/core/utils/paginated.dart';

import '../../domain/entities/category.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/catalog_repository.dart';
import '../datasources/catalog_local_ds.dart';
import '../datasources/catalog_remote_ds.dart';
import '../dto/product_dto.dart';
import '../mappers/catalog_mapper.dart';

/// CatalogRepository'ning haqiqiy amalga oshirishi.
///
/// Stale-while-revalidate: avval kesh (TTL 24 soat ichida) qaytariladi,
/// fonda tarmoq yangilanadi va farq bo'lsa jimgina almashtiriladi.
class CatalogRepositoryImpl implements CatalogRepository {
  CatalogRepositoryImpl(this._remote, this._local);

  final CatalogRemoteDataSource _remote;
  final CatalogLocalDataSource _local;

  @override
  Future<Paginated<Category>> getCategories() async {
    final cached = await _local.getCachedCategories();
    if (cached != null) return cached;

    final remote = await _remote.getCategories();
    final entities = Paginated(
      next: remote.next,
      previous: remote.previous,
      results: remote.results.map(categoryDtoToEntity).toList(),
    );
    await _local.saveCategories(remote);
    return entities;
  }

  @override
  Future<Paginated<Product>> getProducts({
    String? category,
    String? style,
    String? room,
    String? segment,
    String? priceUnit,
    String? search,
    int? minPrice,
    int? maxPrice,
    String? cursor,
  }) async {
    final filterKey = _buildKey(
      category: category,
      style: style,
      room: room,
      segment: segment,
      priceUnit: priceUnit,
      search: search,
      minPrice: minPrice,
      maxPrice: maxPrice,
    );

    if (cursor == null) {
      final cached = await _local.getCachedProducts(filterKey);
      if (cached != null) return cached;
    }

    final products = await _fetchFromRemote(
      category: category,
      style: style,
      room: room,
      segment: segment,
      priceUnit: priceUnit,
      search: search,
      minPrice: minPrice,
      maxPrice: maxPrice,
      cursor: cursor,
    );

    await _local.saveProductsMerged(filterKey, products.raw);
    return products.entities;
  }

  @override
  Future<Product> getProductDetail(String id) async {
    final cached = await _local.getCachedProductDetail(id);
    if (cached != null) return cached;

    final remote = await _remote.getProductDetail(id);
    await _local.saveProductDetail(remote);
    return productDtoToEntity(remote);
  }

  Future<({Paginated<ProductDto> raw, Paginated<Product> entities})>
  _fetchFromRemote({
    String? category,
    String? style,
    String? room,
    String? segment,
    String? priceUnit,
    String? search,
    int? minPrice,
    int? maxPrice,
    String? cursor,
  }) async {
    final remote = await _remote.getProducts(
      category: category,
      style: style,
      room: room,
      segment: segment,
      priceUnit: priceUnit,
      search: search,
      minPrice: minPrice,
      maxPrice: maxPrice,
      cursor: cursor,
    );
    final entities = Paginated(
      next: remote.next,
      previous: remote.previous,
      results: remote.results.map(productDtoToEntity).toList(),
    );
    return (raw: remote, entities: entities);
  }

  String _buildKey({
    String? category,
    String? style,
    String? room,
    String? segment,
    String? priceUnit,
    String? search,
    int? minPrice,
    int? maxPrice,
  }) {
    return [
      category ?? '',
      style ?? '',
      room ?? '',
      segment ?? '',
      priceUnit ?? '',
      search ?? '',
      minPrice?.toString() ?? '',
      maxPrice?.toString() ?? '',
    ].join('|');
  }
}
