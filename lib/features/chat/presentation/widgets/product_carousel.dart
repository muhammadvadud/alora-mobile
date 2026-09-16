import 'package:flutter/material.dart';
import 'package:alora_mobile/features/chat/domain/entities/product_ref.dart';
import 'package:alora_mobile/shared/models/product_card_data.dart';
import 'package:alora_mobile/shared/models/price_unit.dart';
import 'package:alora_mobile/shared/widgets/product_card.dart';
import 'package:go_router/go_router.dart';

class ProductCarousel extends StatelessWidget {
  final List<ProductRef> products;

  const ProductCarousel({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) return const SizedBox.shrink();

    return SizedBox(
      height: 280,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final p = products[index];

          PriceUnit priceUnit = PriceUnit.unknown;
          if (p.priceUnit == 'per_sqm') {
            priceUnit = PriceUnit.perSqm;
          } else if (p.priceUnit == 'per_piece') {
            priceUnit = PriceUnit.perPiece;
          } else if (p.priceUnit == 'per_meter') {
            priceUnit = PriceUnit.perMeter;
          }

          final data = ProductCardData(
            id: p.id,
            name: p.name,
            price: p.price,
            priceUnit: priceUnit,
            imageUrl: p.imageUrl,
            colorHex: p.colorHex,
            colorName: p.colorName,
          );

          return Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? 0 : 0,
              right: index == products.length - 1 ? 0 : 0,
              bottom: 8,
            ),
            child: ProductCard(
              data: data,
              isCarousel: true,
              onTap: () {
                context.push('/catalog/products/${p.id}');
              },
            ),
          );
        },
      ),
    );
  }
}
