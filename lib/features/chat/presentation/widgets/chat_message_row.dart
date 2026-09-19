import 'package:flutter/material.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/features/chat/domain/entities/message.dart';
import 'package:alora_mobile/features/chat/domain/entities/order_draft.dart';
import 'package:alora_mobile/features/chat/presentation/widgets/message_bubble.dart';
import 'package:alora_mobile/features/chat/presentation/widgets/options_card.dart';
import 'package:alora_mobile/features/chat/presentation/widgets/order_draft_card.dart';
import 'package:alora_mobile/features/chat/presentation/widgets/product_carousel.dart';
import 'package:alora_mobile/features/chat/presentation/widgets/quote_card.dart';
import 'package:alora_mobile/features/chat/presentation/widgets/thinking_block.dart';
import 'package:alora_mobile/features/chat/presentation/widgets/tool_chip_block.dart';
import "package:alora_mobile/app/theme/app_radius.dart";
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/shared/widgets/typing_line.dart';
import 'package:alora_mobile/app/l10n/app_localizations.dart';

/// Bitta xabar qatorini rich bloklar bilan chiqaradi.
class ChatMessageRow extends StatelessWidget {
  const ChatMessageRow({
    super.key,
    required this.message,
    required this.isCustomerMode,
    required this.onEditOrder,
    required this.onCreateOrder,
  });

  final Message message;
  final bool isCustomerMode;
  final void Function(OrderDraft draft) onEditOrder;
  final void Function(OrderDraft draft) onCreateOrder;

  @override
  Widget build(BuildContext context) {
    if (message.role == MessageRole.user) {
      return UserBubble(text: message.content);
    }

    final colors = context.colors;
    final typography = context.text;
    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // S-03: AI xabari ustida qator (28x28 avatar + 'Alora')
        Row(
          children: [
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: colors.surfaceMuted,
                borderRadius: AppRadius.avatarBorder,
              ),
              child: Center(
                child: Text('A', style: typography.bodyS.copyWith(color: colors.textPrimary)),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              l10n.chat_defaultTitle, // 'Alora'
              style: typography.bodyL.copyWith(color: colors.textSecondary),
            ),
          ],
        ),
        const SizedBox(height: 8),

        if (message.status == MessageStatus.sending ||
            (message.content.isEmpty &&
                message.richBlocks.isEmpty &&
                message.status == MessageStatus.streaming))
          const TypingLine(),

        ...message.richBlocks.map(
          (b) => Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.m),
            child: b.when(
              toolChip: (tool, state, resultText, rawArgs, rawResult) => isCustomerMode
                  ? const SizedBox.shrink()
                  : ToolChipBlockView(tool: tool, state: state, resultText: resultText),
              products: (products) => ProductCarousel(products: products),
              quote: (quote) => QuoteCardView(
                quote: isCustomerMode
                    ? quote.copyWith(formula: '', wasteWarnings: const [])
                    : quote,
              ),
              options: (options) => OptionsCardView(optionsBlock: options),
              orderDraft: (draft) => OrderDraftCardView(
                draft: draft,
                onEdit: () => onEditOrder(draft),
                onCreate: () => onCreateOrder(draft),
              ),
              warning: (message) => isCustomerMode
                  ? const SizedBox.shrink()
                  : Text(message, style: TextStyle(color: colors.danger)),
            ),
          ),
        ),

        if (message.content.isNotEmpty) AssistantMessageView(text: message.content),

        if (!isCustomerMode &&
            message.status == MessageStatus.streaming &&
            message.richBlocks.any((b) => b.mapOrNull(toolChip: (_) => true) == true))
          const ThinkingBlockView(),

        const SizedBox(height: AppSpacing.chatGap), // chatGap is 24, typically
      ],
    );
  }
}
