import 'package:json_annotation/json_annotation.dart';

part 'employee_dto.g.dart';

/// `team/employees/` ro'yxat elementi (API-CONTRACT 2.1).
@JsonSerializable()
class EmployeeDto {
  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'phone')
  final String phone;

  @JsonKey(name: 'full_name')
  final String fullName;

  @JsonKey(name: 'role')
  final String role;

  @JsonKey(name: 'is_active')
  final bool isActive;

  @JsonKey(name: 'last_login')
  final String? lastLogin;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  @JsonKey(name: 'today_tokens')
  final int todayTokens;

  @JsonKey(name: 'today_messages')
  final int todayMessages;

  @JsonKey(name: 'today_conversations')
  final int todayConversations;

  const EmployeeDto({
    required this.id,
    required this.phone,
    required this.fullName,
    required this.role,
    required this.isActive,
    this.lastLogin,
    this.createdAt,
    this.todayTokens = 0,
    this.todayMessages = 0,
    this.todayConversations = 0,
  });

  factory EmployeeDto.fromJson(Map<String, dynamic> json) =>
      _$EmployeeDtoFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeDtoToJson(this);
}