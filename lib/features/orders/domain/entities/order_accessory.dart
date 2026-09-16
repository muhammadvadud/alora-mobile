import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_accessory.freezed.dart';

@freezed
abstract class OrderAccessory with _$OrderAccessory {
  const factory OrderAccessory({
    required String id,
    Map<String, dynamic>? variant,
    double? qty,
    String? unit,
    int? unitPrice,
    int? total,
    int? sortOrder,
  }) = _OrderAccessory;
}
