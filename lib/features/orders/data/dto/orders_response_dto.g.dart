// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'orders_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrdersResponseDto _$OrdersResponseDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_OrdersResponseDto', json, ($checkedConvert) {
      final val = _OrdersResponseDto(
        next: $checkedConvert('next', (v) => v as String?),
        previous: $checkedConvert('previous', (v) => v as String?),
        results: $checkedConvert(
          'results',
          (v) =>
              (v as List<dynamic>?)
                  ?.map((e) => OrderDto.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              const [],
        ),
      );
      return val;
    });

Map<String, dynamic> _$OrdersResponseDtoToJson(_OrdersResponseDto instance) =>
    <String, dynamic>{
      'next': ?instance.next,
      'previous': ?instance.previous,
      'results': instance.results.map((e) => e.toJson()).toList(),
    };
