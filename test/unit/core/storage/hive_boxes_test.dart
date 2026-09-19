import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:alora_mobile/core/storage/hive_boxes.dart';

/// path_provider method channel'ini mock qiladi.
class _PathProviderChannelMock {
  static const _channel = MethodChannel('plugins.flutter.io/path_provider');

  static void setDocumentsPath(String path) {
    final binding = TestWidgetsFlutterBinding.ensureInitialized();
    binding.defaultBinaryMessenger.setMockMethodCallHandler(_channel, (call) async {
      if (call.method == 'getApplicationDocumentsDirectory') return path;
      return null;
    });
  }

  static void clear() {
    final binding = TestWidgetsFlutterBinding.ensureInitialized();
    binding.defaultBinaryMessenger.setMockMethodCallHandler(_channel, null);
  }
}

void main() {
  late Directory tempDir;

  setUpAll(() async {
    tempDir = await Directory.systemTemp.createTemp('hive_boxes_test_');
    _PathProviderChannelMock.setDocumentsPath(tempDir.path);
  });

  tearDownAll(() async {
    await Hive.close();
    _PathProviderChannelMock.clear();
    if (tempDir.existsSync()) {
      await tempDir.delete(recursive: true);
    }
  });

  setUp(() async {
    await HiveBoxes.init();
  });

  test('schemaVersion 2 ga teng (shifrlash kiritildi)', () {
    expect(HiveBoxes.schemaVersion, 2);
  });

  test('box nomlari to\'g\'ri', () {
    expect(HiveBoxes.authPrefs, 'auth_prefs');
    expect(HiveBoxes.catalogProducts, 'catalog_products');
    expect(HiveBoxes.catalogCategories, 'catalog_categories');
    expect(HiveBoxes.conversations, 'conversations');
    expect(HiveBoxes.messages, 'messages');
    expect(HiveBoxes.offlineQueue, 'offline_queue');
    expect(HiveBoxes.settings, 'settings');
  });

  test('init schema_version ni yozadi (birinchi ishga tushirish)', () async {
    final versionBox = await Hive.openBox<int>('system_version');
    final saved = versionBox.get('schema_version');
    expect(saved, HiveBoxes.schemaVersion);
    await versionBox.close();
  });

  test('init qayta chaqirilganda bo\'sh quti ochadi (xato bermaydi)', () async {
    await HiveBoxes.init();
    final box = await Hive.openBox(HiveBoxes.authPrefs);
    expect(box, isNotNull);
    await box.close();
  });

  test('schema versiya mos kelmasa data boxlari tozalanadi', () async {
    // Avval yangi boxga ma'lumot yozamiz
    final authBox = await Hive.openBox<String>(HiveBoxes.authPrefs);
    await authBox.put('access_token', 'old_token');
    await authBox.close();

    // Versiyani pasaytirib, init() ni chaqiramiz
    final versionBox = await Hive.openBox<int>('system_version');
    await versionBox.put('schema_version', 0);
    await versionBox.close();

    await HiveBoxes.init();

    // Qayta ochilganda bo'sh bo'lishi kerak
    final reopened = await Hive.openBox<String>(HiveBoxes.authPrefs);
    expect(reopened.get('access_token'), isNull);
    await reopened.close();
  });

  test('open: cipher bilan yozilgan qiymat o\'qiladi, ochiq box qayta ishlatiladi', () async {
    HiveBoxes.configureCipher(List<int>.generate(32, (i) => i));
    final box = await HiveBoxes.open<String>('cipher_box');
    await box.put('k', 'v');
    final same = await HiveBoxes.open<String>('cipher_box');
    expect(identical(box, same), isTrue);
    expect(same.get('k'), 'v');
    await box.deleteFromDisk();
  });

  test('clearUserData: foydalanuvchi box\'lari tozalanadi, katalog qoladi', () async {
    final conv = await HiveBoxes.open<dynamic>(HiveBoxes.conversations);
    final catalog = await HiveBoxes.open<dynamic>(HiveBoxes.catalogProducts);
    await conv.put('a', '1');
    await catalog.put('p', '1');

    await HiveBoxes.clearUserData();

    expect(conv.isEmpty, isTrue);
    expect(catalog.get('p'), '1');
    await conv.deleteFromDisk();
    await catalog.deleteFromDisk();
  });
}
