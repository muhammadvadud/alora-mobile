import 'package:dio/dio.dart';

import 'package:alora_mobile/core/error/failure.dart';
import 'package:alora_mobile/core/network/api_paths.dart';

import '../dto/profile_limit_dto.dart';

/// Profil backend bilan aloqa qiluvchi data source (core Dio + interceptorlar).
class ProfileRemoteDataSource {
  ProfileRemoteDataSource(this._dio);

  final Dio _dio;

  /// GET /auth/me/ — joriy foydalanuvchining `limit` blo'gi.
  /// `limit` null bo'lishi mumkin (limit o'rnatilmagan).
  Future<ProfileLimitDto?> meLimit() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(ApiPaths.me);
      final data = response.data!;
      final limitJson = data['limit'];
      if (limitJson is! Map<String, dynamic>) return null;
      return ProfileLimitDto.fromJson(limitJson);
    } on DioException catch (error) {
      throw _mapError(error);
    }
  }

  /// GET `/usage/summary/?period=day&user=<id>` — joriy (manager/admin uchun)
  /// foydalanuvchining bugungi sarfini so'mda qaytaradi.
  Future<int> todayCost(String userId) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        ApiPaths.usageSummary,
        queryParameters: {'period': 'day', 'user': userId},
      );
      return _costOf(response.data!);
    } on DioException catch (error) {
      throw _mapError(error);
    }
  }

  int _costOf(Map<String, dynamic> json) {
    final raw = json['cost_uzs'];
    if (raw is String && raw.isNotEmpty) {
      final value = double.tryParse(raw);
      if (value != null) return value.round();
    }
    if (raw is num) return raw.round();
    return 0;
  }

  Failure _mapError(DioException error) {
    final mapped = error.error;
    if (mapped is Failure) return mapped;
    return Failure.unknown(error.message ?? error.error?.toString() ?? '');
  }
}
