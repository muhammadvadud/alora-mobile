import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/router/adaptive_shell.dart';
import 'package:alora_mobile/app/router/routes.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/core/error/failure.dart';
import 'package:alora_mobile/core/error/failure_l10n.dart';
import 'package:alora_mobile/core/utils/date_format.dart';
import 'package:alora_mobile/features/conversations/domain/entities/conversation.dart';
import 'package:alora_mobile/features/conversations/domain/entities/conversation_stage.dart';
import 'package:alora_mobile/features/conversations/presentation/widgets/conversation_row.dart';
import 'package:alora_mobile/features/management/application/employee_conversations_notifier.dart';
import 'package:alora_mobile/shared/icons/app_icons.dart';
import 'package:alora_mobile/shared/widgets/empty_state.dart';
import 'package:alora_mobile/shared/widgets/error_state.dart';
import 'package:alora_mobile/shared/widgets/skeleton.dart';

/// Xodim suhbatlari ro'yxati (S-21, 11.8) — faqat o'qish rejimi.
class EmployeeConversationsScreen extends ConsumerWidget {
  final String employeeId;

  const EmployeeConversationsScreen({super.key, required this.employeeId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final conversations = ref.watch(employeeConversationsProvider(employeeId));

    return Scaffold(
      appBar: AppBar(title: Text(l10n.management_employeeConversationsTitle)),
      body: TabletCentered(
        child: conversations.maybeWhen(
          loading: () => const SkeletonList(itemCount: 5, itemBuilder: SkeletonBox(height: 84)),
          error: (error, _) => ErrorState(
            message: (error as Failure).localizedMessage(context),
            onRetry: () => ref.invalidate(employeeConversationsProvider(employeeId)),
          ),
          data: (items) => items.isEmpty
              ? EmptyState(
                  icon: AppIcons.chat,
                  title: l10n.management_conversationsEmptyTitle,
                  message: l10n.management_conversationsEmptyMessage,
                )
              : ListView.separated(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.screenH,
                    vertical: AppSpacing.l,
                  ),
                  itemCount: items.length,
                  separatorBuilder: (_, _) => const SizedBox(height: AppSpacing.s),
                  itemBuilder: (context, index) {
                    final conversation = items[index];
                    return ConversationRow(
                      conversation: conversation,
                      stageLabel: _stageLabel(context, conversation.stage),
                      timeLabel: _timeLabel(context, conversation),
                      onTap: () => context.go(
                        AppRoutes.managementConversationTranscript(employeeId, conversation.id),
                      ),
                    );
                  },
                ),
          orElse: () => const SizedBox.shrink(),
        ),
      ),
    );
  }

  String _stageLabel(BuildContext context, ConversationStage stage) {
    final l10n = AppLocalizations.of(context)!;
    return switch (stage) {
      ConversationStage.need => l10n.conversations_stageNeed,
      ConversationStage.recommend => l10n.conversations_stageRecommend,
      ConversationStage.measure => l10n.conversations_stageMeasure,
      ConversationStage.calc => l10n.conversations_stageCalc,
      ConversationStage.variants => l10n.conversations_stageVariants,
      ConversationStage.order => l10n.conversations_stageOrder,
      ConversationStage.unknown => l10n.conversations_stageUnknown,
    };
  }

  String _timeLabel(BuildContext context, Conversation conversation) {
    final date = conversation.lastMessageAt;
    if (date == null) return '';
    final now = DateTime.now();
    final isToday = date.year == now.year && date.month == now.month && date.day == now.day;
    if (!isToday) {
      return formatDate(date, context: context, short: true);
    }
    final hour = date.hour.toString().padLeft(2, '0');
    final minute = date.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }
}
