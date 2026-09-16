import 'package:flutter_test/flutter_test.dart';
import 'package:alora_mobile/features/orders/domain/entities/order.dart';
import 'package:alora_mobile/features/orders/domain/entities/order_extension.dart';
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
      final order = createOrder(
        DateTime.now().subtract(const Duration(days: 1)),
      );
      expect(order.deadlineColor(colors), colors.danger);
    });

    test('returns brass color when deadline is <= 3 days', () {
      final order = createOrder(DateTime.now().add(const Duration(days: 2)));
      expect(order.deadlineColor(colors), colors.brass);
    });

    test('returns null when deadline is > 3 days', () {
      final order = createOrder(
        DateTime.now().add(const Duration(days: 4, hours: 1)),
      );
      expect(order.deadlineColor(colors), isNull);
    });
  });
}
