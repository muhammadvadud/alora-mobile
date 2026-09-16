import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_ref.freezed.dart';

@freezed
abstract class ProductRef with _$ProductRef {
  const factory ProductRef({
    required String id,
    required String name,
    required String category,
    required int price,
    required String priceUnit,
    required String imageUrl,
    required String colorHex,
    required String colorName,
  }) = _ProductRef;
}
