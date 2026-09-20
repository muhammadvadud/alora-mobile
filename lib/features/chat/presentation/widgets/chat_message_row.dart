import 'package:flutter/material.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/features/chat/domain/entities/message.dart';
import 'package:alora_mobile/features/chat/domain/entities/order_draft.dart';
import 'package:alora_mobile/features/chat/domain/entities/pricing_option.dart';
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
    this.onAddPart,
    this.onShowOptions,
    this.onSelectOption,
  });

  final Message message;
  final bool isCustomerMode;
  final void Function(OrderDraft draft) onEditOrder;
  final void Function(OrderDraft draft) onCreateOrder;
  final VoidCallback? onAddPart;
  final VoidCallback? onShowOptions;
  final ValueChanged<PricingOption>? onSelectOption;

  @override
  Widget build(BuildContext context) {
    if (message.role == MessageRole.user) {
      return UserBubble(text: message.content);
    }

    final colors = context.colors;
    final typography = context.text;
    final l10n = AppLocalizations.of(context)!;
    final hasRichData = message.richBlocks.any(
      (block) => block.maybeMap(
        products: (_) => true,
        quote: (_) => true,
        options: (_) => true,
        orderDraft: (_) => true,
        orElse: () => false,
      ),
    );
    final lastToolChipIndex = hasRichData
        ? message.richBlocks.lastIndexWhere(
            (block) => block.mapOrNull(toolChip: (_) => true) == true,
          )
        : -1;

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
            Text(l10n.app_name, style: typography.bodyL.copyWith(color: colors.textSecondary)),
          ],
        ),
        const SizedBox(height: 8),

        if (message.status == MessageStatus.sending ||
            (message.content.isEmpty &&
                message.richBlocks.isEmpty &&
                message.status == MessageStatus.streaming))
          const TypingLine(),

        for (var index = 0; index < message.richBlocks.length; index++)
          if (message.richBlocks[index].mapOrNull(toolChip: (_) => true) != true ||
              index == lastToolChipIndex)
            Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.m),
              child: message.richBlocks[index].when(
                toolChip: (tool, state, resultText, rawArgs, rawResult) => isCustomerMode
                    ? const SizedBox.shrink()
                    : ToolChipBlockView(tool: tool, state: state, resultText: resultText),
                products: (products) => ProductCarousel(products: products),
                quote: (quote) {
                  final isEmptyQuote =
                      quote.total == 0 &&
                      quote.fabrics.isEmpty &&
                      quote.accessories.isEmpty &&
                      quote.services.isEmpty;
                  if (isEmptyQuote) return const SizedBox.shrink();

                  return QuoteCardView(
                    quote: isCustomerMode
                        ? quote.copyWith(formula: '', wasteWarnings: const [])
                        : quote,
                    onAddPart: isCustomerMode ? null : onAddPart,
                    onShowOptions: isCustomerMode ? null : onShowOptions,
                  );
                },
                options: (options) => OptionsCardView(
                  optionsBlock: options,
                  onSelect: isCustomerMode ? null : onSelectOption,
                ),
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
