// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'catalog_write_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductWriteDto _$ProductWriteDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ProductWriteDto',
      json,
      ($checkedConvert) {
        final val = ProductWriteDto(
          name: $checkedConvert('name', (v) => v as String),
          code: $checkedConvert('code', (v) => v as String),
          category: $checkedConvert('category', (v) => v as String),
          description: $checkedConvert('description', (v) => v as String?),
          fabricType: $checkedConvert('fabric_type', (v) => v as String?),
          style: $checkedConvert('style', (v) => v as String),
          pattern: $checkedConvert('pattern', (v) => v as String),
          transparency: $checkedConvert('transparency', (v) => v as String),
          recommendedRooms: $checkedConvert(
            'recommended_rooms',
            (v) => (v as List<dynamic>).map((e) => e as String).toList(),
          ),
          defaultWidthM: $checkedConvert(
            'default_width_m',
            (v) => (v as num?)?.toDouble(),
          ),
          segment: $checkedConvert('segment', (v) => v as String),
          composition: $checkedConvert('composition', (v) => v as String?),
          care: $checkedConvert('care', (v) => v as String?),
          isActive: $checkedConvert('is_active', (v) => v as bool?),
          variants: $checkedConvert(
            'variants',
            (v) => (v as List<dynamic>?)
                ?.map(
                  (e) => VariantWriteDto.fromJson(e as Map<String, dynamic>),
                )
                .toList(),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'fabricType': 'fabric_type',
        'recommendedRooms': 'recommended_rooms',
        'defaultWidthM': 'default_width_m',
        'isActive': 'is_active',
      },
    );

Map<String, dynamic> _$ProductWriteDtoToJson(ProductWriteDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
      'category': instance.category,
      'description': ?instance.description,
      'fabric_type': ?instance.fabricType,
      'style': instance.style,
      'pattern': instance.pattern,
      'transparency': instance.transparency,
      'recommended_rooms': instance.recommendedRooms,
      'default_width_m': ?instance.defaultWidthM,
      'segment': instance.segment,
      'composition': ?instance.composition,
      'care': ?instance.care,
      'is_active': ?instance.isActive,
      'variants': ?instance.variants?.map((e) => e.toJson()).toList(),
    };

VariantWriteDto _$VariantWriteDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'VariantWriteDto',
      json,
      ($checkedConvert) {
        final val = VariantWriteDto(
          id: $checkedConvert('id', (v) => v as String?),
          sku: $checkedConvert('sku', (v) => v as String),
          colorName: $checkedConvert('color_name', (v) => v as String),
          colorHex: $checkedConvert('color_hex', (v) => v as String),
          widthM: $checkedConvert('width_m', (v) => (v as num?)?.toDouble()),
          price: $checkedConvert('price', (v) => v as String),
          costPrice: $checkedConvert('cost_price', (v) => v as String?),
          priceUnit: $checkedConvert(
            'price_unit',
            (v) => $enumDecode(_$PriceUnitEnumMap, v),
          ),
          isActive: $checkedConvert('is_active', (v) => v as bool?),
        );
        return val;
      },
      fieldKeyMap: const {
        'colorName': 'color_name',
        'colorHex': 'color_hex',
        'widthM': 'width_m',
        'costPrice': 'cost_price',
        'priceUnit': 'price_unit',
        'isActive': 'is_active',
      },
    );

Map<String, dynamic> _$VariantWriteDtoToJson(VariantWriteDto instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'sku': instance.sku,
      'color_name': instance.colorName,
      'color_hex': instance.colorHex,
      'width_m': ?instance.widthM,
      'price': instance.price,
      'cost_price': ?instance.costPrice,
      'price_unit': _$PriceUnitEnumMap[instance.priceUnit]!,
      'is_active': ?instance.isActive,
    };

const _$PriceUnitEnumMap = {
  PriceUnit.perSqm: 'per_sqm',
  PriceUnit.perPiece: 'per_piece',
  PriceUnit.perMeter: 'per_meter',
  PriceUnit.unknown: 'unknown',
};

BulkPriceDto _$BulkPriceDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('BulkPriceDto', json, ($checkedConvert) {
      final val = BulkPriceDto(
        variantIds: $checkedConvert(
          'variant_ids',
          (v) => (v as List<dynamic>).map((e) => e as String).toList(),
        ),
        value: $checkedConvert('value', (v) => (v as num).toDouble()),
        type: $checkedConvert('type', (v) => v as String),
      );
      return val;
    }, fieldKeyMap: const {'variantIds': 'variant_ids'});

Map<String, dynamic> _$BulkPriceDtoToJson(BulkPriceDto instance) =>
    <String, dynamic>{
      'variant_ids': instance.variantIds,
      'value': instance.value,
      'type': instance.type,
    };
