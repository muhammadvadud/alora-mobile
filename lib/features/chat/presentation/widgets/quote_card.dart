import 'package:flutter/material.dart';
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
          _buildHeader(context),
          if (quote.fabrics.isNotEmpty) _buildFabricsSection(context),
          if (quote.accessories.isNotEmpty) _buildAccessoriesSection(context),
          if (quote.services.isNotEmpty) _buildServicesSection(context),
          _buildWarnings(context),
          _buildFormula(context),
          _buildTotalSection(context),
          _buildActions(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final colors = context.colors;
    final typography = context.text;
    final m = widget.quote.measurement;

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

  Widget _buildFabricsSection(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final fabrics = widget.quote.fabrics;

    final displayCount = _showAllFabrics
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
          ...fabrics.take(displayCount).map((f) => _buildFabricRow(context, f)),
          if (hiddenCount > 0)
            TextButton(
              onPressed: () => setState(() => _showAllFabrics = true),
              child: Text(l10n.chat_quote_more(hiddenCount)),
            ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildFabricRow(BuildContext context, QuoteFabric f) {
    final colors = context.colors;
    final typography = context.text;

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
                        borderRadius: BorderRadius.circular(4),
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
                  '${f.widthM} m × ${f.heightM} m · K ${f.coef} · ${f.pricePerSqm}/m²',
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
              f.total.toString(),
              style: typography.bodyS.copyWith(fontWeight: FontWeight.w500),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAccessoriesSection(BuildContext context) {
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
          ...widget.quote.accessories.map((a) {
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
                      a.total.toString(),
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

  Widget _buildServicesSection(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final typography = context.text;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionLabel(l10n.chat_quote_services),
          const SizedBox(height: 8),
          ...widget.quote.services.map((s) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                children: [
                  Expanded(child: Text(s.name, style: typography.bodyS)),
                  SizedBox(
                    width: 82,
                    child: Text(
                      s.total.toString(),
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

  Widget _buildWarnings(BuildContext context) {
    if (widget.quote.wasteWarnings.isEmpty) return const SizedBox.shrink();
    final colors = context.colors;
    final typography = context.text;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: widget.quote.wasteWarnings.map((w) {
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

  Widget _buildFormula(BuildContext context) {
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
          widget.quote.formula,
          style: typography.bodyS.copyWith(color: colors.textSecondary),
        ),
      ],
    );
  }

  Widget _buildTotalSection(BuildContext context) {
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
          MoneyText(amount: widget.quote.total, style: typography.displayM),
        ],
      ),
    );
  }

  Widget _buildActions(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
      child: Row(
        children: [
          Expanded(
            child: AppButton.secondary(
              text: l10n.chat_quote_addPart,
              onPressed: widget.onAddPart,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: AppButton.secondary(
              text: l10n.chat_quote_showOptions,
              onPressed: widget.onShowOptions,
            ),
          ),
        ],
      ),
    );
  }
}
