// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

import 'order_dto.dart';

part 'orders_response_dto.freezed.dart';
part 'orders_response_dto.g.dart';

@freezed
abstract class OrdersResponseDto with _$OrdersResponseDto {
  const factory OrdersResponseDto({
    String? next,
    String? previous,
    @Default([]) List<OrderDto> results,
  }) = _OrdersResponseDto;

  factory OrdersResponseDto.fromJson(Map<String, dynamic> json) =>
      _$OrdersResponseDtoFromJson(json);
}
