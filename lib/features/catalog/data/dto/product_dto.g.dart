// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'product_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDto _$ProductDtoFromJson(Map<String, dynamic> json) => $checkedCreate(
  'ProductDto',
  json,
  ($checkedConvert) {
    final val = ProductDto(
      id: $checkedConvert('id', (v) => v as String),
      category: $checkedConvert('category', (v) => v as String),
      categoryData: $checkedConvert(
        'category_data',
        (v) =>
            v == null ? null : CategoryDto.fromJson(v as Map<String, dynamic>),
      ),
      name: $checkedConvert('name', (v) => v as String),
      code: $checkedConvert('code', (v) => v as String),
      description: $checkedConvert('description', (v) => v as String?),
      fabricType: $checkedConvert('fabric_type', (v) => v as String?),
      style: $checkedConvert(
        'style',
        (v) =>
            $enumDecodeNullable(
              _$ProductStyleEnumMap,
              v,
              unknownValue: ProductStyle.unknown,
            ) ??
            ProductStyle.unknown,
      ),
      pattern: $checkedConvert(
        'pattern',
        (v) =>
            $enumDecodeNullable(
              _$ProductPatternEnumMap,
              v,
              unknownValue: ProductPattern.unknown,
            ) ??
            ProductPattern.unknown,
      ),
      transparency: $checkedConvert(
        'transparency',
        (v) =>
            $enumDecodeNullable(
              _$ProductTransparencyEnumMap,
              v,
              unknownValue: ProductTransparency.unknown,
            ) ??
            ProductTransparency.unknown,
      ),
      density: $checkedConvert(
        'density',
        (v) =>
            $enumDecodeNullable(
              _$ProductDensityEnumMap,
              v,
              unknownValue: ProductDensity.unknown,
            ) ??
            ProductDensity.unknown,
      ),
      composition: $checkedConvert('composition', (v) => v as String?),
      care: $checkedConvert('care', (v) => v as String?),
      recommendedRooms: $checkedConvert(
        'recommended_rooms',
        (v) =>
            (v as List<dynamic>?)?.map((e) => e as String).toList() ?? const [],
      ),
      recommendedCoef: $checkedConvert(
        'recommended_coef',
        (v) => (v as num?)?.toDouble(),
      ),
      defaultWidthM: $checkedConvert(
        'default_width_m',
        (v) => (v as num?)?.toDouble(),
      ),
      isSewingRequired: $checkedConvert(
        'is_sewing_required',
        (v) => v as bool? ?? true,
      ),
      segment: $checkedConvert(
        'segment',
        (v) =>
            $enumDecodeNullable(
              _$ProductSegmentEnumMap,
              v,
              unknownValue: ProductSegment.unknown,
            ) ??
            ProductSegment.unknown,
      ),
      tags: $checkedConvert(
        'tags',
        (v) =>
            (v as List<dynamic>?)?.map((e) => e as String).toList() ?? const [],
      ),
      sortOrder: $checkedConvert(
        'sort_order',
        (v) => (v as num?)?.toInt() ?? 0,
      ),
      isActive: $checkedConvert('is_active', (v) => v as bool? ?? true),
      variants: $checkedConvert(
        'variants',
        (v) =>
            (v as List<dynamic>?)
                ?.map(
                  (e) => ProductVariantDto.fromJson(e as Map<String, dynamic>),
                )
                .toList() ??
            const [],
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'categoryData': 'category_data',
    'fabricType': 'fabric_type',
    'recommendedRooms': 'recommended_rooms',
    'recommendedCoef': 'recommended_coef',
    'defaultWidthM': 'default_width_m',
    'isSewingRequired': 'is_sewing_required',
    'sortOrder': 'sort_order',
    'isActive': 'is_active',
  },
);

Map<String, dynamic> _$ProductDtoToJson(ProductDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'category_data': ?instance.categoryData?.toJson(),
      'name': instance.name,
      'code': instance.code,
      'description': ?instance.description,
      'fabric_type': ?instance.fabricType,
      'style': _$ProductStyleEnumMap[instance.style]!,
      'pattern': _$ProductPatternEnumMap[instance.pattern]!,
      'transparency': _$ProductTransparencyEnumMap[instance.transparency]!,
      'density': _$ProductDensityEnumMap[instance.density]!,
      'composition': ?instance.composition,
      'care': ?instance.care,
      'recommended_rooms': instance.recommendedRooms,
      'recommended_coef': ?instance.recommendedCoef,
      'default_width_m': ?instance.defaultWidthM,
      'is_sewing_required': instance.isSewingRequired,
      'segment': _$ProductSegmentEnumMap[instance.segment]!,
      'tags': instance.tags,
      'sort_order': instance.sortOrder,
      'is_active': instance.isActive,
      'variants': instance.variants.map((e) => e.toJson()).toList(),
    };

const _$ProductStyleEnumMap = {
  ProductStyle.klassik: 'klassik',
  ProductStyle.zamonaviy: 'zamonaviy',
  ProductStyle.minimalist: 'minimalist',
  ProductStyle.unknown: 'unknown',
};

const _$ProductPatternEnumMap = {
  ProductPattern.yassi: 'yassi',
  ProductPattern.gulli: 'gulli',
  ProductPattern.chiziqli: 'chiziqli',
  ProductPattern.geometrik: 'geometrik',
  ProductPattern.unknown: 'unknown',
};

const _$ProductTransparencyEnumMap = {
  ProductTransparency.yopiq: 'yopiq',
  ProductTransparency.yarimYorug: 'yarim_yorug',
  ProductTransparency.yorug: 'yorug',
  ProductTransparency.unknown: 'unknown',
};

const _$ProductDensityEnumMap = {
  ProductDensity.yengil: 'yengil',
  ProductDensity.ogir: 'ogir',
  ProductDensity.unknown: 'unknown',
};

const _$ProductSegmentEnumMap = {
  ProductSegment.economy: 'economy',
  ProductSegment.standard: 'standard',
  ProductSegment.premium: 'premium',
  ProductSegment.unknown: 'unknown',
};
