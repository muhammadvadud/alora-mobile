import 'package:freezed_annotation/freezed_annotation.dart';

part 'calc_preview_dto.freezed.dart';
part 'calc_preview_dto.g.dart';

@freezed
abstract class CalcPreviewRequestDto with _$CalcPreviewRequestDto {
  const factory CalcPreviewRequestDto({
    required List<CalcPreviewMeasurementDto> measurements,
    required List<String> services,
    @JsonKey(name: 'discount_percent') @Default('0') String discountPercent,
    @Default(false) bool delivery,
  }) = _CalcPreviewRequestDto;

  factory CalcPreviewRequestDto.fromJson(Map<String, dynamic> json) =>
      _$CalcPreviewRequestDtoFromJson(json);
}

@freezed
abstract class CalcPreviewMeasurementDto with _$CalcPreviewMeasurementDto {
  const factory CalcPreviewMeasurementDto({
    required String length,
    required String height,
    required List<CalcPreviewPartDto> parts,
    required List<CalcPreviewAccessoryDto> accessories,
  }) = _CalcPreviewMeasurementDto;

  factory CalcPreviewMeasurementDto.fromJson(Map<String, dynamic> json) =>
      _$CalcPreviewMeasurementDtoFromJson(json);
}

@freezed
abstract class CalcPreviewPartDto with _$CalcPreviewPartDto {
  const factory CalcPreviewPartDto({
    @JsonKey(name: 'variant_id') required String variantId,
    required String role,
    @JsonKey(name: 'width_m') required String widthM,
    @JsonKey(name: 'height_m') required String heightM,
    required String coef,
  }) = _CalcPreviewPartDto;

  factory CalcPreviewPartDto.fromJson(Map<String, dynamic> json) =>
      _$CalcPreviewPartDtoFromJson(json);
}

@freezed
abstract class CalcPreviewAccessoryDto with _$CalcPreviewAccessoryDto {
  const factory CalcPreviewAccessoryDto({
    @JsonKey(name: 'variant_id') required String variantId,
    required String qty,
  }) = _CalcPreviewAccessoryDto;

  factory CalcPreviewAccessoryDto.fromJson(Map<String, dynamic> json) =>
      _$CalcPreviewAccessoryDtoFromJson(json);
}

@freezed
abstract class CalcPreviewResponseDto with _$CalcPreviewResponseDto {
  const factory CalcPreviewResponseDto({
    required List<CalcPreviewResponseMeasurementDto> measurements,
    required List<CalcPreviewResponseServiceDto> services,
    required String subtotal,
    @JsonKey(name: 'tier_discount_percent') required String tierDiscountPercent,
    @JsonKey(name: 'manual_discount_percent')
    required String manualDiscountPercent,
    @JsonKey(name: 'discount_percent') required String discountPercent,
    @JsonKey(name: 'discount_amount') required String discountAmount,
    @JsonKey(name: 'delivery_amount') required String deliveryAmount,
    required String total,
    required List<String> warnings,
  }) = _CalcPreviewResponseDto;

  factory CalcPreviewResponseDto.fromJson(Map<String, dynamic> json) =>
      _$CalcPreviewResponseDtoFromJson(json);
}

@freezed
abstract class CalcPreviewResponseMeasurementDto
    with _$CalcPreviewResponseMeasurementDto {
  const factory CalcPreviewResponseMeasurementDto({
    @JsonKey(name: 'room_name') required String roomName,
    required List<CalcPreviewResponsePartDto> parts,
    required List<CalcPreviewResponseAccessoryDto> accessories,
  }) = _CalcPreviewResponseMeasurementDto;

  factory CalcPreviewResponseMeasurementDto.fromJson(
    Map<String, dynamic> json,
  ) => _$CalcPreviewResponseMeasurementDtoFromJson(json);
}

@freezed
abstract class CalcPreviewResponsePartDto with _$CalcPreviewResponsePartDto {
  const factory CalcPreviewResponsePartDto({
    required String role,
    @JsonKey(name: 'variant_id') required String variantId,
    @JsonKey(name: 'color_name') required String colorName,
    @JsonKey(name: 'width_m') required String widthM,
    @JsonKey(name: 'height_m') required String heightM,
    required String coef,
    @JsonKey(name: 'area_sqm') required String areaSqm,
    @JsonKey(name: 'price_per_sqm') required String pricePerSqm,
    required String total,
  }) = _CalcPreviewResponsePartDto;

  factory CalcPreviewResponsePartDto.fromJson(Map<String, dynamic> json) =>
      _$CalcPreviewResponsePartDtoFromJson(json);
}

@freezed
abstract class CalcPreviewResponseAccessoryDto
    with _$CalcPreviewResponseAccessoryDto {
  const factory CalcPreviewResponseAccessoryDto({
    @JsonKey(name: 'variant_id') required String variantId,
    @JsonKey(name: 'color_name') required String colorName,
    required String qty,
    @JsonKey(name: 'unit_price') required String unitPrice,
    required String total,
  }) = _CalcPreviewResponseAccessoryDto;

  factory CalcPreviewResponseAccessoryDto.fromJson(Map<String, dynamic> json) =>
      _$CalcPreviewResponseAccessoryDtoFromJson(json);
}

@freezed
abstract class CalcPreviewResponseServiceDto
    with _$CalcPreviewResponseServiceDto {
  const factory CalcPreviewResponseServiceDto({
    required String key,
    required String name,
    required String total,
  }) = _CalcPreviewResponseServiceDto;

  factory CalcPreviewResponseServiceDto.fromJson(Map<String, dynamic> json) =>
      _$CalcPreviewResponseServiceDtoFromJson(json);
}
