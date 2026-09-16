import 'package:json_annotation/json_annotation.dart';

/// To'lov holati — backend `PaymentStatus` (apps/common/choices.py) bilan aynan mos.
/// Ko'rinish (dizayn TZ §4.3): unpaid → "Qarz bor", prepaid → "Avans olindi", paid → "To'liq to'landi".
enum PaymentStatus {
  @JsonValue('unpaid')
  unpaid,
  @JsonValue('prepaid')
  prepaid,
  @JsonValue('paid')
  paid,
  unknown,
}
