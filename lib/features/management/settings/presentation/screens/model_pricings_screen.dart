import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:alora_mobile/app/theme/app_radius.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/features/auth/application/auth_notifier.dart' show authProvider;
import 'package:alora_mobile/features/auth/application/auth_state.dart';
import 'package:alora_mobile/features/management/settings/application/settings_notifiers.dart';
import 'package:alora_mobile/features/management/settings/domain/entities/model_pricing.dart';
import 'package:alora_mobile/shared/extensions/l10n_extension.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/shared/models/role.dart';
import 'package:alora_mobile/shared/widgets/app_button.dart';
import 'package:alora_mobile/shared/widgets/app_card.dart';
import 'package:alora_mobile/shared/widgets/error_state.dart';
import 'package:alora_mobile/shared/widgets/role_gate.dart';
import 'package:alora_mobile/shared/widgets/skeleton.dart';

class ModelPricingsScreen extends ConsumerWidget {
  const ModelPricingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(modelPricingsProvider);
    final colors = context.colors;

    final currentRole = ref
        .watch(authProvider)
        .maybeWhen(authenticated: (user) => user.role, orElse: () => Role.employee);

    return RoleGate(
      minRole: Role.admin,
      currentRole: currentRole,
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.l10n.settings_modelPricingsTitle),
          backgroundColor: colors.surface,
          elevation: 0,
        ),
        body: state.when(
          data: (models) => SingleChildScrollView(
            padding: const EdgeInsets.all(AppSpacing.l),
            child: AppCard.sections(
              sections: models
                  .map(
                    (model) => _ModelPricingCard(
                      model: model,
                      onDelete: () =>
                          ref.read(modelPricingsProvider.notifier).deletePricing(model.id),
                    ),
                  )
                  .toList(),
            ),
          ),
          loading: () => const Padding(
            padding: EdgeInsets.all(AppSpacing.l),
            child: SkeletonList(
              itemCount: 3,
              itemBuilder: SkeletonBox(
                width: double.infinity,
                height: 150,
                borderRadius: AppRadius.card,
              ),
            ),
          ),
          error: (e, st) => ErrorState(onRetry: () => ref.invalidate(modelPricingsProvider)),
        ),
      ),
    );
  }
}

class _ModelPricingCard extends StatelessWidget {
  final ModelPricing model;
  final VoidCallback onDelete;

  const _ModelPricingCard({required this.model, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.text;
    final m = model;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.m),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.settings_modelProviderModel(m.provider, m.model),
            style: typography.titleS,
          ),
          const SizedBox(height: AppSpacing.s),
          Text(context.l10n.settings_modelInput(m.inputPer1m), style: typography.bodyS),
          Text(context.l10n.settings_modelOutput(m.outputPer1m), style: typography.bodyS),
          Text(context.l10n.settings_modelCached(m.cachedInputPer1m), style: typography.bodyS),
          Text(context.l10n.settings_modelStt(m.sttPerMinute), style: typography.bodyS),
          Text(context.l10n.settings_modelTts(m.ttsPer1kChars), style: typography.bodyS),
          Text(context.l10n.settings_modelUsdToUzs(m.usdToUzs), style: typography.bodyS),
          const SizedBox(height: AppSpacing.s),
          Row(
            children: [
              Text(
                m.isActive ? context.l10n.settings_active : context.l10n.settings_inactive,
                style: typography.bodyS.copyWith(
                  color: m.isActive ? colors.success : colors.danger,
                ),
              ),
              const Spacer(),
              AppButton(
                text: context.l10n.settings_delete,
                onPressed: onDelete,
                type: AppButtonType.destructive,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
