import 'package:dio/dio.dart';

import 'package:alora_mobile/core/error/failure.dart';
import 'package:alora_mobile/core/network/api_paths.dart';

import '../dto/auth_me_dto.dart';
import '../dto/login_request_dto.dart';
import '../dto/token_pair_dto.dart';

/// Auth backend bilan aloqa qiluvchi data source (core Dio + interceptorlar)
class AuthRemoteDataSource {
  AuthRemoteDataSource(this._dio);

  final Dio _dio;

  /// POST /auth/login/ - tokenlar juftligini qaytaradi
  Future<TokenPairDto> login({required String phone, required String password}) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        ApiPaths.login,
        data: LoginRequestDto(phone: phone, password: password).toJson(),
      );
      return TokenPairDto.fromJson(response.data!);
    } on DioException catch (error) {
      throw _mapLoginError(error);
    }
  }

  /// POST /auth/refresh/ - yangi tokenlar juftligini qaytaradi
  Future<TokenPairDto> refresh(String refreshToken) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        ApiPaths.refresh,
        data: {'refresh': refreshToken},
      );
      return TokenPairDto.fromJson(response.data!);
    } on DioException catch (error) {
      throw _mapError(error);
    }
  }

  /// POST /auth/logout/ - refresh tokenni backend da blacklist'ga kiritadi
  Future<void> logout(String refreshToken) async {
    try {
      await _dio.post<Map<String, dynamic>>(ApiPaths.logout, data: {'refresh': refreshToken});
    } on DioException catch (error) {
      throw _mapError(error);
    }
  }

  /// GET /auth/me/ - joriy foydalanuvchi ma'lumotlarini qaytaradi
  Future<AuthMeDto> me() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(ApiPaths.me);
      return AuthMeDto.fromJson(response.data!);
    } on DioException catch (error) {
      throw _mapError(error);
    }
  }

  /// Login xatolari uchun: 401 da backend `detail` matni saqlanadi
  /// (ErrorMapper 401'ni detail'siz Failure.auth() qiladi).
  Failure _mapLoginError(DioException error) {
    if (error.response?.statusCode == 401) {
      final detail = _detailOf(error);
      if (detail.isNotEmpty) {
        return Failure.unknown(detail);
      }
    }
    return _mapError(error);
  }

  Failure _mapError(DioException error) {
    final mapped = error.error;
    if (mapped is Failure) return mapped;
    return Failure.unknown(error.message ?? error.error?.toString() ?? '');
  }

  String _detailOf(DioException error) {
    final data = error.response?.data;
    if (data is Map && data['detail'] != null) {
      final detail = data['detail'].toString();
      if (detail.isNotEmpty) return detail;
    }
    return '';
  }
}
