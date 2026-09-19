import 'package:intl/intl.dart';

const _narrowNoBreakSpace = '\u202F';

/// Pul miqdorini formatlaydi, masalan: 2 748 000 so'm
String formatMoney(int amount) {
  return '${formatMoneyPlain(amount)} so\'m';
}

/// Pul miqdorini suffikssiz formatlaydi, masalan: 2 748 000
String formatMoneyPlain(int amount) {
  final formatter = NumberFormat('#,###', 'en_US');
  final formatted = formatter.format(amount);
  return formatted.replaceAll(',', _narrowNoBreakSpace);
}

/// Foizni ko'rsatish uchun: butun bo'lsa `3`, aks holda `2.5` (ortiqcha `.0` yo'q).
String formatPercent(double value) {
  return value % 1 == 0 ? value.toInt().toString() : value.toString();
}
