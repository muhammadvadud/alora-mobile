import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/features/management/pricing/application/pricing_notifier.dart';
import 'package:alora_mobile/features/management/pricing/domain/entities/order_defaults.dart';
import 'package:alora_mobile/shared/extensions/l10n_extension.dart';
import 'package:alora_mobile/shared/widgets/app_button.dart';
import 'package:alora_mobile/shared/widgets/app_text_field.dart';

/// Standart qiymatlar bo'limi: avans foizi, yetkazish narxi va muddat kunlari.
class OrderDefaultsSection extends ConsumerStatefulWidget {
  const OrderDefaultsSection({super.key, required this.defaults});

  final OrderDefaults defaults;

  @override
  ConsumerState<OrderDefaultsSection> createState() =>
      _OrderDefaultsSectionState();
}

class _OrderDefaultsSectionState extends ConsumerState<OrderDefaultsSection> {
  late final TextEditingController _advCtrl;
  late final TextEditingController _delCtrl;
  late final TextEditingController _daysCtrl;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _advCtrl = TextEditingController(
      text: widget.defaults.defaultPrepaymentPercent.toString(),
    );
    _delCtrl = TextEditingController(
      text: widget.defaults.defaultDeliveryAmount.toString(),
    );
    _daysCtrl = TextEditingController(
      text: widget.defaults.deadlineDays.toString(),
    );
  }

  @override
  void didUpdateWidget(covariant OrderDefaultsSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.defaults.defaultPrepaymentPercent.toString() != _advCtrl.text) {
      _advCtrl.text = widget.defaults.defaultPrepaymentPercent.toString();
    }
    if (widget.defaults.defaultDeliveryAmount.toString() != _delCtrl.text) {
      _delCtrl.text = widget.defaults.defaultDeliveryAmount.toString();
    }
    if (widget.defaults.deadlineDays.toString() != _daysCtrl.text) {
      _daysCtrl.text = widget.defaults.deadlineDays.toString();
    }
  }

  @override
  void dispose() {
    _advCtrl.dispose();
    _delCtrl.dispose();
    _daysCtrl.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final adv = double.tryParse(_advCtrl.text.trim());
    final del = int.tryParse(_delCtrl.text.trim());
    final days = int.tryParse(_daysCtrl.text.trim());
    if (adv == null || del == null || days == null) return;
    if (adv == widget.defaults.defaultPrepaymentPercent &&
        del == widget.defaults.defaultDeliveryAmount &&
        days == widget.defaults.deadlineDays) {
      return;
    }

    setState(() => _isSaving = true);
    final notifier = ref.read(pricingProvider.notifier);
    try {
      await notifier.updateOrderDefaults(adv, del, days);
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
                controller: _advCtrl,
                type: AppTextFieldType.number,
                hintText: context.l10n.management_pricingAdvancePercent,
              ),
            ),
            const SizedBox(width: AppSpacing.s),
            Expanded(
              child: AppTextField(
                controller: _delCtrl,
                type: AppTextFieldType.number,
                hintText: context.l10n.management_pricingDeliveryPrice,
              ),
            ),
            const SizedBox(width: AppSpacing.s),
            Expanded(
              child: AppTextField(
                controller: _daysCtrl,
                type: AppTextFieldType.number,
                hintText: context.l10n.management_pricingDeadlineDays,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.m),
        AppButton(
          text: context.l10n.common_save,
          onPressed: _isSaving ? null : _save,
          isLoading: _isSaving,
        ),
      ],
    );
  }
}
