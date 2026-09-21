import 'package:freezed_annotation/freezed_annotation.dart';

import 'order_variant.dart';

part 'order_accessory.freezed.dart';

@freezed
abstract class OrderAccessory with _$OrderAccessory {
  const factory OrderAccessory({
    required String id,
    OrderVariant? variant,
    double? qty,
    String? unit,
    int? unitPrice,
    int? total,
    int? sortOrder,
  }) = _OrderAccessory;
}
