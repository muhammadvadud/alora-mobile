import 'package:flutter_test/flutter_test.dart';
import 'package:alora_mobile/shared/widgets/status_pill.dart';
import 'package:alora_mobile/shared/models/order_status.dart';
import 'package:alora_mobile/shared/models/payment_status.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('StatusPill va PaymentChip Widget Tests', () {
    final orderStatuses = [
      OrderStatus.draft,
      OrderStatus.confirmed,
      OrderStatus.measuring,
      OrderStatus.production,
      OrderStatus.ready,
      OrderStatus.installing,
      OrderStatus.completed,
      OrderStatus.cancelled,
    ];

    for (final status in orderStatuses) {
      testWidgets('StatusPill ${status.name} holatida tekshiriladi', (
        WidgetTester tester,
      ) async {
        await tester.pumpWidget(StatusPill(status: status).pumpApp());

        expect(find.byType(StatusPill), findsOneWidget);
      });
    }

    final paymentStatuses = [
      PaymentStatus.prepaid,
      PaymentStatus.paid,
      PaymentStatus.unpaid,
    ];

    for (final status in paymentStatuses) {
      testWidgets('PaymentChip ${status.name} holatida tekshiriladi', (
        WidgetTester tester,
      ) async {
        await tester.pumpWidget(PaymentChip(status: status).pumpApp());

        expect(find.byType(PaymentChip), findsOneWidget);
      });
    }
  });
}
