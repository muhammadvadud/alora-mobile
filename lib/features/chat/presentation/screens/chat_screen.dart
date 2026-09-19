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
import 'package:alora_mobile/features/chat/application/chat_state.dart';
import 'package:alora_mobile/features/chat/presentation/widgets/chat_empty_view.dart';
import 'package:alora_mobile/features/chat/presentation/widgets/chat_error_banner.dart';
import 'package:alora_mobile/features/chat/presentation/widgets/chat_input_panel.dart';
import 'package:alora_mobile/features/chat/presentation/widgets/chat_message_list.dart';
import "package:alora_mobile/shared/widgets/scroll_down_button.dart";
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
  bool _isCreatingConversation = false;

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

  Future<void> _startConversation(String text) async {
    if (_isCreatingConversation) return;
    setState(() => _isCreatingConversation = true);

    final id = await ref.read(conversationsProvider.notifier).create();
    if (!mounted) return;
    if (id == null) {
      setState(() => _isCreatingConversation = false);
      return;
    }

    unawaited(ref.read(chatProvider(id).notifier).sendMessage(text));
    context.go(AppRoutes.chatConversation(id));
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
    final isCustomerMode = ref.watch(customerModeEnabledProvider);
    final colors = context.colors;
    final isOnline = ref.watch(connectivityProvider);
    final error = widget.conversationId == null
        ? null
        : ref.watch(chatProvider(widget.conversationId!)).error;
    final isLimitExceeded = error?.maybeWhen(limit: (_) => true, orElse: () => false) == true;

    return Scaffold(
      backgroundColor: colors.background,
      appBar: _ChatAppBar(conversationId: widget.conversationId, isCustomerMode: isCustomerMode),
      body: AdaptiveShell(
        leading: const ConversationsPanePlaceholder(),
        child: isLimitExceeded
            ? const LimitExceededView()
            : _ChatBody(
                conversationId: widget.conversationId,
                isOnline: isOnline,
                isCustomerMode: isCustomerMode,
                isVoiceMode: _isVoiceMode,
                showScrollDown: _showScrollDown,
                scrollController: _scrollController,
                onCreateOrder: _createOrderFromDraft,
                onScrollToBottom: _scrollToBottom,
                onVoiceModeChanged: (val) => setState(() => _isVoiceMode = val),
                onFirstMessage: widget.conversationId == null ? _startConversation : null,
                isCreatingConversation: _isCreatingConversation,
              ),
      ),
    );
  }
}

class _ChatAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final String? conversationId;
  final bool isCustomerMode;

  const _ChatAppBar({required this.conversationId, required this.isCustomerMode});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colors;
    final l10n = AppLocalizations.of(context)!;

    return AppBar(
      backgroundColor: colors.surface,
      elevation: 0,
      centerTitle: false,
      leading: IconButton(
        icon: Icon(AppIcons.arrowLeft, color: colors.textPrimary),
        onPressed: () => context.pop(),
      ),
      title: ChatTitleBar(isCustomerMode: isCustomerMode),
      actions: [
        if (isCustomerMode)
          IconButton(
            icon: Icon(AppIcons.lock, color: colors.textPrimary),
            onPressed: () {
              showDialog(context: context, builder: (context) => const EnterPinDialog());
            },
          )
        else
          PopupMenuButton<String>(
            icon: Icon(AppIcons.more, color: colors.textPrimary),
            onSelected: (value) => _handleMenuSelection(context, ref, value, l10n),
            itemBuilder: (context) => [
              PopupMenuItem(value: 'new', child: Text(l10n.chat_menuNew)),
              PopupMenuItem(value: 'reset', child: Text(l10n.chat_menuReset)),
              PopupMenuItem(value: 'customer', child: Text(l10n.chat_menuCustomerMode)),
              PopupMenuItem(value: 'pdf', child: Text(l10n.chat_menuPdf)),
              PopupMenuItem(value: 'share', child: Text(l10n.chat_menuShare)),
            ],
          ),
      ],
    );
  }

  Future<void> _handleMenuSelection(
    BuildContext context,
    WidgetRef ref,
    String value,
    AppLocalizations l10n,
  ) async {
    if (value == 'new') {
      context.go(AppRoutes.chatNew);
    } else if (value == 'reset') {
      final confirmed = await _showResetConfirm(context, l10n);
      if (confirmed == true && conversationId != null) {
        await ref.read(chatProvider(conversationId!).notifier).resetConversation();
      }
    } else if (value == 'customer') {
      await showDialog(context: context, builder: (context) => const SetPinDialog());
    } else if (value == 'pdf' || value == 'share') {
      final conversation = _findConversation(ref);
      if (conversation != null && conversation.orderId != null) {
        if (value == 'pdf') {
          unawaited(ref.read(orderPdfProvider(conversation.orderId!).notifier).openPdf());
        } else {
          unawaited(ref.read(orderPdfProvider(conversation.orderId!).notifier).sharePdf());
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.chat_pdfRequireOrder),
            behavior: SnackBarBehavior.floating,
            backgroundColor: context.colors.inverse,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(AppRadius.input)),
            ),
          ),
        );
      }
    }
  }

  Conversation? _findConversation(WidgetRef ref) {
    if (conversationId == null) return null;
    final items = ref.read(conversationsProvider).whenOrNull(loaded: (items, _, _, _, _) => items);
    if (items == null) return null;
    for (final c in items) {
      if (c.id == conversationId) return c;
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
          TextButton(onPressed: () => Navigator.pop(context, true), child: Text(l10n.common_ok)),
        ],
      ),
    );
  }
}

class _ChatBody extends ConsumerWidget {
  final String? conversationId;
  final bool isOnline;
  final bool isCustomerMode;
  final bool isVoiceMode;
  final bool showScrollDown;
  final ScrollController scrollController;
  final void Function(OrderDraft draft) onCreateOrder;
  final VoidCallback onScrollToBottom;
  final ValueChanged<bool> onVoiceModeChanged;
  final ValueChanged<String>? onFirstMessage;
  final bool isCreatingConversation;

  const _ChatBody({
    required this.conversationId,
    required this.isOnline,
    required this.isCustomerMode,
    required this.isVoiceMode,
    required this.showScrollDown,
    required this.scrollController,
    required this.onCreateOrder,
    required this.onScrollToBottom,
    required this.onVoiceModeChanged,
    this.onFirstMessage,
    this.isCreatingConversation = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final chatState = conversationId == null
        ? const ChatState()
        : ref.watch(chatProvider(conversationId!));
    final error = chatState.error;

    return Column(
      children: [
        if (error != null)
          ChatErrorBanner(
            error: error,
            retryLabel: l10n.chat_retry,
            onRetry: () {
              unawaited(ref.read(chatProvider(conversationId!).notifier).retryLast());
            },
          ),
        Expanded(
          child: Stack(
            children: [
              chatState.messages.isEmpty
                  ? ChatEmptyView(
                      onChipSelected: (text) {
                        if (conversationId == null) {
                          onFirstMessage?.call(text);
                        } else {
                          ref.read(chatProvider(conversationId!).notifier).sendMessage(text);
                        }
                      },
                    )
                  : ChatMessageList(
                      messages: chatState.messages,
                      scrollController: scrollController,
                      isCustomerMode: isCustomerMode,
                      onCreateOrder: onCreateOrder,
                    ),
              if (showScrollDown)
                Positioned(
                  bottom: AppSpacing.l,
                  left: 0,
                  right: 0,
                  child: Center(child: ScrollDownButton(onPressed: onScrollToBottom)),
                ),
            ],
          ),
        ),
        if (isVoiceMode)
          VoicePanel(onClose: () => onVoiceModeChanged(false))
        else
          Padding(
            padding: const EdgeInsets.all(AppSpacing.l).copyWith(top: AppSpacing.s),
            child: ChatInputPanel(
              isStreaming: chatState.isStreaming,
              disabled: !isOnline || isCreatingConversation,
              onSend: (text) {
                if (conversationId == null) {
                  onFirstMessage?.call(text);
                } else {
                  ref.read(chatProvider(conversationId!).notifier).sendMessage(text);
                  onScrollToBottom();
                }
              },
              onMicPressed: () => onVoiceModeChanged(true),
              onAddPressed: () {},
            ),
          ),
      ],
    );
  }
}
