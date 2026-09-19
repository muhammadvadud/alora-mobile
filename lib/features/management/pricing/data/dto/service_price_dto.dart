import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_price_dto.freezed.dart';
part 'service_price_dto.g.dart';

@freezed
abstract class ServicePriceDto with _$ServicePriceDto {
  const factory ServicePriceDto({
    required String id,
    required String key,
    required String name,
    required String price,
    required String unit,
    @JsonKey(name: 'is_active') required bool isActive,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
  }) = _ServicePriceDto;

  factory ServicePriceDto.fromJson(Map<String, dynamic> json) => _$ServicePriceDtoFromJson(json);
}
