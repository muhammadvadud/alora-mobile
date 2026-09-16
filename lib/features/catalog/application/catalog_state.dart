import 'package:alora_mobile/core/error/failure.dart';
import 'package:alora_mobile/features/catalog/domain/entities/category.dart';
import 'package:alora_mobile/features/catalog/domain/entities/product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'catalog_filter.dart';

part 'catalog_state.freezed.dart';

@Freezed(makeCollectionsUnmodifiable: false)
abstract class CatalogState with _$CatalogState {
  const factory CatalogState({
    @Default([]) List<Category> categories,
    @Default(CatalogFilter()) CatalogFilter filter,
    @Default('') String searchQuery,
    String? categoryId,
    @Default([]) List<Product> products,
    String? nextUrl,
    @Default(false) bool isLoading,
    @Default(false) bool isLoadingMore,
    Failure? error,
  }) = _CatalogState;

  const CatalogState._();

  bool get hasMore => nextUrl != null;

  bool get isEmpty => products.isEmpty && !isLoading;

  bool get isFiltered => filter != const CatalogFilter();

  int get activeFilterCount {
    var count = 0;
    final f = filter;
    if (f.type != null) count++;
    if (f.style != null) count++;
    if (f.room != null) count++;
    if (f.pattern != null) count++;
    if (f.transparency != null) count++;
    if (f.segment != null) count++;
    if (f.minPrice != null || f.maxPrice != null) count++;
    return count;
  }
}
