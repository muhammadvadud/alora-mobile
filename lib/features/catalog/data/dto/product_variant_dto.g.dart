// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'product_variant_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductVariantDto _$ProductVariantDtoFromJson(Map<String, dynamic> json) => $checkedCreate(
  'ProductVariantDto',
  json,
  ($checkedConvert) {
    final val = ProductVariantDto(
      id: $checkedConvert('id', (v) => v as String),
      sku: $checkedConvert('sku', (v) => v as String),
      colorName: $checkedConvert('color_name', (v) => v as String),
      colorHex: $checkedConvert('color_hex', (v) => v as String),
      widthM: $checkedConvert('width_m', (v) => (v as num?)?.toDouble() ?? 0),
      price: $checkedConvert('price', (v) => v as String),
      priceUnit: $checkedConvert(
        'price_unit',
        (v) =>
            $enumDecodeNullable(_$PriceUnitEnumMap, v, unknownValue: PriceUnit.unknown) ??
            PriceUnit.unknown,
      ),
      oldPrice: $checkedConvert('old_price', (v) => v as String?),
      costPrice: $checkedConvert('cost_price', (v) => v as String?),
      isActive: $checkedConvert('is_active', (v) => v as bool? ?? true),
      images: $checkedConvert(
        'images',
        (v) =>
            (v as List<dynamic>?)
                ?.map((e) => ProductImageDto.fromJson(e as Map<String, dynamic>))
                .toList() ??
            const [],
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'colorName': 'color_name',
    'colorHex': 'color_hex',
    'widthM': 'width_m',
    'priceUnit': 'price_unit',
    'oldPrice': 'old_price',
    'costPrice': 'cost_price',
    'isActive': 'is_active',
  },
);

Map<String, dynamic> _$ProductVariantDtoToJson(ProductVariantDto instance) => <String, dynamic>{
  'id': instance.id,
  'sku': instance.sku,
  'color_name': instance.colorName,
  'color_hex': instance.colorHex,
  'width_m': instance.widthM,
  'price': instance.price,
  'price_unit': _$PriceUnitEnumMap[instance.priceUnit]!,
  'old_price': ?instance.oldPrice,
  'cost_price': ?instance.costPrice,
  'is_active': instance.isActive,
  'images': instance.images.map((e) => e.toJson()).toList(),
};

const _$PriceUnitEnumMap = {
  PriceUnit.perSqm: 'per_sqm',
  PriceUnit.perPiece: 'per_piece',
  PriceUnit.perMeter: 'per_meter',
  PriceUnit.unknown: 'unknown',
};
