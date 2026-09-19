import 'package:flutter/widgets.dart';

const _monthsUz = [
  'yanvar',
  'fevral',
  'mart',
  'aprel',
  'may',
  'iyun',
  'iyul',
  'avgust',
  'sentabr',
  'oktabr',
  'noyabr',
  'dekabr',
];

const _monthsUzCyrl = [
  'январь',
  'февраль',
  'март',
  'апрель',
  'май',
  'июнь',
  'июль',
  'август',
  'сентябрь',
  'октябрь',
  'ноябрь',
  'декабрь',
];

const _monthsRu = [
  'января',
  'февраля',
  'марта',
  'апреля',
  'мая',
  'июня',
  'июля',
  'августа',
  'сентября',
  'октября',
  'ноября',
  'декабря',
];

String _getMonthName(int month, String locale) {
  final index = month - 1;
  if (locale == 'uz_Cyrl') return _monthsUzCyrl[index];
  if (locale == 'ru') return _monthsRu[index];
  return _monthsUz[index];
}

String _getShortMonthName(int month, String locale) {
  final name = _getMonthName(month, locale);
  if (locale == 'uz' && month == 9) return 'sent';
  if (locale == 'uz' && month == 10) return 'okt';
  if (locale == 'uz' && month == 11) return 'noy';
  if (locale == 'uz' && month == 12) return 'dek';
  if (locale == 'uz_Cyrl' && month == 9) return 'сент';
  if (locale == 'uz_Cyrl' && month == 10) return 'окт';
  if (locale == 'uz_Cyrl' && month == 11) return 'ноя';
  if (locale == 'uz_Cyrl' && month == 12) return 'дек';
  if (locale == 'ru' && month == 9) return 'сент';
  return name.substring(0, 3);
}

/// Sanani formatlaydi: `12-sentabr` yoki `12-sent 2026`
String formatDate(
  DateTime date, {
  BuildContext? context,
  String? overrideLocale,
  bool short = false,
}) {
  final locale =
      overrideLocale ?? (context != null ? Localizations.localeOf(context).toString() : 'uz');
  final now = DateTime.now();
  final monthName = short
      ? _getShortMonthName(date.month, locale)
      : _getMonthName(date.month, locale);

  if (date.year == now.year) {
    if (locale == 'uz' || locale == 'uz_Cyrl') {
      return '${date.day}-$monthName';
    } else {
      return '${date.day} $monthName';
    }
  } else {
    if (locale == 'uz' || locale == 'uz_Cyrl') {
      return '${date.day}-$monthName ${date.year}';
    } else {
      return '${date.day} $monthName ${date.year}';
    }
  }
}

/// Sanani nisbiy formatlaydi: Bugun, Kecha, Bu hafta
String formatRelativeDate(DateTime date, {BuildContext? context, String? overrideLocale}) {
  final locale =
      overrideLocale ?? (context != null ? Localizations.localeOf(context).toString() : 'uz');
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final target = DateTime(date.year, date.month, date.day);
  final diff = today.difference(target).inDays;

  if (diff == 0) {
    if (locale == 'uz_Cyrl') return 'Бугун';
    if (locale == 'ru') return 'Сегодня';
    return 'Bugun';
  } else if (diff == 1) {
    if (locale == 'uz_Cyrl') return 'Кеча';
    if (locale == 'ru') return 'Вчера';
    return 'Kecha';
  } else if (diff > 1 && diff <= 7) {
    if (locale == 'uz_Cyrl') return 'Бу ҳафта';
    if (locale == 'ru') return 'На этой неделе';
    return 'Bu hafta';
  }

  return formatDate(date, context: context, overrideLocale: overrideLocale);
}
