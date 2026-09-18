import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';

import 'package:alora_mobile/features/profile/application/locale_notifier.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Directory tempDir;

  setUpAll(() async {
    tempDir = await Directory.systemTemp.createTemp();
    Hive.init(tempDir.path);
  });

  setUp(() async {
    await Hive.openBox('settings');
  });

  tearDown(() async {
    await Hive.deleteBoxFromDisk('settings');
  });

  tearDownAll(() async {
    await tempDir.delete(recursive: true);
  });

  test('boshlang\'ich holatda locale null (qurilma tili ishlatiladi)', () {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    expect(container.read(localeProvider), isNull);
  });

  test('setLocale(ru) holatni yangilaydi va Hive da saqlaydi', () {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    container.read(localeProvider.notifier).setLocale(const Locale('ru'));

    expect(container.read(localeProvider), const Locale('ru'));
    expect(Hive.box('settings').get('locale'), 'ru');

    // Yangi container ham saqlangan qiymatni tiklaydi.
    final restored = ProviderContainer();
    addTearDown(restored.dispose);
    expect(restored.read(localeProvider), const Locale('ru'));
  });

  test('uz, uz_Cyrl va ru kodlari to\'g\'ri saqlanib qayta tiklanadi', () {
    final container = ProviderContainer();
    addTearDown(container.dispose);
    final notifier = container.read(localeProvider.notifier);
    final box = Hive.box('settings');

    notifier.setLocale(const Locale('uz'));
    expect(box.get('locale'), 'uz');
    expect(container.read(localeProvider), const Locale('uz'));

    notifier.setLocale(const Locale('uz', 'Cyrl'));
    expect(box.get('locale'), 'uz_Cyrl');
    expect(container.read(localeProvider), const Locale('uz', 'Cyrl'));

    notifier.setLocale(const Locale('ru'));
    expect(box.get('locale'), 'ru');
    expect(container.read(localeProvider), const Locale('ru'));
  });

  test('Hive da noto\'g\'ri kod bo\'lsa null qaytaradi', () async {
    final box = Hive.box('settings');
    await box.put('locale', 'fr');

    final container = ProviderContainer();
    addTearDown(container.dispose);

    expect(container.read(localeProvider), isNull);
  });
}
