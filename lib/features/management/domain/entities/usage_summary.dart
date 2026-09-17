import 'usage_daily_point.dart';

/// Foydalanish xulosasi (API-CONTRACT 10.1).
///
/// `orders`, `conversion`, `daily` backend kontraktida hali yo'q — ixtiyoriy
/// maydonlar sifatida qabul qilinadi (qaytmasa nol/bo'sh bo'ladi).
class UsageSummary {
  final String period;
  final DateTime? dateFrom;
  final DateTime? dateTo;
  final int tokens;
  final int costUzs;
  final int messages;
  final int conversations;
  final int orders;
  final double? conversion;
  final List<UsageDailyPoint> daily;

  const UsageSummary({
    required this.period,
    this.dateFrom,
    this.dateTo,
    this.tokens = 0,
    this.costUzs = 0,
    this.messages = 0,
    this.conversations = 0,
    this.orders = 0,
    this.conversion,
    this.daily = const [],
  });
}
