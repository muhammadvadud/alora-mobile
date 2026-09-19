import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/features/management/pricing/application/pricing_notifier.dart';
import 'package:alora_mobile/features/management/pricing/domain/entities/discount_policy.dart';
import 'package:alora_mobile/shared/extensions/l10n_extension.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/shared/widgets/app_button.dart';
import 'package:alora_mobile/shared/widgets/app_text_field.dart';

/// Chegirma siyosati: employee/manager qo'lda maksimal foizi va bosqichlar
/// bilan jamlash (stacking) sozlamasi.
class DiscountPolicyForm extends ConsumerStatefulWidget {
  const DiscountPolicyForm({super.key, required this.policy});

  final DiscountPolicy policy;

  @override
  ConsumerState<DiscountPolicyForm> createState() => _DiscountPolicyFormState();
}

class _DiscountPolicyFormState extends ConsumerState<DiscountPolicyForm> {
  late final TextEditingController _empCtrl;
  late final TextEditingController _mgrCtrl;
  late bool _stackWithTier;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _empCtrl = TextEditingController(
      text: widget.policy.manualMaxPercentEmployee.toString(),
    );
    _mgrCtrl = TextEditingController(
      text: widget.policy.manualMaxPercentManager.toString(),
    );
    _stackWithTier = widget.policy.stackWithTier;
  }

  @override
  void didUpdateWidget(covariant DiscountPolicyForm oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.policy.manualMaxPercentEmployee.toString() != _empCtrl.text) {
      _empCtrl.text = widget.policy.manualMaxPercentEmployee.toString();
    }
    if (widget.policy.manualMaxPercentManager.toString() != _mgrCtrl.text) {
      _mgrCtrl.text = widget.policy.manualMaxPercentManager.toString();
    }
    _stackWithTier = widget.policy.stackWithTier;
  }

  @override
  void dispose() {
    _empCtrl.dispose();
    _mgrCtrl.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final emp = double.tryParse(_empCtrl.text.trim());
    final mgr = double.tryParse(_mgrCtrl.text.trim());
    if (emp == null || mgr == null) return;
    if (emp == widget.policy.manualMaxPercentEmployee &&
        mgr == widget.policy.manualMaxPercentManager &&
        _stackWithTier == widget.policy.stackWithTier) {
      return;
    }

    setState(() => _isSaving = true);
    final notifier = ref.read(pricingProvider.notifier);
    try {
      await notifier.updateDiscountPolicy(
        emp,
        mgr,
        stackWithTier: _stackWithTier,
      );
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.l10n.management_pricingSaveError)),
        );
      }
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: AppTextField(
                controller: _empCtrl,
                type: AppTextFieldType.number,
                hintText: context.l10n.management_pricingMaxEmployee,
              ),
            ),
            const SizedBox(width: AppSpacing.s),
            Expanded(
              child: AppTextField(
                controller: _mgrCtrl,
                type: AppTextFieldType.number,
                hintText: context.l10n.management_pricingMaxManager,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.s),
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            context.l10n.management_pricingStackWithTier,
            style: context.text.bodyM,
          ),
          value: _stackWithTier,
          onChanged: (v) => setState(() => _stackWithTier = v),
        ),
        const SizedBox(height: AppSpacing.s),
        AppButton(
          text: context.l10n.common_save,
          onPressed: _isSaving ? null : _save,
          isLoading: _isSaving,
        ),
      ],
    );
  }
}
