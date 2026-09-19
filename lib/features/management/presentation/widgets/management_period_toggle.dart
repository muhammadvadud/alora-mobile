import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/features/management/application/management_period_notifier.dart';
import 'package:alora_mobile/features/management/domain/entities/usage_period.dart';
import 'package:alora_mobile/shared/widgets/app_chip.dart';

class ManagementPeriodToggle extends ConsumerWidget {
  const ManagementPeriodToggle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final period = ref.watch(managementPeriodProvider);
    final notifier = ref.read(managementPeriodProvider.notifier);

    return Row(
      children: [
        AppChip(
          label: l10n.management_periodToday,
          onTap: () => notifier.setPeriod(UsagePeriod.day),
          state: period == UsagePeriod.day
              ? AppChipState.selected
              : AppChipState.unselected,
        ),
        const SizedBox(width: AppSpacing.s),
        AppChip(
          label: l10n.management_periodWeek,
          onTap: () => notifier.setPeriod(UsagePeriod.week),
          state: period == UsagePeriod.week
              ? AppChipState.selected
              : AppChipState.unselected,
        ),
        const SizedBox(width: AppSpacing.s),
        AppChip(
          label: l10n.management_periodMonth,
          onTap: () => notifier.setPeriod(UsagePeriod.month),
          state: period == UsagePeriod.month
              ? AppChipState.selected
              : AppChipState.unselected,
        ),
      ],
    );
  }
}
