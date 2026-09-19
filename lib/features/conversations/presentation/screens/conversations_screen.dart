import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/router/routes.dart';
import 'package:alora_mobile/features/conversations/application/conversations_notifier.dart';
import 'package:alora_mobile/features/conversations/presentation/widgets/conversations_pane.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/shared/icons/app_icons.dart';

class ConversationsScreen extends ConsumerWidget {
  const ConversationsScreen({super.key});

  Future<void> _newConversation(BuildContext context, WidgetRef ref) async {
    final id = await ref.read(conversationsProvider.notifier).create();
    if (id != null && context.mounted) {
      context.go(AppRoutes.chatConversation(id));
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final colors = context.colors;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.conversations_title)),
      body: const ConversationsPane(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _newConversation(context, ref),
        tooltip: l10n.conversations_new,
        backgroundColor: colors.accent,
        foregroundColor: colors.onAccent,
        child: const Icon(AppIcons.plus),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
