import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/features/profile/application/locale_notifier.dart';
import 'package:alora_mobile/shared/widgets/app_list_tile.dart';
import 'package:alora_mobile/shared/widgets/app_bottom_sheet.dart';
import 'package:alora_mobile/shared/widgets/app_radio.dart';

class LanguageSection extends ConsumerWidget {
  const LanguageSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final current = Localizations.localeOf(context);

    final isUz = current.languageCode == 'uz' && current.countryCode != 'Cyrl';
    final isCyrl = current.countryCode == 'Cyrl';
    final isRu = current.languageCode == 'ru';

    final String currentName = isUz ? l10n.profile_languageOptionUz : (isCyrl ? l10n.profile_languageOptionCyrl : l10n.profile_languageOptionRu);

    return AppListTile(
      title: l10n.profile_languageTitle,
      leading: const Icon(LucideIcons.globe, size: 24),
      trailing: Text(currentName),
      onTap: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          builder: (context) => AppBottomSheet(
            title: l10n.profile_languageTitle,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppListTile(
                  title: l10n.profile_languageOptionUz,
                  trailing: AppRadio(isSelected: isUz),
                  onTap: () {
                    ref.read(localeProvider.notifier).setLocale(const Locale('uz'));
                    Navigator.pop(context);
                  },
                ),
                AppListTile(
                  title: l10n.profile_languageOptionCyrl,
                  trailing: AppRadio(isSelected: isCyrl),
                  onTap: () {
                    ref.read(localeProvider.notifier).setLocale(const Locale('uz', 'Cyrl'));
                    Navigator.pop(context);
                  },
                ),
                AppListTile(
                  title: l10n.profile_languageOptionRu,
                  trailing: AppRadio(isSelected: isRu),
                  onTap: () {
                    ref.read(localeProvider.notifier).setLocale(const Locale('ru'));
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
