import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/theme/theme_mode_notifier.dart';
import 'package:alora_mobile/shared/widgets/app_list_tile.dart';
import 'package:alora_mobile/shared/widgets/app_bottom_sheet.dart';
import 'package:alora_mobile/shared/widgets/app_radio.dart';

/// Mavzu tanlash (S-25): Tizim / Yorug' / Qorong'i.
class ThemeSection extends ConsumerWidget {
  const ThemeSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final themeMode = ref.watch(themeModeProvider);
    final notifier = ref.read(themeModeProvider.notifier);

    final String currentName = themeMode == ThemeMode.system
        ? l10n.profile_themeSystem
        : (themeMode == ThemeMode.light ? l10n.profile_themeLight : l10n.profile_themeDark);

    return AppListTile(
      title: l10n.profile_themeTitle,
      leading: const Icon(LucideIcons.moon, size: 24),
      trailing: Text(currentName),
      onTap: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          builder: (context) => AppBottomSheet(
            title: l10n.profile_themeTitle,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppListTile(
                  title: l10n.profile_themeSystem,
                  trailing: AppRadio(isSelected: themeMode == ThemeMode.system),
                  onTap: () {
                    notifier.setThemeMode(ThemeMode.system);
                    Navigator.pop(context);
                  },
                ),
                AppListTile(
                  title: l10n.profile_themeLight,
                  trailing: AppRadio(isSelected: themeMode == ThemeMode.light),
                  onTap: () {
                    notifier.setThemeMode(ThemeMode.light);
                    Navigator.pop(context);
                  },
                ),
                AppListTile(
                  title: l10n.profile_themeDark,
                  trailing: AppRadio(isSelected: themeMode == ThemeMode.dark),
                  onTap: () {
                    notifier.setThemeMode(ThemeMode.dark);
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
