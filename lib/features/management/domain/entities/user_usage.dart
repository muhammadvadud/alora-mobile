/// Xodimlar bo'yicha reyting qatori (API-CONTRACT 10.2).
class UserUsage {
  final String userId;
  final String? fullName;
  final int tokens;
  final int costUzs;
  final int messages;
  final int conversations;

  const UserUsage({
    required this.userId,
    this.fullName,
    this.tokens = 0,
    this.costUzs = 0,
    this.messages = 0,
    this.conversations = 0,
  });
}
