import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:alora_mobile/core/storage/offline_queue_item.dart';

void main() {
  late DateTime before;
  late DateTime after;

  setUp(() {
    before = DateTime.now().toUtc();
  });

  test('create() factory id va createdAt ni avtomatik qo\'yadi', () {
    final item = OfflineQueueItem.create(
      method: 'POST',
      path: '/orders/',
      body: {'note': 'qayd'},
    );

    expect(item.id, isNotEmpty);
    expect(item.method, 'POST');
    expect(item.path, '/orders/');
    expect(item.body, {'note': 'qayd'});
    expect(item.attempts, 0); // Default qiymat
    after = DateTime.now().toUtc();
    expect(item.createdAt.isAfter(before), isTrue);
    expect(item.createdAt.isBefore(after), isTrue);
  });

  test('body null bo\'lganda create() ishlaydi', () {
    final item = OfflineQueueItem.create(method: 'GET', path: '/catalog/');

    expect(item.body, isNull);
    expect(item.attempts, 0);
  });

  test('fromJson toJson gas aylanishi', () {
    final json = {
      'id': '123',
      'method': 'POST',
      'path': '/orders/1',
      'body': {'total': 100},
      'created_at': '2024-01-01T00:00:00.000Z',
      'attempts': 2,
    };

    final item = OfflineQueueItem.fromJson(json);

    expect(item.id, '123');
    expect(item.method, 'POST');
    expect(item.path, '/orders/1');
    expect(item.body, {'total': 100});
    expect(item.createdAt, DateTime.utc(2024, 1, 1));
    expect(item.attempts, 2);

    final toJson = item.toJson();
    expect(jsonEncode(toJson), jsonEncode(json));
  });

  test('toJson dateTime ISO8601 formatda saqlanadi', () {
    final item = OfflineQueueItem.create(method: 'POST', path: '/test');

    final json = item.toJson();
    expect(json['created_at'], isA<String>());
    expect(DateTime.parse(json['created_at'] as String), item.createdAt);
  });

  test('fromJson attempts bo\'lmasa default 0', () {
    final json = {
      'id': '1',
      'method': 'GET',
      'path': '/x',
      'body': null,
      'created_at': '2024-05-01T10:00:00.000Z',
    };

    final item = OfflineQueueItem.fromJson(json);
    expect(item.attempts, 0);
    expect(item.body, isNull);
  });

  test('Hive adapter write/read aylanishi', () async {
    final dir = await Directory.systemTemp.createTemp('oq_item_test_');
    Hive.init(dir.path);
    Hive.registerAdapter(OfflineQueueItemAdapter());

    final item = OfflineQueueItem.create(
      method: 'PATCH',
      path: '/orders/42',
      body: {'status': 'done'},
    );

    final box = await Hive.openBox<OfflineQueueItem>('oq');
    await box.put('item', item);

    // Diskdan qayta o'qish uchun yopamiz va qayta ochamiz
    await box.close();
    final reopened = await Hive.openBox<OfflineQueueItem>('oq');

    final read = reopened.get('item')!;
    expect(read.id, item.id);
    expect(read.method, 'PATCH');
    expect(read.path, '/orders/42');
    expect(read.body, {'status': 'done'});
    expect(
      read.createdAt,
      DateTime.fromMillisecondsSinceEpoch(
        item.createdAt.millisecondsSinceEpoch,
        isUtc: true,
      ),
    );
    expect(read.attempts, item.attempts);

    await reopened.close();
    await Hive.deleteFromDisk();
    await dir.delete(recursive: true);
  });

  test('Hive typeId 1 ga teng', () {
    expect(OfflineQueueItemAdapter().typeId, 1);
  });
}
