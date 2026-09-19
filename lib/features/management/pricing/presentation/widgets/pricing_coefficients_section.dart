import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/features/management/pricing/application/pricing_notifier.dart';
import 'package:alora_mobile/features/management/pricing/domain/entities/calc_rule.dart';
import 'package:alora_mobile/shared/extensions/l10n_extension.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/shared/widgets/app_button.dart';
import 'package:alora_mobile/shared/widgets/app_card.dart';
import 'package:alora_mobile/shared/widgets/app_list_tile.dart';
import 'package:alora_mobile/shared/widgets/app_bottom_sheet.dart';
import 'package:alora_mobile/shared/widgets/app_text_field.dart';

/// Koeffitsientlar bo'limi (S-23).
/// AppCard.sections ro'yxati (titleS kalit, bodyL qiymat). Tahrir - bottom sheet orqali.
class PricingCoefficientsSection extends ConsumerWidget {
  const PricingCoefficientsSection({super.key, required this.rules});

  final List<CalcRule> rules;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (rules.isEmpty) {
      return Text(
        context.l10n.management_pricingCoefsEmpty,
        style: context.text.bodyS.copyWith(color: context.colors.textSecondary),
      );
    }

    return AppCard.sections(
      sections: rules.map((rule) {
        return AppListTile(
          title: rule.description,
          subtitle: rule.key,
          trailing: Text(
            '${rule.value} ${rule.unit}',
            style: context.text.bodyL.copyWith(color: context.colors.textPrimary),
          ),
          onTap: () => _editRule(context, ref, rule),
          showDivider: false,
        );
      }).toList(),
    );
  }

  void _editRule(BuildContext context, WidgetRef ref, CalcRule rule) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: _RuleEditSheet(rule: rule),
      ),
    );
  }
}

class _RuleEditSheet extends ConsumerStatefulWidget {
  final CalcRule rule;
  const _RuleEditSheet({required this.rule});

  @override
  ConsumerState<_RuleEditSheet> createState() => _RuleEditSheetState();
}

class _RuleEditSheetState extends ConsumerState<_RuleEditSheet> {
  late TextEditingController _controller;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.rule.value.toString());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final raw = _controller.text.trim();
    final parsed = double.tryParse(raw);
    if (parsed == null || parsed == widget.rule.value) {
      Navigator.pop(context);
      return;
    }

    setState(() => _isSaving = true);
    final notifier = ref.read(pricingProvider.notifier);
    try {
      await notifier.updateCalcRule(widget.rule.key, raw);
      if (mounted) Navigator.pop(context);
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(context.l10n.management_pricingSaveError)));
      }
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBottomSheet(
      title: widget.rule.description,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.rule.key, style: context.text.bodyS.copyWith(color: context.colors.textSecondary)),
          const SizedBox(height: AppSpacing.m),
          AppTextField(
            controller: _controller,
            type: AppTextFieldType.number,
            hintText: widget.rule.unit,
          ),
          const SizedBox(height: AppSpacing.xl),
          AppButton(
            text: context.l10n.common_save,
            onPressed: _isSaving ? null : _save,
            isLoading: _isSaving,
          ),
        ],
      ),
    );
  }
}
