import 'package:flutter/material.dart';

import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/router/adaptive_shell.dart';
import 'package:alora_mobile/app/router/section_placeholder.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/shared/icons/app_icons.dart';

/// Chat sahifasi (placeholder). Haqiqiy suhbat 5-bosqichda qo'shiladi.
class ChatScreen extends StatelessWidget {
  final String? conversationId;

  const ChatScreen({super.key, this.conversationId});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.tab_chat)),
      body: AdaptiveShell(
        leading: const _ConversationsPanePlaceholder(),
        child: SectionPlaceholder(
          icon: AppIcons.chat,
          title: l10n.tab_chat,
          subtitle: l10n.placeholder_comingSoon,
        ),
      ),
    );
  }
}

class _ConversationsPanePlaceholder extends StatelessWidget {
  const _ConversationsPanePlaceholder();

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
