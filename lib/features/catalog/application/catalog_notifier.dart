import 'dart:async';

import 'package:alora_mobile/core/error/failure.dart';
import 'package:alora_mobile/core/utils/debounce.dart';
import 'package:alora_mobile/features/catalog/domain/repositories/catalog_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'catalog_filter.dart';
import 'catalog_query_mapper.dart';
import 'catalog_state.dart';
import 'providers.dart';

part 'catalog_notifier.g.dart';

/// Katalog holatini boshqaruvchi notifier: kategoriyalar, qidiruv (300 ms debounce),
/// filtrlar, sahifalash.
@Riverpod(keepAlive: true)
class CatalogNotifier extends _$CatalogNotifier {
  final _searchDebouncer = Debouncer(delay: const Duration(milliseconds: 300));

  @override
  CatalogState build() {
    ref.onDispose(_searchDebouncer.cancel);
    return const CatalogState();
  }

  CatalogRepository get _repo => ref.read(catalogRepositoryProvider);

  /// Katalog ochilganda call qilinadi (ekran `initState` da chaqiradi).
  void bootstrap() {
    unawaited(loadCategories());
    unawaited(_loadFirstPage());
  }

  /// Kategoriyalarni yuklaydi.
  Future<void> loadCategories() async {
    try {
      final paginated = await _repo.getCategories();
      final active = paginated.results.where((c) => c.isActive).toList();
      state = state.copyWith(categories: active);
    } on Failure catch (_) {
      // Kategoriyalar muhim emas, davom etamiz
    }
  }

  /// Yangi qidiruv so'rovini ishga tushiradi (debounced).
  void setSearch(String query) {
    final trimmed = query.trim();
    if (trimmed == state.searchQuery) return;
    state = state.copyWith(searchQuery: trimmed);
    _searchDebouncer.run(() => _loadFirstPage());
  }

  /// Filtrni o'zgartiradi va qayta yuklaydi.
  void setFilter(CatalogFilter filter) {
    if (filter == state.filter) return;
    state = state.copyWith(filter: filter);
    _loadFirstPage();
  }

  /// Filtrlarni tozalab, qayta yuklaydi.
  void clearFilter() {
    if (state.filter == const CatalogFilter()) return;
    state = state.copyWith(filter: const CatalogFilter());
    _loadFirstPage();
  }

  /// Filtr sheet uchun: berilgan filtr bilan birinchi sahifa natijalari soni.
  /// Holatga ta'sir qilmaydi (preview uchun).
  Future<int> previewCount(CatalogFilter filter) async {
    try {
      final query = CatalogQueryMapper.toQuery(filter);
      final paginated = await _repo.getProducts(
        category: state.categoryId ?? query['category'],
        style: query['style'],
        room: query['room'],
        segment: query['segment'],
        priceUnit: query['price_unit'],
        search: state.searchQuery.isEmpty ? null : state.searchQuery,
        minPrice: query['min_price'] != null
            ? int.tryParse(query['min_price']!)
            : null,
        maxPrice: query['max_price'] != null
            ? int.tryParse(query['max_price']!)
            : null,
      );
      return paginated.results.length;
    } on Failure catch (_) {
      return state.products.length;
    }
  }

  /// Kategoriyani tanlaydi (null — hammasi).
  void selectCategory(String? categoryId) {
    if (categoryId == state.categoryId) return;
    state = state.copyWith(categoryId: categoryId);
    _loadFirstPage();
  }

  /// Keyingi sahifani yuklaydi (infinite scroll).
  Future<void> loadMore() async {
    if (!state.hasMore || state.isLoadingMore) return;
    state = state.copyWith(isLoadingMore: true);
    try {
      final query = CatalogQueryMapper.toQuery(state.filter);
      final paginated = await _repo.getProducts(
        category: state.categoryId ?? query['category'],
        style: query['style'],
        room: query['room'],
        segment: query['segment'],
        priceUnit: query['price_unit'],
        search: state.searchQuery.isEmpty ? null : state.searchQuery,
        minPrice: query['min_price'] != null
            ? int.tryParse(query['min_price']!)
            : null,
        maxPrice: query['max_price'] != null
            ? int.tryParse(query['max_price']!)
            : null,
        cursor: state.nextUrl,
      );
      final ids = state.products.map((p) => p.id).toSet();
      final newProducts = paginated.results
          .where((p) => !ids.contains(p.id))
          .toList();
      state = state.copyWith(
        products: [...state.products, ...newProducts],
        nextUrl: paginated.next,
        isLoadingMore: false,
        error: null,
      );
    } on Failure catch (error) {
      state = state.copyWith(isLoadingMore: false, error: error);
    }
  }

  Future<void> retry() async {
    state = state.copyWith(error: null);
    await loadCategories();
    await _loadFirstPage();
  }

  /// Birinchi sahifani yuklaydi (filter/qidiruv/kategoriya o'zgarganda).
  Future<void> _loadFirstPage() async {
    state = state.copyWith(isLoading: true, products: [], error: null);
    try {
      final query = CatalogQueryMapper.toQuery(state.filter);
      final paginated = await _repo.getProducts(
        category: state.categoryId ?? query['category'],
        style: query['style'],
        room: query['room'],
        segment: query['segment'],
        priceUnit: query['price_unit'],
        search: state.searchQuery.isEmpty ? null : state.searchQuery,
        minPrice: query['min_price'] != null
            ? int.tryParse(query['min_price']!)
            : null,
        maxPrice: query['max_price'] != null
            ? int.tryParse(query['max_price']!)
            : null,
      );
      state = state.copyWith(
        products: paginated.results,
        nextUrl: paginated.next,
        isLoading: false,
        error: null,
      );
    } on Failure catch (error) {
      state = state.copyWith(isLoading: false, error: error);
    }
  }
}
