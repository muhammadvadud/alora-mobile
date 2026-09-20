import 'package:flutter/material.dart';
import 'package:alora_mobile/shared/widgets/app_card.dart';
import 'package:alora_mobile/shared/widgets/error_state.dart';
import 'package:alora_mobile/shared/icons/app_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alora_mobile/app/theme/app_radius.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/features/management/pricing/application/pricing_notifier.dart';
import 'package:alora_mobile/features/management/pricing/presentation/widgets/calc_preview_sheet.dart';
import 'package:alora_mobile/features/management/pricing/presentation/widgets/discount_policy_form.dart';
import 'package:alora_mobile/features/management/pricing/presentation/widgets/discount_tiers_section.dart';
import 'package:alora_mobile/features/management/pricing/presentation/widgets/order_defaults_section.dart';
import 'package:alora_mobile/features/management/pricing/presentation/widgets/pricing_coefficients_section.dart';
import 'package:alora_mobile/features/management/pricing/presentation/widgets/pricing_section_title.dart';
import 'package:alora_mobile/features/management/pricing/presentation/widgets/service_prices_section.dart';
import 'package:alora_mobile/shared/extensions/l10n_extension.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/shared/widgets/skeleton.dart';

/// Narx va hisob qoidalari ekrani (S-23).
class PricingRulesScreen extends ConsumerWidget {
  const PricingRulesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(pricingProvider);
    final notifier = ref.read(pricingProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.management_pricingTitle),
        actions: [
          IconButton(
            icon: const Icon(AppIcons.calculator),
            onPressed: () => _showPreviewSheet(context),
            tooltip: context.l10n.management_pricingTest,
          ),
        ],
      ),
      body: state.isLoading
          ? const Padding(
              padding: EdgeInsets.all(AppSpacing.m),
              child: SkeletonList(
                itemCount: 5,
                itemBuilder: SkeletonBox(
                  width: double.infinity,
                  height: 60,
                  borderRadius: AppRadius.card,
                ),
                separator: SizedBox(height: AppSpacing.s),
              ),
            )
          : state.error != null
          ? ErrorState(message: state.error, onRetry: () => notifier.loadData())
          : RefreshIndicator(
              onRefresh: () => notifier.loadData(),
              child: ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.screenH,
                  vertical: AppSpacing.l,
                ),
                children: [
                  PricingSectionTitle(title: context.l10n.management_pricingCoefs),
                  PricingCoefficientsSection(rules: state.calcRules),
                  const SizedBox(height: AppSpacing.xl),

                  PricingSectionTitle(title: context.l10n.management_pricingServicesTitle),
                  ServicePricesSection(services: state.services),
                  const SizedBox(height: AppSpacing.xl),

                  PricingSectionTitle(title: context.l10n.management_pricingTiersTitle),
                  DiscountTiersSection(
                    tiers: state.discountTiers,
                    onAdd: (min, pct) => notifier.addDiscountTier(min, pct),
                    onDelete: (id) => notifier.deleteDiscountTier(id),
                  ),
                  if (state.discountPolicy != null) ...[
                    const SizedBox(height: AppSpacing.m),
                    AppCard(child: DiscountPolicyForm(policy: state.discountPolicy!)),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      context.l10n.management_pricingPolicyHint,
                      style: context.text.bodyS.copyWith(color: context.colors.textSecondary),
                    ),
                  ],
                  const SizedBox(height: AppSpacing.xl),

                  PricingSectionTitle(title: context.l10n.management_pricingDefaultsTitle),
                  if (state.orderDefaults != null)
                    AppCard(child: OrderDefaultsSection(defaults: state.orderDefaults!)),
                ],
              ),
            ),
    );
  }

  void _showPreviewSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) => const CalcPreviewSheet(),
    );
  }
}
