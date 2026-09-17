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
import 'package:alora_mobile/shared/widgets/app_card.dart';
import 'package:alora_mobile/shared/widgets/app_chip.dart';
import 'package:alora_mobile/shared/widgets/app_snackbar.dart';
import 'package:alora_mobile/shared/widgets/app_text_field.dart';
import 'package:alora_mobile/shared/widgets/section_label.dart';

/// Limit davrlari (API-CONTRACT 2.5: `daily`/`monthly`).
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

/// Xodim limit sozlamalari (S-21, 11.9).
class EmployeeLimitEditor extends ConsumerStatefulWidget {
  final String employeeId;
  final UsageLimit? initialLimit;

  const EmployeeLimitEditor({
    super.key,
    required this.employeeId,
    this.initialLimit,
  });

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
      await ref
          .read(employeeDetailProvider(widget.employeeId).notifier)
          .setLimit(body: body);
      if (!mounted) return;
      AppSnackbar.show(context, message: l10n.management_limitSet);
    } on Failure catch (error) {
      if (!mounted) return;
      setState(() => _saving = false);
      AppSnackbar.show(
        context,
        message: error.localizedMessage(context),
        isError: true,
      );
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
        AppCard(
          child: Column(
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
                  Switch(
                    value: _unlimited,
                    onChanged: (value) => setState(() => _unlimited = value),
                  ),
                ],
              ),
              if (!_unlimited) ...[
                const Divider(height: AppSpacing.l),
                Wrap(
                  spacing: AppSpacing.s,
                  runSpacing: AppSpacing.s,
                  children: [
                    _periodChip(
                      l10n.management_limitPeriodDay,
                      LimitPeriod.daily,
                    ),
                    _periodChip(
                      l10n.management_limitPeriodMonth,
                      LimitPeriod.monthly,
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.m),
                AppTextField(
                  controller: _tokensController,
                  type: AppTextFieldType.number,
                  hintText: l10n.management_limitTokens,
                  isEnabled: !_unlimited,
                ),
                const SizedBox(height: AppSpacing.m),
                AppTextField(
                  controller: _costController,
                  type: AppTextFieldType.number,
                  hintText:
                      '${l10n.management_limitCost} (${l10n.currency_som})',
                  isEnabled: !_unlimited,
                ),
                const SizedBox(height: AppSpacing.m),
                AppTextField(
                  controller: _messagesController,
                  type: AppTextFieldType.number,
                  hintText: l10n.management_limitMessages,
                  isEnabled: !_unlimited,
                ),
                const SizedBox(height: AppSpacing.l),
                Wrap(
                  spacing: AppSpacing.s,
                  children: [
                    _onExceedChip(l10n.management_onExceedWarn, OnExceed.warn),
                    _onExceedChip(l10n.management_onExceedBlock, OnExceed.block),
                  ],
                ),
                const SizedBox(height: AppSpacing.l),
              ],
              AppButton(
                text: l10n.management_limitSet,
                isLoading: _saving,
                onPressed: _save,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _periodChip(String label, LimitPeriod period) {
    return AppChip(
      label: label,
      onTap: _unlimited
          ? null
          : () => setState(() => _period = period),
      state: !_unlimited && _period == period
          ? AppChipState.selected
          : AppChipState.unselected,
    );
  }

  Widget _onExceedChip(String label, OnExceed onExceed) {
    return AppChip(
      label: label,
      onTap: () => setState(() => _onExceed = onExceed),
      state: _onExceed == onExceed
          ? AppChipState.selected
          : AppChipState.unselected,
    );
  }
}