import '../entities/conversation.dart';

/// Suhbatlar bilan ishlash interfeysi
abstract class ConversationsRepository {
  /// Suhbatlar ro'yxatini olish (cursor pagination + qidiruv)
  Future<(List<Conversation> items, String? nextCursor)> list({
    String? cursor,
    String? search,
    String? cacheScope,
  });

  /// Yangi suhbat yaratish
  Future<Conversation> create();

  /// Suhbatni arxivlash
  Future<void> archive(String id);

  /// Suhbat transkriptini olish
  Future<String> transcript(String id);

  /// Keshdan suhbatlarni olish
  Future<List<Conversation>> getCached();
}
