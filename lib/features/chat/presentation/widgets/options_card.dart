import "package:alora_mobile/app/theme/app_spacing.dart";
import 'package:flutter/material.dart';
import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/theme/app_radius.dart';
import 'package:alora_mobile/features/chat/domain/entities/pricing_option.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/shared/widgets/app_radio.dart';
import 'package:alora_mobile/shared/widgets/money_text.dart';
import 'package:alora_mobile/shared/widgets/app_button.dart';

class OptionsCardView extends StatefulWidget {
  final PricingOptions optionsBlock;
  final ValueChanged<PricingOption>? onSelect;

  const OptionsCardView({super.key, required this.optionsBlock, this.onSelect});

  @override
  State<OptionsCardView> createState() => _OptionsCardViewState();
}

class _OptionsCardViewState extends State<OptionsCardView> {
  PricingTier? _selectedTier;

  @override
  void initState() {
    super.initState();
    // Default to mid tier
    final options = widget.optionsBlock.options;
    if (options.isNotEmpty) {
      final midIdx = options.indexWhere((o) => o.tier == PricingTier.mid);
      _selectedTier = midIdx != -1 ? PricingTier.mid : options.first.tier;
    }
  }

  @override
  Widget build(BuildContext context) {
    final options = widget.optionsBlock.options;
    if (options.isEmpty) return const SizedBox.shrink();

    // S-06 planshet: 3 ustun yonma-yon? Wait, the spec says S-07 is Variantlar, walmart_order radio ro'yxati uslubi.
    // If it's tablet, we can still show a vertical list or grid. Let's just use vertical list as per S-07.
    // But rules.md §6 S-06 says: Chat — uchta variant (yorug'/qorong'i/planshet) 1f, 5b, 5c.
    // If tablet (width >= 840), we can show them side by side.

    final screenWidth = MediaQuery.sizeOf(context).width;
    final isTablet = screenWidth >= 840;

    Widget content;
    if (isTablet) {
      content = Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: options.map((opt) {
          final isSelected = opt.tier == _selectedTier;
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s),
              child: _OptionCardItem(
                option: opt,
                isSelected: isSelected,
                onTap: () {
                  setState(() => _selectedTier = opt.tier);
                },
              ),
            ),
          );
        }).toList(),
      );
      content = IntrinsicHeight(child: content);
    } else {
      content = Column(
        mainAxisSize: MainAxisSize.min,
        children: options.map((opt) {
          final isSelected = opt.tier == _selectedTier;
          return Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.m),
            child: _OptionCardItem(
              option: opt,
              isSelected: isSelected,
              onTap: () {
                setState(() => _selectedTier = opt.tier);
              },
            ),
          );
        }).toList(),
      );
    }

    final l10n = AppLocalizations.of(context)!;
    final selectedOption = options.firstWhere(
      (o) => o.tier == _selectedTier,
      orElse: () => options.first,
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        content,
        const SizedBox(height: 4),
        AppButton.secondary(
          text: l10n.chat_options_select,
          onPressed: widget.onSelect != null ? () => widget.onSelect!(selectedOption) : null,
        ),
      ],
    );
  }
}

class _OptionCardItem extends StatelessWidget {
  final PricingOption option;
  final bool isSelected;
  final VoidCallback onTap;

  const _OptionCardItem({required this.option, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.text;

    return Semantics(
      button: true,
      selected: isSelected,
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Container(
          padding: const EdgeInsets.all(AppSpacing.l),
          decoration: BoxDecoration(
            color: colors.surface,
            borderRadius: AppRadius.cardBorder,
            border: Border.all(
              color: isSelected ? colors.info : colors.border,
              width: isSelected ? 1.5 : 1.0,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppRadio(isSelected: isSelected),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      option.title,
                      style: typography.overline.copyWith(color: colors.textSecondary),
                    ),
                    const SizedBox(height: 8),
                    MoneyText(amount: option.total, style: typography.titleL),
                    if (option.difference != null && option.difference! != 0) ...[
                      const SizedBox(height: 4),
                      Text(
                        option.difference! > 0
                            ? '+${option.difference} so\'m'
                            : '${option.difference} so\'m',
                        style: typography.bodyS.copyWith(
                          color: option.difference! > 0 ? colors.textSecondary : colors.success,
                        ),
                      ),
                    ],
                    const SizedBox(height: 12),
                    _OptionLinesList(lines: option.lines),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _OptionLinesList extends StatelessWidget {
  final List<PricingOptionLine> lines;

  const _OptionLinesList({required this.lines});

  @override
  Widget build(BuildContext context) {
    final typography = context.text;
    final colors = context.colors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: lines.map((line) {
        return Padding(
          padding: const EdgeInsets.only(bottom: AppSpacing.xs),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('• ', style: typography.bodyS.copyWith(color: colors.textSecondary)),
              Expanded(child: Text('${line.title}: ${line.value}', style: typography.bodyS)),
            ],
          ),
        );
      }).toList(),
    );
  }
}
