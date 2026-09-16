// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'auth_me_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthMeDto _$AuthMeDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('AuthMeDto', json, ($checkedConvert) {
      final val = AuthMeDto(
        profile: $checkedConvert(
          'profile',
          (v) => AuthProfileDto.fromJson(v as Map<String, dynamic>),
        ),
        limit: $checkedConvert(
          'limit',
          (v) =>
              v == null ? null : LimitDto.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$AuthMeDtoToJson(AuthMeDto instance) => <String, dynamic>{
  'profile': instance.profile.toJson(),
  'limit': ?instance.limit?.toJson(),
};
