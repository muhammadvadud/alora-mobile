import 'package:alora_mobile/core/error/failure.dart';
import 'package:alora_mobile/features/conversations/domain/entities/conversation.dart';
import 'package:alora_mobile/features/management/domain/entities/employee.dart';
import 'package:alora_mobile/features/management/domain/entities/on_exceed.dart';
import 'package:alora_mobile/features/management/domain/entities/transcript_message.dart';
import 'package:alora_mobile/features/management/domain/entities/usage_limit.dart';
import 'package:alora_mobile/features/management/domain/repositories/team_repository.dart';
import 'package:alora_mobile/shared/models/role.dart';

/// Testlarda ishlatiladigan [Employee] namunasi.
Employee testEmployee({
  String id = 'employee-1',
  String phone = '+998901112233',
  String fullName = 'Akmal Karimov',
  Role role = Role.employee,
  bool isActive = true,
  DateTime? lastLoginAt,
  DateTime? createdAt,
  int todayTokens = 0,
  int todayMessages = 0,
  int todayConversations = 0,
  int? todayCost,
}) {
  return Employee(
    id: id,
    phone: phone,
    fullName: fullName,
    role: role,
    isActive: isActive,
    lastLoginAt: lastLoginAt,
    createdAt: createdAt,
    todayTokens: todayTokens,
    todayMessages: todayMessages,
    todayConversations: todayConversations,
    todayCost: todayCost,
  );
}

/// Testlarda ishlatiladigan [UsageLimit] namunasi.
UsageLimit testUsageLimit({
  String id = 'limit-1',
  String userId = 'employee-1',
  String period = 'daily',
  bool isUnlimited = false,
  int? maxTokens,
  String? maxCostUzs,
  int? maxMessages,
  OnExceed onExceed = OnExceed.warn,
  bool isActive = true,
}) {
  return UsageLimit(
    id: id,
    userId: userId,
    period: period,
    isUnlimited: isUnlimited,
    maxTokens: maxTokens,
    maxCostUzs: maxCostUzs,
    maxMessages: maxMessages,
    onExceed: onExceed,
    isActive: isActive,
  );
}

/// Testlarda ishlatiladigan [TranscriptMessage] namunasi.
TranscriptMessage testTranscriptMessage({
  String role = 'user',
  String content = 'Salom!',
  List<dynamic> toolCalls = const [],
  dynamic toolResult,
  DateTime? createdAt,
}) {
  return TranscriptMessage(
    role: role,
    content: content,
    toolCalls: toolCalls,
    toolResult: toolResult,
    createdAt: createdAt,
  );
}

/// [TeamRepository] interfeysining boshqariladigan fakesi.
/// Xatoliklar va natijalar testda sozlanadi, chaqiruvlar hisoblanadi.
class FakeTeamRepository implements TeamRepository {
  List<Employee> employeesResult = [];
  Failure? employeesFailure;
  int employeesCalls = 0;

  Employee? employeeResult;
  Failure? employeeFailure;
  final List<String> employeeIds = [];

  Failure? createFailure;
  Employee createResult = testEmployee(id: 'new-employee');
  final List<Map<String, dynamic>> created = [];

  Failure? updateFailure;
  final List<({String id, Map<String, dynamic> patch})> updates = [];

  Failure? setLimitFailure;
  UsageLimit setLimitResult = testUsageLimit();
  final List<({String id, Map<String, dynamic> body})> setLimits = [];

  Failure? conversationsFailure;
  List<Conversation> conversationsResult = const [];
  final List<String> conversationEmployeeIds = [];

  Failure? transcriptFailure;
  List<TranscriptMessage> transcriptResult = const [];
  final List<String> transcriptIds = [];

  @override
  Future<List<Employee>> employees() async {
    employeesCalls++;
    final failure = employeesFailure;
    if (failure != null) throw failure;
    return employeesResult;
  }

  @override
  Future<Employee> employee(String id) async {
    employeeIds.add(id);
    final failure = employeeFailure;
    if (failure != null) throw failure;
    return employeeResult ?? testEmployee(id: id);
  }

  @override
  Future<Employee> createEmployee({
    required String phone,
    required String fullName,
    required String password,
    required Role role,
    required bool isActive,
  }) async {
    created.add({
      'phone': phone,
      'full_name': fullName,
      'password': password,
      'role': role,
      'is_active': isActive,
    });
    final failure = createFailure;
    if (failure != null) throw failure;
    return createResult;
  }

  @override
  Future<Employee> updateEmployee({required String id, required Map<String, dynamic> patch}) async {
    updates.add((id: id, patch: patch));
    final failure = updateFailure;
    if (failure != null) throw failure;
    return employeeResult ?? testEmployee(id: id);
  }

  @override
  Future<Employee> changeEmployeePassword({
    required String id,
    required String password,
    required String passwordConfirmation,
  }) async {
    final failure = updateFailure;
    if (failure != null) throw failure;
    return employeeResult ?? testEmployee(id: id);
  }

  @override
  Future<UsageLimit> setEmployeeLimit({
    required String id,
    required Map<String, dynamic> body,
  }) async {
    setLimits.add((id: id, body: body));
    final failure = setLimitFailure;
    if (failure != null) throw failure;
    return setLimitResult;
  }

  @override
  Future<List<Conversation>> employeeConversations(String employeeId) async {
    conversationEmployeeIds.add(employeeId);
    final failure = conversationsFailure;
    if (failure != null) throw failure;
    return conversationsResult;
  }

  @override
  Future<List<TranscriptMessage>> transcript(String conversationId) async {
    transcriptIds.add(conversationId);
    final failure = transcriptFailure;
    if (failure != null) throw failure;
    return transcriptResult;
  }
}
