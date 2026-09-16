import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_item.freezed.dart';

@freezed
abstract class OrderItem with _$OrderItem {
  const factory OrderItem({
    required String id,
    String? serviceKey,
    String? nameSnapshot,
    double? qty,
    String? unit,
    int? unitPrice,
    int? total,
    int? sortOrder,
  }) = _OrderItem;
}
