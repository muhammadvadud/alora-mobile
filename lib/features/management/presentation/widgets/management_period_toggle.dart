import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/features/management/application/management_period_notifier.dart';
import 'package:alora_mobile/features/management/domain/entities/usage_period.dart';
import 'package:alora_mobile/shared/widgets/app_chip.dart';

/// Boshqaruv bosh sahifasidagi davr o'tkazgich (Bugun/Hafta/Oy, S-19).
class ManagementPeriodToggle extends ConsumerWidget {
  const ManagementPeriodToggle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final period = ref.watch(managementPeriodProvider);
    final notifier = ref.read(managementPeriodProvider.notifier);

    return Row(
      children: [
        _chip(
          context,
          label: l10n.management_periodToday,
          state: period == UsagePeriod.day,
          onTap: () => notifier.setPeriod(UsagePeriod.day),
        ),
        const SizedBox(width: AppSpacing.s),
        _chip(
          context,
          label: l10n.management_periodWeek,
          state: period == UsagePeriod.week,
          onTap: () => notifier.setPeriod(UsagePeriod.week),
        ),
        const SizedBox(width: AppSpacing.s),
        _chip(
          context,
          label: l10n.management_periodMonth,
          state: period == UsagePeriod.month,
          onTap: () => notifier.setPeriod(UsagePeriod.month),
        ),
      ],
    );
  }

  Widget _chip(
    BuildContext context, {
    required String label,
    required bool state,
    required VoidCallback onTap,
  }) {
    return AppChip(
      label: label,
      onTap: onTap,
      state: state ? AppChipState.selected : AppChipState.unselected,
    );
  }
}