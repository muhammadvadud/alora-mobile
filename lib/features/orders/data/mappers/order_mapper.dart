import '../../domain/entities/order.dart';
import '../../domain/entities/order_measurement.dart';
import '../../domain/entities/order_curtain_part.dart';
import '../../domain/entities/order_accessory.dart';
import '../../domain/entities/order_item.dart';
import '../../domain/entities/order_user.dart';
import '../../domain/entities/status_transition.dart';
import '../dto/order_dto.dart';
import '../dto/order_measurement_dto.dart';
import '../dto/order_curtain_part_dto.dart';
import '../dto/order_accessory_dto.dart';
import '../dto/order_item_dto.dart';
import '../dto/order_user_dto.dart';
import '../dto/status_transition_dto.dart';
import '../../../../shared/models/order_status.dart';
import '../../../../shared/models/payment_status.dart';

int? parseMoney(String? val) {
  if (val == null) return null;
  final numValue = double.tryParse(val);
  return numValue?.round();
}

double? parseDouble(String? val) {
  if (val == null) return null;
  return double.tryParse(val);
}

DateTime? parseDate(String? val) {
  if (val == null) return null;
  return DateTime.tryParse(val);
}

extension OrderUserDtoMapper on OrderUserDto {
  OrderUser toEntity() => OrderUser(id: id, fullName: fullName, phone: phone);
}

extension OrderCurtainPartDtoMapper on OrderCurtainPartDto {
  OrderCurtainPart toEntity() => OrderCurtainPart(
    id: id,
    variant: variant,
    role: role,
    widthM: parseDouble(widthM),
    heightM: parseDouble(heightM),
    coefficient: parseDouble(coefficient),
    areaSqm: parseDouble(areaSqm),
    pricePerSqm: parseMoney(pricePerSqm),
    total: parseMoney(total),
    sortOrder: sortOrder,
  );
}

extension OrderAccessoryDtoMapper on OrderAccessoryDto {
  OrderAccessory toEntity() => OrderAccessory(
    id: id,
    variant: variant,
    qty: parseDouble(qty),
    unit: unit,
    unitPrice: parseMoney(unitPrice),
    total: parseMoney(total),
    sortOrder: sortOrder,
  );
}

extension OrderItemDtoMapper on OrderItemDto {
  OrderItem toEntity() => OrderItem(
    id: id,
    serviceKey: serviceKey,
    nameSnapshot: nameSnapshot,
    qty: parseDouble(qty),
    unit: unit,
    unitPrice: parseMoney(unitPrice),
    total: parseMoney(total),
    sortOrder: sortOrder,
  );
}

extension OrderMeasurementDtoMapper on OrderMeasurementDto {
  OrderMeasurement toEntity() => OrderMeasurement(
    id: id,
    roomName: roomName,
    corniceLengthM: parseDouble(corniceLengthM),
    heightM: parseDouble(heightM),
    layers: layers ?? [],
    coefficient: parseDouble(coefficient),
    note: note,
    parts: parts.map((e) => e.toEntity()).toList(),
    accessories: accessories.map((e) => e.toEntity()).toList(),
  );
}

extension OrderDtoMapper on OrderDto {
  Order toEntity() => Order(
    id: id,
    number: number,
    conversationId: conversation,
    customerName: customerName,
    customerPhone: customerPhone,
    address: address,
    status: status ?? OrderStatus.unknown,
    statusDisplay: statusDisplay,
    subtotal: parseMoney(subtotal),
    discountPercent: parseDouble(discountPercent),
    discountAmount: parseMoney(discountAmount),
    discountSource: discountSource,
    discountSourceDisplay: discountSourceDisplay,
    deliveryAmount: parseMoney(deliveryAmount),
    total: parseMoney(total),
    prepaymentPercent: parseDouble(prepaymentPercent),
    prepayment: parseMoney(prepayment),
    balance: parseMoney(balance),
    paymentStatus: paymentStatus ?? PaymentStatus.unknown,
    paymentStatusDisplay: paymentStatusDisplay,
    deadlineDate: parseDate(deadlineDate),
    note: note,
    confirmedBy: confirmedBy?.toEntity(),
    confirmedAt: parseDate(confirmedAt),
    user: user?.toEntity(),
    measurements: measurements.map((e) => e.toEntity()).toList(),
    items: items.map((e) => e.toEntity()).toList(),
    createdAt: parseDate(createdAt),
    updatedAt: parseDate(updatedAt),
  );
}

extension StatusTransitionDtoMapper on StatusTransitionDto {
  StatusTransition toEntity() => StatusTransition(code: code, label: label);
}
