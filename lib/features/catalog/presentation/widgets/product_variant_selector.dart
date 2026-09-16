import 'package:flutter/material.dart';

import 'package:alora_mobile/app/theme/app_colors.dart';
import 'package:alora_mobile/features/catalog/domain/entities/product.dart';
import 'package:alora_mobile/features/catalog/domain/entities/product_variant.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/shared/widgets/color_dot.dart';

/// Rang variantlari — aylana chip'lar. Tanlanganda narx va rasm o'zgaradi.
class ProductVariantSelector extends StatelessWidget {
  final Product product;
  final String? selectedVariantId;
  final ValueChanged<String> onSelected;

  const ProductVariantSelector({
    super.key,
    required this.product,
    required this.selectedVariantId,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    final variants = product.variants.where((v) => v.isActive).toList();
    if (variants.isEmpty) return const SizedBox.shrink();

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [for (final variant in variants) _variantDot(colors, variant)],
    );
  }

  Widget _variantDot(AppColors colors, ProductVariant variant) {
    final isSelected = variant.id == selectedVariantId;

    return GestureDetector(
      onTap: () => onSelected(variant.id),
      child: Container(
        width: 28,
        height: 28,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected ? colors.accent : colors.border,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: ColorDot(colorHex: variant.colorHex, size: 20),
      ),
    );
  }
}
