/// Foydalanuvchi limiti (`auth/me/` javobidagi `limit` blo'gi, API-CONTRACT 1.4).
class ProfileLimit {
  final String id;
  final String userId;
  final String period;
  final bool isUnlimited;
  final int? maxTokens;
  final String? maxCostUzs;
  final int? maxMessages;
  final String onExceed;
  final bool isActive;

  const ProfileLimit({
    required this.id,
    required this.userId,
    required this.period,
    required this.isUnlimited,
    this.maxTokens,
    this.maxCostUzs,
    this.maxMessages,
    required this.onExceed,
    required this.isActive,
  });

  /// `maxCostUzs` ("45702.00") ni so'mga yaxlitlangan int sifatida qaytaradi.
  int? get maxCost {
    final raw = maxCostUzs;
    if (raw == null || raw.isEmpty) return null;
    final value = double.tryParse(raw);
    if (value == null) return null;
    return value.round();
  }
}