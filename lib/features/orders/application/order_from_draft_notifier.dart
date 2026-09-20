import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:alora_mobile/features/chat/domain/entities/order_draft.dart';
import 'package:alora_mobile/features/orders/application/orders_notifiers.dart';
import 'package:alora_mobile/features/orders/application/providers.dart';
import 'package:alora_mobile/features/orders/domain/entities/order.dart';

part 'order_from_draft_notifier.g.dart';

/// AI qoralamasidan (`OrderDraft`, S-07) buyurtma yaratadi — `POST orders/`.
/// Narx/hisob ilovada hisoblanmaydi: faqat backend bergan maydonlar uzatiladi (§0.8).
@riverpod
class OrderFromDraftNotifier extends _$OrderFromDraftNotifier {
  @override
  FutureOr<Order?> build() => null;

  Future<Order?> create(OrderDraft draft, {String? conversationId}) async {
    state = const AsyncValue.loading();
    final repo = ref.read(ordersRepositoryProvider);
    final result = await AsyncValue.guard(
      () => repo.createOrder(draftToBody(draft, conversationId: conversationId)),
    );
    state = result;
    if (result.hasValue) {
      ref.invalidate(ordersListProvider);
      ref.invalidate(draftOrdersCountProvider);
    }
    return result.value;
  }
}

/// `OrderDraft` → `POST orders/` tanasi (API-CONTRACT 4.2). Bo'sh maydonlar yuborilmaydi.
Map<String, dynamic> draftToBody(OrderDraft draft, {String? conversationId}) {
  return <String, dynamic>{
    'customer_name': ?draft.customerName,
    'customer_phone': ?draft.phone,
    'address': ?draft.address,
    'conversation_id': ?conversationId,
    if (draft.prepaymentPercent != null) 'prepayment_percent': draft.prepaymentPercent.toString(),
    if (draft.services.isNotEmpty) 'services': draft.services,
    if (draft.delivery) 'delivery': true,
    if (draft.discountPercent != null) 'discount_percent': draft.discountPercent.toString(),
    if (draft.deadline != null) 'deadline_date': draft.deadline!.toIso8601String().split('T').first,
    'measurements': [
      for (final m in draft.measurements)
        <String, dynamic>{
          'room_name': ?m.roomName,
          if (m.cornice != null) 'cornice_length_m': m.cornice!.toStringAsFixed(3),
          if (m.height != null) 'height_m': m.height!.toStringAsFixed(3),
          if (m.coefficient != null) 'coefficient': m.coefficient!.toStringAsFixed(3),
          if (m.parts.isNotEmpty)
            'parts': [
              for (final part in m.parts)
                <String, dynamic>{
                  'variant_id': part.variantId,
                  'role': part.role,
                  if (part.widthM != null) 'width_m': part.widthM!.toStringAsFixed(3),
                  if (part.heightM != null) 'height_m': part.heightM!.toStringAsFixed(3),
                  if (part.coefficient != null) 'coefficient': part.coefficient!.toStringAsFixed(3),
                },
            ],
          if (m.accessories.isNotEmpty)
            'accessories': [
              for (final accessory in m.accessories)
                <String, dynamic>{'variant_id': accessory.variantId, 'qty': accessory.qty},
            ],
        },
    ],
  };
}
