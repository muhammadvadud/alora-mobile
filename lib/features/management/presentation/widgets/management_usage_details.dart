import 'package:flutter/material.dart';

import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/core/utils/money_format.dart';
import 'package:alora_mobile/features/management/domain/entities/usage_summary.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/shared/widgets/app_card.dart';
import 'package:alora_mobile/shared/widgets/section_label.dart';

/// Davr bo'yicha sarflangan quota tafsilotlari.
class ManagementUsageDetails extends StatelessWidget {
  final UsageSummary usage;

  const ManagementUsageDetails({super.key, required this.usage});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionLabel(l10n.management_usageDetails),
        const SizedBox(height: AppSpacing.m),
        AppCard(
          padding: const EdgeInsets.all(AppSpacing.l),
          child: Row(
            children: [
              Expanded(
                child: _UsageValue(
                  label: l10n.management_statCost,
                  value: '${formatMoneyPlain(usage.costUzs)} ${l10n.currency_som}',
                ),
              ),
              const SizedBox(width: AppSpacing.m),
              Expanded(
                child: _UsageValue(
                  label: l10n.management_usageTokens,
                  value: usage.tokens.toString(),
                ),
              ),
              const SizedBox(width: AppSpacing.m),
              Expanded(
                child: _UsageValue(
                  label: l10n.management_usageMessages,
                  value: usage.messages.toString(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _UsageValue extends StatelessWidget {
  final String label;
  final String value;

  const _UsageValue({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.text;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.centerLeft,
          child: Text(
            value,
            style: typography.titleM.copyWith(color: colors.textPrimary),
            maxLines: 1,
          ),
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          label,
          style: typography.labelS.copyWith(color: colors.textSecondary),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
