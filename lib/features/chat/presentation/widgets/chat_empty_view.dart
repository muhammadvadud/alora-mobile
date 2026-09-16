import 'package:flutter/material.dart';
import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/shared/widgets/app_chip.dart';

class ChatEmptyView extends StatelessWidget {
  final ValueChanged<String> onChipSelected;

  const ChatEmptyView({super.key, required this.onChipSelected});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final text = context.text;
    final colors = context.colors;

    final options = [
      l10n.chat_start_livingRoom,
      l10n.chat_start_bedroom,
      l10n.chat_start_couple,
      l10n.chat_start_kitchen,
      l10n.chat_start_kids,
      l10n.chat_start_office,
    ];

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              l10n.chat_emptyTitle,
              style: text.displayM.copyWith(color: colors.textPrimary),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Wrap(
              spacing: 8,
              runSpacing: 12,
              alignment: WrapAlignment.center,
              children: options.map((opt) {
                return AppChip(label: opt, onTap: () => onChipSelected(opt));
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
