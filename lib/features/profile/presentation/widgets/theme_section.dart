import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/theme/theme_mode_notifier.dart';
import 'package:alora_mobile/shared/icons/app_icons.dart';

import 'profile_radio_group.dart';

/// Mavzu tanlash (S-25): Tizim / Yorug' / Qorong'i.
class ThemeSection extends ConsumerWidget {
  const ThemeSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final themeMode = ref.watch(themeModeProvider);
    final notifier = ref.read(themeModeProvider.notifier);

    return ProfileRadioGroup(
      title: l10n.profile_themeTitle,
      icon: AppIcons.moon,
      options: [
        ProfileRadioOption(
          label: l10n.profile_themeSystem,
          isSelected: themeMode == ThemeMode.system,
          onSelect: () => notifier.setThemeMode(ThemeMode.system),
        ),
        ProfileRadioOption(
          label: l10n.profile_themeLight,
          isSelected: themeMode == ThemeMode.light,
          onSelect: () => notifier.setThemeMode(ThemeMode.light),
        ),
        ProfileRadioOption(
          label: l10n.profile_themeDark,
          isSelected: themeMode == ThemeMode.dark,
          onSelect: () => notifier.setThemeMode(ThemeMode.dark),
        ),
      ],
    );
  }
}
