import 'package:json_annotation/json_annotation.dart';

enum PaymentStatus {
  @JsonValue('advance_paid')
  advancePaid,
  @JsonValue('fully_paid')
  fullyPaid,
  @JsonValue('debt')
  debt,
  @JsonValue('unknown')
  unknown,
}
