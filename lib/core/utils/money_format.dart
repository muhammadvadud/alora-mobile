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
