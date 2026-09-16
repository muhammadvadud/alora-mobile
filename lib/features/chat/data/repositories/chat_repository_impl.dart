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
  Future<Paginated<Message>> getMessages(
    String conversationId, {
    String? cursor,
  }) async {
    try {
      final paginatedDto = await _remoteDS.getMessages(
        conversationId,
        cursor: cursor,
      );

      // Keshni yangilaymiz (faqat birinchi sahifa bo'lsa)
      if (cursor == null) {
        await _localDS.saveMessages(conversationId, paginatedDto.results);
      }

      final messages = paginatedDto.results.map(ChatMapper.fromDto).toList();
      return Paginated(
        next: paginatedDto.next,
        previous: paginatedDto.previous,
        results: messages,
      );
    } catch (_) {
      // Oflayn bo'lsa, keshdan qaytaramiz (faqat birinchi sahifa)
      if (cursor == null) {
        final localDto = await _localDS.getMessages(conversationId);
        final messages = localDto.map(ChatMapper.fromDto).toList();
        return Paginated(next: null, previous: null, results: messages);
      }
      rethrow;
    }
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
    return _remoteDS.sendMessage(
      conversationId,
      request,
      cancelToken: cancelToken,
    );
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
