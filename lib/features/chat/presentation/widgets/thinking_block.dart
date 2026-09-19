import 'package:flutter/material.dart';
import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';

class ThinkingBlockView extends StatelessWidget {
  const ThinkingBlockView({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.text;
    final l10n = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 4.0),
      child: Text(
        l10n.chat_thinking,
        style: typography.bodyS.copyWith(color: colors.textSecondary, fontStyle: FontStyle.italic),
      ),
    );
  }
}
