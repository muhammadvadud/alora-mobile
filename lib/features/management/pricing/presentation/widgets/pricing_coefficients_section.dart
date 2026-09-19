import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/features/management/pricing/application/pricing_notifier.dart';
import 'package:alora_mobile/features/management/pricing/domain/entities/calc_rule.dart';
import 'package:alora_mobile/shared/extensions/l10n_extension.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/shared/widgets/app_button.dart';
import 'package:alora_mobile/shared/widgets/app_text_field.dart';

import 'pricing_field_row.dart';

/// Koeffitsientlar bo'limi. Har bir `CalcRule` inline tahrirlanadi,
/// saqlash tugmasida o'zgargan qiymatlar PATCH bilan yuboriladi.
class PricingCoefficientsSection extends ConsumerStatefulWidget {
  const PricingCoefficientsSection({super.key, required this.rules});

  final List<CalcRule> rules;

  @override
  ConsumerState<PricingCoefficientsSection> createState() => _PricingCoefficientsSectionState();
}

class _PricingCoefficientsSectionState extends ConsumerState<PricingCoefficientsSection> {
  final Map<String, TextEditingController> _controllers = {};
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _syncControllers();
  }

  @override
  void didUpdateWidget(covariant PricingCoefficientsSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    _syncControllers();
  }

  void _syncControllers() {
    for (final key in _controllers.keys.toList()) {
      if (!widget.rules.any((r) => r.key == key)) {
        _controllers.remove(key)?.dispose();
      }
    }
    for (final rule in widget.rules) {
      _controllers.putIfAbsent(rule.key, () => TextEditingController(text: rule.value.toString()));
    }
  }

  @override
  void dispose() {
    for (final c in _controllers.values) {
      c.dispose();
    }
    super.dispose();
  }

  Future<void> _save() async {
    final changes = <String, String>{};
    for (final rule in widget.rules) {
      final raw = _controllers[rule.key]!.text.trim();
      final parsed = double.tryParse(raw);
      if (parsed == null || parsed == rule.value) continue;
      changes[rule.key] = raw;
    }
    if (changes.isEmpty) return;

    setState(() => _isSaving = true);
    final notifier = ref.read(pricingProvider.notifier);
    try {
      await Future.wait([
        for (final entry in changes.entries) notifier.updateCalcRule(entry.key, entry.value),
      ]);
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
    return Column(
      children: [
        if (widget.rules.isEmpty)
          Text(
            context.l10n.management_pricingCoefsEmpty,
            style: context.text.bodyS.copyWith(color: context.colors.textSecondary),
          )
        else
          for (final rule in widget.rules)
            PricingFieldRow(
              label: rule.key,
              description: rule.description,
              field: AppTextField(
                controller: _controllers[rule.key],
                type: AppTextFieldType.number,
                hintText: rule.unit,
              ),
            ),
        if (widget.rules.isNotEmpty) ...[
          const SizedBox(height: AppSpacing.m),
          AppButton(
            text: context.l10n.common_save,
            onPressed: _isSaving ? null : _save,
            isLoading: _isSaving,
          ),
        ],
      ],
    );
  }
}
