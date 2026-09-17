import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'locale_notifier.g.dart';

/// Ilova tilini boshqaruvchi notifier.
/// Tanlov darhol qo'llanadi va Hive 'settings' boxida saqlanadi.
/// `null` holat — qurilma tili (uz/ru, aks holda uz).
@Riverpod(keepAlive: true)
class LocaleNotifier extends _$LocaleNotifier {
  static const _boxName = 'settings';
  static const _key = 'locale';

  static const _latinCode = 'uz';
  static const _cyrillicCode = 'uz_Cyrl';
  static const _russianCode = 'ru';

  @override
  Locale? build() {
    final box = Hive.box(_boxName);
    final value = box.get(_key) as String?;
    return _localeFromCode(value);
  }

  void setLocale(Locale locale) {
    state = locale;
    final box = Hive.box(_boxName);
    box.put(_key, _codeOf(locale));
  }

  static Locale? _localeFromCode(String? value) {
    return switch (value) {
      _latinCode => const Locale('uz'),
      _cyrillicCode => const Locale('uz', 'Cyrl'),
      _russianCode => const Locale('ru'),
      _ => null,
    };
  }

  static String _codeOf(Locale locale) {
    if (locale.languageCode == 'ru') return _russianCode;
    if (locale.countryCode == 'Cyrl') return _cyrillicCode;
    return _latinCode;
  }
}