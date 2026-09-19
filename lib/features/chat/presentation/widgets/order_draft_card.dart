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
          _DraftHeader(draft: draft),
          if (draft.missingFields.isNotEmpty)
            _DraftWarnings(missingFields: draft.missingFields),
          _DraftFieldsSection(draft: draft),
          _DraftActionsSection(
            draft: draft,
            onEdit: onEdit,
            onCreate: onCreate,
          ),
        ],
      ),
    );
  }
}

class _DraftHeader extends StatelessWidget {
  final OrderDraft draft;

  const _DraftHeader({required this.draft});

  @override
  Widget build(BuildContext context) {
    final typography = context.text;
    final l10n = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.all(AppSpacing.l),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(l10n.chat_draft_title, style: typography.overline),
          MoneyText(amount: draft.total, style: typography.titleM),
        ],
      ),
    );
  }
}

class _DraftWarnings extends StatelessWidget {
  final List<String> missingFields;

  const _DraftWarnings({required this.missingFields});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.text;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.l,
        vertical: AppSpacing.m,
      ),
      color: colors.dangerSoft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: missingFields.map((f) {
          return Row(
            children: [
              Icon(AppIcons.alertTriangle, size: 16, color: colors.danger),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  f,
                  style: typography.bodyS.copyWith(color: colors.danger),
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}

class _DraftFieldsSection extends StatelessWidget {
  final OrderDraft draft;

  const _DraftFieldsSection({required this.draft});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.l),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _DraftField(label: 'Mijoz', value: draft.customerName),
          _DraftField(label: 'Telefon', value: draft.phone),
          _DraftField(label: 'Manzil', value: draft.address),
          _DraftField(
            label: 'Xonalar',
            value: draft.measurements
                .map((m) => m.roomName ?? 'Noma\'lum')
                .join(', '),
          ),
        ],
      ),
    );
  }
}

class _DraftField extends StatelessWidget {
  final String label;
  final String? value;

  const _DraftField({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    if (value == null || value!.isEmpty) return const SizedBox.shrink();
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
          Expanded(child: Text(value!, style: typography.bodyS)),
        ],
      ),
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

    return Padding(
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
    );
  }
}
