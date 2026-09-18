import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/router/adaptive_shell.dart';
import 'package:alora_mobile/app/theme/app_radius.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/shared/icons/app_icons.dart';
import 'package:alora_mobile/core/connectivity/connectivity_notifier.dart';
import 'package:alora_mobile/shared/widgets/limit_exceeded_view.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/features/chat/application/chat_notifier.dart';
import 'package:alora_mobile/features/chat/domain/entities/message.dart';
import 'package:alora_mobile/features/chat/presentation/widgets/chat_empty_view.dart';
import 'package:alora_mobile/features/chat/presentation/widgets/chat_input_panel.dart';
import 'package:alora_mobile/features/chat/presentation/widgets/message_bubble.dart';
import 'package:alora_mobile/features/chat/presentation/widgets/tool_chip_block.dart';
import 'package:alora_mobile/features/chat/presentation/widgets/product_carousel.dart';
import 'package:alora_mobile/features/chat/presentation/widgets/quote_card.dart';
import 'package:alora_mobile/features/chat/presentation/widgets/options_card.dart';
import 'package:alora_mobile/features/chat/presentation/widgets/order_draft_card.dart';
import 'package:alora_mobile/features/chat/presentation/widgets/thinking_block.dart';
import 'package:alora_mobile/shared/widgets/typing_line.dart';
import 'package:alora_mobile/features/voice/presentation/widgets/voice_panel.dart';
import 'package:alora_mobile/features/customer_mode/application/providers.dart';
import 'package:alora_mobile/features/customer_mode/presentation/widgets/pin_dialogs.dart';
import 'package:alora_mobile/features/conversations/application/conversations_notifier.dart';
import 'package:alora_mobile/features/conversations/application/conversations_state.dart';
import 'package:alora_mobile/features/conversations/domain/entities/conversation.dart';
import 'package:alora_mobile/features/orders/application/order_pdf_notifier.dart';

class ChatScreen extends ConsumerStatefulWidget {
  final String? conversationId;

  const ChatScreen({super.key, this.conversationId});

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _showScrollDown = false;
  bool _isVoiceMode = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      final show = _scrollController.offset > 200;
      if (show != _showScrollDown) {
        setState(() => _showScrollDown = show);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.conversationId == null) {
      return const Scaffold(
        body: Center(child: Text("Conversation ID is required")),
      );
    }

    final isCustomerMode = ref.watch(customerModeEnabledProvider);
    final l10n = AppLocalizations.of(context)!;
    final colors = context.colors;
    final typography = context.text;
    final isOnline = ref.watch(connectivityProvider);
    final chatState = ref.watch(chatProvider(widget.conversationId!));

    final isLimitExceeded =
        chatState.error?.contains('limit') == true ||
        chatState.error?.contains('429') == true;

    Widget body;
    if (isLimitExceeded) {
      body = const LimitExceededView();
    } else {
      body = Column(
        children: [
          if (chatState.error != null && !isLimitExceeded)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              color: colors.dangerSoft,
              child: Row(
                children: [
                  Icon(AppIcons.alertTriangle, color: colors.danger, size: 16),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      chatState.error!,
                      style: typography.bodyS.copyWith(color: colors.danger),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      ref
                          .read(chatProvider(widget.conversationId!).notifier)
                          .sendMessage('Retry');
                    },
                    child: Text(l10n.chat_retry),
                  ),
                ],
              ),
            ),
          Expanded(
            child: Stack(
              children: [
                chatState.messages.isEmpty
                    ? ChatEmptyView(
                        onChipSelected: (text) {
                          ref
                              .read(
                                chatProvider(widget.conversationId!).notifier,
                              )
                              .sendMessage(text);
                        },
                      )
                    : ListView.builder(
                        controller: _scrollController,
                        reverse: true,
                        itemCount: chatState.messages.length,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 16,
                        ),
                        itemBuilder: (context, index) {
                          final msg = chatState.messages[index];
                          return RepaintBoundary(
                            child: _buildMessageRow(msg, isCustomerMode),
                          );
                        },
                      ),
                if (_showScrollDown)
                  Positioned(
                    bottom: 16,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: FloatingActionButton.extended(
                        onPressed: _scrollToBottom,
                        backgroundColor: colors.surface,
                        foregroundColor: colors.textPrimary,
                        label: Text(l10n.chat_newMessages),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          if (_isVoiceMode)
            VoicePanel(onClose: () => setState(() => _isVoiceMode = false))
          else
            Padding(
              padding: const EdgeInsets.all(AppSpacing.l).copyWith(top: 8),
              child: ChatInputPanel(
                isStreaming: chatState.isStreaming,
                disabled: !isOnline,
                onSend: (text) {
                  ref
                      .read(chatProvider(widget.conversationId!).notifier)
                      .sendMessage(text);
                  _scrollToBottom();
                },
                onMicPressed: () => setState(() => _isVoiceMode = true),
                onAddPressed: () {},
              ),
            ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: colors.background,
      appBar: _buildAppBar(context, l10n, isCustomerMode),
      body: AdaptiveShell(
        leading: const _ConversationsPanePlaceholder(),
        child: body,
      ),
    );
  }

  AppBar _buildAppBar(
    BuildContext context,
    AppLocalizations l10n,
    bool isCustomerMode,
  ) {
    final colors = context.colors;
    final typography = context.text;

    return AppBar(
      backgroundColor: colors.surface,
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        icon: Icon(AppIcons.chevronRight, color: colors.textPrimary), // Back button normally left, but let's use default back button or pop
        onPressed: () => context.pop(),
      ),
      title: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isCustomerMode)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  l10n.chat_customerModeTitle,
                  style: typography.labelS.copyWith(
                    color: colors.textSecondary,
                  ),
                ),
                const SizedBox(width: 4),
                Icon(AppIcons.lock, size: 12, color: colors.textSecondary),
              ],
            )
          else ...[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: colors.surface,
                borderRadius: AppRadius.pillBorder,
                border: Border.all(color: colors.border),
              ),
              child: Text(
                'Mijoz',
                style: typography.titleL.copyWith(color: colors.textPrimary),
              ),
            ),
            const SizedBox(height: 2),
            Text(
              l10n.conversations_stageNeed,
              style: typography.labelS.copyWith(color: colors.textSecondary),
            ),
          ],
        ],
      ),
      actions: [
        if (isCustomerMode)
          IconButton(
            icon: Icon(AppIcons.lock, color: colors.textPrimary),
            onPressed: () {
              // Note: Disable customer mode logic is handled in the pop scope or a dialog
              // We should probably trigger the EnterPinDialog here.
              // We will just let the user use the lock icon to exit.
              showDialog(
                context: context,
                builder: (context) => aloraCustomerModeExitDialog(context, ref),
              );
            },
          )
        else
          PopupMenuButton<String>(
            icon: Icon(AppIcons.more, color: colors.textPrimary),
            onSelected: (value) async {
              if (value == 'reset') {
                final confirmed = await _showResetConfirm(context, l10n);
                if (confirmed == true && widget.conversationId != null) {
                  await ref
                      .read(chatProvider(widget.conversationId!).notifier)
                      .resetConversation();
                }
              } else if (value == 'customer') {
                await showDialog(
                  context: context,
                  builder: (context) =>
                      aloraCustomerModeSetupDialog(context, ref),
                );
              } else if (value == 'pdf') {
                final conversation = _findConversation(ref);
                if (conversation != null && conversation.orderId != null) {
                  unawaited(
                    ref
                        .read(orderPdfProvider(conversation.orderId!).notifier)
                        .openPdf(),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(l10n.chat_pdfRequireOrder),
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: context.colors.inverse,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(AppRadius.input),
                        ),
                      ),
                    ),
                  );
                }
              } else if (value == 'share') {
                final conversation = _findConversation(ref);
                if (conversation != null && conversation.orderId != null) {
                  unawaited(
                    ref
                        .read(orderPdfProvider(conversation.orderId!).notifier)
                        .sharePdf(),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(l10n.chat_pdfRequireOrder),
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: context.colors.inverse,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(AppRadius.input),
                        ),
                      ),
                    ),
                  );
                }
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(value: 'new', child: Text(l10n.chat_menuNew)),
              PopupMenuItem(value: 'reset', child: Text(l10n.chat_menuReset)),
              PopupMenuItem(
                value: 'customer',
                child: Text(l10n.chat_menuCustomerMode),
              ),
              PopupMenuItem(value: 'pdf', child: Text(l10n.chat_menuPdf)),
              PopupMenuItem(value: 'share', child: Text(l10n.chat_menuShare)),
            ],
          ),
      ],
    );
  }

  Widget aloraCustomerModeSetupDialog(BuildContext context, WidgetRef ref) {
    // This is just a placeholder to let the code compile. Subagent handles actual dialogs.
    // It should import from features/customer_mode/presentation/widgets/pin_dialogs.dart
    // For now we'll just use the real widgets since subagent said they are in pin_dialogs.dart
    return const SetPinDialog();
  }

  Widget aloraCustomerModeExitDialog(BuildContext context, WidgetRef ref) {
    return const EnterPinDialog();
  }

  Conversation? _findConversation(WidgetRef ref) {
    final id = widget.conversationId;
    if (id == null) return null;
    final items = ref
        .read(conversationsProvider)
        .whenOrNull(loaded: (items, _, _, _, _) => items);
    if (items == null) return null;
    for (final c in items) {
      if (c.id == id) return c;
    }
    return null;
  }

  Future<bool?> _showResetConfirm(BuildContext context, AppLocalizations l10n) {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.chat_resetConfirmTitle),
        content: Text(l10n.chat_resetConfirmMessage),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(l10n.common_cancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(l10n.common_ok),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageRow(Message msg, bool isCustomerMode) {
    if (msg.role == MessageRole.user) {
      return UserBubble(text: msg.content);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (msg.status == MessageStatus.sending ||
            (msg.content.isEmpty &&
                msg.richBlocks.isEmpty &&
                msg.status == MessageStatus.streaming))
          const TypingLine(),

        ...msg.richBlocks.map(
          (b) => b.when(
            toolChip: (tool, state, resultText, rawArgs, rawResult) =>
                isCustomerMode
                ? const SizedBox.shrink()
                : ToolChipBlockView(
                    tool: tool,
                    state: state,
                    resultText: resultText,
                  ),
            products: (products) => ProductCarousel(products: products),
            quote: (quote) => QuoteCardView(
              quote: isCustomerMode
                  ? quote.copyWith(formula: '', wasteWarnings: const [])
                  : quote,
            ),
            options: (options) => OptionsCardView(optionsBlock: options),
            orderDraft: (draft) => OrderDraftCardView(draft: draft),
            warning: (message) => isCustomerMode
                ? const SizedBox.shrink()
                : Text(message, style: TextStyle(color: context.colors.danger)),
          ),
        ),

        if (msg.content.isNotEmpty) AssistantMessageView(text: msg.content),

        if (!isCustomerMode &&
            msg.status == MessageStatus.streaming &&
            msg.richBlocks.any(
              (b) => b.mapOrNull(toolChip: (_) => true) == true,
            ))
          const ThinkingBlockView(),

        const SizedBox(height: 16),
      ],
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
