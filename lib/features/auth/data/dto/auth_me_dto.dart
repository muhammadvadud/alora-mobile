import 'package:json_annotation/json_annotation.dart';

import 'auth_profile_dto.dart';
import 'limit_dto.dart';

part 'auth_me_dto.g.dart';

/// GET /auth/me/ javob tanasi (API-CONTRACT 1.4)
@JsonSerializable()
class AuthMeDto {
  final AuthProfileDto profile;
  final LimitDto? limit;

  const AuthMeDto({required this.profile, this.limit});

  factory AuthMeDto.fromJson(Map<String, dynamic> json) => _$AuthMeDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AuthMeDtoToJson(this);
}
