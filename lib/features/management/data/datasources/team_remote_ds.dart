import 'package:dio/dio.dart';

import 'package:alora_mobile/core/error/failure.dart';
import 'package:alora_mobile/core/network/api_paths.dart';

import '../dto/employee_conversation_dto.dart';
import '../dto/employee_dto.dart';
import '../dto/transcript_message_dto.dart';
import '../dto/usage_limit_dto.dart';

/// Jamoa (xodimlar) backend data source (faqat manager/admin).
class TeamRemoteDataSource {
  TeamRemoteDataSource(this._dio);

  final Dio _dio;

  /// GET /team/employees/ — array ko'rinishida qaytadi (paginatsiyasiz).
  Future<List<EmployeeDto>> employees() async {
    try {
      final response = await _dio.get<List<dynamic>>(ApiPaths.employees);
      return (response.data ?? [])
          .map((e) => EmployeeDto.fromJson(e as Map<String, dynamic>))
          .toList();
    } on DioException catch (error) {
      throw _mapError(error);
    }
  }

  /// GET /team/employees/{id}/ — bitta xodim tafsiloti.
  Future<EmployeeDto> employee(String id) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(ApiPaths.employee(id));
      return EmployeeDto.fromJson(response.data!);
    } on DioException catch (error) {
      throw _mapError(error);
    }
  }

  /// POST /team/employees/ — yangi xodim qo'shish.
  Future<EmployeeDto> createEmployee({required Map<String, dynamic> body}) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(ApiPaths.employees, data: body);
      return EmployeeDto.fromJson(response.data!);
    } on DioException catch (error) {
      throw _mapError(error);
    }
  }

  /// PATCH /team/employees/{id}/ — xodim ma'lumotlarini yangilash.
  Future<EmployeeDto> updateEmployee({
    required String id,
    required Map<String, dynamic> body,
  }) async {
    try {
      final response = await _dio.patch<Map<String, dynamic>>(ApiPaths.employee(id), data: body);
      return EmployeeDto.fromJson(response.data!);
    } on DioException catch (error) {
      throw _mapError(error);
    }
  }

  /// POST /team/employees/{id}/password/ — xodim parolini almashtirish.
  Future<EmployeeDto> changeEmployeePassword({
    required String id,
    required String password,
    required String passwordConfirmation,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        ApiPaths.employeePassword(id),
        data: {'password': password, 'password_confirmation': passwordConfirmation},
      );
      return EmployeeDto.fromJson(response.data!);
    } on DioException catch (error) {
      throw _mapError(error);
    }
  }

  /// POST /team/employees/{id}/limit/ — xodim limitini o'rnatish.
  Future<UsageLimitDto> setEmployeeLimit({
    required String id,
    required Map<String, dynamic> body,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        ApiPaths.employeeLimit(id),
        data: body,
      );
      return UsageLimitDto.fromJson(response.data!);
    } on DioException catch (error) {
      throw _mapError(error);
    }
  }

  /// GET /team/employees/{id}/conversations/ — xodim suhbatlari.
  Future<List<EmployeeConversationDto>> employeeConversations(String id) async {
    try {
      final response = await _dio.get<List<dynamic>>(ApiPaths.employeeConversations(id));
      return (response.data ?? [])
          .map((e) => EmployeeConversationDto.fromJson(e as Map<String, dynamic>))
          .toList();
    } on DioException catch (error) {
      throw _mapError(error);
    }
  }

  /// GET /conversations/{id}/transcript/ — suhbat transkripti (o'qish rejimi).
  Future<List<TranscriptMessageDto>> transcript(String conversationId) async {
    try {
      final response = await _dio.get<List<dynamic>>(
        ApiPaths.conversationTranscript(conversationId),
      );
      return (response.data ?? [])
          .map((e) => TranscriptMessageDto.fromJson(e as Map<String, dynamic>))
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
