import "package:alora_mobile/app/theme/app_spacing.dart";
import 'package:flutter/material.dart';
import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/shared/widgets/suggestion_chip.dart';

class ChatEmptyView extends StatelessWidget {
  final ValueChanged<String> onChipSelected;

  const ChatEmptyView({super.key, required this.onChipSelected});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final options = [
      (title: l10n.chat_start_livingRoom, subtitle: l10n.chat_start_livingRoom_sub),
      (title: l10n.chat_start_bedroom, subtitle: l10n.chat_start_bedroom_sub),
      (title: l10n.chat_start_couple, subtitle: l10n.chat_start_couple_sub),
      (title: l10n.chat_start_kitchen, subtitle: l10n.chat_start_kitchen_sub),
      (title: l10n.chat_start_kids, subtitle: l10n.chat_start_kids_sub),
      (title: l10n.chat_start_office, subtitle: l10n.chat_start_office_sub),
    ];

    // SuggestionChip gorizontal karuseli, gap 12, chetdan 12.
    // However, they can be two rows? Spec:
    // "pastda SuggestionChip gorizontal karuseli (mavjud 6 boshlang'ich chip → title + subtitle, gap 12, chetdan 12)"
    // If it's a carousel, maybe horizontal list. Wait, in S-02 image, is it one row or two? The spec says "gorizontal karuseli", which implies a horizontal scrolling list, but maybe we can just make it one row, or a wrap inside a horizontal scroll?
    // Let's use ListView with scrollDirection: horizontal. But standard S-02 has 2 rows in the design usually? Spec: "pastda SuggestionChip gorizontal karuseli (mavjud 6 boshlang'ich chip → title + subtitle, gap 12, chetdan 12)"
    // If it's 2 rows, we can build a GridView with horizontal scroll.
    // "2 qatorli suggestion chip karuseli" is mentioned in 6.9 or something?
    // Wait, Tasks.md 6.9: "S-02 bo'sh chat — "Mijoz nima izlayapti?", boshlash chip'lari" (which is old).
    // Tasks.md 21.3 says: "suggestion chip karuseli".
    // Let's check rules.md §6: "pastda 2 qatorli suggestion chip karuseli + input paneli" for S-02.

    return Column(
      mainAxisAlignment: MainAxisAlignment.end, // Align to bottom
      children: [
        SizedBox(
          height: 156, // 2 qator x 72 balandlik + 12 gap = 156
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.m),
            itemCount: (options.length / 2).ceil(),
            separatorBuilder: (context, index) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final firstIndex = index * 2;
              final secondIndex = firstIndex + 1;

              return SizedBox(
                width: 180, // roughly half screen width minus padding
                child: Column(
                  children: [
                    if (firstIndex < options.length)
                      SuggestionChip(
                        title: options[firstIndex].title,
                        subtitle: options[firstIndex].subtitle,
                        onTap: () => onChipSelected(options[firstIndex].title),
                      ),
                    if (secondIndex < options.length) ...[
                      const SizedBox(height: 12),
                      SuggestionChip(
                        title: options[secondIndex].title,
                        subtitle: options[secondIndex].subtitle,
                        onTap: () => onChipSelected(options[secondIndex].title),
                      ),
                    ],
                  ],
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
