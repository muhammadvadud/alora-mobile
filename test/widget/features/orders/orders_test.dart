import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alora_mobile/features/orders/presentation/screens/orders_screen.dart';
import 'package:alora_mobile/features/orders/presentation/screens/order_detail_screen.dart';
import 'package:alora_mobile/features/orders/presentation/screens/order_form_screen.dart';
import 'package:alora_mobile/features/orders/domain/entities/order.dart';
import 'package:alora_mobile/features/orders/domain/entities/order_measurement.dart';
import 'package:alora_mobile/features/orders/domain/entities/statuses_response.dart';
import 'package:alora_mobile/shared/models/order_status.dart';
import 'package:alora_mobile/shared/models/payment_status.dart';
import 'package:alora_mobile/features/orders/application/providers.dart';
import 'package:mocktail/mocktail.dart';

import '../../../helpers/pump_app.dart';
import '../../../helpers/mock_orders_repository.dart';

import 'package:alora_mobile/core/utils/paginated.dart';
import 'package:alora_mobile/features/orders/presentation/widgets/order_card.dart';
import 'package:alora_mobile/features/orders/presentation/widgets/status_change_sheet.dart';
import 'package:alora_mobile/shared/widgets/empty_state.dart';
import 'package:alora_mobile/shared/widgets/skeleton.dart';

void main() {
  late MockOrdersRepository mockRepo;
  final dummyOrder = Order(
    id: 'order-1',
    number: 'ORD-1234',
    customerName: 'Toshmat',
    customerPhone: '+998901234567',
    status: OrderStatus.draft,
    statusDisplay: 'Qoralama',
    total: 500000,
    paymentStatus: PaymentStatus.unpaid,
    measurements: const [OrderMeasurement(id: 'm1', roomName: 'Mehmonxona', parts: [])],
    deadlineDate: DateTime.now().add(const Duration(days: 2)),
  );

  setUp(() {
    mockRepo = MockOrdersRepository();
    when(() => mockRepo.getStatuses())
        .thenAnswer((_) async => const StatusesResponse(statuses: []));
  });

  Widget wrapWithProvider(Widget child) {
    return ProviderScope(
      overrides: [ordersRepositoryProvider.overrideWithValue(mockRepo)],
      child: child.pumpApp(),
    );
  }

  testWidgets('OrdersScreen ro\'yxat/bo\'sh (S-15)', (WidgetTester tester) async {
    when(
      () => mockRepo.getOrders(
        status: any(named: 'status'),
        search: any(named: 'search'),
      ),
    ).thenAnswer((_) async => const Paginated<Order>(next: null, previous: null, results: []));

    await tester.pumpWidget(wrapWithProvider(const OrdersScreen()));
    await tester.pumpAndSettle();

    expect(find.byType(EmptyState), findsOneWidget);
    expect(find.text('Hali buyurtma yo\'q'), findsOneWidget);
  });

  testWidgets('OrdersScreen skeleton loading', (WidgetTester tester) async {
    when(
      () => mockRepo.getOrders(
        status: any(named: 'status'),
        search: any(named: 'search'),
      ),
    ).thenAnswer((_) async {
      await Future.delayed(const Duration(seconds: 1));
      return const Paginated<Order>(next: null, previous: null, results: []);
    });

    when(() => mockRepo.getStatuses()).thenAnswer((_) async {
      await Future.delayed(const Duration(seconds: 1));
      return const StatusesResponse(statuses: []);
    });

    await tester.pumpWidget(wrapWithProvider(const OrdersScreen()));
    await tester.pump(); // Start loading

    // The statuses skeleton and the list skeleton should be visible
    expect(find.byType(SkeletonBox), findsWidgets);

    // Finish loading
    await tester.pumpAndSettle();
  });

  testWidgets('OrderCard (status chiziq, pill, muddat) va swipe amallari', (
    WidgetTester tester,
  ) async {
    when(
      () => mockRepo.getOrders(
        status: any(named: 'status'),
        search: any(named: 'search'),
      ),
    ).thenAnswer((_) async => Paginated<Order>(next: null, previous: null, results: [dummyOrder]));

    await tester.pumpWidget(wrapWithProvider(const OrdersScreen()));
    await tester.pumpAndSettle();

    expect(find.text('ORD-1234'), findsOneWidget);
    expect(find.textContaining('Toshmat'), findsOneWidget);

    // Swipe left to show status change
    await tester.drag(find.byType(OrderCard), const Offset(-500.0, 0.0));
    await tester.pumpAndSettle();

    // Expect StatusChangeSheet to appear
    expect(find.byType(StatusChangeSheet), findsOneWidget);
  });

  testWidgets('OrderDetail 8 bo\'lim + yopishqoq panel', (WidgetTester tester) async {
    when(() => mockRepo.getOrder('order-1')).thenAnswer((_) async => dummyOrder);

    await tester.pumpWidget(wrapWithProvider(const OrderDetailScreen(orderId: 'order-1')));
    await tester.pumpAndSettle();

    expect(find.text('ORD-1234'), findsOneWidget);
    expect(find.text('Toshmat'), findsOneWidget);
    expect(find.text('Mehmonxona'), findsOneWidget);
  });

  testWidgets('OrderForm bo\'limlari', (WidgetTester tester) async {
    await tester.pumpWidget(wrapWithProvider(const OrderFormScreen()));
    await tester.pumpAndSettle();

    expect(find.byType(OrderFormScreen), findsOneWidget);
  });
}
