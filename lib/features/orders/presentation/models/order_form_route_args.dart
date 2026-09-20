import 'package:alora_mobile/features/chat/domain/entities/order_draft.dart';

class OrderFormRouteArgs {
  final OrderDraft? draft;
  final String? conversationId;

  const OrderFormRouteArgs({this.draft, this.conversationId});
}
