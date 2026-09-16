/// Foydalanuvchi limiti (auth_me 'limit' blo'gi, API-CONTRACT 1.4)
class LimitStatus {
  final String id;
  final String userId;
  final String period;
  final bool isUnlimited;
  final int? maxTokens;
  final String? maxCostUzs;
  final int? maxMessages;
  final String onExceed;
  final bool isActive;

  const LimitStatus({
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
}
