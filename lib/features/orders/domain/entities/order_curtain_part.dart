import 'package:freezed_annotation/freezed_annotation.dart';

import 'order_variant.dart';

part 'order_curtain_part.freezed.dart';

@freezed
abstract class OrderCurtainPart with _$OrderCurtainPart {
  const factory OrderCurtainPart({
    required String id,
    OrderVariant? variant,
    String? role,
    double? widthM,
    double? heightM,
    double? coefficient,
    double? areaSqm,
    int? pricePerSqm,
    int? total,
    int? sortOrder,
  }) = _OrderCurtainPart;
}
