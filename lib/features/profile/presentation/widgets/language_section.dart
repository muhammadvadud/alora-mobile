import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/features/profile/application/locale_notifier.dart';
import 'package:alora_mobile/shared/icons/app_icons.dart';

import 'profile_radio_group.dart';

/// Til tanlash (S-25): lotin / kirill / rus — tanlov darhol qo'llanadi.
class LanguageSection extends ConsumerWidget {
  const LanguageSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final current = Localizations.localeOf(context);
    final notifier = ref.read(localeProvider.notifier);

    final isCyrl = current.countryCode == 'Cyrl';
    final isRu = current.languageCode == 'ru';
    final isUz = !isCyrl && !isRu;

    return ProfileRadioGroup(
      title: l10n.profile_languageTitle,
      icon: AppIcons.globe,
      options: [
        ProfileRadioOption(
          label: l10n.profile_languageOptionUz,
          isSelected: isUz,
          onSelect: () => notifier.setLocale(const Locale('uz')),
        ),
        ProfileRadioOption(
          label: l10n.profile_languageOptionCyrl,
          isSelected: isCyrl,
          onSelect: () => notifier.setLocale(const Locale('uz', 'Cyrl')),
        ),
        ProfileRadioOption(
          label: l10n.profile_languageOptionRu,
          isSelected: isRu,
          onSelect: () => notifier.setLocale(const Locale('ru')),
        ),
      ],
    );
  }
}
