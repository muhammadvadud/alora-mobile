import 'on_exceed.dart';

/// Xodim foydalanish limiti (`team/employees/{id}/limit/`, API-CONTRACT 2.5).
class UsageLimit {
  final String id;
  final String userId;
  final String period;
  final bool isUnlimited;
  final int? maxTokens;
  final String? maxCostUzs;
  final int? maxMessages;
  final OnExceed onExceed;
  final bool isActive;

  const UsageLimit({
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

  int? get maxCost {
    final raw = maxCostUzs;
    if (raw == null || raw.isEmpty) return null;
    final value = double.tryParse(raw);
    if (value == null) return null;
    return value.round();
  }
}