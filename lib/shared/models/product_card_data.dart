import 'package:alora_mobile/shared/models/price_unit.dart';

class ProductCardData {
  final String id;
  final String name;
  final String? imageUrl;
  final int price;
  final PriceUnit priceUnit;
  final String colorHex;
  final String colorName;

  const ProductCardData({
    required this.id,
    required this.name,
    this.imageUrl,
    required this.price,
    required this.priceUnit,
    required this.colorHex,
    required this.colorName,
  });
}
