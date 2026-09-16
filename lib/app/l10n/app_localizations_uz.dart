// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Uzbek (`uz`).
class AppLocalizationsUz extends AppLocalizations {
  AppLocalizationsUz([String locale = 'uz']) : super(locale);

  @override
  String get app_name => 'Alora';

  @override
  String get common_retry => 'Qayta urinish';

  @override
  String get common_cancel => 'Bekor qilish';

  @override
  String get common_save => 'Saqlash';

  @override
  String get common_ok => 'OK';

  @override
  String get common_loading => 'Yuklanmoqda…';

  @override
  String get common_noInternet =>
      'Internet yo\'q. Ulanish tiklanganda avtomatik yuboriladi';

  @override
  String get common_error => 'Xatolik yuz berdi';

  @override
  String get common_search => 'Qidiruv';

  @override
  String get common_close => 'Yopish';
}

/// The translations for Uzbek, using the Cyrillic script (`uz_Cyrl`).
class AppLocalizationsUzCyrl extends AppLocalizationsUz {
  AppLocalizationsUzCyrl() : super('uz_Cyrl');

  @override
  String get app_name => 'Алора';

  @override
  String get common_retry => 'Қайта уриниш';

  @override
  String get common_cancel => 'Бекор қилиш';

  @override
  String get common_save => 'Сақлаш';

  @override
  String get common_ok => 'ОК';

  @override
  String get common_loading => 'Юкланмоқда…';

  @override
  String get common_noInternet =>
      'Интернет йўқ. Уланиш тикланганда автоматик юборилади';

  @override
  String get common_error => 'Хатолик юз берди';

  @override
  String get common_search => 'Қидирув';

  @override
  String get common_close => 'Ёпиш';
}
