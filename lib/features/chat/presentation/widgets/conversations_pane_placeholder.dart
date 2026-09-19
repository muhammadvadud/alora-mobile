import 'package:flutter/material.dart';
import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';

/// Planshet/katta ekranda chat tanlagacha ko'rsatiladigan chap panel.
class ConversationsPanePlaceholder extends StatelessWidget {
  const ConversationsPanePlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = context.text;
    return ColoredBox(
      color: colors.surfaceMuted,
      child: Center(
        child: Text(
          AppLocalizations.of(context)!.tab_chat,
          style: text.labelS.copyWith(color: colors.textSecondary),
        ),
      ),
    );
  }
}
