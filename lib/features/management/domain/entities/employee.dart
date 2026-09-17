import 'package:alora_mobile/shared/models/role.dart';

/// Jamoa xodimi (API-CONTRACT 2.1).
///
/// `todayCost` backend ro'yxatida qaytmaydi; u qo'shimcha
/// `usage/summary?period=day&user=<id>` so'rovi orqali to'ldiriladi.
class Employee {
  final String id;
  final String phone;
  final String fullName;
  final Role role;
  final bool isActive;
  final DateTime? lastLoginAt;
  final DateTime? createdAt;
  final int todayTokens;
  final int todayMessages;
  final int todayConversations;
  final int? todayCost;

  const Employee({
    required this.id,
    required this.phone,
    required this.fullName,
    required this.role,
    required this.isActive,
    this.lastLoginAt,
    this.createdAt,
    this.todayTokens = 0,
    this.todayMessages = 0,
    this.todayConversations = 0,
    this.todayCost,
  });

  bool get isBlocked => !isActive;
}