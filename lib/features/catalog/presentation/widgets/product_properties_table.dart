import 'package:flutter/material.dart';

import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/features/catalog/domain/entities/product.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/shared/widgets/app_card.dart';
import 'package:alora_mobile/shared/widgets/section_label.dart';

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
        SectionLabel(l10n.product_properties),
        const SizedBox(height: AppSpacing.s),
        AppCard.sections(
          sections: [
            for (final (label, value) in rows)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      label,
                      style: typography.bodyS.copyWith(color: colors.textSecondary),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(value, style: typography.bodyL),
                  ),
                ],
              ),
          ],
        ),
      ],
    );
  }
}
