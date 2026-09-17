// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'service_price_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ServicePriceDto _$ServicePriceDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_ServicePriceDto',
      json,
      ($checkedConvert) {
        final val = _ServicePriceDto(
          id: $checkedConvert('id', (v) => v as String),
          key: $checkedConvert('key', (v) => v as String),
          name: $checkedConvert('name', (v) => v as String),
          price: $checkedConvert('price', (v) => v as String),
          unit: $checkedConvert('unit', (v) => v as String),
          isActive: $checkedConvert('is_active', (v) => v as bool),
          createdAt: $checkedConvert('created_at', (v) => v as String),
          updatedAt: $checkedConvert('updated_at', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {
        'isActive': 'is_active',
        'createdAt': 'created_at',
        'updatedAt': 'updated_at',
      },
    );

Map<String, dynamic> _$ServicePriceDtoToJson(_ServicePriceDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'key': instance.key,
      'name': instance.name,
      'price': instance.price,
      'unit': instance.unit,
      'is_active': instance.isActive,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
