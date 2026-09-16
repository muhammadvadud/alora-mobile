// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'statuses_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StatusesResponseDto _$StatusesResponseDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_StatusesResponseDto', json, ($checkedConvert) {
      final val = _StatusesResponseDto(
        statuses: $checkedConvert(
          'statuses',
          (v) =>
              (v as List<dynamic>?)
                  ?.map(
                    (e) =>
                        StatusTransitionDto.fromJson(e as Map<String, dynamic>),
                  )
                  .toList() ??
              const [],
        ),
        transitions: $checkedConvert(
          'transitions',
          (v) =>
              (v as Map<String, dynamic>?)?.map(
                (k, e) => MapEntry(
                  k,
                  (e as List<dynamic>).map((e) => e as String).toList(),
                ),
              ) ??
              const {},
        ),
      );
      return val;
    });

Map<String, dynamic> _$StatusesResponseDtoToJson(
  _StatusesResponseDto instance,
) => <String, dynamic>{
  'statuses': instance.statuses.map((e) => e.toJson()).toList(),
  'transitions': instance.transitions,
};
