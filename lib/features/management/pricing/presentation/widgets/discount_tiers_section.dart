import 'package:flutter/material.dart';
import 'package:alora_mobile/shared/icons/app_icons.dart';
import 'package:alora_mobile/core/utils/money_format.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/features/management/pricing/domain/entities/discount_tier.dart';
import 'package:alora_mobile/shared/extensions/l10n_extension.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/shared/widgets/app_button.dart';
import 'package:alora_mobile/shared/widgets/app_text_field.dart';
import 'package:alora_mobile/shared/widgets/app_bottom_sheet.dart';
import 'package:alora_mobile/shared/widgets/app_card.dart';
import 'package:alora_mobile/shared/widgets/app_icon_button.dart';

/// Chegirma bosqichlari jadvali. Qator qo'shish/o'chirish va qo'lda
/// maksimal foiz sozlamasi uchun tugmalarni ko'rsatadi.
class DiscountTiersSection extends StatelessWidget {
  const DiscountTiersSection({
    super.key,
    required this.tiers,
    required this.onAdd,
    required this.onDelete,
  });

  final List<DiscountTier> tiers;
  final void Function(int minAmount, double percent) onAdd;
  final void Function(String id) onDelete;

  @override
  Widget build(BuildContext context) {
    if (tiers.isEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            context.l10n.management_pricingTiersEmpty,
            style: context.text.bodyS.copyWith(color: context.colors.textSecondary),
          ),
          const SizedBox(height: AppSpacing.s),
          AppButton.secondary(
            text: context.l10n.management_pricingAddTier,
            onPressed: () => _showAddTierDialog(context),
          ),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppCard.sections(
          sections: [
            for (final t in tiers)
              Row(
                children: [
                  Expanded(
                    child: Text(
                      context.l10n.management_pricingTierRow(formatMoneyPlain(t.minAmount)),
                      style: context.text.titleS,
                    ),
                  ),
                  Text('${formatPercent(t.percent)}%', style: context.text.bodyL),
                  const SizedBox(width: AppSpacing.s),
                  AppIconButton.muted(
                    icon: AppIcons.trash,
                    semanticLabel: context.l10n.common_delete,
                    onPressed: () => onDelete(t.id),
                  ),
                ],
              ),
          ],
        ),
        const SizedBox(height: AppSpacing.m),
        AppButton.secondary(
          text: context.l10n.management_pricingAddTier,
          onPressed: () => _showAddTierDialog(context),
        ),
      ],
    );
  }

  Future<void> _showAddTierDialog(BuildContext context) async {
    final minCtrl = TextEditingController();
    final pctCtrl = TextEditingController();
    final result = await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
        child: AppBottomSheet(
          title: context.l10n.management_pricingAddTier,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppTextField(
                controller: minCtrl,
                type: AppTextFieldType.number,
                hintText: context.l10n.management_pricingTierMinAmount,
              ),
              const SizedBox(height: AppSpacing.m),
              AppTextField(
                controller: pctCtrl,
                type: AppTextFieldType.number,
                hintText: context.l10n.management_pricingTierPercent,
              ),
            ],
          ),
          action: AppButton(
            text: context.l10n.management_pricingTierSave,
            onPressed: () => Navigator.pop(context, true),
          ),
        ),
      ),
    );
    if (result != true) return;
    final min = int.tryParse(minCtrl.text.trim());
    final pct = double.tryParse(pctCtrl.text.trim());
    if (min != null && pct != null) onAdd(min, pct);
  }
}
