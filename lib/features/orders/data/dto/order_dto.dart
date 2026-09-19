// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

import 'order_measurement_dto.dart';
import 'order_item_dto.dart';
import 'order_user_dto.dart';
import '../../../../shared/models/order_status.dart';
import '../../../../shared/models/payment_status.dart';

part 'order_dto.freezed.dart';
part 'order_dto.g.dart';

@freezed
abstract class OrderDto with _$OrderDto {
  const factory OrderDto({
    required String id,
    String? number,
    String? conversation,
    @JsonKey(name: 'customer_name') String? customerName,
    @JsonKey(name: 'customer_phone') String? customerPhone,
    String? address,
    @JsonKey(unknownEnumValue: OrderStatus.unknown) OrderStatus? status,
    @JsonKey(name: 'status_display') String? statusDisplay,
    String? subtotal,
    @JsonKey(name: 'discount_percent') String? discountPercent,
    @JsonKey(name: 'discount_amount') String? discountAmount,
    @JsonKey(name: 'discount_source') String? discountSource,
    @JsonKey(name: 'discount_source_display') String? discountSourceDisplay,
    @JsonKey(name: 'delivery_amount') String? deliveryAmount,
    String? total,
    @JsonKey(name: 'prepayment_percent') String? prepaymentPercent,
    String? prepayment,
    String? balance,
    @JsonKey(name: 'payment_status', unknownEnumValue: PaymentStatus.unknown)
    PaymentStatus? paymentStatus,
    @JsonKey(name: 'payment_status_display') String? paymentStatusDisplay,
    @JsonKey(name: 'deadline_date') String? deadlineDate,
    String? note,
    @JsonKey(name: 'confirmed_by') OrderUserDto? confirmedBy,
    @JsonKey(name: 'confirmed_at') String? confirmedAt,
    OrderUserDto? user,
    @Default([]) List<OrderMeasurementDto> measurements,
    @Default([]) List<OrderItemDto> items,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _OrderDto;

  factory OrderDto.fromJson(Map<String, dynamic> json) => _$OrderDtoFromJson(json);
}
