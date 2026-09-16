import 'package:alora_mobile/shared/models/role.dart';

/// Audit qilingan foydalanuvchi (domain model)
class User {
  final String id;
  final String phone;
  final String fullName;
  final Role role;
  final String tenant;
  final String? deviceId;

  const User({
    required this.id,
    required this.phone,
    required this.fullName,
    required this.role,
    required this.tenant,
    this.deviceId,
  });
}
