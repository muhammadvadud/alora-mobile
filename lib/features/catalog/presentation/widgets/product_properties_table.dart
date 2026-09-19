import 'package:flutter/material.dart';

import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/features/catalog/domain/entities/product.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';

/// Mahsulot xususiyatlari jadvali (Mato turi, Rulon eni, Tarkib, Parvarish).
class ProductPropertiesTable extends StatelessWidget {
  final Product product;

  const ProductPropertiesTable({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colors = context.colors;
    final typography = context.text;

    final rows = <(String, String)>[
      if (product.fabricType != null && product.fabricType!.isNotEmpty)
        (l10n.product_fabricType, product.fabricType!),
      if (product.defaultWidthM != null)
        (
          l10n.product_rollWidth,
          l10n.product_rollWidthValue(
            (product.defaultWidthM! * 100).round().toString(),
            l10n.product_unitCm,
          ),
        ),
      if (product.composition != null && product.composition!.isNotEmpty)
        (l10n.product_composition, product.composition!),
      if (product.care != null && product.care!.isNotEmpty) (l10n.product_care, product.care!),
    ];

    if (rows.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l10n.product_properties, style: typography.overline.copyWith(color: colors.brass)),
        const SizedBox(height: AppSpacing.s),
        for (final (label, value) in rows) ...[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Text(label, style: typography.bodyM.copyWith(color: colors.textSecondary)),
                ),
                Expanded(flex: 3, child: Text(value, style: typography.bodyM)),
              ],
            ),
          ),
        ],
      ],
    );
  }
}
