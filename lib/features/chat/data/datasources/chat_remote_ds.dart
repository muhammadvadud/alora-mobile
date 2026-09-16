import 'package:dio/dio.dart';
import 'package:alora_mobile/core/network/api_paths.dart';
import 'package:alora_mobile/core/sse/sse_client.dart';
import 'package:alora_mobile/core/sse/sse_event.dart';
import 'package:alora_mobile/core/utils/paginated.dart';

import '../dto/chat_dto.dart';

class ChatRemoteDataSource {
  final Dio _dio;
  final SseClient _sseClient;

  ChatRemoteDataSource(this._dio, this._sseClient);

  Future<Paginated<MessageDto>> getMessages(
    String conversationId, {
    String? cursor,
  }) async {
    final path = ApiPaths.conversationMessages(conversationId);
    final response = await _dio.get(
      path,
      queryParameters: cursor != null ? {'cursor': cursor} : null,
    );
    return Paginated<MessageDto>.fromJson(
      response.data as Map<String, dynamic>,
      (json) => MessageDto.fromJson(json as Map<String, dynamic>),
    );
  }

  Stream<SseEvent> sendMessage(
    String conversationId,
    SendMessageRequestDto request, {
    CancelToken? cancelToken,
  }) {
    final path = ApiPaths.conversationMessages(conversationId);
    return _sseClient.connect(
      path,
      data: request.toJson(),
      cancelToken: cancelToken,
    );
  }

  Future<void> resetConversation(String conversationId) async {
    final path = ApiPaths.conversationReset(conversationId);
    await _dio.post(path);
  }
}
