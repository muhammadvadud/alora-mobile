import 'package:flutter/material.dart';

import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/core/utils/money_format.dart';
import 'package:alora_mobile/features/management/domain/entities/user_usage.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/shared/widgets/app_card.dart';
import 'package:alora_mobile/shared/widgets/empty_state.dart';
import 'package:alora_mobile/shared/widgets/section_label.dart';

/// Xodimlar reytingi jadvali (S-19).
///
/// `usage/by-user/` javobida `orders` maydoni yo'q, shuning uchun
/// faqat Xodim · Suhbat · Sarf ustunlari ko'rsatiladi.
class ManagementRankingTable extends StatelessWidget {
  final List<UserUsage> ranking;

  const ManagementRankingTable({super.key, required this.ranking});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionLabel(l10n.management_rankingTitle),
        const SizedBox(height: AppSpacing.m),
        if (ranking.isEmpty)
          AppCard(
            child: EmptyState(
              title: l10n.management_statsEmpty,
              message: l10n.placeholder_comingSoon,
            ),
          )
        else
          AppCard(
            padding: const EdgeInsets.all(AppSpacing.l),
            child: Column(
              children: [
                _HeaderRow(),
                const SizedBox(height: AppSpacing.m),
                for (var i = 0; i < ranking.length; i++) ...[
                  if (i > 0) const Divider(height: AppSpacing.m),
                  _RankingRow(item: ranking[i], index: i),
                ],
              ],
            ),
          ),
      ],
    );
  }
}

class _HeaderRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colors = context.colors;
    final style = context.text.labelS.copyWith(color: colors.textSecondary);

    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(l10n.management_rankingEmployeeCol.toUpperCase(), style: style),
        ),
        Expanded(
          flex: 1,
          child: Text(
            l10n.management_rankingChatsCol.toUpperCase(),
            style: style,
            textAlign: TextAlign.end,
          ),
        ),
        const SizedBox(width: AppSpacing.m),
        Expanded(
          flex: 1,
          child: Text(
            l10n.management_rankingCostCol.toUpperCase(),
            style: style,
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}

class _RankingRow extends StatelessWidget {
  final UserUsage item;
  final int index;

  const _RankingRow({required this.item, required this.index});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colors = context.colors;
    final typography = context.text;

    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Row(
            children: [
              Text(
                '${index + 1}.',
                style: typography.bodyS.copyWith(color: colors.textSecondary),
              ),
              const SizedBox(width: AppSpacing.s),
              Expanded(
                child: Text(
                  item.fullName ?? '—',
                  style: typography.bodyM.copyWith(color: colors.textPrimary),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            item.conversations.toString(),
            style: typography.bodyM.copyWith(color: colors.textPrimary),
            textAlign: TextAlign.end,
          ),
        ),
        const SizedBox(width: AppSpacing.m),
        Expanded(
          flex: 1,
          child: Text(
            '${formatMoneyPlain(item.costUzs)} ${l10n.currency_som}',
            style: typography.bodyM.copyWith(color: colors.textPrimary),
            textAlign: TextAlign.end,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}