import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:alora_mobile/app/router/routes.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/features/chat/domain/entities/message.dart';
import 'package:alora_mobile/features/chat/domain/entities/order_draft.dart';
import 'package:alora_mobile/features/chat/presentation/widgets/chat_message_row.dart';

/// Xabarlar ro'yxati (teskari, har xabar RepaintBoundary ichida — §13).
class ChatMessageList extends StatelessWidget {
  final List<Message> messages;
  final ScrollController scrollController;
  final bool isCustomerMode;
  final void Function(OrderDraft draft) onCreateOrder;

  const ChatMessageList({
    super.key,
    required this.messages,
    required this.scrollController,
    required this.isCustomerMode,
    required this.onCreateOrder,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      reverse: true,
      itemCount: messages.length,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.l,
        vertical: AppSpacing.l,
      ),
      itemBuilder: (context, index) {
        return RepaintBoundary(
          child: ChatMessageRow(
            message: messages[index],
            isCustomerMode: isCustomerMode,
            onEditOrder: (draft) =>
                context.push(AppRoutes.orderNew, extra: draft),
            onCreateOrder: onCreateOrder,
          ),
        );
      },
    );
  }
}
