import 'package:dio/dio.dart';
import 'package:alora_mobile/core/sse/sse_event.dart';
import 'package:alora_mobile/core/utils/paginated.dart';
import 'package:alora_mobile/features/chat/domain/entities/message.dart';

abstract class ChatRepository {
  Future<Paginated<Message>> getMessages(String conversationId, {String? cursor});

  /// Hive keshidan xabarlarni o'qiydi (oflayn/histor yuklanguncha ko'rsatish uchun).
  Future<List<Message>> getCachedMessages(String conversationId);

  Stream<SseEvent> sendMessage(
    String conversationId,
    String content,
    String locale,
    bool customerMode,
    String? stage, {
    CancelToken? cancelToken,
  });

  Future<void> resetConversation(String conversationId);

  RichBlock parseToolResult(String tool, String resultStr);
}
