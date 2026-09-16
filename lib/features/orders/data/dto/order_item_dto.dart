// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_item_dto.freezed.dart';
part 'order_item_dto.g.dart';

@freezed
abstract class OrderItemDto with _$OrderItemDto {
  const factory OrderItemDto({
    required String id,
    @JsonKey(name: 'service_key') String? serviceKey,
    @JsonKey(name: 'name_snapshot') String? nameSnapshot,
    String? qty,
    String? unit,
    @JsonKey(name: 'unit_price') String? unitPrice,
    String? total,
    @JsonKey(name: 'sort_order') int? sortOrder,
  }) = _OrderItemDto;

  factory OrderItemDto.fromJson(Map<String, dynamic> json) =>
      _$OrderItemDtoFromJson(json);
}
