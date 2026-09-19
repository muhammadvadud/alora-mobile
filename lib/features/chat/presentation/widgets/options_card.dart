import 'package:flutter/material.dart';
import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/theme/app_radius.dart';
import 'package:alora_mobile/features/chat/domain/entities/pricing_option.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/shared/widgets/app_button.dart';
import 'package:alora_mobile/shared/widgets/money_text.dart';

class OptionsCardView extends StatefulWidget {
  final PricingOptions optionsBlock;
  final ValueChanged<PricingOption>? onSelect;

  const OptionsCardView({super.key, required this.optionsBlock, this.onSelect});

  @override
  State<OptionsCardView> createState() => _OptionsCardViewState();
}

class _OptionsCardViewState extends State<OptionsCardView> {
  late PageController _pageController;
  int _currentIndex = 1; // mid is usually index 1

  @override
  void initState() {
    super.initState();
    // find mid index if exists
    final options = widget.optionsBlock.options;
    int initialPage = 0;
    if (options.isNotEmpty) {
      final midIdx = options.indexWhere((o) => o.tier == PricingTier.mid);
      initialPage = midIdx != -1 ? midIdx : 0;
    }
    _currentIndex = initialPage;
    _pageController = PageController(
      viewportFraction: 0.86,
      initialPage: initialPage,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final options = widget.optionsBlock.options;
    if (options.isEmpty) return const SizedBox.shrink();

    // Responsive check for tablet (S-06 5b)
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isTablet = screenWidth >= 840;

    if (isTablet) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: options.map((opt) {
          final isSelected = opt.tier == PricingTier.mid;
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: _OptionCardItem(
                option: opt,
                isSelected: isSelected,
                onSelect: widget.onSelect,
              ),
            ),
          );
        }).toList(),
      );
    }

    return SizedBox(
      height: 320,
      child: PageView.builder(
        controller: _pageController,
        onPageChanged: (idx) {
          setState(() {
            _currentIndex = idx;
          });
        },
        itemCount: options.length,
        itemBuilder: (context, index) {
          final isSelected = index == _currentIndex;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            margin: EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: isSelected ? 8.0 : 16.0,
            ),
            child: _OptionCardItem(
              option: options[index],
              isSelected: isSelected,
              onSelect: widget.onSelect,
            ),
          );
        },
      ),
    );
  }
}

class _OptionCardItem extends StatelessWidget {
  final PricingOption option;
  final bool isSelected;
  final ValueChanged<PricingOption>? onSelect;

  const _OptionCardItem({
    required this.option,
    required this.isSelected,
    this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 15),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: AppRadius.cardBorder,
        border: Border.all(
          color: isSelected ? colors.accent : colors.border,
          width: isSelected ? 1.5 : 1.0,
        ),
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: colors.accent.withValues(alpha: 0.09),
                  blurRadius: 3,
                  spreadRadius: 3,
                ),
              ]
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _OptionHeader(option: option),
          const SizedBox(height: 16),
          Expanded(child: _OptionLinesList(lines: option.lines)),
          const SizedBox(height: 16),
          _OptionAction(option: option, onSelect: onSelect),
        ],
      ),
    );
  }
}

class _OptionHeader extends StatelessWidget {
  final PricingOption option;

  const _OptionHeader({required this.option});

  @override
  Widget build(BuildContext context) {
    final typography = context.text;
    final colors = context.colors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          option.title.toUpperCase(),
          style: typography.overline.copyWith(color: colors.textSecondary),
        ),
        const SizedBox(height: 8),
        MoneyText(amount: option.total, style: typography.displayM),
        if (option.difference != null && option.difference! != 0) ...[
          const SizedBox(height: 4),
          Text(
            option.difference! > 0
                ? '+${option.difference} so\'m'
                : '${option.difference} so\'m',
            style: typography.bodyS.copyWith(
              color: option.difference! > 0
                  ? colors.textSecondary
                  : colors.success,
            ),
          ),
        ],
      ],
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

    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: lines.length,
      separatorBuilder: (context, index) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final line = lines[index];
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '• ',
              style: typography.bodyS.copyWith(color: colors.textSecondary),
            ),
            Expanded(
              child: Text(
                '${line.title}: ${line.value}',
                style: typography.bodyS,
              ),
            ),
          ],
        );
      },
    );
  }
}

class _OptionAction extends StatelessWidget {
  final PricingOption option;
  final ValueChanged<PricingOption>? onSelect;

  const _OptionAction({required this.option, this.onSelect});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return AppButton.secondary(
      text: l10n.chat_options_select,
      onPressed: onSelect != null ? () => onSelect!(option) : null,
    );
  }
}
