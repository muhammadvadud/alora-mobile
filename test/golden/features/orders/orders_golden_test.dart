import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alora_mobile/features/orders/presentation/screens/orders_screen.dart';
import 'package:alora_mobile/features/orders/presentation/screens/order_detail_screen.dart';
import 'package:alora_mobile/features/orders/presentation/screens/order_form_screen.dart';
import 'package:alora_mobile/features/orders/presentation/widgets/status_change_sheet.dart';
import 'package:alora_mobile/features/orders/domain/entities/order.dart';
import 'package:alora_mobile/features/orders/domain/entities/order_measurement.dart';
import 'package:alora_mobile/features/orders/domain/entities/statuses_response.dart';
import 'package:alora_mobile/shared/models/order_status.dart';
import 'package:alora_mobile/shared/models/payment_status.dart';
import 'package:alora_mobile/features/orders/application/providers.dart';
import 'package:mocktail/mocktail.dart';
import 'package:alora_mobile/core/utils/paginated.dart';

import '../../../helpers/pump_app.dart';
import '../../../helpers/mock_orders_repository.dart';

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
    createdAt: DateTime.now().subtract(const Duration(days: 1)),
  );

  setUpAll(() async {
    await loadAppFonts();
  });

  setUp(() {
    mockRepo = MockOrdersRepository();
    when(() => mockRepo.getStatuses())
        .thenAnswer((_) async => const StatusesResponse(statuses: []));
  });

  Widget wrapWithProvider(Widget child) {
    return ProviderScope(
      overrides: [ordersRepositoryProvider.overrideWithValue(mockRepo)],
      child: child,
    );
  }

  testGoldens('S-11 yorug\'/qorong\'i (OrdersScreen) - loaded state', (tester) async {
    when(
      () => mockRepo.getOrders(
        status: any(named: 'status'),
        search: any(named: 'search'),
      ),
    ).thenAnswer(
      (_) async => Paginated<Order>(
        next: null,
        previous: null,
        results: [
          dummyOrder,
          dummyOrder.copyWith(id: 'order-2', number: 'ORD-1235'),
        ],
      ),
    );

    // Light
    await tester.pumpWidgetBuilder(
      wrapWithProvider(const OrdersScreen().pumpApp(themeMode: ThemeMode.light)),
      surfaceSize: const Size(400, 800),
    );
    await tester.pumpAndSettle();
    await screenMatchesGolden(tester, 'orders_screen_light');

    // Dark
    await tester.pumpWidgetBuilder(
      wrapWithProvider(const OrdersScreen().pumpApp(themeMode: ThemeMode.dark)),
      surfaceSize: const Size(400, 800),
    );
    await tester.pumpAndSettle();
    await screenMatchesGolden(tester, 'orders_screen_dark');
  });

  testGoldens('S-15 (Empty orders)', (tester) async {
    when(
      () => mockRepo.getOrders(
        status: any(named: 'status'),
        search: any(named: 'search'),
      ),
    ).thenAnswer((_) async => const Paginated<Order>(next: null, previous: null, results: []));

    await tester.pumpWidgetBuilder(
      wrapWithProvider(const OrdersScreen().pumpApp(themeMode: ThemeMode.light)),
      surfaceSize: const Size(400, 800),
    );
    await tester.pumpAndSettle();
    await screenMatchesGolden(tester, 'orders_screen_empty');
  });

  testGoldens('S-12 yorug\'/qorong\'i (OrderDetailScreen)', (tester) async {
    when(() => mockRepo.getOrder('order-1')).thenAnswer((_) async => dummyOrder);

    // Light
    await tester.pumpWidgetBuilder(
      wrapWithProvider(
        const OrderDetailScreen(orderId: 'order-1').pumpApp(themeMode: ThemeMode.light),
      ),
      surfaceSize: const Size(400, 800),
    );
    await tester.pumpAndSettle();
    await screenMatchesGolden(tester, 'order_detail_screen_light');

    // Dark
    await tester.pumpWidgetBuilder(
      wrapWithProvider(
        const OrderDetailScreen(orderId: 'order-1').pumpApp(themeMode: ThemeMode.dark),
      ),
      surfaceSize: const Size(400, 800),
    );
    await tester.pumpAndSettle();
    await screenMatchesGolden(tester, 'order_detail_screen_dark');
  });

  testGoldens('S-14 (OrderFormScreen)', (tester) async {
    await tester.pumpWidgetBuilder(
      wrapWithProvider(const OrderFormScreen().pumpApp(themeMode: ThemeMode.light)),
      surfaceSize: const Size(400, 800),
    );
    await tester.pumpAndSettle();
    await screenMatchesGolden(tester, 'order_form_screen');
  });

  testGoldens('S-13 (StatusChangeSheet)', (tester) async {
    await tester.pumpWidgetBuilder(
      wrapWithProvider(
        Scaffold(body: StatusChangeSheet(order: dummyOrder)).pumpApp(themeMode: ThemeMode.light),
      ),
      surfaceSize: const Size(400, 600),
    );
    await tester.pumpAndSettle();
    await screenMatchesGolden(tester, 'status_change_sheet');
  });
}
