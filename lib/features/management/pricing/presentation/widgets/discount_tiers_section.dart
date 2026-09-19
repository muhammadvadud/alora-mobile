import 'package:flutter/material.dart';
import 'package:alora_mobile/shared/icons/app_icons.dart';
import 'package:alora_mobile/core/utils/money_format.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/features/management/pricing/domain/entities/discount_tier.dart';
import 'package:alora_mobile/shared/extensions/l10n_extension.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/shared/widgets/app_button.dart';
import 'package:alora_mobile/shared/widgets/app_text_field.dart';

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
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            headingRowHeight: 40,
            dataRowMinHeight: 48,
            dataRowMaxHeight: 48,
            columns: [
              DataColumn(label: Text(context.l10n.management_pricingTierMinAmount)),
              DataColumn(numeric: true, label: Text(context.l10n.management_pricingTierPercent)),
              const DataColumn(label: Text('')),
            ],
            rows: [
              for (final t in tiers)
                DataRow(
                  cells: [
                    DataCell(Text(formatMoney(t.minAmount))),
                    DataCell(Text('${formatPercent(t.percent)}%')),
                    DataCell(
                      Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          icon: Icon(AppIcons.trash, size: 18, color: context.colors.danger),
                          onPressed: () => onDelete(t.id),
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.s),
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
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(context.l10n.management_pricingAddTier),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppTextField(
              controller: minCtrl,
              type: AppTextFieldType.number,
              hintText: context.l10n.management_pricingTierMinAmount,
            ),
            const SizedBox(height: AppSpacing.s),
            AppTextField(
              controller: pctCtrl,
              type: AppTextFieldType.number,
              hintText: context.l10n.management_pricingTierPercent,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(MaterialLocalizations.of(context).cancelButtonLabel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(context.l10n.management_pricingTierSave),
          ),
        ],
      ),
    );
    if (result != true) return;
    final min = int.tryParse(minCtrl.text.trim());
    final pct = double.tryParse(pctCtrl.text.trim());
    if (min != null && pct != null) onAdd(min, pct);
  }
}
