import 'package:alora_mobile/features/management/catalog_admin/data/datasources/catalog_write_data_source.dart';
import 'package:alora_mobile/features/management/catalog_admin/data/dto/catalog_write_dtos.dart';
import 'package:alora_mobile/features/management/catalog_admin/domain/repositories/catalog_write_repository.dart';

class CatalogWriteRepositoryImpl implements CatalogWriteRepository {
  final CatalogWriteDataSource _dataSource;

  const CatalogWriteRepositoryImpl(this._dataSource);

  @override
  Future<void> createProduct(ProductWriteDto dto) {
    return _dataSource.createProduct(dto);
  }

  @override
  Future<void> updateProduct(String id, Map<String, dynamic> data) {
    return _dataSource.updateProduct(id, data);
  }

  @override
  Future<void> deleteProduct(String id) {
    return _dataSource.deleteProduct(id);
  }

  @override
  Future<void> createVariant(String productId, VariantWriteDto dto) {
    return _dataSource.createVariant(productId, dto);
  }

  @override
  Future<void> updateVariant(String id, Map<String, dynamic> data) {
    return _dataSource.updateVariant(id, data);
  }

  @override
  Future<void> deleteVariant(String id) {
    return _dataSource.deleteVariant(id);
  }

  @override
  Future<void> applyBulkPrice(BulkPriceDto dto) {
    return _dataSource.applyBulkPrice(dto);
  }

  @override
  Future<void> uploadProductImage(String productId, String imagePath, {void Function(int, int)? onSendProgress}) {
    return _dataSource.uploadProductImage(productId, imagePath, onSendProgress: onSendProgress);
  }

  @override
  Future<void> deleteImage(String imageId) {
    return _dataSource.deleteImage(imageId);
  }
}
