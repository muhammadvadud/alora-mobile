import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_mode_notifier.g.dart';

@Riverpod(keepAlive: true)
class ThemeModeNotifier extends _$ThemeModeNotifier {
  static const _boxName = 'settings';
  static const _key = 'theme_mode';

  @override
  ThemeMode build() {
    final box = Hive.box(_boxName);
    final value = box.get(_key) as String?;
    if (value == 'light') return ThemeMode.light;
    if (value == 'dark') return ThemeMode.dark;
    return ThemeMode.system;
  }

  void setThemeMode(ThemeMode mode) {
    state = mode;
    final box = Hive.box(_boxName);
    switch (mode) {
      case ThemeMode.light:
        box.put(_key, 'light');
        break;
      case ThemeMode.dark:
        box.put(_key, 'dark');
        break;
      case ThemeMode.system:
        box.put(_key, 'system');
        break;
    }
  }
}
