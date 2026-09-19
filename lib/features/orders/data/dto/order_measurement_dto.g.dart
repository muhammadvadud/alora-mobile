// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'order_measurement_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderMeasurementDto _$OrderMeasurementDtoFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_OrderMeasurementDto',
  json,
  ($checkedConvert) {
    final val = _OrderMeasurementDto(
      id: $checkedConvert('id', (v) => v as String),
      roomName: $checkedConvert('room_name', (v) => v as String?),
      corniceLengthM: $checkedConvert('cornice_length_m', (v) => v as String?),
      heightM: $checkedConvert('height_m', (v) => v as String?),
      layers: $checkedConvert(
        'layers',
        (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
      ),
      coefficient: $checkedConvert('coefficient', (v) => v as String?),
      note: $checkedConvert('note', (v) => v as String?),
      parts: $checkedConvert(
        'parts',
        (v) =>
            (v as List<dynamic>?)
                ?.map((e) => OrderCurtainPartDto.fromJson(e as Map<String, dynamic>))
                .toList() ??
            const [],
      ),
      accessories: $checkedConvert(
        'accessories',
        (v) =>
            (v as List<dynamic>?)
                ?.map((e) => OrderAccessoryDto.fromJson(e as Map<String, dynamic>))
                .toList() ??
            const [],
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'roomName': 'room_name',
    'corniceLengthM': 'cornice_length_m',
    'heightM': 'height_m',
  },
);

Map<String, dynamic> _$OrderMeasurementDtoToJson(_OrderMeasurementDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'room_name': ?instance.roomName,
      'cornice_length_m': ?instance.corniceLengthM,
      'height_m': ?instance.heightM,
      'layers': ?instance.layers,
      'coefficient': ?instance.coefficient,
      'note': ?instance.note,
      'parts': instance.parts.map((e) => e.toJson()).toList(),
      'accessories': instance.accessories.map((e) => e.toJson()).toList(),
    };
