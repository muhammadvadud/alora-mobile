import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/router/adaptive_shell.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/core/error/failure.dart';
import 'package:alora_mobile/core/error/failure_l10n.dart';
import 'package:alora_mobile/features/management/application/management_home_notifier.dart';
import 'package:alora_mobile/features/management/presentation/widgets/management_period_toggle.dart';
import 'package:alora_mobile/features/management/presentation/widgets/management_ranking_table.dart';
import 'package:alora_mobile/features/management/presentation/widgets/management_sections_list.dart';
import 'package:alora_mobile/features/management/presentation/widgets/management_spend_chart.dart';
import 'package:alora_mobile/features/management/presentation/widgets/management_stat_cards.dart';
import 'package:alora_mobile/features/management/presentation/widgets/management_usage_details.dart';
import 'package:alora_mobile/shared/widgets/error_state.dart';
import 'package:alora_mobile/shared/widgets/skeleton.dart';

/// Boshqaruv bosh sahifasi (S-19).
class ManagementScreen extends ConsumerWidget {
  const ManagementScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final home = ref.watch(managementHomeProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.tab_management)),
      body: TabletCentered(
        child: RefreshIndicator(
          onRefresh: () => ref.refresh(managementHomeProvider.future),
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.screenH,
              vertical: AppSpacing.l,
            ),
            children: [
              const ManagementPeriodToggle(),
              const SizedBox(height: AppSpacing.xl),
              home.maybeWhen(
                loading: () =>
                    const SkeletonList(itemCount: 4, itemBuilder: SkeletonBox(height: 84)),
                error: (error, _) => ErrorState(
                  message: (error as Failure).localizedMessage(context),
                  onRetry: () => ref.invalidate(managementHomeProvider),
                ),
                data: (data) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ManagementStatCards(usage: data.usage, conversion: data.conversion),
                    const SizedBox(height: AppSpacing.xl),
                    ManagementUsageDetails(usage: data.usage),
                    const SizedBox(height: AppSpacing.xl),
                    ManagementSpendChart(daily: data.usage.daily),
                    const SizedBox(height: AppSpacing.xl),
                    ManagementRankingTable(ranking: data.ranking),
                    const SizedBox(height: AppSpacing.xl),
                    const ManagementSectionsList(),
                  ],
                ),
                orElse: () => const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
