import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/features/profile/application/locale_notifier.dart';
import 'package:alora_mobile/shared/widgets/app_chip.dart';

/// Til tanlash (S-25, 10.2): O'zbek lotin / Кирилл / Русский.
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
        _optionChip(
          context,
          label: l10n.profile_languageOptionUz,
          isSelected: isUz,
          onTap: () => ref.read(localeProvider.notifier).setLocale(const Locale('uz')),
        ),
        _optionChip(
          context,
          label: l10n.profile_languageOptionCyrl,
          isSelected: isCyrl,
          onTap: () =>
              ref.read(localeProvider.notifier).setLocale(const Locale('uz', 'Cyrl')),
        ),
        _optionChip(
          context,
          label: l10n.profile_languageOptionRu,
          isSelected: isRu,
          onTap: () => ref.read(localeProvider.notifier).setLocale(const Locale('ru')),
        ),
      ],
    );
  }

  Widget _optionChip(
    BuildContext context, {
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return AppChip(
      label: label,
      onTap: onTap,
      state: isSelected ? AppChipState.selected : AppChipState.unselected,
    );
  }
}