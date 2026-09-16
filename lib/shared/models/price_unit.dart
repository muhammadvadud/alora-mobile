import 'package:json_annotation/json_annotation.dart';

enum PriceUnit {
  @JsonValue('per_sqm')
  perSqm,
  @JsonValue('per_piece')
  perPiece,
  @JsonValue('per_meter')
  perMeter,
  @JsonValue('unknown')
  unknown,
}
