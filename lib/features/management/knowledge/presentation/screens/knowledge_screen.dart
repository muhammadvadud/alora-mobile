import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alora_mobile/app/theme/app_radius.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/features/management/knowledge/application/knowledge_notifier.dart';
import 'package:alora_mobile/features/management/knowledge/domain/entities/knowledge_rule.dart';
import 'package:alora_mobile/features/management/knowledge/presentation/widgets/knowledge_rule_form.dart';
import 'package:alora_mobile/shared/extensions/l10n_extension.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/shared/icons/app_icons.dart';
import 'package:alora_mobile/shared/widgets/app_chip.dart';
import 'package:alora_mobile/shared/widgets/app_button.dart';
import 'package:alora_mobile/shared/widgets/empty_state.dart';
import 'package:alora_mobile/shared/widgets/error_state.dart';
import 'package:alora_mobile/shared/widgets/skeleton.dart';

class KnowledgeScreen extends ConsumerWidget {
  const KnowledgeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.management_knowledgeTitle)),
      body: const _KnowledgeBody(),
      bottomNavigationBar: SafeArea(
        top: false,
        minimum: const EdgeInsets.fromLTRB(AppSpacing.m, 0, AppSpacing.m, AppSpacing.m),
        child: AppButton(
          text: context.l10n.management_knowledgeAddRule,
          onPressed: () => _showRuleForm(context),
        ),
      ),
    );
  }

  void _showRuleForm(BuildContext context, [KnowledgeRule? rule]) {
    showDialog<void>(
      context: context,
      builder: (context) => KnowledgeRuleForm(rule: rule),
    );
  }
}

class _KnowledgeBody extends ConsumerWidget {
  const _KnowledgeBody();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(knowledgeProvider);
    final notifier = ref.read(knowledgeProvider.notifier);
    final l10n = context.l10n;

    if (state.isLoading && state.rules.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(AppSpacing.m),
        child: SkeletonList(
          itemCount: 4,
          itemBuilder: SkeletonBox(
            width: double.infinity,
            height: 120,
            borderRadius: AppRadius.card,
          ),
        ),
      );
    }
    if (state.error != null && state.rules.isEmpty) {
      return ErrorState(
        title: l10n.management_knowledgeErrorTitle,
        message: state.error,
        onRetry: () => notifier.loadData(),
      );
    }
    if (state.rules.isEmpty) {
      return EmptyState(
        icon: AppIcons.fileText,
        title: l10n.management_knowledgeEmptyTitle,
        message: l10n.management_knowledgeEmptyMessage,
      );
    }
    return RefreshIndicator(
      onRefresh: () => notifier.loadData(),
      child: ListView.builder(
        padding: const EdgeInsets.all(AppSpacing.m),
        itemCount: state.rules.length,
        itemBuilder: (context, index) {
          final rule = state.rules[index];
          return _KnowledgeRuleCard(rule: rule);
        },
      ),
    );
  }
}

class _KnowledgeRuleCard extends ConsumerWidget {
  final KnowledgeRule rule;

  const _KnowledgeRuleCard({required this.rule});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colors;
    final notifier = ref.read(knowledgeProvider.notifier);
    final l10n = context.l10n;

    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.m),
      padding: const EdgeInsets.all(AppSpacing.l),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: AppRadius.cardBorder,
        border: Border.all(color: colors.borderSubtle, width: 1.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  rule.kind.toUpperCase(),
                  style: context.text.labelM.copyWith(color: colors.warning, letterSpacing: 0.4),
                ),
              ),
              Switch(
                value: rule.isActive,
                onChanged: (val) => notifier.updateRule(rule.id, {'is_active': val}),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.s),
          if (rule.condition.isNotEmpty)
            Wrap(
              spacing: AppSpacing.xs,
              runSpacing: AppSpacing.xs,
              children: [
                for (final cond in rule.condition)
                  AppChip(label: cond, state: AppChipState.categorySelected),
              ],
            ),
          const SizedBox(height: AppSpacing.m),
          Text(rule.recommendation, style: context.text.bodyM),
          const SizedBox(height: AppSpacing.m),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                l10n.management_knowledgeRulePriorityLabel(rule.priority),
                style: context.text.bodyS.copyWith(color: colors.textSecondary),
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(AppIcons.edit, size: 20),
                    color: colors.textSecondary,
                    onPressed: () {
                      showDialog<void>(
                        context: context,
                        builder: (context) => KnowledgeRuleForm(rule: rule),
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(AppIcons.trash, size: 20, color: colors.danger),
                    onPressed: () => _confirmDelete(context, ref),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _confirmDelete(BuildContext context, WidgetRef ref) async {
    final l10n = context.l10n;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.management_knowledgeRemoveConfirmTitle),
        content: Text(l10n.management_knowledgeRemoveConfirmMessage),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(l10n.common_cancel),
          ),
          SizedBox(
            width: 140,
            child: AppButton.destructive(
              text: l10n.management_knowledgeRemove,
              onPressed: () => Navigator.pop(context, true),
            ),
          ),
        ],
      ),
    );
    if (confirmed != true || !context.mounted) return;
    final messenger = ScaffoldMessenger.of(context);
    final message = l10n.management_knowledgeRuleRemoved;
    await ref.read(knowledgeProvider.notifier).deleteRule(rule.id);
    messenger.showSnackBar(SnackBar(content: Text(message)));
  }
}
