import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alora_mobile/features/orders/presentation/screens/order_detail_screen.dart';
import 'package:alora_mobile/features/orders/domain/entities/order.dart';
import 'package:alora_mobile/features/orders/domain/entities/order_measurement.dart';
import 'package:alora_mobile/features/orders/domain/entities/order_curtain_part.dart';
import 'package:alora_mobile/features/orders/domain/entities/order_accessory.dart';
import 'package:alora_mobile/features/orders/domain/entities/order_item.dart';
import 'package:alora_mobile/features/orders/domain/entities/order_variant.dart';
import 'package:alora_mobile/features/orders/domain/entities/statuses_response.dart';
import 'package:alora_mobile/features/orders/application/providers.dart';
import 'package:alora_mobile/shared/models/order_status.dart';
import 'package:alora_mobile/shared/models/payment_status.dart';
import 'package:alora_mobile/shared/models/price_unit.dart';
import 'package:alora_mobile/shared/widgets/money_text.dart';
import 'package:mocktail/mocktail.dart';

import '../../../helpers/pump_app.dart';
import '../../../helpers/mock_orders_repository.dart';

/// Barcha bo'limlar to'ldirilgan, ichki hisob-kitoblari izchil buyurtma.
Order _fullOrder() => const Order(
  id: 'order-full',
  number: 'ORD-9001',
  customerName: 'Karimova Nilufar',
  customerPhone: '+998901234567',
  address: 'Toshkent',
  status: OrderStatus.confirmed,
  paymentStatus: PaymentStatus.prepaid,
  subtotal: 7153000,
  discountPercent: 5,
  discountAmount: 357650,
  discountSourceDisplay: 'Bosqich bo\'yicha',
  deliveryAmount: 80000,
  total: 6875350,
  prepaymentPercent: 50,
  prepayment: 3437675,
  balance: 3437675,
  measurements: [
    OrderMeasurement(
      id: 'm1',
      roomName: 'Mehmonxona',
      corniceLengthM: 4.2,
      heightM: 2.6,
      coefficient: 2.5,
      parts: [
        OrderCurtainPart(
          id: 'p1',
          variant: OrderVariant(
            id: 'v1',
            sku: 'VEL-01',
            colorName: 'Zumrad',
            productName: 'Velvet Zumrad',
            priceUnit: PriceUnit.perSqm,
          ),
          role: 'portyera',
          widthM: 10.5,
          heightM: 2.6,
          coefficient: 2.5,
          areaSqm: 27.3,
          pricePerSqm: 120000,
          total: 3276000,
        ),
        OrderCurtainPart(
          id: 'p2',
          variant: OrderVariant(
            id: 'v2',
            sku: 'TUL-02',
            productName: 'Tul Shaffof',
            priceUnit: PriceUnit.perSqm,
          ),
          role: 'tul',
          widthM: 10.5,
          heightM: 2.6,
          coefficient: 1.5,
          areaSqm: 40.95,
          pricePerSqm: 40000,
          total: 1638000,
        ),
      ],
      accessories: [
        OrderAccessory(
          id: 'a1',
          variant: OrderVariant(
            id: 'acc-1',
            sku: 'TAS-01',
            productName: 'Tasma',
            priceUnit: PriceUnit.perMeter,
          ),
          qty: 6,
          unit: 'per_meter',
          unitPrice: 15000,
          total: 90000,
        ),
      ],
    ),
    OrderMeasurement(
      id: 'm2',
      roomName: 'Yotoqxona',
      corniceLengthM: 3.0,
      heightM: 2.7,
      coefficient: 2.0,
      parts: [
        OrderCurtainPart(
          id: 'p3',
          variant: OrderVariant(
            id: 'v3',
            sku: 'VEL-01',
            productName: 'Velvet Zumrad',
            priceUnit: PriceUnit.perSqm,
          ),
          role: 'portyera',
          widthM: 6.0,
          heightM: 2.7,
          coefficient: 2.0,
          areaSqm: 16.2,
          pricePerSqm: 120000,
          total: 1944000,
        ),
      ],
    ),
  ],
  items: [
    OrderItem(
      id: 'i1',
      serviceKey: 'sewing',
      nameSnapshot: 'Tikuv',
      qty: 1,
      unit: 'per_piece',
      unitPrice: 125000,
      total: 125000,
    ),
    OrderItem(
      id: 'i2',
      serviceKey: 'install',
      nameSnapshot: 'Montaj',
      qty: 1,
      unit: 'per_piece',
      unitPrice: 80000,
      total: 80000,
    ),
  ],
);

void main() {
  late MockOrdersRepository mockRepo;

  setUp(() {
    mockRepo = MockOrdersRepository();
    when(() => mockRepo.getStatuses())
        .thenAnswer((_) async => const StatusesResponse(statuses: []));
    when(() => mockRepo.getOrder('order-full')).thenAnswer((_) async => _fullOrder());
  });

  Widget wrapWithProvider(Widget child) {
    return ProviderScope(
      overrides: [ordersRepositoryProvider.overrideWithValue(mockRepo)],
      child: child.pumpApp(),
    );
  }

  testWidgets('OrderDetail to\'liq: xonalar, bo\'laklar, aksessuarlar, xizmatlar', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(wrapWithProvider(const OrderDetailScreen(orderId: 'order-full')));
    await tester.pumpAndSettle();

    // Xonalar (o'lchovlar)
    expect(find.text('Mehmonxona'), findsOneWidget);
    expect(find.text('Yotoqxona'), findsOneWidget);

    // Bo'laklar: mato nomi + SKU + rol
    expect(find.text('Velvet Zumrad'), findsNWidgets(2));
    expect(find.text('Tul Shaffof'), findsOneWidget);
    expect(find.textContaining('SKU VEL-01'), findsNWidgets(2));
    expect(find.textContaining('SKU TUL-02'), findsOneWidget);
    expect(find.text('Portyera'), findsNWidgets(2));
    expect(find.text('Tul'), findsOneWidget);

    // Bo'lak meta qatori: o'lcham, koeffitsient, maydon, birlik narxi
    expect(find.text('10.5 m × 2.6 m'), findsNWidgets(2));
    expect(find.textContaining('27.3 m²'), findsOneWidget);
    expect(find.textContaining(RegExp(r'120[\u0020\u202F]000')), findsNWidgets(2));

    // Aksessuarlar
    expect(find.text('Tasma'), findsOneWidget);
    expect(find.textContaining('SKU TAS-01'), findsOneWidget);

    // Xizmatlar
    expect(find.text('Tikuv'), findsOneWidget);
    expect(find.text('Montaj'), findsOneWidget);
  });

  testWidgets('OrderDetail moliyaviy bo\'lim: barcha qator summalari (§0.8)', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(wrapWithProvider(const OrderDetailScreen(orderId: 'order-full')));
    await tester.pumpAndSettle();

    // Bo'lim sarlavhalari
    expect(find.text('Bo\'laklar'), findsNWidgets(2));
    expect(find.text('Aksessuarlar'), findsOneWidget);
    expect(find.text('Xizmatlar'), findsOneWidget);

    // Yakuniy hisob qatorlari
    expect(find.text('Bo\'laklar jami'), findsOneWidget);
    expect(find.text('Aksessuarlar jami'), findsOneWidget);
    expect(find.text('Xizmatlar jami'), findsOneWidget);
    expect(find.text('Chegirma (5%) · Bosqich bo\'yicha'), findsOneWidget);
    expect(find.text('Yetkazish'), findsOneWidget);
    expect(find.text('Jami'), findsOneWidget);
    expect(find.text('Avans (50%)'), findsOneWidget);
    expect(find.text('Qoldiq'), findsOneWidget);

    // Ko'rsatilgan barcha pullar backend qiymatlariga mos (§0.8)
    final amounts = tester
        .widgetList<MoneyText>(find.byType(MoneyText))
        .map((m) => m.amount)
        .toList();

    expect(
      amounts,
      containsAll(<int>[
        3276000, // p1
        1638000, // p2
        1944000, // p3
        90000, // a1 va aksessuarlar jami
        125000, // i1
        80000, // i2 va yetkazish
        6858000, // bo'laklar jami
        205000, // xizmatlar jami
        357650, // chegirma
        6875350, // jami
        3437675, // avans va qoldiq
      ]),
    );
  });
}
