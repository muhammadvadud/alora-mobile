import 'package:dio/dio.dart';

import 'package:alora_mobile/core/error/failure.dart';
import 'package:alora_mobile/core/network/api_paths.dart';

import '../dto/conversion_stats_dto.dart';
import '../dto/usage_conversation_dto.dart';
import '../dto/usage_summary_dto.dart';
import '../dto/user_usage_dto.dart';
import '../../domain/entities/usage_period.dart';

/// Usage statistika uchun backend data source (faqat manager/admin).
class UsageRemoteDataSource {
  UsageRemoteDataSource(this._dio);

  final Dio _dio;

  /// GET `/usage/summary/?period=<query>&user=<userId?>`
  Future<UsageSummaryDto> summary({
    required UsagePeriod period,
    String? userId,
  }) async {
    try {
      final params = <String, dynamic>{'period': period.query};
      if (userId != null) params['user'] = userId;

      final response = await _dio.get<Map<String, dynamic>>(
        ApiPaths.usageSummary,
        queryParameters: params,
      );
      return UsageSummaryDto.fromJson(response.data!);
    } on DioException catch (error) {
      throw _mapError(error);
    }
  }

  /// GET `/usage/by-user/?period=<query>`
  Future<List<UserUsageDto>> byUser({required UsagePeriod period}) async {
    try {
      final response = await _dio.get<List<dynamic>>(
        ApiPaths.usageByUser,
        queryParameters: {'period': period.query},
      );
      return (response.data ?? [])
          .map((e) => UserUsageDto.fromJson(e as Map<String, dynamic>))
          .toList();
    } on DioException catch (error) {
      throw _mapError(error);
    }
  }

  /// GET /analytics/conversion/
  Future<ConversionStatsDto> conversion() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        ApiPaths.analyticsConversion,
      );
      return ConversionStatsDto.fromJson(response.data!);
    } on DioException catch (error) {
      throw _mapError(error);
    }
  }

  /// GET /usage/conversations/ — eng qimmat suhbatlar.
  Future<List<UsageConversationDto>> conversations() async {
    try {
      final response = await _dio.get<List<dynamic>>(
        ApiPaths.usageConversations,
      );
      return (response.data ?? [])
          .map((e) => UsageConversationDto.fromJson(e as Map<String, dynamic>))
          .toList();
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
