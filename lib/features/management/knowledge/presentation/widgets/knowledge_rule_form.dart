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
    _priorityCtrl = TextEditingController(
      text: widget.rule?.priority.toString() ?? '0',
    );
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
      _kindCtrl.text.trim().isNotEmpty &&
      _conditions.isNotEmpty &&
      _recCtrl.text.trim().isNotEmpty;

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
                    ? context.l10n.management_knowledgeAddRule
                    : context.l10n.management_knowledgeEditTitle,
                style: context.text.titleL,
              ),
              const SizedBox(height: AppSpacing.l),
              AppTextField(
                controller: _kindCtrl,
                hintText: context.l10n.management_knowledgeRuleType,
                onChanged: (_) => setState(() {}),
              ),
              const SizedBox(height: AppSpacing.m),
              Text(
                context.l10n.management_knowledgeRuleConditions,
                style: context.text.bodyS.copyWith(color: colors.textSecondary),
              ),
              const SizedBox(height: AppSpacing.s),
              Wrap(
                spacing: AppSpacing.xs,
                runSpacing: AppSpacing.xs,
                children: [
                  for (final suggestion in _suggestions)
                    AppChip(
                      label: suggestion,
                      state: _conditions.contains(suggestion)
                          ? AppChipState.selected
                          : AppChipState.unselected,
                      onTap: () => _toggleCondition(suggestion),
                    ),
                ],
              ),
              const SizedBox(height: AppSpacing.m),
              Row(
                children: [
                  Expanded(
                    child: AppTextField(
                      controller: _condCtrl,
                      hintText: context.l10n.management_knowledgeConditionHint,
                      onChanged: (_) => setState(() {}),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.s),
                  IconButton(
                    icon: const Icon(AppIcons.plus),
                    color: colors.accent,
                    onPressed: _addCondition,
                  ),
                ],
              ),
              if (_conditions.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: AppSpacing.s),
                  child: Wrap(
                    spacing: AppSpacing.xs,
                    runSpacing: AppSpacing.xs,
                    children: [
                      for (final cond in _conditions)
                        AppChip(
                          label: cond,
                          state: AppChipState.categorySelected,
                          onTap: () => _toggleCondition(cond),
                        ),
                    ],
                  ),
                ),
              const SizedBox(height: AppSpacing.m),
              AppTextField(
                controller: _recCtrl,
                type: AppTextFieldType.multiline,
                hintText: context.l10n.management_knowledgeRuleRecommendation,
                onChanged: (_) => setState(() {}),
              ),
              const SizedBox(height: AppSpacing.m),
              AppTextField(
                controller: _priorityCtrl,
                type: AppTextFieldType.number,
                hintText: context.l10n.management_knowledgeRulePriorityHint,
                onChanged: (_) => setState(() {}),
              ),
              const SizedBox(height: AppSpacing.xs),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  context.l10n.management_knowledgeRuleIsActive,
                  style: context.text.bodyM,
                ),
                value: _isActive,
                onChanged: (val) => setState(() => _isActive = val),
              ),
              const SizedBox(height: AppSpacing.m),
              Row(
                children: [
                  Expanded(
                    child: AppButton.secondary(
                      text: context.l10n.common_cancel,
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.s),
                  Expanded(
                    child: AppButton(
                      text: context.l10n.common_save,
                      isEnabled: _isValid && !_isSaving,
                      isLoading: _isSaving,
                      onPressed: _save,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.m),
              AppButton.secondary(
                text: context.l10n.management_knowledgeRuleTestAI,
                onPressed: _testInAi,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
