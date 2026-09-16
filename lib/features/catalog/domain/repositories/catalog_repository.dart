import 'package:alora_mobile/core/utils/paginated.dart';

import '../entities/category.dart';
import '../entities/product.dart';

abstract class CatalogRepository {
  Future<Paginated<Category>> getCategories();

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
  });

  Future<Product> getProductDetail(String id);
}
