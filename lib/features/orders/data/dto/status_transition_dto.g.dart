// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'status_transition_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StatusTransitionDto _$StatusTransitionDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_StatusTransitionDto', json, ($checkedConvert) {
      final val = _StatusTransitionDto(
        code: $checkedConvert('code', (v) => v as String),
        label: $checkedConvert('label', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$StatusTransitionDtoToJson(
  _StatusTransitionDto instance,
) => <String, dynamic>{'code': instance.code, 'label': instance.label};
