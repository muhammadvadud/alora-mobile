import 'package:alora_mobile/features/catalog/domain/entities/product_enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'catalog_filter.freezed.dart';

@Freezed(makeCollectionsUnmodifiable: false)
abstract class CatalogFilter with _$CatalogFilter {
  const factory CatalogFilter({
    String? categoryId,
    ProductType? type,
    ProductStyle? style,
    ProductRoom? room,
    ProductPattern? pattern,
    ProductTransparency? transparency,
    ProductSegment? segment,
    int? minPrice,
    int? maxPrice,
  }) = _CatalogFilter;

  const CatalogFilter._();

  /// Backend qo'llab-quvvatlamaydigan filtrlar.
  bool get hasClientOnlyFilters => pattern != null || transparency != null;

  /// Backend'ga yuborilishi kerak bo'lgan filtrlar.
  bool get hasBackendFilters =>
      categoryId != null ||
      type != null ||
      style != null ||
      room != null ||
      segment != null ||
      minPrice != null ||
      maxPrice != null;

  bool get isEmpty => this == const CatalogFilter();
}
