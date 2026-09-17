// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'calc_preview_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CalcPreviewRequestDto _$CalcPreviewRequestDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_CalcPreviewRequestDto',
  json,
  ($checkedConvert) {
    final val = _CalcPreviewRequestDto(
      measurements: $checkedConvert(
        'measurements',
        (v) => (v as List<dynamic>)
            .map(
              (e) =>
                  CalcPreviewMeasurementDto.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
      services: $checkedConvert(
        'services',
        (v) => (v as List<dynamic>).map((e) => e as String).toList(),
      ),
      discountPercent: $checkedConvert('discount_percent', (v) => v as String),
      delivery: $checkedConvert('delivery', (v) => v as bool),
    );
    return val;
  },
  fieldKeyMap: const {'discountPercent': 'discount_percent'},
);

Map<String, dynamic> _$CalcPreviewRequestDtoToJson(
  _CalcPreviewRequestDto instance,
) => <String, dynamic>{
  'measurements': instance.measurements.map((e) => e.toJson()).toList(),
  'services': instance.services,
  'discount_percent': instance.discountPercent,
  'delivery': instance.delivery,
};

_CalcPreviewMeasurementDto _$CalcPreviewMeasurementDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_CalcPreviewMeasurementDto', json, ($checkedConvert) {
  final val = _CalcPreviewMeasurementDto(
    length: $checkedConvert('length', (v) => v as String),
    height: $checkedConvert('height', (v) => v as String),
    parts: $checkedConvert(
      'parts',
      (v) => (v as List<dynamic>)
          .map((e) => CalcPreviewPartDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
    accessories: $checkedConvert(
      'accessories',
      (v) => (v as List<dynamic>)
          .map(
            (e) => CalcPreviewAccessoryDto.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$CalcPreviewMeasurementDtoToJson(
  _CalcPreviewMeasurementDto instance,
) => <String, dynamic>{
  'length': instance.length,
  'height': instance.height,
  'parts': instance.parts.map((e) => e.toJson()).toList(),
  'accessories': instance.accessories.map((e) => e.toJson()).toList(),
};

_CalcPreviewPartDto _$CalcPreviewPartDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_CalcPreviewPartDto',
      json,
      ($checkedConvert) {
        final val = _CalcPreviewPartDto(
          variantId: $checkedConvert('variant_id', (v) => v as String),
          role: $checkedConvert('role', (v) => v as String),
          widthM: $checkedConvert('width_m', (v) => v as String),
          heightM: $checkedConvert('height_m', (v) => v as String),
          coef: $checkedConvert('coef', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {
        'variantId': 'variant_id',
        'widthM': 'width_m',
        'heightM': 'height_m',
      },
    );

Map<String, dynamic> _$CalcPreviewPartDtoToJson(_CalcPreviewPartDto instance) =>
    <String, dynamic>{
      'variant_id': instance.variantId,
      'role': instance.role,
      'width_m': instance.widthM,
      'height_m': instance.heightM,
      'coef': instance.coef,
    };

_CalcPreviewAccessoryDto _$CalcPreviewAccessoryDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_CalcPreviewAccessoryDto', json, ($checkedConvert) {
  final val = _CalcPreviewAccessoryDto(
    variantId: $checkedConvert('variant_id', (v) => v as String),
    qty: $checkedConvert('qty', (v) => v as String),
  );
  return val;
}, fieldKeyMap: const {'variantId': 'variant_id'});

Map<String, dynamic> _$CalcPreviewAccessoryDtoToJson(
  _CalcPreviewAccessoryDto instance,
) => <String, dynamic>{'variant_id': instance.variantId, 'qty': instance.qty};

_CalcPreviewResponseDto _$CalcPreviewResponseDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_CalcPreviewResponseDto',
  json,
  ($checkedConvert) {
    final val = _CalcPreviewResponseDto(
      measurements: $checkedConvert(
        'measurements',
        (v) => (v as List<dynamic>)
            .map(
              (e) => CalcPreviewResponseMeasurementDto.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
      services: $checkedConvert(
        'services',
        (v) => (v as List<dynamic>)
            .map(
              (e) => CalcPreviewResponseServiceDto.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
      subtotal: $checkedConvert('subtotal', (v) => v as String),
      tierDiscountPercent: $checkedConvert(
        'tier_discount_percent',
        (v) => v as String,
      ),
      manualDiscountPercent: $checkedConvert(
        'manual_discount_percent',
        (v) => v as String,
      ),
      discountPercent: $checkedConvert('discount_percent', (v) => v as String),
      discountAmount: $checkedConvert('discount_amount', (v) => v as String),
      deliveryAmount: $checkedConvert('delivery_amount', (v) => v as String),
      total: $checkedConvert('total', (v) => v as String),
      warnings: $checkedConvert(
        'warnings',
        (v) => (v as List<dynamic>).map((e) => e as String).toList(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'tierDiscountPercent': 'tier_discount_percent',
    'manualDiscountPercent': 'manual_discount_percent',
    'discountPercent': 'discount_percent',
    'discountAmount': 'discount_amount',
    'deliveryAmount': 'delivery_amount',
  },
);

Map<String, dynamic> _$CalcPreviewResponseDtoToJson(
  _CalcPreviewResponseDto instance,
) => <String, dynamic>{
  'measurements': instance.measurements.map((e) => e.toJson()).toList(),
  'services': instance.services.map((e) => e.toJson()).toList(),
  'subtotal': instance.subtotal,
  'tier_discount_percent': instance.tierDiscountPercent,
  'manual_discount_percent': instance.manualDiscountPercent,
  'discount_percent': instance.discountPercent,
  'discount_amount': instance.discountAmount,
  'delivery_amount': instance.deliveryAmount,
  'total': instance.total,
  'warnings': instance.warnings,
};

_CalcPreviewResponseMeasurementDto _$CalcPreviewResponseMeasurementDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_CalcPreviewResponseMeasurementDto',
  json,
  ($checkedConvert) {
    final val = _CalcPreviewResponseMeasurementDto(
      roomName: $checkedConvert('room_name', (v) => v as String),
      parts: $checkedConvert(
        'parts',
        (v) => (v as List<dynamic>)
            .map(
              (e) => CalcPreviewResponsePartDto.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
      accessories: $checkedConvert(
        'accessories',
        (v) => (v as List<dynamic>)
            .map(
              (e) => CalcPreviewResponseAccessoryDto.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {'roomName': 'room_name'},
);

Map<String, dynamic> _$CalcPreviewResponseMeasurementDtoToJson(
  _CalcPreviewResponseMeasurementDto instance,
) => <String, dynamic>{
  'room_name': instance.roomName,
  'parts': instance.parts.map((e) => e.toJson()).toList(),
  'accessories': instance.accessories.map((e) => e.toJson()).toList(),
};

_CalcPreviewResponsePartDto _$CalcPreviewResponsePartDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_CalcPreviewResponsePartDto',
  json,
  ($checkedConvert) {
    final val = _CalcPreviewResponsePartDto(
      role: $checkedConvert('role', (v) => v as String),
      variantId: $checkedConvert('variant_id', (v) => v as String),
      colorName: $checkedConvert('color_name', (v) => v as String),
      widthM: $checkedConvert('width_m', (v) => v as String),
      heightM: $checkedConvert('height_m', (v) => v as String),
      coef: $checkedConvert('coef', (v) => v as String),
      areaSqm: $checkedConvert('area_sqm', (v) => v as String),
      pricePerSqm: $checkedConvert('price_per_sqm', (v) => v as String),
      total: $checkedConvert('total', (v) => v as String),
    );
    return val;
  },
  fieldKeyMap: const {
    'variantId': 'variant_id',
    'colorName': 'color_name',
    'widthM': 'width_m',
    'heightM': 'height_m',
    'areaSqm': 'area_sqm',
    'pricePerSqm': 'price_per_sqm',
  },
);

Map<String, dynamic> _$CalcPreviewResponsePartDtoToJson(
  _CalcPreviewResponsePartDto instance,
) => <String, dynamic>{
  'role': instance.role,
  'variant_id': instance.variantId,
  'color_name': instance.colorName,
  'width_m': instance.widthM,
  'height_m': instance.heightM,
  'coef': instance.coef,
  'area_sqm': instance.areaSqm,
  'price_per_sqm': instance.pricePerSqm,
  'total': instance.total,
};

_CalcPreviewResponseAccessoryDto _$CalcPreviewResponseAccessoryDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_CalcPreviewResponseAccessoryDto',
  json,
  ($checkedConvert) {
    final val = _CalcPreviewResponseAccessoryDto(
      variantId: $checkedConvert('variant_id', (v) => v as String),
      colorName: $checkedConvert('color_name', (v) => v as String),
      qty: $checkedConvert('qty', (v) => v as String),
      unitPrice: $checkedConvert('unit_price', (v) => v as String),
      total: $checkedConvert('total', (v) => v as String),
    );
    return val;
  },
  fieldKeyMap: const {
    'variantId': 'variant_id',
    'colorName': 'color_name',
    'unitPrice': 'unit_price',
  },
);

Map<String, dynamic> _$CalcPreviewResponseAccessoryDtoToJson(
  _CalcPreviewResponseAccessoryDto instance,
) => <String, dynamic>{
  'variant_id': instance.variantId,
  'color_name': instance.colorName,
  'qty': instance.qty,
  'unit_price': instance.unitPrice,
  'total': instance.total,
};

_CalcPreviewResponseServiceDto _$CalcPreviewResponseServiceDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_CalcPreviewResponseServiceDto', json, ($checkedConvert) {
  final val = _CalcPreviewResponseServiceDto(
    key: $checkedConvert('key', (v) => v as String),
    name: $checkedConvert('name', (v) => v as String),
    total: $checkedConvert('total', (v) => v as String),
  );
  return val;
});

Map<String, dynamic> _$CalcPreviewResponseServiceDtoToJson(
  _CalcPreviewResponseServiceDto instance,
) => <String, dynamic>{
  'key': instance.key,
  'name': instance.name,
  'total': instance.total,
};
