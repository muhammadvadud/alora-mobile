// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'order_defaults_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderDefaultsDto _$OrderDefaultsDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_OrderDefaultsDto',
      json,
      ($checkedConvert) {
        final val = _OrderDefaultsDto(
          id: $checkedConvert('id', (v) => v as String),
          defaultPrepaymentPercent: $checkedConvert(
            'default_prepayment_percent',
            (v) => v as String,
          ),
          defaultDeliveryAmount: $checkedConvert(
            'default_delivery_amount',
            (v) => v as String,
          ),
          isActive: $checkedConvert('is_active', (v) => v as bool),
          createdAt: $checkedConvert('created_at', (v) => v as String),
          updatedAt: $checkedConvert('updated_at', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {
        'defaultPrepaymentPercent': 'default_prepayment_percent',
        'defaultDeliveryAmount': 'default_delivery_amount',
        'isActive': 'is_active',
        'createdAt': 'created_at',
        'updatedAt': 'updated_at',
      },
    );

Map<String, dynamic> _$OrderDefaultsDtoToJson(_OrderDefaultsDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'default_prepayment_percent': instance.defaultPrepaymentPercent,
      'default_delivery_amount': instance.defaultDeliveryAmount,
      'is_active': instance.isActive,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
