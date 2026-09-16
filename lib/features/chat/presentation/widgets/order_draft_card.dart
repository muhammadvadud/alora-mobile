import 'package:flutter/material.dart';
import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/theme/app_radius.dart';
import 'package:alora_mobile/features/chat/domain/entities/order_draft.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/shared/widgets/app_button.dart';
import 'package:alora_mobile/shared/widgets/money_text.dart';
import 'package:alora_mobile/shared/icons/app_icons.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';

class OrderDraftCardView extends StatelessWidget {
  final OrderDraft draft;
  final VoidCallback? onEdit;
  final VoidCallback? onCreate;

  const OrderDraftCardView({
    super.key,
    required this.draft,
    this.onEdit,
    this.onCreate,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.text;
    final l10n = AppLocalizations.of(context)!;

    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.l),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: AppRadius.cardBorder,
        border: Border.all(color: colors.border, width: 1.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(AppSpacing.l),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(l10n.chat_draft_title, style: typography.overline),
                MoneyText(amount: draft.total, style: typography.titleM),
              ],
            ),
          ),

          if (draft.missingFields.isNotEmpty)
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.l,
                vertical: AppSpacing.m,
              ),
              color: colors.dangerSoft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: draft.missingFields.map((f) {
                  return Row(
                    children: [
                      Icon(
                        AppIcons.alertTriangle,
                        size: 16,
                        color: colors.danger,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          f,
                          style: typography.bodyS.copyWith(
                            color: colors.danger,
                          ),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),

          Padding(
            padding: const EdgeInsets.all(AppSpacing.l),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildField(context, 'Mijoz', draft.customerName),
                _buildField(context, 'Telefon', draft.phone),
                _buildField(context, 'Manzil', draft.address),
                _buildField(
                  context,
                  'Xonalar',
                  draft.measurements
                      .map((m) => m.roomName ?? 'Noma\'lum')
                      .join(', '),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(
              left: AppSpacing.l,
              right: AppSpacing.l,
              bottom: AppSpacing.l,
            ),
            child: Row(
              children: [
                Expanded(
                  child: AppButton.secondary(
                    text: l10n.chat_draft_edit,
                    onPressed: onEdit,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: AppButton(
                    text: l10n.chat_draft_createOrder,
                    onPressed: draft.missingFields.isEmpty ? onCreate : null,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildField(BuildContext context, String label, String? value) {
    if (value == null || value.isEmpty) return const SizedBox.shrink();
    final typography = context.text;
    final colors = context.colors;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              label,
              style: typography.bodyS.copyWith(color: colors.textSecondary),
            ),
          ),
          Expanded(child: Text(value, style: typography.bodyS)),
        ],
      ),
    );
  }
}
