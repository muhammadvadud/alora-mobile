import 'package:alora_mobile/features/management/catalog_admin/data/dto/catalog_write_dtos.dart';

abstract class CatalogWriteRepository {
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
