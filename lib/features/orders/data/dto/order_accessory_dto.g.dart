// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'order_accessory_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderAccessoryDto _$OrderAccessoryDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_OrderAccessoryDto', json, ($checkedConvert) {
      final val = _OrderAccessoryDto(
        id: $checkedConvert('id', (v) => v as String),
        variant: $checkedConvert('variant', (v) => v as Map<String, dynamic>?),
        qty: $checkedConvert('qty', (v) => v as String?),
        unit: $checkedConvert('unit', (v) => v as String?),
        unitPrice: $checkedConvert('unit_price', (v) => v as String?),
        total: $checkedConvert('total', (v) => v as String?),
        sortOrder: $checkedConvert('sort_order', (v) => (v as num?)?.toInt()),
      );
      return val;
    }, fieldKeyMap: const {'unitPrice': 'unit_price', 'sortOrder': 'sort_order'});

Map<String, dynamic> _$OrderAccessoryDtoToJson(_OrderAccessoryDto instance) => <String, dynamic>{
  'id': instance.id,
  'variant': ?instance.variant,
  'qty': ?instance.qty,
  'unit': ?instance.unit,
  'unit_price': ?instance.unitPrice,
  'total': ?instance.total,
  'sort_order': ?instance.sortOrder,
};
