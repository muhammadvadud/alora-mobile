// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'order_curtain_part_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderCurtainPartDto _$OrderCurtainPartDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_OrderCurtainPartDto',
      json,
      ($checkedConvert) {
        final val = _OrderCurtainPartDto(
          id: $checkedConvert('id', (v) => v as String),
          variant: $checkedConvert(
            'variant',
            (v) => v as Map<String, dynamic>?,
          ),
          role: $checkedConvert('role', (v) => v as String?),
          widthM: $checkedConvert('width_m', (v) => v as String?),
          heightM: $checkedConvert('height_m', (v) => v as String?),
          coefficient: $checkedConvert('coefficient', (v) => v as String?),
          areaSqm: $checkedConvert('area_sqm', (v) => v as String?),
          pricePerSqm: $checkedConvert('price_per_sqm', (v) => v as String?),
          total: $checkedConvert('total', (v) => v as String?),
          sortOrder: $checkedConvert('sort_order', (v) => (v as num?)?.toInt()),
        );
        return val;
      },
      fieldKeyMap: const {
        'widthM': 'width_m',
        'heightM': 'height_m',
        'areaSqm': 'area_sqm',
        'pricePerSqm': 'price_per_sqm',
        'sortOrder': 'sort_order',
      },
    );

Map<String, dynamic> _$OrderCurtainPartDtoToJson(
  _OrderCurtainPartDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'variant': ?instance.variant,
  'role': ?instance.role,
  'width_m': ?instance.widthM,
  'height_m': ?instance.heightM,
  'coefficient': ?instance.coefficient,
  'area_sqm': ?instance.areaSqm,
  'price_per_sqm': ?instance.pricePerSqm,
  'total': ?instance.total,
  'sort_order': ?instance.sortOrder,
};
