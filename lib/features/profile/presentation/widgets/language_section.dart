import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/features/profile/application/locale_notifier.dart';
import 'package:alora_mobile/shared/widgets/app_chip.dart';

class LanguageSection extends ConsumerWidget {
  const LanguageSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final current = Localizations.localeOf(context);

    final isUz = current.languageCode == 'uz' && current.countryCode != 'Cyrl';
    final isCyrl = current.countryCode == 'Cyrl';
    final isRu = current.languageCode == 'ru';

    return Wrap(
      spacing: AppSpacing.s,
      runSpacing: AppSpacing.s,
      children: [
        AppChip(
          label: l10n.profile_languageOptionUz,
          onTap: () => ref.read(localeProvider.notifier).setLocale(const Locale('uz')),
          state: isUz ? AppChipState.selected : AppChipState.unselected,
        ),
        AppChip(
          label: l10n.profile_languageOptionCyrl,
          onTap: () => ref.read(localeProvider.notifier).setLocale(const Locale('uz', 'Cyrl')),
          state: isCyrl ? AppChipState.selected : AppChipState.unselected,
        ),
        AppChip(
          label: l10n.profile_languageOptionRu,
          onTap: () => ref.read(localeProvider.notifier).setLocale(const Locale('ru')),
          state: isRu ? AppChipState.selected : AppChipState.unselected,
        ),
      ],
    );
  }
}
