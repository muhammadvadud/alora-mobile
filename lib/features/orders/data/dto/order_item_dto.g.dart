// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'order_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderItemDto _$OrderItemDtoFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_OrderItemDto',
  json,
  ($checkedConvert) {
    final val = _OrderItemDto(
      id: $checkedConvert('id', (v) => v as String),
      serviceKey: $checkedConvert('service_key', (v) => v as String?),
      nameSnapshot: $checkedConvert('name_snapshot', (v) => v as String?),
      qty: $checkedConvert('qty', (v) => v as String?),
      unit: $checkedConvert('unit', (v) => v as String?),
      unitPrice: $checkedConvert('unit_price', (v) => v as String?),
      total: $checkedConvert('total', (v) => v as String?),
      sortOrder: $checkedConvert('sort_order', (v) => (v as num?)?.toInt()),
    );
    return val;
  },
  fieldKeyMap: const {
    'serviceKey': 'service_key',
    'nameSnapshot': 'name_snapshot',
    'unitPrice': 'unit_price',
    'sortOrder': 'sort_order',
  },
);

Map<String, dynamic> _$OrderItemDtoToJson(_OrderItemDto instance) => <String, dynamic>{
  'id': instance.id,
  'service_key': ?instance.serviceKey,
  'name_snapshot': ?instance.nameSnapshot,
  'qty': ?instance.qty,
  'unit': ?instance.unit,
  'unit_price': ?instance.unitPrice,
  'total': ?instance.total,
  'sort_order': ?instance.sortOrder,
};
