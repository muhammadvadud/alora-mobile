import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/core/error/failure.dart';
import 'package:alora_mobile/core/error/failure_l10n.dart';
import 'package:alora_mobile/core/utils/money_format.dart';
import 'package:alora_mobile/features/profile/application/profile_spend_data.dart';
import 'package:alora_mobile/features/profile/application/profile_spend_notifier.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/shared/widgets/app_button.dart';
import 'package:alora_mobile/shared/widgets/app_card.dart';
import 'package:alora_mobile/shared/widgets/limit_progress_bar.dart';
import 'package:alora_mobile/shared/widgets/section_label.dart';
import 'package:alora_mobile/shared/widgets/skeleton.dart';

/// Bugungi sarf va limit bloki (S-25, 10.3).
class SpendSection extends ConsumerWidget {
  const SpendSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final spend = ref.watch(profileSpendProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionLabel(l10n.profile_todaySpend),
        const SizedBox(height: AppSpacing.m),
        AppCard(
          child: spend.maybeWhen(
            loading: () => const SkeletonBox(height: 60),
            error: (error, _) =>
                _SpendError(message: (error as Failure).localizedMessage(context)),
            data: (data) => _SpendContent(data: data),
            orElse: () => const SkeletonBox(height: 60),
          ),
        ),
      ],
    );
  }
}

class _SpendError extends ConsumerWidget {
  final String message;

  const _SpendError({required this.message});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final colors = context.colors;
    return Row(
      children: [
        Expanded(
          child: Text(
            message,
            style: context.text.bodyS.copyWith(color: colors.textSecondary),
          ),
        ),
        AppButton.text(
          text: l10n.common_retry,
          onPressed: () => ref.invalidate(profileSpendProvider),
        ),
      ],
    );
  }
}

class _SpendContent extends StatelessWidget {
  final ProfileSpendData data;

  const _SpendContent({required this.data});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colors = context.colors;
    final typography = context.text;
    final limit = data.limit;
    final todayCost = data.todayCost;

    if (limit == null) {
      return _notSet(context);
    }

    if (limit.isUnlimited) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  l10n.profile_todaySpend,
                  style: typography.bodyM.copyWith(color: colors.textSecondary),
                ),
              ),
              Text('∞', style: typography.displayM.copyWith(color: colors.accent)),
            ],
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            l10n.profile_unlimited,
            style: typography.bodyS.copyWith(color: colors.textSecondary),
          ),
        ],
      );
    }

    final maxCost = limit.maxCost;
    if (maxCost == null) {
      return _notSet(context);
    }

    final fractionText = todayCost == null
        ? '${formatMoneyPlain(maxCost)} ${l10n.currency_som}'
        : '${formatMoneyPlain(todayCost)} / ${formatMoneyPlain(maxCost)} ${l10n.currency_som}';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                l10n.profile_todaySpend,
                style: typography.bodyM.copyWith(color: colors.textSecondary),
              ),
            ),
            Text(
              fractionText,
              style: typography.titleS.copyWith(color: colors.textPrimary),
            ),
          ],
        ),
        if (todayCost != null) ...[
          const SizedBox(height: AppSpacing.m),
          LimitProgressBar(progress: maxCost <= 0 ? 0 : todayCost / maxCost),
        ],
        const SizedBox(height: AppSpacing.s),
        Text(
          l10n.profile_limitDailyReset,
          style: context.text.bodyS.copyWith(color: colors.textSecondary),
        ),
      ],
    );
  }

  Widget _notSet(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colors = context.colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.profile_limitNotSet,
          style: context.text.titleS.copyWith(color: colors.textPrimary),
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          l10n.profile_limitDailyReset,
          style: context.text.bodyS.copyWith(color: colors.textSecondary),
        ),
      ],
    );
  }
}