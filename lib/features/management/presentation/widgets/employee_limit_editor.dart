import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/core/error/failure.dart';
import 'package:alora_mobile/core/error/failure_l10n.dart';
import 'package:alora_mobile/features/management/application/employee_detail_notifier.dart';
import 'package:alora_mobile/features/management/domain/entities/on_exceed.dart';
import 'package:alora_mobile/features/management/domain/entities/usage_limit.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/shared/widgets/app_button.dart';
import 'package:alora_mobile/shared/widgets/app_chip.dart';
import 'package:alora_mobile/shared/widgets/app_snackbar.dart';
import 'package:alora_mobile/shared/widgets/app_text_field.dart';
import 'package:alora_mobile/shared/widgets/section_label.dart';

enum LimitPeriod {
  daily('daily'),
  monthly('monthly');

  const LimitPeriod(this.query);

  final String query;

  static LimitPeriod fromName(String value) {
    for (final period in LimitPeriod.values) {
      if (period.query == value) return period;
    }
    return LimitPeriod.daily;
  }
}

class EmployeeLimitEditor extends ConsumerStatefulWidget {
  final String employeeId;
  final UsageLimit? initialLimit;

  const EmployeeLimitEditor({super.key, required this.employeeId, this.initialLimit});

  @override
  ConsumerState<EmployeeLimitEditor> createState() => _EmployeeLimitEditorState();
}

class _EmployeeLimitEditorState extends ConsumerState<EmployeeLimitEditor> {
  late bool _unlimited;
  late LimitPeriod _period;
  late OnExceed _onExceed;
  final _tokensController = TextEditingController();
  final _costController = TextEditingController();
  final _messagesController = TextEditingController();
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    _initFromLimit(widget.initialLimit);
  }

  @override
  void didUpdateWidget(covariant EmployeeLimitEditor oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialLimit?.id != oldWidget.initialLimit?.id) {
      _initFromLimit(widget.initialLimit);
    }
  }

  void _initFromLimit(UsageLimit? limit) {
    _unlimited = limit?.isUnlimited ?? true;
    _period = limit == null ? LimitPeriod.daily : LimitPeriod.fromName(limit.period);
    _onExceed = limit?.onExceed ?? OnExceed.warn;
    _tokensController.text = limit?.maxTokens?.toString() ?? '';
    _costController.text = limit?.maxCost?.toString() ?? '';
    _messagesController.text = limit?.maxMessages?.toString() ?? '';
  }

  @override
  void dispose() {
    _tokensController.dispose();
    _costController.dispose();
    _messagesController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final l10n = AppLocalizations.of(context)!;
    final body = _buildBody();

    setState(() => _saving = true);
    try {
      await ref.read(employeeDetailProvider(widget.employeeId).notifier).setLimit(body: body);
      if (!mounted) return;
      AppSnackbar.show(context, message: l10n.management_limitSet);
    } on Failure catch (error) {
      if (!mounted) return;
      AppSnackbar.show(context, message: error.localizedMessage(context), isError: true);
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  Map<String, dynamic> _buildBody() {
    if (_unlimited) {
      return {'is_unlimited': true};
    }
    final tokens = int.tryParse(_tokensController.text.trim()) ?? 0;
    final cost = int.tryParse(_costController.text.trim()) ?? 0;
    final messages = int.tryParse(_messagesController.text.trim()) ?? 0;

    return {
      'is_unlimited': false,
      'period': _period.query,
      'max_tokens': tokens,
      'max_cost_uzs': '$cost.00',
      'max_messages': messages,
      'on_exceed': _onExceed.query,
      'is_active': true,
    };
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colors = context.colors;
    final typography = context.text;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionLabel(l10n.management_limitTitle),
        const SizedBox(height: AppSpacing.m),
        const SizedBox(height: AppSpacing.m),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    l10n.management_limitUnlimited,
                    style: typography.labelL.copyWith(color: colors.textPrimary),
                  ),
                ),
                Switch(value: _unlimited, onChanged: (value) => setState(() => _unlimited = value)),
              ],
            ),
            if (!_unlimited) ...[
              const Divider(height: AppSpacing.l),
              _LimitFormSection(
                period: _period,
                onExceed: _onExceed,
                tokensController: _tokensController,
                costController: _costController,
                messagesController: _messagesController,
                onPeriodChanged: (val) => setState(() => _period = val),
                onExceedChanged: (val) => setState(() => _onExceed = val),
              ),
            ],
            AppButton(text: l10n.management_limitSet, isLoading: _saving, onPressed: _save),
          ],
        ),
      ],
    );
  }
}

class _LimitFormSection extends StatelessWidget {
  final LimitPeriod period;
  final OnExceed onExceed;
  final TextEditingController tokensController;
  final TextEditingController costController;
  final TextEditingController messagesController;
  final ValueChanged<LimitPeriod> onPeriodChanged;
  final ValueChanged<OnExceed> onExceedChanged;

  const _LimitFormSection({
    required this.period,
    required this.onExceed,
    required this.tokensController,
    required this.costController,
    required this.messagesController,
    required this.onPeriodChanged,
    required this.onExceedChanged,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: AppSpacing.s,
          runSpacing: AppSpacing.s,
          children: [
            _PeriodChip(
              label: l10n.management_limitPeriodDay,
              period: LimitPeriod.daily,
              currentPeriod: period,
              onTap: () => onPeriodChanged(LimitPeriod.daily),
            ),
            _PeriodChip(
              label: l10n.management_limitPeriodMonth,
              period: LimitPeriod.monthly,
              currentPeriod: period,
              onTap: () => onPeriodChanged(LimitPeriod.monthly),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.m),
        AppTextField(
          controller: tokensController,
          type: AppTextFieldType.number,
          hintText: l10n.management_limitTokens,
        ),
        const SizedBox(height: AppSpacing.m),
        AppTextField(
          controller: costController,
          type: AppTextFieldType.number,
          hintText: '${l10n.management_limitCost} (${l10n.currency_som})',
        ),
        const SizedBox(height: AppSpacing.m),
        AppTextField(
          controller: messagesController,
          type: AppTextFieldType.number,
          hintText: l10n.management_limitMessages,
        ),
        const SizedBox(height: AppSpacing.l),
        Wrap(
          spacing: AppSpacing.s,
          children: [
            _OnExceedChip(
              label: l10n.management_onExceedWarn,
              onExceed: OnExceed.warn,
              current: onExceed,
              onTap: () => onExceedChanged(OnExceed.warn),
            ),
            _OnExceedChip(
              label: l10n.management_onExceedBlock,
              onExceed: OnExceed.block,
              current: onExceed,
              onTap: () => onExceedChanged(OnExceed.block),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.l),
      ],
    );
  }
}

class _PeriodChip extends StatelessWidget {
  final String label;
  final LimitPeriod period;
  final LimitPeriod currentPeriod;
  final VoidCallback onTap;

  const _PeriodChip({
    required this.label,
    required this.period,
    required this.currentPeriod,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppChip(
      label: label,
      onTap: onTap,
      state: currentPeriod == period ? AppChipState.selected : AppChipState.unselected,
    );
  }
}

class _OnExceedChip extends StatelessWidget {
  final String label;
  final OnExceed onExceed;
  final OnExceed current;
  final VoidCallback onTap;

  const _OnExceedChip({
    required this.label,
    required this.onExceed,
    required this.current,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppChip(
      label: label,
      onTap: onTap,
      state: current == onExceed ? AppChipState.selected : AppChipState.unselected,
    );
  }
}
