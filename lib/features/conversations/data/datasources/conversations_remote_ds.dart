import 'package:dio/dio.dart';

import 'package:alora_mobile/core/error/failure.dart';
import 'package:alora_mobile/core/network/api_paths.dart';
import 'package:alora_mobile/core/utils/paginated.dart';

import '../dto/conversation_dto.dart';

/// Conversations backend bilan aloqa qiluvchi data source
class ConversationsRemoteDataSource {
  ConversationsRemoteDataSource(this._dio);

  final Dio _dio;

  /// Suhbatlar ro'yxatini olish (cursor pagination + qidiruv)
  Future<Paginated<ConversationDto>> list({String? cursor, String? search}) async {
    try {
      final queryParams = <String, dynamic>{};
      if (cursor != null) queryParams['cursor'] = cursor;
      if (search != null && search.isNotEmpty) {
        queryParams['search'] = search;
      }

      final response = await _dio.get<Map<String, dynamic>>(
        ApiPaths.conversations,
        queryParameters: queryParams,
      );
      final data = response.data!;
      return Paginated.fromJson(
        data,
        (json) => ConversationDto.fromJson(json! as Map<String, dynamic>),
      );
    } on DioException catch (error) {
      throw _mapError(error);
    }
  }

  /// Yangi suhbat yaratish
  Future<ConversationDto> create() async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        ApiPaths.conversations,
        data: <String, dynamic>{},
      );
      return ConversationDto.fromJson(response.data!);
    } on DioException catch (error) {
      throw _mapError(error);
    }
  }

  /// Suhbatni arxivlash (DELETE)
  Future<void> archive(String id) async {
    try {
      await _dio.delete<dynamic>(ApiPaths.conversation(id));
    } on DioException catch (error) {
      throw _mapError(error);
    }
  }

  /// Suhbat transkriptini olish
  Future<String> transcript(String id) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(ApiPaths.conversationTranscript(id));
      return response.data.toString();
    } on DioException catch (error) {
      throw _mapError(error);
    }
  }

  Failure _mapError(DioException error) {
    final mapped = error.error;
    if (mapped is Failure) return mapped;
    return Failure.unknown(error.message ?? error.error?.toString() ?? '');
  }
}
