// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'order_user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderUserDto _$OrderUserDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_OrderUserDto', json, ($checkedConvert) {
      final val = _OrderUserDto(
        id: $checkedConvert('id', (v) => v as String),
        fullName: $checkedConvert('full_name', (v) => v as String?),
        phone: $checkedConvert('phone', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'fullName': 'full_name'});

Map<String, dynamic> _$OrderUserDtoToJson(_OrderUserDto instance) => <String, dynamic>{
  'id': instance.id,
  'full_name': ?instance.fullName,
  'phone': ?instance.phone,
};
