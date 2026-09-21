import 'package:flutter_test/flutter_test.dart';
import 'package:alora_mobile/features/orders/domain/entities/order.dart';
import 'package:alora_mobile/features/orders/domain/entities/order_extension.dart';
import 'package:alora_mobile/features/orders/domain/entities/order_measurement.dart';
import 'package:alora_mobile/features/orders/domain/entities/order_curtain_part.dart';
import 'package:alora_mobile/features/orders/domain/entities/order_accessory.dart';
import 'package:alora_mobile/features/orders/domain/entities/order_item.dart';
import 'package:alora_mobile/app/theme/app_colors.dart';
import 'package:alora_mobile/shared/models/order_status.dart';
import 'package:alora_mobile/shared/models/payment_status.dart';

void main() {
  group('Order Extension deadlineColor', () {
    const colors = AppColors.light;

    Order createOrder(DateTime? deadline) {
      return Order(
        id: '1',
        status: OrderStatus.draft,
        paymentStatus: PaymentStatus.unpaid,
        deadlineDate: deadline,
      );
    }

    test('returns null when deadlineDate is null', () {
      final order = createOrder(null);
      expect(order.deadlineColor(colors), isNull);
    });

    test('returns danger color when deadline is past', () {
      final order = createOrder(DateTime.now().subtract(const Duration(days: 1)));
      expect(order.deadlineColor(colors), colors.danger);
    });

    test('returns warning color when deadline is <= 3 days', () {
      final order = createOrder(DateTime.now().add(const Duration(days: 2)));
      expect(order.deadlineColor(colors), colors.warning);
    });

    test('returns null when deadline is > 3 days', () {
      final order = createOrder(DateTime.now().add(const Duration(days: 4, hours: 1)));
      expect(order.deadlineColor(colors), isNull);
    });
  });

  group('OrderSumsX summari (§0.8 — faqat ko\'rsatish uchun)', () {
    Order consistentOrder() => const Order(
      id: 'o-sums',
      status: OrderStatus.confirmed,
      paymentStatus: PaymentStatus.prepaid,
      subtotal: 4929000,
      discountPercent: 5,
      discountAmount: 246450,
      discountSourceDisplay: 'Bosqich bo\'yicha',
      deliveryAmount: 80000,
      total: 4762550,
      prepaymentPercent: 50,
      prepayment: 2381275,
      balance: 2381275,
      measurements: [
        OrderMeasurement(
          id: 'm1',
          parts: [
            OrderCurtainPart(id: 'p1', total: 2688000),
            OrderCurtainPart(id: 'p2', total: 1344000),
          ],
          accessories: [OrderAccessory(id: 'a1', total: 90000)],
        ),
        OrderMeasurement(
          id: 'm2',
          parts: [OrderCurtainPart(id: 'p3', total: 602000)],
        ),
      ],
      items: [
        OrderItem(id: 'i1', total: 125000),
        OrderItem(id: 'i2', total: 80000),
      ],
    );

    test('parts/accessories/services summalari backend subtotal ga teng (§0.8)', () {
      final order = consistentOrder();
      expect(order.partsTotal, 4634000);
      expect(order.accessoriesTotal, 90000);
      expect(order.servicesTotal, 205000);
      expect(order.partsTotal + order.accessoriesTotal + order.servicesTotal, order.subtotal);
      expect(order.total, order.subtotal! - order.discountAmount! + order.deliveryAmount!);
    });

    test('bo\'sh orderda summalar nol', () {
      const order = Order(
        id: 'empty',
        status: OrderStatus.draft,
        paymentStatus: PaymentStatus.unpaid,
      );
      expect(order.partsTotal, 0);
      expect(order.accessoriesTotal, 0);
      expect(order.servicesTotal, 0);
    });
  });
}
