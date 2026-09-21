import 'package:dio/dio.dart';
import 'package:alora_mobile/core/sse/sse_event.dart';
import 'package:alora_mobile/core/utils/paginated.dart';
import 'package:alora_mobile/features/chat/data/datasources/chat_local_ds.dart';
import 'package:alora_mobile/features/chat/data/datasources/chat_remote_ds.dart';
import 'package:alora_mobile/features/chat/data/dto/chat_dto.dart';
import 'package:alora_mobile/features/chat/data/mappers/chat_mapper.dart';
import 'package:alora_mobile/features/chat/domain/entities/message.dart';
import 'package:alora_mobile/features/chat/domain/repositories/chat_repository.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatRemoteDataSource _remoteDS;
  final ChatLocalDataSource _localDS;

  ChatRepositoryImpl(this._remoteDS, this._localDS);

  @override
  Future<Paginated<Message>> getMessages(String conversationId, {String? cursor}) async {
    try {
      final paginatedDto = await _remoteDS.getMessages(conversationId, cursor: _cursorToken(cursor));

      // Keshni yangilaymiz (faqat birinchi sahifa bo'lsa)
      if (cursor == null) {
        await _localDS.saveMessages(conversationId, paginatedDto.results);
      }

      final messages = paginatedDto.results.map(ChatMapper.fromDto).toList();
      return Paginated(next: paginatedDto.next, previous: paginatedDto.previous, results: messages);
    } catch (_) {
      // Oflayn bo'lsa, keshdan qaytaramiz (faqat birinchi sahifa)
      if (cursor == null) {
        final messages = await getCachedMessages(conversationId);
        return Paginated(next: null, previous: null, results: messages);
      }
      rethrow;
    }
  }

  @override
  Future<List<Message>> getCachedMessages(String conversationId) async {
    final localDto = await _localDS.getMessages(conversationId);
    return localDto.map(ChatMapper.fromDto).toList();
  }

  /// Server `next` URL'dan cursor tokenini ajratib oladi. API `next` ni to'liq
  /// URL ko'rinishida qaytaradi (`?cursor=...`); faqat token kelgan bo'lsa ham qo'llab-quvvatlaydi.
  String? _cursorToken(String? next) {
    if (next == null || next.isEmpty) return null;
    final uri = Uri.tryParse(next);
    if (uri != null && uri.queryParameters.containsKey('cursor')) {
      return uri.queryParameters['cursor'];
    }
    return next;
  }

  @override
  Stream<SseEvent> sendMessage(
    String conversationId,
    String content,
    String locale,
    bool customerMode,
    String? stage, {
    CancelToken? cancelToken,
  }) {
    final request = SendMessageRequestDto(
      content: content,
      locale: locale,
      context: SendMessageContextDto(customerMode: customerMode, stage: stage),
    );
    return _remoteDS.sendMessage(conversationId, request, cancelToken: cancelToken);
  }

  @override
  Future<void> resetConversation(String conversationId) async {
    await _remoteDS.resetConversation(conversationId);
    await _localDS.clearMessages(conversationId);
  }

  @override
  RichBlock parseToolResult(String tool, String resultStr) {
    return ChatMapper.parseToolResult(tool, resultStr);
  }
}
