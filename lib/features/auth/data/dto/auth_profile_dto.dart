import 'package:json_annotation/json_annotation.dart';

part 'auth_profile_dto.g.dart';

/// GET /auth/me/ javobidagi `profile` blo'gi (API-CONTRACT 1.4)
@JsonSerializable()
class AuthProfileDto {
  final String id;
  final String phone;
  final String fullName;
  final String role;
  final String tenant;
  final String? deviceId;
  final String? managerPhone;

  const AuthProfileDto({
    required this.id,
    required this.phone,
    required this.fullName,
    required this.role,
    required this.tenant,
    this.deviceId,
    this.managerPhone,
  });

  factory AuthProfileDto.fromJson(Map<String, dynamic> json) => _$AuthProfileDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AuthProfileDtoToJson(this);
}
