import 'package:flutter/material.dart';
import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/features/chat/domain/entities/quote.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/shared/widgets/app_button.dart';
import 'package:alora_mobile/shared/widgets/money_text.dart';
import 'package:alora_mobile/shared/icons/app_icons.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/shared/widgets/app_card.dart';
import 'package:alora_mobile/features/chat/presentation/widgets/quote_services_section.dart';
import 'package:alora_mobile/features/chat/presentation/widgets/quote_accessories_section.dart';
import 'package:alora_mobile/features/chat/presentation/widgets/quote_fabrics_section.dart';

class QuoteCardView extends StatefulWidget {
  final Quote quote;
  final VoidCallback? onAddPart;
  final VoidCallback? onShowOptions;

  const QuoteCardView({super.key, required this.quote, this.onAddPart, this.onShowOptions});

  @override
  State<QuoteCardView> createState() => _QuoteCardViewState();
}

class _QuoteCardViewState extends State<QuoteCardView> {
  bool _showAllFabrics = false;
  bool _showFormula = false;

  @override
  Widget build(BuildContext context) {
    final quote = widget.quote;

    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.l),
      child: AppCard.sections(
        sections: [
          _QuoteHeaderSection(quote: quote),
          if (quote.fabrics.isNotEmpty)
            QuoteFabricsSection(
              quote: quote,
              showAllFabrics: _showAllFabrics,
              onShowMore: () => setState(() => _showAllFabrics = true),
            ),
          if (quote.accessories.isNotEmpty) QuoteAccessoriesSection(quote: quote),
          if (quote.services.isNotEmpty) QuoteServicesSection(quote: quote),
          if (quote.wasteWarnings.isNotEmpty) _QuoteWarningsSection(quote: quote),
          _QuoteFormulaSection(
            quote: quote,
            showFormula: _showFormula,
            onToggle: () => setState(() => _showFormula = !_showFormula),
          ),
          _QuoteTotalSection(
            quote: quote,
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('HISOB · ${m?.room?.toUpperCase() ?? "XONA"}', style: typography.overline.copyWith(color: colors.textSecondary)),
        const SizedBox(height: AppSpacing.xs),
        if (m != null)
          Text(
            '${m.cornice} m × ${m.height} m',
            style: typography.bodyS.copyWith(color: colors.textSecondary),
          ),
      ],
    );
  }
}

class _QuoteWarningsSection extends StatelessWidget {
  final Quote quote;

  const _QuoteWarningsSection({required this.quote});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.text;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: quote.wasteWarnings.map((w) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(AppIcons.alertTriangle, size: AppSpacing.l, color: colors.danger),
            const SizedBox(width: AppSpacing.s),
            Expanded(
              child: Text(w, style: typography.bodyS.copyWith(color: colors.danger)),
            ),
          ],
        );
      }).toList(),
    );
  }
}

class _QuoteFormulaSection extends StatelessWidget {
  final Quote quote;
  final bool showFormula;
  final VoidCallback onToggle;

  const _QuoteFormulaSection({required this.quote, required this.showFormula, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.text;
    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: onToggle,
          behavior: HitTestBehavior.opaque,
          child: Text(
            l10n.chat_quote_howCalculated,
            style: typography.bodyS.copyWith(color: colors.info),
          ),
        ),
        if (showFormula) ...[
          const SizedBox(height: AppSpacing.s),
          Text(quote.formula, style: typography.bodyS.copyWith(color: colors.textSecondary)),
        ]
      ],
    );
  }
}

class _QuoteTotalSection extends StatelessWidget {
  final Quote quote;
  final VoidCallback? onAddPart;
  final VoidCallback? onShowOptions;

  const _QuoteTotalSection({required this.quote, this.onAddPart, this.onShowOptions});

  @override
  Widget build(BuildContext context) {
    final typography = context.text;
    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(l10n.chat_quote_total, style: typography.titleM),
            MoneyText(amount: quote.total, style: typography.displayM),
          ],
        ),
        const SizedBox(height: AppSpacing.m),
        Row(
          children: [
            Expanded(
              child: AppButton.secondary(text: l10n.chat_quote_addPart, onPressed: onAddPart),
            ),
            const SizedBox(width: AppSpacing.s),
            Expanded(
              child: AppButton.secondary(text: l10n.chat_quote_showOptions, onPressed: onShowOptions),
            ),
          ],
        ),
      ],
    );
  }
}
