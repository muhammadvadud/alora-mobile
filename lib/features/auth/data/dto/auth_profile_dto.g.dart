// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'auth_profile_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthProfileDto _$AuthProfileDtoFromJson(Map<String, dynamic> json) => $checkedCreate(
  'AuthProfileDto',
  json,
  ($checkedConvert) {
    final val = AuthProfileDto(
      id: $checkedConvert('id', (v) => v as String),
      phone: $checkedConvert('phone', (v) => v as String),
      fullName: $checkedConvert('full_name', (v) => v as String),
      role: $checkedConvert('role', (v) => v as String),
      tenant: $checkedConvert('tenant', (v) => v as String),
      deviceId: $checkedConvert('device_id', (v) => v as String?),
      managerPhone: $checkedConvert('manager_phone', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'fullName': 'full_name',
    'deviceId': 'device_id',
    'managerPhone': 'manager_phone',
  },
);

Map<String, dynamic> _$AuthProfileDtoToJson(AuthProfileDto instance) => <String, dynamic>{
  'id': instance.id,
  'phone': instance.phone,
  'full_name': instance.fullName,
  'role': instance.role,
  'tenant': instance.tenant,
  'device_id': ?instance.deviceId,
  'manager_phone': ?instance.managerPhone,
};
