import 'package:flutter/material.dart';

import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/features/conversations/domain/entities/conversation.dart';
import 'package:alora_mobile/features/conversations/domain/entities/conversation_stage.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/shared/widgets/app_card.dart';
import 'package:alora_mobile/shared/widgets/money_text.dart';

/// Suhbatlar ro'yxatidagi bitta qator.
/// Sarlavha, summa (bo'lsa), oxirgi xabar (bo'lsa),
/// bosqich nuqtasi + bosqich nomi + vaqt/sana.
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
    final amount = conversation.totalAmount;

    return AppCard(
      isSelected: isSelected,
      onTap: onTap,
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.l,
        AppSpacing.m,
        AppSpacing.l,
        AppSpacing.m,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  conversation.title,
                  style: typography.titleS.copyWith(color: colors.textPrimary),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (amount != null) ...[
                const SizedBox(width: AppSpacing.s),
                MoneyText(
                  amount: amount,
                  style: typography.labelM.copyWith(color: colors.brass),
                ),
              ],
            ],
          ),
          if (conversation.lastMessagePreview != null) ...[
            const SizedBox(height: AppSpacing.xs),
            Text(
              conversation.lastMessagePreview!,
              style: typography.bodyS.copyWith(color: colors.textSecondary),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
          const SizedBox(height: AppSpacing.s),
          Row(
            children: [
              _StageDot(stage: conversation.stage),
              const SizedBox(width: AppSpacing.s),
              Text(
                stageLabel.toUpperCase(),
                style: typography.labelS.copyWith(color: colors.accent),
              ),
              Text(
                ' · $timeLabel',
                style: typography.bodyS.copyWith(color: colors.textSecondary),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StageDot extends StatelessWidget {
  final ConversationStage stage;

  const _StageDot({required this.stage});

  Color _color(BuildContext context) {
    return switch (stage) {
      ConversationStage.need => context.colors.info,
      ConversationStage.recommend => context.colors.accent,
      ConversationStage.measure => context.colors.brass,
      ConversationStage.calc => context.colors.info,
      ConversationStage.variants => context.colors.accent,
      ConversationStage.order => context.colors.success,
      ConversationStage.unknown => context.colors.textDisabled,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 6,
      height: 6,
      decoration: BoxDecoration(color: _color(context), shape: BoxShape.circle),
    );
  }
}
