import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:alora_mobile/core/storage/offline_queue.dart';
import 'package:alora_mobile/core/storage/offline_queue_item.dart';

import 'dart:io';

void main() {
  late Dio dio;
  late DioAdapter dioAdapter;
  late Directory tempDir;

  setUp(() async {
    tempDir = Directory.systemTemp.createTempSync('hive_test');
    Hive.init(tempDir.path);
    Hive.registerAdapter(OfflineQueueItemAdapter());

    dio = Dio(BaseOptions());
    dioAdapter = DioAdapter(dio: dio);
  });

  tearDown(() async {
    await Hive.close();
    if (tempDir.existsSync()) {
      tempDir.deleteSync(recursive: true);
    }
  });

  test('FIFO queue ishlaydi va 400 da o\'chiriladi, 500 da qoladi', () async {
    final item1 = OfflineQueueItem.create(method: 'POST', path: '/test1');
    final item2 = OfflineQueueItem.create(method: 'POST', path: '/test2');
    final item3 = OfflineQueueItem.create(method: 'POST', path: '/test3');

    await OfflineQueue.add(item1);
    await Future.delayed(const Duration(milliseconds: 10));
    await OfflineQueue.add(item2);
    await Future.delayed(const Duration(milliseconds: 10));
    await OfflineQueue.add(item3);

    dioAdapter.onPost('/test1', (server) => server.reply(200, {}));
    dioAdapter.onPost('/test2', (server) => server.reply(400, {'detail': 'xato'}));
    dioAdapter.onPost(
      '/test3',
      (server) => server.throws(500, DioException(requestOptions: RequestOptions(path: '/test3'))),
    );

    final results = await OfflineQueue.flush(dio);

    expect(results.length, 2);
    expect(results[0].success, true);
    expect(results[1].success, false);
    expect(results[1].errorMessage, 'Saqlanmadi: xato');

    final remaining = await OfflineQueue.getItems();
    expect(remaining.length, 1);
    expect(remaining[0].path, '/test3');
    expect(remaining[0].attempts, 1);
  });
}
