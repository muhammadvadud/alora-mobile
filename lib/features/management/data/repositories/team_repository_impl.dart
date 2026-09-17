import 'package:alora_mobile/features/conversations/domain/entities/conversation.dart';
import 'package:alora_mobile/shared/models/role.dart';

import '../../domain/entities/employee.dart';
import '../../domain/entities/transcript_message.dart';
import '../../domain/entities/usage_limit.dart';
import '../../domain/repositories/team_repository.dart';
import '../datasources/team_remote_ds.dart';
import '../mappers/team_mapper.dart';

/// Jamoa repository implementatsiyasi.
class TeamRepositoryImpl implements TeamRepository {
  TeamRepositoryImpl(this._remoteDataSource);

  final TeamRemoteDataSource _remoteDataSource;

  @override
  Future<List<Employee>> employees() async {
    final dtos = await _remoteDataSource.employees();
    return dtos.map((dto) => dto.toEntity()).toList();
  }

  @override
  Future<Employee> employee(String id) async {
    return (await _remoteDataSource.employee(id)).toEntity();
  }

  @override
  Future<Employee> createEmployee({
    required String phone,
    required String fullName,
    required String password,
    required Role role,
    required bool isActive,
  }) async {
    final dto = await _remoteDataSource.createEmployee(
      body: {
        'phone': phone,
        'full_name': fullName,
        'password': password,
        'role': role.name,
        'is_active': isActive,
      },
    );
    return dto.toEntity();
  }

  @override
  Future<Employee> updateEmployee({
    required String id,
    required Map<String, dynamic> patch,
  }) async {
    final dto = await _remoteDataSource.updateEmployee(id: id, body: patch);
    return dto.toEntity();
  }

  @override
  Future<UsageLimit> setEmployeeLimit({
    required String id,
    required Map<String, dynamic> body,
  }) async {
    final dto = await _remoteDataSource.setEmployeeLimit(id: id, body: body);
    return dto.toEntity();
  }

  @override
  Future<List<Conversation>> employeeConversations(String employeeId) async {
    final dtos = await _remoteDataSource.employeeConversations(employeeId);
    return dtos.map((dto) => dto.toEntity()).toList();
  }

  @override
  Future<List<TranscriptMessage>> transcript(String conversationId) async {
    final dtos = await _remoteDataSource.transcript(conversationId);
    return dtos.map((dto) => dto.toEntity()).toList();
  }
}