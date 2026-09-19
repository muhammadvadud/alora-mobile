// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'product_image_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductImageDto _$ProductImageDtoFromJson(Map<String, dynamic> json) => $checkedCreate(
  'ProductImageDto',
  json,
  ($checkedConvert) {
    final val = ProductImageDto(
      id: $checkedConvert('id', (v) => v as String),
      product: $checkedConvert('product', (v) => v as String),
      variant: $checkedConvert('variant', (v) => v as String),
      imageUrl: $checkedConvert('image', (v) => v as String),
      alt: $checkedConvert('alt', (v) => v as String?),
      sortOrder: $checkedConvert('sort_order', (v) => (v as num?)?.toInt() ?? 0),
      isPrimary: $checkedConvert('is_primary', (v) => v as bool? ?? false),
      isActive: $checkedConvert('is_active', (v) => v as bool? ?? true),
    );
    return val;
  },
  fieldKeyMap: const {
    'imageUrl': 'image',
    'sortOrder': 'sort_order',
    'isPrimary': 'is_primary',
    'isActive': 'is_active',
  },
);

Map<String, dynamic> _$ProductImageDtoToJson(ProductImageDto instance) => <String, dynamic>{
  'id': instance.id,
  'product': instance.product,
  'variant': instance.variant,
  'image': instance.imageUrl,
  'alt': ?instance.alt,
  'sort_order': instance.sortOrder,
  'is_primary': instance.isPrimary,
  'is_active': instance.isActive,
};
