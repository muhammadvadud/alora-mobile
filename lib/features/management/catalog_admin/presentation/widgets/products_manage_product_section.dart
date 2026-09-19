import 'package:flutter/material.dart';
import 'package:alora_mobile/shared/widgets/app_card.dart';
import 'package:alora_mobile/app/theme/app_radius.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/features/catalog/domain/entities/product.dart';
import 'package:alora_mobile/features/catalog/domain/entities/product_variant.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/shared/icons/app_icons.dart';
import 'package:alora_mobile/shared/widgets/color_dot.dart';
import 'package:alora_mobile/shared/widgets/money_text.dart';
import 'package:alora_mobile/shared/widgets/unit_text.dart';

/// Mahsulot bo'limi (S-22): sarlavha + variant qatorlari, tanlash/faollik.
class ProductsManageProductSection extends StatelessWidget {
  final Product product;
  final Set<String> selectedIds;
  final bool selectionMode;
  final void Function(ProductVariant) onToggleSelection;
  final void Function(ProductVariant, bool) onToggleActive;

  const ProductsManageProductSection({
    super.key,
    required this.product,
    required this.selectedIds,
    required this.selectionMode,
    required this.onToggleSelection,
    required this.onToggleActive,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.m),
      child: AppCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(product.name, style: context.text.titleS),
            if (product.code.isNotEmpty)
              Text(product.code, style: context.text.bodyS.copyWith(color: colors.textSecondary)),
            if (product.variants.isNotEmpty) const Divider(height: AppSpacing.xl),
            for (final variant in product.variants)
              _VariantRow(
                variant: variant,
                selected: selectedIds.contains(variant.id),
                selectionMode: selectionMode,
                onToggleSelection: () => onToggleSelection(variant),
                onToggleActive: (value) => onToggleActive(variant, value),
              ),
          ],
        ),
      ),
    );
  }
}

class _VariantRow extends StatelessWidget {
  final ProductVariant variant;
  final bool selected;
  final bool selectionMode;
  final VoidCallback onToggleSelection;
  final ValueChanged<bool> onToggleActive;

  const _VariantRow({
    required this.variant,
    required this.selected,
    required this.selectionMode,
    required this.onToggleSelection,
    required this.onToggleActive,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return InkWell(
      onLongPress: onToggleSelection,
      onTap: selectionMode ? onToggleSelection : null,
      borderRadius: AppRadius.cardBorder,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.s),
        child: Row(
          children: [
            ColorDot(colorHex: variant.colorHex, size: 14),
            const SizedBox(width: AppSpacing.m),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(variant.colorName, style: context.text.bodyM),
                  Text(
                    variant.sku,
                    style: context.text.bodyS.copyWith(color: colors.textSecondary),
                  ),
                ],
              ),
            ),
            const SizedBox(width: AppSpacing.m),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                UnitText(amount: variant.price, unit: variant.priceUnit),
                if (variant.oldPrice != null)
                  MoneyText(
                    amount: variant.oldPrice!,
                    style: context.text.bodyS.copyWith(
                      color: colors.textDisabled,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
              ],
            ),
            const SizedBox(width: AppSpacing.s),
            if (selectionMode)
              Icon(
                selected ? AppIcons.check : AppIcons.close,
                size: 18,
                color: selected ? colors.accent : colors.textDisabled,
              )
            else
              Switch(value: variant.isActive, onChanged: onToggleActive),
          ],
        ),
      ),
    );
  }
}
