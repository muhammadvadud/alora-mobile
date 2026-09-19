import 'package:flutter/material.dart';

import 'package:alora_mobile/app/theme/app_colors.dart';
import 'package:alora_mobile/app/theme/app_radius.dart';
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
      children: [
        for (final variant in variants)
          _VariantDot(
            colors: colors,
            variant: variant,
            isSelected: variant.id == selectedVariantId,
            onTap: () => onSelected(variant.id),
          ),
      ],
    );
  }
}

class _VariantDot extends StatelessWidget {
  final AppColors colors;
  final ProductVariant variant;
  final bool isSelected;
  final VoidCallback onTap;

  const _VariantDot({
    required this.colors,
    required this.variant,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final typography = context.text;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.fromLTRB(4, 4, 12, 4),
        decoration: BoxDecoration(
          borderRadius: AppRadius.pillBorder,
          border: Border.all(
            color: isSelected ? colors.accent : colors.border,
            width: isSelected ? 1.5 : 1,
          ),
          color: isSelected ? colors.surface : colors.background,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ColorDot(colorHex: variant.colorHex, size: 24),
            const SizedBox(width: 8),
            Text(
              variant.colorName,
              style: typography.bodyS.copyWith(
                color: isSelected ? colors.textPrimary : colors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
