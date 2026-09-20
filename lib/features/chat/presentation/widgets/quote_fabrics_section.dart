import 'package:flutter/material.dart';
import 'package:alora_mobile/core/utils/money_format.dart';
import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/theme/app_radius.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/features/chat/domain/entities/quote.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/shared/widgets/color_dot.dart';
import 'package:alora_mobile/shared/widgets/section_label.dart';

/// Hisob kartochkasi bo'limi (S-05).
class QuoteFabricsSection extends StatelessWidget {
  final Quote quote;
  final bool showAllFabrics;
  final VoidCallback onShowMore;

  const QuoteFabricsSection({
    super.key,
    required this.quote,
    required this.showAllFabrics,
    required this.onShowMore,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final fabrics = quote.fabrics;

    final displayCount = showAllFabrics
        ? fabrics.length
        : (fabrics.length > 6 ? 4 : fabrics.length);
    final hiddenCount = fabrics.length - displayCount;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionLabel(l10n.chat_quote_fabrics),
        const SizedBox(height: AppSpacing.s),
        ...fabrics.take(displayCount).map((f) => _FabricRow(fabric: f)),
        if (hiddenCount > 0)
          TextButton(onPressed: onShowMore, child: Text(l10n.chat_quote_more(hiddenCount))),
      ],
    );
  }
}

class _FabricRow extends StatelessWidget {
  final QuoteFabric fabric;

  const _FabricRow({required this.fabric});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.text;
    final f = fabric;

    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.m),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xs, vertical: 2),
                      decoration: BoxDecoration(
                        color: colors.surfaceMuted,
                        borderRadius: AppRadius.smallBorder,
                      ),
                      child: Text(
                        f.role,
                        style: typography.labelS.copyWith(color: colors.textSecondary),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.xs),
                    if (f.colorHex.isNotEmpty) ...[
                      ColorDot(colorHex: f.colorHex, size: 10),
                      const SizedBox(width: AppSpacing.xs),
                    ],
                    Expanded(
                      child: Text(
                        f.colorName,
                        style: typography.bodyS,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                if (f.widthM > 0 || f.heightM > 0 || f.coef > 0 || f.pricePerSqm > 0)
                  Text(
                    '${f.widthM} m × ${f.heightM} m · K ${f.coef} · ${formatMoneyPlain(f.pricePerSqm)}/m²',
                    style: typography.bodyS.copyWith(color: colors.textSecondary),
                  ),
              ],
            ),
          ),
          SizedBox(
            width: 44,
            child: Text(
              '${f.areaSqm} m²',
              style: typography.bodyS.copyWith(color: colors.textSecondary),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: 82,
            child: Text(
              formatMoneyPlain(f.total),
              style: typography.bodyS.copyWith(fontWeight: FontWeight.w500),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
