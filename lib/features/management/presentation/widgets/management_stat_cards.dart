import 'package:flutter/material.dart';

import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/core/utils/money_format.dart';
import 'package:alora_mobile/features/management/domain/entities/conversion_stats.dart';
import 'package:alora_mobile/features/management/domain/entities/usage_summary.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/shared/widgets/app_card.dart';

/// Statistika kartochkalari (S-19): Suhbatlar · Buyurtmalar · Konversiya · Sarf.
class ManagementStatCards extends StatelessWidget {
  final UsageSummary usage;
  final ConversionStats conversion;

  const ManagementStatCards({super.key, required this.usage, required this.conversion});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final rate = conversion.conversionRate;

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _StatCard(
                label: l10n.management_statThreads,
                value: usage.conversations.toString(),
              ),
            ),
            const SizedBox(width: AppSpacing.m),
            Expanded(
              child: _StatCard(
                label: l10n.management_statOrders,
                value: conversion.withOrder.toString(),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.m),
        Row(
          children: [
            Expanded(
              child: _StatCard(
                label: l10n.management_statConversion,
                value: rate == null ? '—' : '${rate.round()}%',
              ),
            ),
            const SizedBox(width: AppSpacing.m),
            Expanded(
              child: _StatCard(
                label: l10n.management_statCost,
                value: '${formatMoneyPlain(usage.costUzs)} ${l10n.currency_som}',
                isMoney: true,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label;
  final String value;
  final bool isMoney;

  const _StatCard({required this.label, required this.value, this.isMoney = false});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.text;

    return AppCard(
      padding: const EdgeInsets.all(AppSpacing.l),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: typography.displayM.copyWith(
              color: colors.textPrimary,
              fontFeatures: const [FontFeature.tabularFigures()],
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: AppSpacing.s),
          Text(
            label,
            style: typography.bodyS.copyWith(color: colors.textSecondary),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
