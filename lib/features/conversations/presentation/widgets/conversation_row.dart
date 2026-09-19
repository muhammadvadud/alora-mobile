import 'package:flutter/material.dart';
import 'package:alora_mobile/features/conversations/domain/entities/conversation.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/shared/widgets/app_list_tile.dart';

class ConversationRow extends StatelessWidget {
  final Conversation conversation;
  final String stageLabel;
  final String timeLabel;
  final bool isSelected;
  final VoidCallback? onTap;

  const ConversationRow({
    super.key,
    required this.conversation,
    required this.stageLabel,
    required this.timeLabel,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.text;

    return Container(
      color: isSelected ? colors.surfaceMuted : Colors.transparent,
      child: AppListTile(
        title: conversation.title,
        subtitle: conversation.lastMessagePreview,
        trailing: Text(timeLabel, style: typography.labelS.copyWith(color: colors.textDisabled)),
        onTap: onTap,
        showDivider: false, // Maybe we don't want dividers if they are in a list with swipe-delete? The spec doesn't mention divider.
      ),
    );
  }
}
