import 'dart:async';

import 'package:flutter/material.dart';
import 'package:alora_mobile/shared/extensions/l10n_extension.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/router/adaptive_shell.dart';
import 'package:alora_mobile/app/theme/app_radius.dart';
import 'package:alora_mobile/core/error/failure.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/shared/icons/app_icons.dart';
import 'package:alora_mobile/core/connectivity/connectivity_notifier.dart';
import 'package:alora_mobile/shared/widgets/limit_exceeded_view.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/features/chat/application/chat_notifier.dart';
import 'package:alora_mobile/features/chat/presentation/widgets/chat_empty_view.dart';
import 'package:alora_mobile/features/chat/presentation/widgets/chat_error_banner.dart';
import 'package:alora_mobile/features/chat/presentation/widgets/chat_input_panel.dart';
import 'package:alora_mobile/features/chat/presentation/widgets/chat_message_row.dart';
import 'package:alora_mobile/features/chat/presentation/widgets/chat_scroll_down_fab.dart';
import 'package:alora_mobile/features/chat/presentation/widgets/chat_title_bar.dart';
import 'package:alora_mobile/features/chat/presentation/widgets/conversations_pane_placeholder.dart';
import 'package:alora_mobile/features/voice/presentation/widgets/voice_panel.dart';
import 'package:alora_mobile/features/customer_mode/application/providers.dart';
import 'package:alora_mobile/features/customer_mode/presentation/widgets/pin_dialogs.dart';
import 'package:alora_mobile/features/conversations/application/conversations_notifier.dart';
import 'package:alora_mobile/features/conversations/application/conversations_state.dart';
import 'package:alora_mobile/features/conversations/domain/entities/conversation.dart';
import 'package:alora_mobile/app/router/routes.dart';
import 'package:alora_mobile/features/chat/domain/entities/order_draft.dart';
import 'package:alora_mobile/features/orders/application/order_from_draft_notifier.dart';
import 'package:alora_mobile/features/orders/application/order_pdf_notifier.dart';
import 'package:alora_mobile/shared/widgets/app_snackbar.dart';

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

  /// S-07 "Buyurtma yaratish": `POST orders/` → `/orders/:id` (7.12).
  Future<void> _createOrderFromDraft(OrderDraft draft) async {
    final order = await ref
        .read(orderFromDraftProvider.notifier)
        .create(draft, conversationId: widget.conversationId);
    if (!mounted) return;
    if (order == null) {
      final error = ref.read(orderFromDraftProvider).error;
      AppSnackbar.show(
        context,
        message: error == null
            ? context.l10n.error_unknown
            : context.l10n.errorOccurred(error.toString()),
        isError: true,
      );
      return;
    }
    AppSnackbar.show(context, message: context.l10n.orders_createdSnack);
    await context.push(AppRoutes.order(order.id));
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
      return Scaffold(
        body: Center(child: Text(context.l10n.chat_noConversation)),
      );
    }

    final isCustomerMode = ref.watch(customerModeEnabledProvider);
    final l10n = AppLocalizations.of(context)!;
    final colors = context.colors;
    final isOnline = ref.watch(connectivityProvider);
    final chatState = ref.watch(chatProvider(widget.conversationId!));
    final error = chatState.error;

    final isLimitExceeded =
        error?.maybeWhen(limit: (_) => true, orElse: () => false) == true;

    Widget body;
    if (isLimitExceeded) {
      body = const LimitExceededView();
    } else {
      body = Column(
        children: [
          if (error != null)
            ChatErrorBanner(
              error: error,
              retryLabel: l10n.chat_retry,
              onRetry: () {
                unawaited(
                  ref
                      .read(chatProvider(widget.conversationId!).notifier)
                      .retryLast(),
                );
              },
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
                          horizontal: AppSpacing.l,
                          vertical: AppSpacing.l,
                        ),
                        itemBuilder: (context, index) {
                          final msg = chatState.messages[index];
                          return RepaintBoundary(
                            child: ChatMessageRow(
                              message: msg,
                              isCustomerMode: isCustomerMode,
                              onEditOrder: (draft) => context.push(
                                AppRoutes.orderNew,
                                extra: draft,
                              ),
                              onCreateOrder: (draft) =>
                                  unawaited(_createOrderFromDraft(draft)),
                            ),
                          );
                        },
                      ),
                if (_showScrollDown)
                  Positioned(
                    bottom: AppSpacing.l,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: ChatScrollDownFab(
                        onPressed: _scrollToBottom,
                        label: l10n.chat_newMessages,
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
              padding: const EdgeInsets.all(AppSpacing.l)
                  .copyWith(top: AppSpacing.s),
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
        leading: const ConversationsPanePlaceholder(),
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

    return AppBar(
      backgroundColor: colors.surface,
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        icon: Icon(AppIcons.chevronRight, color: colors.textPrimary),
        onPressed: () => context.pop(),
      ),
      title: ChatTitleBar(isCustomerMode: isCustomerMode),
      actions: [
        if (isCustomerMode)
          IconButton(
            icon: Icon(AppIcons.lock, color: colors.textPrimary),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const EnterPinDialog(),
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
                  builder: (context) => const SetPinDialog(),
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
}
