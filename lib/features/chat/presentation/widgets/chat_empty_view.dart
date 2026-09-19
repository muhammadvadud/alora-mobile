import 'package:flutter/material.dart';
import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
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

    // Kichik ekran/klaviatura ochiq holatda overflow bo'lmasligi uchun scroll.
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.l),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              l10n.chat_emptyTitle,
              style: text.displayM.copyWith(color: colors.textPrimary),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.xl),
            Wrap(
              spacing: AppSpacing.s,
              // AppChip 48 dp bosish maydoniga ega (§7.3) — qatorlar orasi shunga mos.
              runSpacing: AppSpacing.xs,
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
