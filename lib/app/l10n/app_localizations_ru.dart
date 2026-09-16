// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get app_name => 'Алора';

  @override
  String get common_retry => 'Повторить';

  @override
  String get common_cancel => 'Отмена';

  @override
  String get common_save => 'Сохранить';

  @override
  String get common_ok => 'ОК';

  @override
  String get common_loading => 'Загрузка…';

  @override
  String get common_noInternet =>
      'Нет интернета. Будет отправлено при восстановлении';

  @override
  String get common_error => 'Произошла ошибка';

  @override
  String get common_search => 'Поиск';

  @override
  String get common_close => 'Закрыть';
}
