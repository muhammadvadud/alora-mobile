import 'package:alora_mobile/core/network/api_paths.dart';
import 'package:dio/dio.dart';
import 'package:alora_mobile/features/management/catalog_admin/data/dto/catalog_write_dtos.dart';

abstract class CatalogWriteDataSource {
  Future<void> createProduct(ProductWriteDto dto);
  Future<void> updateProduct(String id, Map<String, dynamic> data);
  Future<void> deleteProduct(String id);

  Future<void> createVariant(String productId, VariantWriteDto dto);
  Future<void> updateVariant(String id, Map<String, dynamic> data);
  Future<void> deleteVariant(String id);

  Future<void> applyBulkPrice(BulkPriceDto dto);
  Future<void> uploadProductImage(
    String productId,
    String imagePath, {
    void Function(int, int)? onSendProgress,
  });
  Future<void> deleteImage(String imageId);
}

class CatalogWriteDataSourceImpl implements CatalogWriteDataSource {
  static const String _variantsBase = 'catalog/variants/';

  final Dio _dio;

  CatalogWriteDataSourceImpl(this._dio);

  @override
  Future<void> createProduct(ProductWriteDto dto) async {
    await _dio.post(ApiPaths.products, data: dto.toJson());
  }

  @override
  Future<void> updateProduct(String id, Map<String, dynamic> data) async {
    await _dio.patch(ApiPaths.product(id), data: data);
  }

  @override
  Future<void> deleteProduct(String id) async {
    await _dio.delete(ApiPaths.product(id));
  }

  @override
  Future<void> createVariant(String productId, VariantWriteDto dto) async {
    final data = dto.toJson();
    data['product'] = productId;
    await _dio.post(_variantsBase, data: data);
  }

  @override
  Future<void> updateVariant(String id, Map<String, dynamic> data) async {
    await _dio.patch(ApiPaths.variant(id), data: data);
  }

  @override
  Future<void> deleteVariant(String id) async {
    await _dio.delete(ApiPaths.variant(id));
  }

  @override
  Future<void> applyBulkPrice(BulkPriceDto dto) async {
    await _dio.post(ApiPaths.variantsBulkPrice, data: dto.toJson());
  }

  @override
  Future<void> uploadProductImage(
    String productId,
    String imagePath, {
    void Function(int, int)? onSendProgress,
  }) async {
    final formData = FormData.fromMap({
      'image': await MultipartFile.fromFile(imagePath),
    });
    await _dio.post(
      ApiPaths.productImages(productId),
      data: formData,
      onSendProgress: onSendProgress,
    );
  }

  @override
  Future<void> deleteImage(String imageId) async {
    await _dio.delete(ApiPaths.catalogImage(imageId));
  }
}
