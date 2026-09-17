import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../providers/catalog_providers.dart';
import '../../data/dto/catalog_write_dtos.dart';

import 'package:alora_mobile/core/storage/offline_queue.dart';
import 'package:alora_mobile/core/storage/offline_queue_item.dart';

part 'product_form_notifier.g.dart';

@riverpod
class ProductFormNotifier extends _$ProductFormNotifier {
  @override
  Map<String, dynamic> build() {
    return {
      'name': '',
      'code': '',
      'category': '',
      'price': 0.0,
      'isDirty': false,
      'variants': [],
    };
  }

  void updateField(String key, Object? value) {
    state = {...state, key: value, 'isDirty': true};
  }

  Future<bool> save() async {
    try {
      final repo = ref.read(catalogWriteRepositoryProvider);
      // Validate
      if ((state['price'] as double) <= 0) {
        return false;
      }

      final dto = ProductWriteDto(
        name: state['name'] as String,
        code: state['code'] as String,
        category: state['category'] as String,
        style: 'default',
        pattern: 'default',
        transparency: 'default',
        recommendedRooms: [],
        segment: 'default',
      );

      await repo.createProduct(dto);
      return true;
    } catch (e) {
      final item = OfflineQueueItem.create(
        method: 'POST',
        path: '/catalog/products',
        body: {},
      );
      await OfflineQueue.add(item);
      return false;
    }
  }
}
