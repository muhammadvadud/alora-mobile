import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_draft.freezed.dart';

@freezed
abstract class OrderDraftMeasurement with _$OrderDraftMeasurement {
  const factory OrderDraftMeasurement({String? roomName, double? cornice, double? height}) =
      _OrderDraftMeasurement;
}

@freezed
abstract class OrderDraft with _$OrderDraft {
  const factory OrderDraft({
    String? customerName,
    String? phone,
    String? address,
    required List<OrderDraftMeasurement> measurements,
    required int total,
    int? prepayment,
    DateTime? deadline,
    required List<String> missingFields,
  }) = _OrderDraft;
}
