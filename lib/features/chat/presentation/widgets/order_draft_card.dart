import 'package:flutter/material.dart';
import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/features/chat/domain/entities/order_draft.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/shared/widgets/app_button.dart';
import 'package:alora_mobile/shared/icons/app_icons.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/shared/widgets/app_card.dart';

class OrderDraftCardView extends StatelessWidget {
  final OrderDraft draft;
  final VoidCallback? onEdit;
  final VoidCallback? onCreate;

  const OrderDraftCardView({super.key, required this.draft, this.onEdit, this.onCreate});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.l),
      child: AppCard.sections(
        sections: [
          _DraftHeaderSection(),
          _DraftFieldsSection(draft: draft),
          if (draft.missingFields.isNotEmpty) _DraftMissingFieldsSection(draft: draft),
          _DraftActionsSection(draft: draft, onEdit: onEdit, onCreate: onCreate),
        ],
      ),
    );
  }
}

class _DraftHeaderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.text;
    final l10n = AppLocalizations.of(context)!;
    return Text(
      l10n.chat_draft_title,
      style: typography.titleM.copyWith(color: colors.textPrimary),
    );
  }
}

class _DraftFieldsSection extends StatelessWidget {
  final OrderDraft draft;
  const _DraftFieldsSection({required this.draft});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.text;
    final l10n = AppLocalizations.of(context)!;

    final fields = <Widget>[];

    // Bo'sh maydon ham ko'rsatiladi — «—» `danger` rangda (SPEC §5, S-07).
    void addField(String label, String? value) {
      final isMissing = value == null || value.isEmpty;
      final valueColor = isMissing ? colors.danger : colors.textPrimary;
      final shown = isMissing ? '—' : value;
      {
        fields.add(
          Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.s),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    label,
                    style: typography.titleS.copyWith(color: colors.textSecondary),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(shown, style: typography.bodyL.copyWith(color: valueColor)),
                ),
              ],
            ),
          ),
        );
      }
    }

    addField(l10n.chat_draft_customer, draft.customerName);
    addField(l10n.chat_draft_phone, draft.phone);
    addField(l10n.chat_draft_address, draft.address);

    if (fields.isEmpty) return const SizedBox.shrink();
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: fields);
  }
}

class _DraftMissingFieldsSection extends StatelessWidget {
  final OrderDraft draft;
  const _DraftMissingFieldsSection({required this.draft});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.text;
    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(AppIcons.alertTriangle, size: AppSpacing.l, color: colors.danger),
            const SizedBox(width: AppSpacing.s),
            Text(
              l10n.chat_draft_missingFields,
              style: typography.labelS.copyWith(color: colors.danger),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.xs),
        ...draft.missingFields.map(
          (f) => Padding(
            padding: const EdgeInsets.only(left: AppSpacing.xl, bottom: 2.0),
            child: Text('• $f', style: typography.bodyS.copyWith(color: colors.danger)),
          ),
        ),
      ],
    );
  }
}

class _DraftActionsSection extends StatelessWidget {
  final OrderDraft draft;
  final VoidCallback? onEdit;
  final VoidCallback? onCreate;

  const _DraftActionsSection({required this.draft, this.onEdit, this.onCreate});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isComplete = draft.missingFields.isEmpty;

    return Row(
      children: [
        Expanded(
          child: AppButton.secondary(text: l10n.chat_draft_edit, onPressed: onEdit),
        ),
        const SizedBox(width: AppSpacing.s),
        Expanded(
          child: AppButton(
            text: l10n.chat_draft_createOrder,
            onPressed: isComplete ? onCreate : null,
          ),
        ),
      ],
    );
  }
}
