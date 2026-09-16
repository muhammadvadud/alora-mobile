import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'hive_boxes.dart';
import 'offline_queue_item.dart';

class OfflineQueueResult {
  final OfflineQueueItem item;
  final bool success;
  final String? errorMessage;

  const OfflineQueueResult({
    required this.item,
    required this.success,
    this.errorMessage,
  });
}

class OfflineQueue {
  OfflineQueue._();

  static Box<OfflineQueueItem>? _box;

  static Future<Box<OfflineQueueItem>> get _getBox async {
    if (_box != null && _box!.isOpen) return _box!;
    _box = await Hive.openBox<OfflineQueueItem>(HiveBoxes.offlineQueue);
    return _box!;
  }

  static Future<void> add(OfflineQueueItem item) async {
    final box = await _getBox;
    await box.put(item.id, item);
  }

  static Future<void> remove(String id) async {
    final box = await _getBox;
    await box.delete(id);
  }

  static Future<List<OfflineQueueItem>> getItems() async {
    final box = await _getBox;
    final items = box.values.toList();
    items.sort((a, b) => a.createdAt.compareTo(b.createdAt));
    return items;
  }

  /// Navbatni yuborish (FIFO)
  static Future<List<OfflineQueueResult>> flush(Dio dio) async {
    final items = await getItems();
    final results = <OfflineQueueResult>[];

    for (final item in items) {
      try {
        await dio.request(
          item.path,
          data: item.body,
          options: Options(method: item.method),
        );
        await remove(item.id);
        results.add(OfflineQueueResult(item: item, success: true));
      } on DioException catch (e) {
        final statusCode = e.response?.statusCode;
        if (statusCode != null && statusCode >= 400 && statusCode < 500) {
          // 4xx xatolik - server yutadi, navbatdan o'chiramiz
          await remove(item.id);
          final data = e.response?.data;
          final detail = data is Map ? data['detail'] as String? : null;
          results.add(
            OfflineQueueResult(
              item: item,
              success: false,
              errorMessage: "Saqlanmadi: ${detail ?? "Noma'lum xato"}",
            ),
          );
        } else {
          // Tarmoq xatosi yoki 5xx - keyinroq yana urinamiz
          final box = await _getBox;
          await box.put(item.id, item.copyWith(attempts: item.attempts + 1));
          break; // Keyingilarini ham yubormay turamiz
        }
      } catch (e) {
        // Noma'lum xato - urinishlar sonini oshiramiz
        final box = await _getBox;
        await box.put(item.id, item.copyWith(attempts: item.attempts + 1));
        break;
      }
    }

    return results;
  }
}
