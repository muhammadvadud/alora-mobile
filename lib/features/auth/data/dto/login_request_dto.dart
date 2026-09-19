import 'package:json_annotation/json_annotation.dart';

part 'login_request_dto.g.dart';

/// POST /auth/login/ so'rov tanasi (API-CONTRACT 1.1)
@JsonSerializable()
class LoginRequestDto {
  final String phone;
  final String password;

  const LoginRequestDto({required this.phone, required this.password});

  factory LoginRequestDto.fromJson(Map<String, dynamic> json) => _$LoginRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestDtoToJson(this);
}
