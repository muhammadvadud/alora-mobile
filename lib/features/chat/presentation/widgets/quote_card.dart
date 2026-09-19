import 'package:flutter/material.dart';
import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/theme/app_radius.dart';
import 'package:alora_mobile/features/chat/domain/entities/quote.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/shared/widgets/app_button.dart';
import 'package:alora_mobile/shared/widgets/money_text.dart';
import 'package:alora_mobile/shared/icons/app_icons.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/features/chat/presentation/widgets/quote_services_section.dart';
import 'package:alora_mobile/features/chat/presentation/widgets/quote_accessories_section.dart';
import 'package:alora_mobile/features/chat/presentation/widgets/quote_fabrics_section.dart';

class QuoteCardView extends StatefulWidget {
  final Quote quote;
  final VoidCallback? onAddPart;
  final VoidCallback? onShowOptions;

  const QuoteCardView({
    super.key,
    required this.quote,
    this.onAddPart,
    this.onShowOptions,
  });

  @override
  State<QuoteCardView> createState() => _QuoteCardViewState();
}

class _QuoteCardViewState extends State<QuoteCardView> {
  bool _showAllFabrics = false;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final quote = widget.quote;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: AppRadius.cardBorder,
        border: Border.all(color: colors.border, width: 1.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _QuoteHeaderSection(quote: quote),
          if (quote.fabrics.isNotEmpty)
            QuoteFabricsSection(
              quote: quote,
              showAllFabrics: _showAllFabrics,
              onShowMore: () => setState(() => _showAllFabrics = true),
            ),
          if (quote.accessories.isNotEmpty)
            QuoteAccessoriesSection(quote: quote),
          if (quote.services.isNotEmpty) QuoteServicesSection(quote: quote),
          _QuoteWarningsSection(quote: quote),
          _QuoteFormulaSection(quote: quote),
          _QuoteTotalSection(quote: quote),
          _QuoteActionsSection(
            onAddPart: widget.onAddPart,
            onShowOptions: widget.onShowOptions,
          ),
        ],
      ),
    );
  }
}

class _QuoteHeaderSection extends StatelessWidget {
  final Quote quote;

  const _QuoteHeaderSection({required this.quote});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.text;
    final m = quote.measurement;

    return Padding(
      padding: const EdgeInsets.all(AppSpacing.l),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'HISOB · ${m?.room?.toUpperCase() ?? "XONA"}',
            style: typography.overline,
          ),
          const SizedBox(height: AppSpacing.xs),
          if (m != null)
            Text(
              '${m.cornice} m × ${m.height} m',
              style: typography.bodyS.copyWith(color: colors.textSecondary),
            ),
        ],
      ),
    );
  }
}

class _QuoteWarningsSection extends StatelessWidget {
  final Quote quote;

  const _QuoteWarningsSection({required this.quote});

  @override
  Widget build(BuildContext context) {
    if (quote.wasteWarnings.isEmpty) return const SizedBox.shrink();
    final colors = context.colors;
    final typography = context.text;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: quote.wasteWarnings.map((w) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(AppIcons.alertTriangle, size: 16, color: colors.danger),
              const SizedBox(width: AppSpacing.s),
              Expanded(
                child: Text(
                  w,
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

class _QuoteFormulaSection extends StatelessWidget {
  final Quote quote;

  const _QuoteFormulaSection({required this.quote});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.text;
    final l10n = AppLocalizations.of(context)!;

    return ExpansionTile(
      shape: const Border(),
      collapsedShape: const Border(),
      title: Text(
        l10n.chat_quote_howCalculated,
        style: typography.bodyS.copyWith(color: colors.accent),
      ),
      iconColor: colors.accent,
      collapsedIconColor: colors.accent,
      tilePadding: const EdgeInsets.symmetric(horizontal: AppSpacing.l),
      childrenPadding: const EdgeInsets.only(
        left: AppSpacing.l,
        right: AppSpacing.l,
        bottom: AppSpacing.l,
      ),
      children: [
        Text(
          quote.formula,
          style: typography.bodyS.copyWith(color: colors.textSecondary),
        ),
      ],
    );
  }
}

class _QuoteTotalSection extends StatelessWidget {
  final Quote quote;

  const _QuoteTotalSection({required this.quote});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.text;
    final l10n = AppLocalizations.of(context)!;

    return Container(
      padding: const EdgeInsets.all(AppSpacing.l),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: colors.textPrimary, width: 1.0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(l10n.chat_quote_total, style: typography.labelM),
          MoneyText(amount: quote.total, style: typography.displayM),
        ],
      ),
    );
  }
}

class _QuoteActionsSection extends StatelessWidget {
  final VoidCallback? onAddPart;
  final VoidCallback? onShowOptions;

  const _QuoteActionsSection({this.onAddPart, this.onShowOptions});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
      child: Row(
        children: [
          Expanded(
            child: AppButton.secondary(
              text: l10n.chat_quote_addPart,
              onPressed: onAddPart,
            ),
          ),
          const SizedBox(width: AppSpacing.s),
          Expanded(
            child: AppButton.secondary(
              text: l10n.chat_quote_showOptions,
              onPressed: onShowOptions,
            ),
          ),
        ],
      ),
    );
  }
}
