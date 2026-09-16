// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

import 'order_curtain_part_dto.dart';
import 'order_accessory_dto.dart';

part 'order_measurement_dto.freezed.dart';
part 'order_measurement_dto.g.dart';

@freezed
abstract class OrderMeasurementDto with _$OrderMeasurementDto {
  const factory OrderMeasurementDto({
    required String id,
    @JsonKey(name: 'room_name') String? roomName,
    @JsonKey(name: 'cornice_length_m') String? corniceLengthM,
    @JsonKey(name: 'height_m') String? heightM,
    List<String>? layers,
    String? coefficient,
    String? note,
    @Default([]) List<OrderCurtainPartDto> parts,
    @Default([]) List<OrderAccessoryDto> accessories,
  }) = _OrderMeasurementDto;

  factory OrderMeasurementDto.fromJson(Map<String, dynamic> json) =>
      _$OrderMeasurementDtoFromJson(json);
}
