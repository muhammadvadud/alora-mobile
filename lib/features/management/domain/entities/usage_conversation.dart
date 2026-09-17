/// Eng qimmat suhbatlar ro'yxati satri (API-CONTRACT 10.3).
class UsageConversation {
  final String conversationId;
  final int costUzs;
  final int tokens;
  final int messages;

  const UsageConversation({
    required this.conversationId,
    required this.costUzs,
    this.tokens = 0,
    this.messages = 0,
  });
}