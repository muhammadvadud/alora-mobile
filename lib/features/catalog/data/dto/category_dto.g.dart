// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'category_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryDto _$CategoryDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('CategoryDto', json, ($checkedConvert) {
      final val = CategoryDto(
        id: $checkedConvert('id', (v) => v as String),
        name: $checkedConvert('name', (v) => v as String),
        slug: $checkedConvert('slug', (v) => v as String),
        parent: $checkedConvert('parent', (v) => v as String?),
        sortOrder: $checkedConvert(
          'sort_order',
          (v) => (v as num?)?.toInt() ?? 0,
        ),
        isActive: $checkedConvert('is_active', (v) => v as bool? ?? true),
      );
      return val;
    }, fieldKeyMap: const {'sortOrder': 'sort_order', 'isActive': 'is_active'});

Map<String, dynamic> _$CategoryDtoToJson(CategoryDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'parent': ?instance.parent,
      'sort_order': instance.sortOrder,
      'is_active': instance.isActive,
    };
