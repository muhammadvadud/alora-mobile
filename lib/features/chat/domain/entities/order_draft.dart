import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_draft.freezed.dart';

@freezed
abstract class OrderDraftPart with _$OrderDraftPart {
  const factory OrderDraftPart({
    required String variantId,
    required String role,
    double? widthM,
    double? heightM,
    double? coefficient,
  }) = _OrderDraftPart;
}

@freezed
abstract class OrderDraftAccessory with _$OrderDraftAccessory {
  const factory OrderDraftAccessory({required String variantId, required double qty}) =
      _OrderDraftAccessory;
}

@freezed
abstract class OrderDraftMeasurement with _$OrderDraftMeasurement {
  const factory OrderDraftMeasurement({
    String? roomName,
    double? cornice,
    double? height,
    double? coefficient,
    @Default([]) List<OrderDraftPart> parts,
    @Default([]) List<OrderDraftAccessory> accessories,
  }) = _OrderDraftMeasurement;
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
    @Default([]) List<String> services,
    @Default(false) bool delivery,
    double? discountPercent,
    double? prepaymentPercent,
  }) = _OrderDraft;
}
