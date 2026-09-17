/// Statistika davrlari (usage/summary ?period=day|week|month).
enum UsagePeriod {
  day('day'),
  week('week'),
  month('month'),
  unknown('unknown');

  const UsagePeriod(this.query);

  /// Backend query parametri qiymati.
  final String query;

  static UsagePeriod fromName(String value) {
    for (final period in UsagePeriod.values) {
      if (period.query == value) return period;
    }
    return UsagePeriod.unknown;
  }
}