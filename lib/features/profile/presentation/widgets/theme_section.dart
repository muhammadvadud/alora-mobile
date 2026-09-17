import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/app/theme/theme_mode_notifier.dart';
import 'package:alora_mobile/shared/widgets/app_chip.dart';

/// Mavzu tanlash (S-25): Tizim / Yorug' / Qorong'i.
class ThemeSection extends ConsumerWidget {
  const ThemeSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final themeMode = ref.watch(themeModeProvider);
    final notifier = ref.read(themeModeProvider.notifier);

    return Wrap(
      spacing: AppSpacing.s,
      runSpacing: AppSpacing.s,
      children: [
        AppChip(
          label: l10n.profile_themeSystem,
          onTap: () => notifier.setThemeMode(ThemeMode.system),
          state: themeMode == ThemeMode.system
              ? AppChipState.selected
              : AppChipState.unselected,
        ),
        AppChip(
          label: l10n.profile_themeLight,
          onTap: () => notifier.setThemeMode(ThemeMode.light),
          state: themeMode == ThemeMode.light
              ? AppChipState.selected
              : AppChipState.unselected,
        ),
        AppChip(
          label: l10n.profile_themeDark,
          onTap: () => notifier.setThemeMode(ThemeMode.dark),
          state: themeMode == ThemeMode.dark
              ? AppChipState.selected
              : AppChipState.unselected,
        ),
      ],
    );
  }
}
