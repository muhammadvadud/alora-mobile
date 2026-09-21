import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../shared/models/price_unit.dart';

part 'order_variant.freezed.dart';

/// Buyurtma bilan snapshot qilingan katalog varianti (matn/aksessuar uchun).
@freezed
abstract class OrderVariant with _$OrderVariant {
  const factory OrderVariant({
    required String id,
    String? sku,
    String? colorName,
    String? productName,
    PriceUnit? priceUnit,
  }) = _OrderVariant;
}
