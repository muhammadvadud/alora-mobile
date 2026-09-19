import 'package:flutter/material.dart';
import 'package:alora_mobile/core/utils/money_format.dart';
import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/features/chat/domain/entities/quote.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/shared/widgets/section_label.dart';

/// Hisob kartochkasi bo'limi (S-05).
class QuoteAccessoriesSection extends StatelessWidget {
  final Quote quote;

  const QuoteAccessoriesSection({super.key, required this.quote});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final typography = context.text;
    final colors = context.colors;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.l),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionLabel(l10n.chat_quote_accessories),
          const SizedBox(height: AppSpacing.s),
          ...quote.accessories.map((a) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                children: [
                  Expanded(child: Text(a.name, style: typography.bodyS)),
                  SizedBox(
                    width: 44,
                    child: Text(
                      '${a.qty} ${a.unit}',
                      style: typography.bodyS.copyWith(
                        color: colors.textSecondary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    width: 82,
                    child: Text(
                      formatMoneyPlain(a.total),
                      style: typography.bodyS.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            );
          }),
          const SizedBox(height: AppSpacing.l),
        ],
      ),
    );
  }
}
