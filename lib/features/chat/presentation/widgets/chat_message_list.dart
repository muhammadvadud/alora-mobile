import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:alora_mobile/app/router/routes.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/features/chat/domain/entities/message.dart';
import 'package:alora_mobile/features/chat/domain/entities/order_draft.dart';
import 'package:alora_mobile/features/chat/domain/entities/pricing_option.dart';
import 'package:alora_mobile/features/chat/presentation/widgets/chat_message_row.dart';
import 'package:alora_mobile/features/orders/presentation/models/order_form_route_args.dart';

/// Xabarlar ro'yxati (teskari, har xabar RepaintBoundary ichida — §13).
class ChatMessageList extends StatelessWidget {
  final List<Message> messages;
  final ScrollController scrollController;
  final bool isCustomerMode;
  final String? conversationId;
  final void Function(OrderDraft draft) onCreateOrder;
  final VoidCallback? onAddPart;
  final VoidCallback? onShowOptions;
  final ValueChanged<PricingOption>? onSelectOption;

  const ChatMessageList({
    super.key,
    required this.messages,
    required this.scrollController,
    required this.isCustomerMode,
    required this.conversationId,
    required this.onCreateOrder,
    this.onAddPart,
    this.onShowOptions,
    this.onSelectOption,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      reverse: true,
      itemCount: messages.length,
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.l, vertical: AppSpacing.l),
      itemBuilder: (context, index) {
        return RepaintBoundary(
          child: ChatMessageRow(
            message: messages[index],
            isCustomerMode: isCustomerMode,
            onEditOrder: (draft) => context.push(
              AppRoutes.orderNew,
              extra: OrderFormRouteArgs(draft: draft, conversationId: conversationId),
            ),
            onCreateOrder: onCreateOrder,
            onAddPart: onAddPart,
            onShowOptions: onShowOptions,
            onSelectOption: onSelectOption,
          ),
        );
      },
    );
  }
}
