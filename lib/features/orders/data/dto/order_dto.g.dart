// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'order_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderDto _$OrderDtoFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_OrderDto',
  json,
  ($checkedConvert) {
    final val = _OrderDto(
      id: $checkedConvert('id', (v) => v as String),
      number: $checkedConvert('number', (v) => v as String?),
      conversation: $checkedConvert('conversation', (v) => v as String?),
      customerName: $checkedConvert('customer_name', (v) => v as String?),
      customerPhone: $checkedConvert('customer_phone', (v) => v as String?),
      address: $checkedConvert('address', (v) => v as String?),
      status: $checkedConvert(
        'status',
        (v) => $enumDecodeNullable(_$OrderStatusEnumMap, v, unknownValue: OrderStatus.unknown),
      ),
      statusDisplay: $checkedConvert('status_display', (v) => v as String?),
      subtotal: $checkedConvert('subtotal', (v) => v as String?),
      discountPercent: $checkedConvert('discount_percent', (v) => v as String?),
      discountAmount: $checkedConvert('discount_amount', (v) => v as String?),
      discountSource: $checkedConvert('discount_source', (v) => v as String?),
      discountSourceDisplay: $checkedConvert('discount_source_display', (v) => v as String?),
      deliveryAmount: $checkedConvert('delivery_amount', (v) => v as String?),
      total: $checkedConvert('total', (v) => v as String?),
      prepaymentPercent: $checkedConvert('prepayment_percent', (v) => v as String?),
      prepayment: $checkedConvert('prepayment', (v) => v as String?),
      balance: $checkedConvert('balance', (v) => v as String?),
      paymentStatus: $checkedConvert(
        'payment_status',
        (v) => $enumDecodeNullable(_$PaymentStatusEnumMap, v, unknownValue: PaymentStatus.unknown),
      ),
      paymentStatusDisplay: $checkedConvert('payment_status_display', (v) => v as String?),
      deadlineDate: $checkedConvert('deadline_date', (v) => v as String?),
      note: $checkedConvert('note', (v) => v as String?),
      confirmedBy: $checkedConvert(
        'confirmed_by',
        (v) => v == null ? null : OrderUserDto.fromJson(v as Map<String, dynamic>),
      ),
      confirmedAt: $checkedConvert('confirmed_at', (v) => v as String?),
      user: $checkedConvert(
        'user',
        (v) => v == null ? null : OrderUserDto.fromJson(v as Map<String, dynamic>),
      ),
      measurements: $checkedConvert(
        'measurements',
        (v) =>
            (v as List<dynamic>?)
                ?.map((e) => OrderMeasurementDto.fromJson(e as Map<String, dynamic>))
                .toList() ??
            const [],
      ),
      items: $checkedConvert(
        'items',
        (v) =>
            (v as List<dynamic>?)
                ?.map((e) => OrderItemDto.fromJson(e as Map<String, dynamic>))
                .toList() ??
            const [],
      ),
      createdAt: $checkedConvert('created_at', (v) => v as String?),
      updatedAt: $checkedConvert('updated_at', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'customerName': 'customer_name',
    'customerPhone': 'customer_phone',
    'statusDisplay': 'status_display',
    'discountPercent': 'discount_percent',
    'discountAmount': 'discount_amount',
    'discountSource': 'discount_source',
    'discountSourceDisplay': 'discount_source_display',
    'deliveryAmount': 'delivery_amount',
    'prepaymentPercent': 'prepayment_percent',
    'paymentStatus': 'payment_status',
    'paymentStatusDisplay': 'payment_status_display',
    'deadlineDate': 'deadline_date',
    'confirmedBy': 'confirmed_by',
    'confirmedAt': 'confirmed_at',
    'createdAt': 'created_at',
    'updatedAt': 'updated_at',
  },
);

Map<String, dynamic> _$OrderDtoToJson(_OrderDto instance) => <String, dynamic>{
  'id': instance.id,
  'number': ?instance.number,
  'conversation': ?instance.conversation,
  'customer_name': ?instance.customerName,
  'customer_phone': ?instance.customerPhone,
  'address': ?instance.address,
  'status': ?_$OrderStatusEnumMap[instance.status],
  'status_display': ?instance.statusDisplay,
  'subtotal': ?instance.subtotal,
  'discount_percent': ?instance.discountPercent,
  'discount_amount': ?instance.discountAmount,
  'discount_source': ?instance.discountSource,
  'discount_source_display': ?instance.discountSourceDisplay,
  'delivery_amount': ?instance.deliveryAmount,
  'total': ?instance.total,
  'prepayment_percent': ?instance.prepaymentPercent,
  'prepayment': ?instance.prepayment,
  'balance': ?instance.balance,
  'payment_status': ?_$PaymentStatusEnumMap[instance.paymentStatus],
  'payment_status_display': ?instance.paymentStatusDisplay,
  'deadline_date': ?instance.deadlineDate,
  'note': ?instance.note,
  'confirmed_by': ?instance.confirmedBy?.toJson(),
  'confirmed_at': ?instance.confirmedAt,
  'user': ?instance.user?.toJson(),
  'measurements': instance.measurements.map((e) => e.toJson()).toList(),
  'items': instance.items.map((e) => e.toJson()).toList(),
  'created_at': ?instance.createdAt,
  'updated_at': ?instance.updatedAt,
};

const _$OrderStatusEnumMap = {
  OrderStatus.draft: 'draft',
  OrderStatus.confirmed: 'confirmed',
  OrderStatus.measuring: 'measuring',
  OrderStatus.production: 'production',
  OrderStatus.ready: 'ready',
  OrderStatus.installing: 'installing',
  OrderStatus.completed: 'completed',
  OrderStatus.cancelled: 'cancelled',
  OrderStatus.unknown: 'unknown',
};

const _$PaymentStatusEnumMap = {
  PaymentStatus.unpaid: 'unpaid',
  PaymentStatus.prepaid: 'prepaid',
  PaymentStatus.paid: 'paid',
  PaymentStatus.unknown: 'unknown',
};
