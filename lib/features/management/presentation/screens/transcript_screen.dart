import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/router/adaptive_shell.dart';
import 'package:alora_mobile/app/theme/app_radius.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/core/error/failure.dart';
import 'package:alora_mobile/core/error/failure_l10n.dart';
import 'package:alora_mobile/features/management/application/transcript_notifier.dart';
import 'package:alora_mobile/features/management/domain/entities/transcript_message.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/shared/icons/app_icons.dart';
import 'package:alora_mobile/shared/widgets/empty_state.dart';
import 'package:alora_mobile/shared/widgets/error_state.dart';
import 'package:alora_mobile/shared/widgets/skeleton.dart';
import 'package:alora_mobile/shared/widgets/tool_chip.dart';

/// Suhbat transkripti (11.10) — manager uchun o'qish rejimi, input yo'q.
class TranscriptScreen extends ConsumerWidget {
  final String conversationId;

  const TranscriptScreen({super.key, required this.conversationId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final transcript = ref.watch(transcriptProvider(conversationId));

    return Scaffold(
      appBar: AppBar(title: Text(l10n.management_transcriptTitle)),
      body: TabletCentered(
        child: transcript.maybeWhen(
          loading: () => const SkeletonList(
            itemCount: 6,
            itemBuilder: SkeletonBox(height: 84),
            separator: SizedBox(height: AppSpacing.m),
          ),
          error: (error, _) => ErrorState(
            message: (error as Failure).localizedMessage(context),
            onRetry: () => ref.invalidate(transcriptProvider(conversationId)),
          ),
          data: (messages) => messages.isEmpty
              ? EmptyState(icon: AppIcons.chat, title: l10n.management_transcriptEmpty)
              : ListView.separated(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.screenH,
                    vertical: AppSpacing.l,
                  ),
                  itemCount: messages.length,
                  separatorBuilder: (_, _) => const SizedBox(height: AppSpacing.m),
                  itemBuilder: (context, index) => _MessageBubble(message: messages[index]),
                ),
          orElse: () => const SizedBox.shrink(),
        ),
      ),
    );
  }
}

class _MessageBubble extends StatelessWidget {
  final TranscriptMessage message;

  const _MessageBubble({required this.message});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colors = context.colors;
    final typography = context.text;
    final isUser = !message.isAssistant && message.role == 'user';

    final bubbleColor = isUser ? colors.accent : colors.surface;
    final textColor = isUser ? colors.onAccent : colors.textPrimary;
    final label = isUser
        ? l10n.management_transcriptUser
        : message.isAssistant
        ? l10n.management_transcriptAssistant
        : l10n.management_transcriptTool;
    final labelColor = isUser ? colors.onAccent : colors.textSecondary;

    return Column(
      crossAxisAlignment: isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Text(label.toUpperCase(), style: typography.labelS.copyWith(color: labelColor)),
        const SizedBox(height: AppSpacing.xs),
        Align(
          alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            constraints: const BoxConstraints(maxWidth: 520),
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.l, vertical: AppSpacing.m),
            decoration: BoxDecoration(
              color: bubbleColor,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(AppRadius.card),
                topRight: const Radius.circular(AppRadius.card),
                bottomLeft: Radius.circular(isUser ? AppRadius.card : AppRadius.input),
                bottomRight: Radius.circular(isUser ? AppRadius.input : AppRadius.card),
              ),
              border: isUser ? null : Border.all(color: colors.border, width: 1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (message.content.isNotEmpty)
                  Text(message.content, style: typography.bodyM.copyWith(color: textColor)),
                if (message.toolNames.isNotEmpty) ...[
                  const SizedBox(height: AppSpacing.s),
                  Wrap(
                    spacing: AppSpacing.s,
                    runSpacing: AppSpacing.s,
                    children: [
                      for (final name in message.toolNames)
                        ToolChip(text: name, state: ToolChipState.done),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}
