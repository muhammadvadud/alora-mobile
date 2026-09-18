import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';

import 'package:alora_mobile/app/theme/theme_mode_notifier.dart';

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

  test('boshlang\'ich holat sistema rejimi (system)', () {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    expect(container.read(themeModeProvider), ThemeMode.system);
  });

  test('setThemeMode(dark) Hive da saqlaydi va qayta tiklaydi', () {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    container.read(themeModeProvider.notifier).setThemeMode(ThemeMode.dark);

    expect(container.read(themeModeProvider), ThemeMode.dark);
    expect(Hive.box('settings').get('theme_mode'), 'dark');

    final restored = ProviderContainer();
    addTearDown(restored.dispose);
    expect(restored.read(themeModeProvider), ThemeMode.dark);
  });

  test('light/dark/system qiymatlari to\'g\'ri saqlanadi', () {
    final container = ProviderContainer();
    addTearDown(container.dispose);
    final notifier = container.read(themeModeProvider.notifier);
    final box = Hive.box('settings');

    notifier.setThemeMode(ThemeMode.light);
    expect(box.get('theme_mode'), 'light');
    expect(container.read(themeModeProvider), ThemeMode.light);

    notifier.setThemeMode(ThemeMode.dark);
    expect(box.get('theme_mode'), 'dark');
    expect(container.read(themeModeProvider), ThemeMode.dark);

    notifier.setThemeMode(ThemeMode.system);
    expect(box.get('theme_mode'), 'system');
    expect(container.read(themeModeProvider), ThemeMode.system);
  });

  test('Hive da noma\'lum qiymat bo\'lsa system ga tushadi', () async {
    final box = Hive.box('settings');
    await box.put('theme_mode', 'sepia');

    final container = ProviderContainer();
    addTearDown(container.dispose);

    expect(container.read(themeModeProvider), ThemeMode.system);
  });
}
