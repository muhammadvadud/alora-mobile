// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'employee_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeDto _$EmployeeDtoFromJson(Map<String, dynamic> json) => $checkedCreate(
  'EmployeeDto',
  json,
  ($checkedConvert) {
    final val = EmployeeDto(
      id: $checkedConvert('id', (v) => v as String),
      phone: $checkedConvert('phone', (v) => v as String),
      fullName: $checkedConvert('full_name', (v) => v as String),
      role: $checkedConvert('role', (v) => v as String),
      isActive: $checkedConvert('is_active', (v) => v as bool),
      lastLogin: $checkedConvert('last_login', (v) => v as String?),
      createdAt: $checkedConvert('created_at', (v) => v as String?),
      todayTokens: $checkedConvert('today_tokens', (v) => (v as num?)?.toInt() ?? 0),
      todayMessages: $checkedConvert('today_messages', (v) => (v as num?)?.toInt() ?? 0),
      todayConversations: $checkedConvert('today_conversations', (v) => (v as num?)?.toInt() ?? 0),
    );
    return val;
  },
  fieldKeyMap: const {
    'fullName': 'full_name',
    'isActive': 'is_active',
    'lastLogin': 'last_login',
    'createdAt': 'created_at',
    'todayTokens': 'today_tokens',
    'todayMessages': 'today_messages',
    'todayConversations': 'today_conversations',
  },
);

Map<String, dynamic> _$EmployeeDtoToJson(EmployeeDto instance) => <String, dynamic>{
  'id': instance.id,
  'phone': instance.phone,
  'full_name': instance.fullName,
  'role': instance.role,
  'is_active': instance.isActive,
  'last_login': ?instance.lastLogin,
  'created_at': ?instance.createdAt,
  'today_tokens': instance.todayTokens,
  'today_messages': instance.todayMessages,
  'today_conversations': instance.todayConversations,
};
