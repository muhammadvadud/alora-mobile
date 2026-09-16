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

  @override
  String get error_network => 'Нет подключения к интернету.';

  @override
  String get error_auth => 'Сессия истекла. Пожалуйста, войдите снова.';

  @override
  String get error_permission => 'Нет доступа';

  @override
  String get error_notFound => 'Не найдено';

  @override
  String get error_limit => 'Лимит исчерпан';

  @override
  String get error_serviceUnavailable => 'AI сервис временно недоступен';

  @override
  String get error_server => 'Сервер не отвечает';

  @override
  String get error_unknown => 'Неизвестная ошибка';

  @override
  String get order_status_draft => 'Черновик';

  @override
  String get order_status_confirmed => 'Подтвержден';

  @override
  String get order_status_measuring => 'На замере';

  @override
  String get order_status_production => 'В пошиве';

  @override
  String get order_status_ready => 'Готов';

  @override
  String get order_status_installing => 'На установке';

  @override
  String get order_status_completed => 'Сдан';

  @override
  String get order_status_cancelled => 'Отменен';

  @override
  String get order_status_unknown => 'Неизвестно';

  @override
  String get payment_status_advancePaid => 'Аванс получен';

  @override
  String get payment_status_fullyPaid => 'Оплачен полностью';

  @override
  String get payment_status_debt => 'Есть долг';

  @override
  String get payment_status_unknown => 'Неизвестно';

  @override
  String get price_unit_perSqm => 'сум/м²';

  @override
  String get price_unit_perPiece => 'сум/шт';

  @override
  String get price_unit_perMeter => 'сум/м';

  @override
  String get price_unit_unknown => '';
}
