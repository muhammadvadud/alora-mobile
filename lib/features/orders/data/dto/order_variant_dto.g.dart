// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'order_variant_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderVariantDto _$OrderVariantDtoFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_OrderVariantDto',
  json,
  ($checkedConvert) {
    final val = _OrderVariantDto(
      id: $checkedConvert('id', (v) => v as String),
      sku: $checkedConvert('sku', (v) => v as String?),
      colorName: $checkedConvert('color_name', (v) => v as String?),
      productName: $checkedConvert('product_name', (v) => v as String?),
      priceUnit: $checkedConvert(
        'price_unit',
        (v) => $enumDecodeNullable(_$PriceUnitEnumMap, v, unknownValue: PriceUnit.unknown),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'colorName': 'color_name',
    'productName': 'product_name',
    'priceUnit': 'price_unit',
  },
);

Map<String, dynamic> _$OrderVariantDtoToJson(_OrderVariantDto instance) => <String, dynamic>{
  'id': instance.id,
  'sku': ?instance.sku,
  'color_name': ?instance.colorName,
  'product_name': ?instance.productName,
  'price_unit': ?_$PriceUnitEnumMap[instance.priceUnit],
};

const _$PriceUnitEnumMap = {
  PriceUnit.perSqm: 'per_sqm',
  PriceUnit.perPiece: 'per_piece',
  PriceUnit.perMeter: 'per_meter',
  PriceUnit.unknown: 'unknown',
};
