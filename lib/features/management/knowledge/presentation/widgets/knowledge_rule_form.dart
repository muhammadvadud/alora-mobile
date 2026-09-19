import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:alora_mobile/app/router/routes.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/features/management/knowledge/application/knowledge_notifier.dart';
import 'package:alora_mobile/features/management/knowledge/domain/entities/knowledge_rule.dart';
import 'package:alora_mobile/shared/extensions/l10n_extension.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/shared/icons/app_icons.dart';
import 'package:alora_mobile/shared/widgets/app_button.dart';
import 'package:alora_mobile/shared/widgets/app_chip.dart';
import 'package:alora_mobile/shared/widgets/app_text_field.dart';

class KnowledgeRuleForm extends ConsumerStatefulWidget {
  final KnowledgeRule? rule;

  const KnowledgeRuleForm({super.key, this.rule});

  @override
  ConsumerState<KnowledgeRuleForm> createState() => _KnowledgeRuleFormState();
}

class _KnowledgeRuleFormState extends ConsumerState<KnowledgeRuleForm> {
  static const List<String> _suggestions = [
    'Mehmonxona',
    'Zal',
    'Oshxona',
    'Bolalar xonasi',
    'Ofis',
    'Kvartira',
  ];

  late final TextEditingController _kindCtrl;
  late final TextEditingController _condCtrl;
  late final TextEditingController _recCtrl;
  late final TextEditingController _priorityCtrl;
  List<String> _conditions = [];
  bool _isActive = true;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _kindCtrl = TextEditingController(text: widget.rule?.kind ?? 'general');
    _conditions = widget.rule?.condition.toList() ?? [];
    _condCtrl = TextEditingController();
    _recCtrl = TextEditingController(text: widget.rule?.recommendation ?? '');
    _priorityCtrl = TextEditingController(text: widget.rule?.priority.toString() ?? '0');
    _isActive = widget.rule?.isActive ?? true;
  }

  @override
  void dispose() {
    _kindCtrl.dispose();
    _condCtrl.dispose();
    _recCtrl.dispose();
    _priorityCtrl.dispose();
    super.dispose();
  }

  bool get _isValid =>
      _kindCtrl.text.trim().isNotEmpty && _conditions.isNotEmpty && _recCtrl.text.trim().isNotEmpty;

  void _toggleCondition(String value) {
    setState(() {
      if (_conditions.contains(value)) {
        _conditions.remove(value);
      } else {
        _conditions.add(value);
      }
    });
  }

  void _addCondition() {
    final val = _condCtrl.text.trim();
    if (val.isNotEmpty) {
      _toggleCondition(val);
      _condCtrl.clear();
    }
  }

  Future<void> _save() async {
    if (!_isValid) return;
    final kind = _kindCtrl.text.trim();
    final rec = _recCtrl.text.trim();
    final priority = int.tryParse(_priorityCtrl.text.trim()) ?? 0;

    setState(() => _isSaving = true);
    final notifier = ref.read(knowledgeProvider.notifier);
    try {
      if (widget.rule != null) {
        await notifier.updateRule(widget.rule!.id, {
          'kind': kind,
          'condition': _conditions,
          'recommendation': rec,
          'priority': priority,
          'is_active': _isActive,
        });
      } else {
        await notifier.createRule(kind, _conditions, rec, priority, _isActive);
      }
      if (mounted) Navigator.of(context).pop();
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(context.l10n.common_error)));
      }
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  void _testInAi() {
    Navigator.of(context).pop();
    context.go(AppRoutes.chat);
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final l10n = context.l10n;

    return Dialog(
      insetPadding: const EdgeInsets.all(AppSpacing.m),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.l),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                widget.rule == null
                    ? l10n.management_knowledgeAddRule
                    : l10n.management_knowledgeEditTitle,
                style: context.text.titleL,
              ),
              const SizedBox(height: AppSpacing.l),
              AppTextField(
                controller: _kindCtrl,
                hintText: l10n.management_knowledgeRuleType,
                onChanged: (_) => setState(() {}),
              ),
              const SizedBox(height: AppSpacing.m),
              Text(
                l10n.management_knowledgeRuleConditions,
                style: context.text.bodyS.copyWith(color: colors.textSecondary),
              ),
              const SizedBox(height: AppSpacing.s),
              _ConditionsBuilder(
                suggestions: _suggestions,
                conditions: _conditions,
                condCtrl: _condCtrl,
                onToggleCondition: _toggleCondition,
                onAddCondition: _addCondition,
              ),
              const SizedBox(height: AppSpacing.m),
              AppTextField(
                controller: _recCtrl,
                type: AppTextFieldType.multiline,
                hintText: l10n.management_knowledgeRuleRecommendation,
                onChanged: (_) => setState(() {}),
              ),
              const SizedBox(height: AppSpacing.m),
              AppTextField(
                controller: _priorityCtrl,
                type: AppTextFieldType.number,
                hintText: l10n.management_knowledgeRulePriorityHint,
                onChanged: (_) => setState(() {}),
              ),
              const SizedBox(height: AppSpacing.xs),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(l10n.management_knowledgeRuleIsActive, style: context.text.bodyM),
                value: _isActive,
                onChanged: (val) => setState(() => _isActive = val),
              ),
              const SizedBox(height: AppSpacing.m),
              _ActionButtons(
                isValid: _isValid,
                isSaving: _isSaving,
                onCancel: () => Navigator.of(context).pop(),
                onSave: _save,
                onTestInAi: _testInAi,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ConditionsBuilder extends StatelessWidget {
  final List<String> suggestions;
  final List<String> conditions;
  final TextEditingController condCtrl;
  final ValueChanged<String> onToggleCondition;
  final VoidCallback onAddCondition;

  const _ConditionsBuilder({
    required this.suggestions,
    required this.conditions,
    required this.condCtrl,
    required this.onToggleCondition,
    required this.onAddCondition,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final l10n = context.l10n;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Wrap(
          spacing: AppSpacing.xs,
          runSpacing: AppSpacing.xs,
          children: [
            for (final suggestion in suggestions)
              AppChip(
                label: suggestion,
                state: conditions.contains(suggestion)
                    ? AppChipState.selected
                    : AppChipState.unselected,
                onTap: () => onToggleCondition(suggestion),
              ),
          ],
        ),
        const SizedBox(height: AppSpacing.m),
        Row(
          children: [
            Expanded(
              child: AppTextField(
                controller: condCtrl,
                hintText: l10n.management_knowledgeConditionHint,
              ),
            ),
            const SizedBox(width: AppSpacing.s),
            IconButton(
              icon: const Icon(AppIcons.plus),
              color: colors.accent,
              onPressed: onAddCondition,
            ),
          ],
        ),
        if (conditions.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: AppSpacing.s),
            child: Wrap(
              spacing: AppSpacing.xs,
              runSpacing: AppSpacing.xs,
              children: [
                for (final cond in conditions)
                  AppChip(
                    label: cond,
                    state: AppChipState.categorySelected,
                    onTap: () => onToggleCondition(cond),
                  ),
              ],
            ),
          ),
      ],
    );
  }
}

class _ActionButtons extends StatelessWidget {
  final bool isValid;
  final bool isSaving;
  final VoidCallback onCancel;
  final VoidCallback onSave;
  final VoidCallback onTestInAi;

  const _ActionButtons({
    required this.isValid,
    required this.isSaving,
    required this.onCancel,
    required this.onSave,
    required this.onTestInAi,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: AppButton.secondary(text: l10n.common_cancel, onPressed: onCancel),
            ),
            const SizedBox(width: AppSpacing.s),
            Expanded(
              child: AppButton(
                text: l10n.common_save,
                isEnabled: isValid && !isSaving,
                isLoading: isSaving,
                onPressed: onSave,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.m),
        AppButton.secondary(text: l10n.management_knowledgeRuleTestAI, onPressed: onTestInAi),
      ],
    );
  }
}
