// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'token_pair_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenPairDto _$TokenPairDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('TokenPairDto', json, ($checkedConvert) {
      final val = TokenPairDto(
        access: $checkedConvert('access', (v) => v as String),
        refresh: $checkedConvert('refresh', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$TokenPairDtoToJson(TokenPairDto instance) => <String, dynamic>{
  'access': instance.access,
  'refresh': instance.refresh,
};
