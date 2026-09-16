import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/router/routes.dart';
import 'package:alora_mobile/features/conversations/application/conversations_notifier.dart';
import 'package:alora_mobile/features/conversations/presentation/widgets/conversations_pane.dart';
import 'package:alora_mobile/shared/icons/app_icons.dart';

/// Suhbatlar ro'yxati sahifasi (`/chat`).
/// Listni [ConversationsPane] ko'rsatadi, FAB yangi suhbat ochadi.
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
    return Scaffold(
      appBar: AppBar(title: Text(l10n.conversations_title)),
      body: const ConversationsPane(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _newConversation(context, ref),
        icon: const Icon(AppIcons.chat),
        label: Text(l10n.conversations_new),
      ),
    );
  }
}
