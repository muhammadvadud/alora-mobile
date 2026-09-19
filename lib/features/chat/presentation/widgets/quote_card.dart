import 'package:flutter/material.dart';
import 'package:alora_mobile/core/utils/money_format.dart';
import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/theme/app_radius.dart';
import 'package:alora_mobile/features/chat/domain/entities/quote.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/shared/widgets/app_button.dart';
import 'package:alora_mobile/shared/widgets/color_dot.dart';
import 'package:alora_mobile/shared/widgets/money_text.dart';
import 'package:alora_mobile/shared/widgets/section_label.dart';
import 'package:alora_mobile/shared/icons/app_icons.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';

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
            _QuoteFabricsSection(
              quote: quote,
              showAllFabrics: _showAllFabrics,
              onShowMore: () => setState(() => _showAllFabrics = true),
            ),
          if (quote.accessories.isNotEmpty)
            _QuoteAccessoriesSection(quote: quote),
          if (quote.services.isNotEmpty) _QuoteServicesSection(quote: quote),
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
          const SizedBox(height: 4),
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

class _QuoteFabricsSection extends StatelessWidget {
  final Quote quote;
  final bool showAllFabrics;
  final VoidCallback onShowMore;

  const _QuoteFabricsSection({
    required this.quote,
    required this.showAllFabrics,
    required this.onShowMore,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final fabrics = quote.fabrics;

    final displayCount = showAllFabrics
        ? fabrics.length
        : (fabrics.length > 6 ? 4 : fabrics.length);
    final hiddenCount = fabrics.length - displayCount;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionLabel(l10n.chat_quote_fabrics),
          const SizedBox(height: 8),
          ...fabrics.take(displayCount).map((f) => _FabricRow(fabric: f)),
          if (hiddenCount > 0)
            TextButton(
              onPressed: onShowMore,
              child: Text(l10n.chat_quote_more(hiddenCount)),
            ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _FabricRow extends StatelessWidget {
  final QuoteFabric fabric;

  const _FabricRow({required this.fabric});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.text;
    final f = fabric;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: colors.surfaceMuted,
                        borderRadius: AppRadius.smallBorder,
                      ),
                      child: Text(
                        f.role,
                        style: typography.labelS.copyWith(
                          color: colors.textSecondary,
                        ),
                      ),
                    ),
                    const SizedBox(width: 4),
                    if (f.colorHex.isNotEmpty) ...[
                      ColorDot(colorHex: f.colorHex, size: 10),
                      const SizedBox(width: 4),
                    ],
                    Expanded(
                      child: Text(
                        f.colorName,
                        style: typography.bodyS,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  '${f.widthM} m × ${f.heightM} m · K ${f.coef} · ${formatMoneyPlain(f.pricePerSqm)}/m²',
                  style: typography.bodyS.copyWith(color: colors.textSecondary),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 44,
            child: Text(
              '${f.areaSqm} m²',
              style: typography.bodyS.copyWith(color: colors.textSecondary),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: 82,
            child: Text(
              formatMoneyPlain(f.total),
              style: typography.bodyS.copyWith(fontWeight: FontWeight.w500),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}

class _QuoteAccessoriesSection extends StatelessWidget {
  final Quote quote;

  const _QuoteAccessoriesSection({required this.quote});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final typography = context.text;
    final colors = context.colors;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionLabel(l10n.chat_quote_accessories),
          const SizedBox(height: 8),
          ...quote.accessories.map((a) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                children: [
                  Expanded(child: Text(a.name, style: typography.bodyS)),
                  SizedBox(
                    width: 44,
                    child: Text(
                      '${a.qty} ${a.unit}',
                      style: typography.bodyS.copyWith(
                        color: colors.textSecondary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    width: 82,
                    child: Text(
                      formatMoneyPlain(a.total),
                      style: typography.bodyS.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            );
          }),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _QuoteServicesSection extends StatelessWidget {
  final Quote quote;

  const _QuoteServicesSection({required this.quote});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final typography = context.text;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionLabel(l10n.chat_quote_services),
          const SizedBox(height: 8),
          ...quote.services.map((s) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                children: [
                  Expanded(child: Text(s.name, style: typography.bodyS)),
                  SizedBox(
                    width: 82,
                    child: Text(
                      formatMoneyPlain(s.total),
                      style: typography.bodyS.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            );
          }),
          const SizedBox(height: 16),
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
              const SizedBox(width: 8),
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
          const SizedBox(width: 8),
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
