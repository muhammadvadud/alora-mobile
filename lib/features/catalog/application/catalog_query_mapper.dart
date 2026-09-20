import 'package:alora_mobile/features/catalog/domain/entities/product_enums.dart';

import 'catalog_filter.dart';

/// [CatalogFilter]'ni backend query param'lariga aylantiradi.
///
/// `type` → `price_unit` (fabric → per_sqm, accessory → per_piece).
/// `pattern` va `transparency` backend'da filtr yo'q — yuborilmaydi.
class CatalogQueryMapper {
  CatalogQueryMapper._();

  static Map<String, String> toQuery(CatalogFilter filter) {
    return {
      if (filter.categoryId != null && filter.categoryId!.isNotEmpty)
        'category': filter.categoryId!,
      if (filter.type != null && filter.type != ProductType.unknown)
        'price_unit': _priceUnitFor(filter.type!),
      if (filter.style != null && filter.style != ProductStyle.unknown)
        'style': _styleValue(filter.style!),
      if (filter.room != null && filter.room != ProductRoom.unknown)
        'room': _roomValue(filter.room!),
      if (filter.segment != null && filter.segment != ProductSegment.unknown)
        'segment': _segmentValue(filter.segment!),
      if (filter.minPrice != null) 'min_price': filter.minPrice.toString(),
      if (filter.maxPrice != null) 'max_price': filter.maxPrice.toString(),
    };
  }

  /// Ro'yxat keshi kaliti (filtr kombinatsiyasi uchun).
  static String filterKey(CatalogFilter filter) {
    return [
      filter.type?.name ?? '',
      filter.style?.name ?? '',
      filter.room?.name ?? '',
      filter.pattern?.name ?? '',
      filter.transparency?.name ?? '',
      filter.segment?.name ?? '',
      filter.minPrice?.toString() ?? '',
      filter.maxPrice?.toString() ?? '',
    ].join('|');
  }

  static String _priceUnitFor(ProductType type) {
    switch (type) {
      case ProductType.fabric:
        return 'per_sqm';
      case ProductType.accessory:
        return 'per_piece';
      case ProductType.unknown:
        return '';
    }
  }

  static String _styleValue(ProductStyle style) {
    switch (style) {
      case ProductStyle.klassik:
        return 'klassik';
      case ProductStyle.zamonaviy:
        return 'zamonaviy';
      case ProductStyle.minimalist:
        return 'minimalist';
      case ProductStyle.unknown:
        return '';
    }
  }

  static String _roomValue(ProductRoom room) {
    switch (room) {
      case ProductRoom.mehmonxona:
        return 'mehmonxona';
      case ProductRoom.yotoqxona:
        return 'yotoqxona';
      case ProductRoom.oshxona:
        return 'oshxona';
      case ProductRoom.bolalarXonasi:
        return 'bolalar_xonasi';
      case ProductRoom.ofis:
        return 'ofis';
      case ProductRoom.unknown:
        return '';
    }
  }

  static String _segmentValue(ProductSegment segment) {
    switch (segment) {
      case ProductSegment.economy:
        return 'economy';
      case ProductSegment.standard:
        return 'standard';
      case ProductSegment.premium:
        return 'premium';
      case ProductSegment.unknown:
        return '';
    }
  }
}
