import 'package:freezed_annotation/freezed_annotation.dart';

import 'order_measurement.dart';
import 'order_item.dart';
import 'order_user.dart';
import '../../../../shared/models/order_status.dart';
import '../../../../shared/models/payment_status.dart';

part 'order.freezed.dart';

@freezed
abstract class Order with _$Order {
  const factory Order({
    required String id,
    String? number,
    String? conversationId,
    String? customerName,
    String? customerPhone,
    String? address,
    required OrderStatus status,
    String? statusDisplay,
    int? subtotal,
    double? discountPercent,
    int? discountAmount,
    String? discountSource,
    String? discountSourceDisplay,
    int? deliveryAmount,
    int? total,
    double? prepaymentPercent,
    int? prepayment,
    int? balance,
    required PaymentStatus paymentStatus,
    String? paymentStatusDisplay,
    DateTime? deadlineDate,
    String? note,
    OrderUser? confirmedBy,
    DateTime? confirmedAt,
    OrderUser? user,
    @Default([]) List<OrderMeasurement> measurements,
    @Default([]) List<OrderItem> items,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Order;
}
