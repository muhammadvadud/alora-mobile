import 'package:freezed_annotation/freezed_annotation.dart';

import 'order_curtain_part.dart';
import 'order_accessory.dart';

part 'order_measurement.freezed.dart';

@freezed
abstract class OrderMeasurement with _$OrderMeasurement {
  const factory OrderMeasurement({
    required String id,
    String? roomName,
    double? corniceLengthM,
    double? heightM,
    @Default([]) List<String> layers,
    double? coefficient,
    String? note,
    @Default([]) List<OrderCurtainPart> parts,
    @Default([]) List<OrderAccessory> accessories,
  }) = _OrderMeasurement;
}
