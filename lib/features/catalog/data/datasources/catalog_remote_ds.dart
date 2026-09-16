import 'package:dio/dio.dart';

import 'package:alora_mobile/core/error/failure.dart';
import 'package:alora_mobile/core/network/api_paths.dart';
import 'package:alora_mobile/core/utils/app_logger.dart';
import 'package:alora_mobile/core/utils/paginated.dart';

import '../dto/category_dto.dart';
import '../dto/product_dto.dart';

/// Katalog backend bilan aloqa qiluvchi data source (core Dio + interceptorlar)
class CatalogRemoteDataSource {
  CatalogRemoteDataSource(this._dio);

  final Dio _dio;

  /// GET /catalog/categories/ — kategoriyalar (cursor pagination)
  Future<Paginated<CategoryDto>> getCategories({String? cursor}) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        ApiPaths.categories,
        queryParameters: {'cursor': ?cursor},
      );
      return Paginated.fromJson(
        response.data!,
        (e) => CategoryDto.fromJson(Map<String, dynamic>.from(e as Map)),
      );
    } on DioException catch (error) {
      throw _mapError(error);
    }
  }

  /// GET /catalog/products/ — mahsulotlar (filtr + cursor + search)
  Future<Paginated<ProductDto>> getProducts({
    String? category,
    String? style,
    String? room,
    String? segment,
    String? priceUnit,
    String? pattern,
    String? transparency,
    String? search,
    int? minPrice,
    int? maxPrice,
    String? cursor,
  }) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        ApiPaths.products,
        queryParameters: {
          if (category != null && category.isNotEmpty) 'category': category,
          if (style != null && style.isNotEmpty) 'style': style,
          if (room != null && room.isNotEmpty) 'room': room,
          if (segment != null && segment.isNotEmpty) 'segment': segment,
          if (priceUnit != null && priceUnit.isNotEmpty)
            'price_unit': priceUnit,
          if (search != null && search.isNotEmpty) 'search': search,
          'min_price': ?minPrice,
          'max_price': ?maxPrice,
          if (cursor != null && cursor.isNotEmpty) 'cursor': cursor,
        },
      );
      return Paginated.fromJson(
        response.data!,
        (e) => ProductDto.fromJson(Map<String, dynamic>.from(e as Map)),
      );
    } on DioException catch (error) {
      throw _mapError(error);
    }
  }

  /// GET /catalog/products/{id}/ — bitta mahsulot
  Future<ProductDto> getProductDetail(String id) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        ApiPaths.product(id),
      );
      return ProductDto.fromJson(response.data!);
    } on DioException catch (error) {
      throw _mapError(error);
    }
  }

  Failure _mapError(DioException error) {
    final mapped = error.error;
    if (mapped is Failure) return mapped;
    logger.w('Katalog so\'rov xatosi: ${error.message}');
    return Failure.unknown(error.message ?? error.error?.toString() ?? '');
  }
}
