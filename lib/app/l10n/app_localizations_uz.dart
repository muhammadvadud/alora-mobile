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

  @override
  String get error_network => 'Ulanish yo\'q. Internetni tekshiring.';

  @override
  String get error_auth => 'Sessiya muddati tugadi. Iltimos, qayta kiring.';

  @override
  String get error_permission => 'Ruxsat yo\'q';

  @override
  String get error_notFound => 'Topilmadi';

  @override
  String get error_limit => 'Limit tugadi';

  @override
  String get error_serviceUnavailable => 'AI xizmati vaqtincha ishlamayapti';

  @override
  String get error_server => 'Server javob bermadi';

  @override
  String get error_unknown => 'Noma\'lum xatolik';

  @override
  String get order_status_draft => 'Qoralama';

  @override
  String get order_status_confirmed => 'Tasdiqlangan';

  @override
  String get order_status_measuring => 'O\'lchovda';

  @override
  String get order_status_production => 'Tikuvda';

  @override
  String get order_status_ready => 'Tayyor';

  @override
  String get order_status_installing => 'O\'rnatishda';

  @override
  String get order_status_completed => 'Topshirildi';

  @override
  String get order_status_cancelled => 'Bekor qilingan';

  @override
  String get order_status_unknown => 'Noma\'lum';

  @override
  String get payment_status_advancePaid => 'Avans olindi';

  @override
  String get payment_status_fullyPaid => 'To\'liq to\'landi';

  @override
  String get payment_status_debt => 'Qarz bor';

  @override
  String get payment_status_unknown => 'Noma\'lum';

  @override
  String get price_unit_perSqm => 'so\'m/m²';

  @override
  String get price_unit_perPiece => 'so\'m/dona';

  @override
  String get price_unit_perMeter => 'so\'m/m';

  @override
  String get price_unit_unknown => '';
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

  @override
  String get error_network => 'Уланиш йўқ. Интернетни текширинг.';

  @override
  String get error_auth => 'Сессия муддати тугади. Илтимос, қайта киринг.';

  @override
  String get error_permission => 'Рухсат йўқ';

  @override
  String get error_notFound => 'Топилмади';

  @override
  String get error_limit => 'Лимит тугади';

  @override
  String get error_serviceUnavailable => 'AI хизмати вақтинча ишламаяпти';

  @override
  String get error_server => 'Сервер жавоб бермади';

  @override
  String get error_unknown => 'Номаълум хатолик';

  @override
  String get order_status_draft => 'Қоралама';

  @override
  String get order_status_confirmed => 'Тасдиқланган';

  @override
  String get order_status_measuring => 'Ўлчовда';

  @override
  String get order_status_production => 'Тикувда';

  @override
  String get order_status_ready => 'Тайёр';

  @override
  String get order_status_installing => 'Ўрнатишда';

  @override
  String get order_status_completed => 'Топширилди';

  @override
  String get order_status_cancelled => 'Бекор қилинган';

  @override
  String get order_status_unknown => 'Номаълум';

  @override
  String get payment_status_advancePaid => 'Аванс олинди';

  @override
  String get payment_status_fullyPaid => 'Тўлиқ тўланди';

  @override
  String get payment_status_debt => 'Қарз бор';

  @override
  String get payment_status_unknown => 'Номаълум';

  @override
  String get price_unit_perSqm => 'сўм/м²';

  @override
  String get price_unit_perPiece => 'сўм/дона';

  @override
  String get price_unit_perMeter => 'сўм/м';

  @override
  String get price_unit_unknown => '';
}
