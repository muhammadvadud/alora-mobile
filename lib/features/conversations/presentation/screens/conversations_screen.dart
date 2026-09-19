import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/router/routes.dart';
import 'package:alora_mobile/features/conversations/presentation/widgets/conversations_pane.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/shared/icons/app_icons.dart';

class ConversationsScreen extends StatelessWidget {
  const ConversationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colors = context.colors;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.conversations_title)),
      body: const ConversationsPane(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go(AppRoutes.chatNew),
        tooltip: l10n.conversations_new,
        backgroundColor: colors.accent,
        foregroundColor: colors.onAccent,
        child: const Icon(AppIcons.plus),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
