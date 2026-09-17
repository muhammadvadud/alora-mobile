import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_defaults_dto.freezed.dart';
part 'order_defaults_dto.g.dart';

@freezed
abstract class OrderDefaultsDto with _$OrderDefaultsDto {
  const factory OrderDefaultsDto({
    required String id,
    @JsonKey(name: 'default_prepayment_percent')
    required String defaultPrepaymentPercent,
    @JsonKey(name: 'default_delivery_amount')
    required String defaultDeliveryAmount,
    @JsonKey(name: 'is_active') required bool isActive,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
  }) = _OrderDefaultsDto;

  factory OrderDefaultsDto.fromJson(Map<String, dynamic> json) =>
      _$OrderDefaultsDtoFromJson(json);
}
