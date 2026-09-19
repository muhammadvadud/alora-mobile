import 'package:flutter/material.dart';
import 'package:alora_mobile/core/utils/money_format.dart';
import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/features/chat/domain/entities/quote.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/shared/widgets/section_label.dart';

/// Hisob kartochkasi bo'limi (S-05).
class QuoteServicesSection extends StatelessWidget {
  final Quote quote;

  const QuoteServicesSection({super.key, required this.quote});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final typography = context.text;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.l),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionLabel(l10n.chat_quote_services),
          const SizedBox(height: AppSpacing.s),
          ...quote.services.map((s) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                children: [
                  Expanded(child: Text(s.name, style: typography.bodyS)),
                  SizedBox(
                    width: 82,
                    child: Text(
                      formatMoneyPlain(s.total),
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
