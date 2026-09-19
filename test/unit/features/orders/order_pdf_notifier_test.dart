import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:share_plus_platform_interface/share_plus_platform_interface.dart';
import 'package:alora_mobile/features/orders/application/order_pdf_notifier.dart';
import 'package:alora_mobile/features/orders/domain/entities/order.dart';
import 'package:alora_mobile/features/orders/application/providers.dart';
import 'package:alora_mobile/features/orders/domain/repositories/orders_repository.dart';
import 'package:alora_mobile/shared/models/order_status.dart';
import 'package:alora_mobile/shared/models/payment_status.dart';
import 'package:alora_mobile/core/utils/paginated.dart';
import 'package:alora_mobile/features/orders/domain/entities/statuses_response.dart';

const _order = Order(
  id: '123',
  number: 'ORD-001',
  customerName: 'Toshmat',
  total: 1000000,
  status: OrderStatus.draft,
  paymentStatus: PaymentStatus.unpaid,
);

class FakePathProvider extends PathProviderPlatform {
  @override
  Future<String?> getTemporaryPath() async => '/tmp';

  @override
  Future<String?> getApplicationSupportPath() async => '/tmp';

  @override
  Future<String?> getLibraryPath() async => '/tmp';

  @override
  Future<String?> getApplicationDocumentsPath() async => '/tmp';

  @override
  Future<String?> getExternalStoragePath() async => '/tmp';
}

class FakeSharePlatform extends SharePlatform with MockPlatformInterfaceMixin {
  ShareParams? lastParams;
  List<ShareParams> allParams = [];

  @override
  Future<ShareResult> share(ShareParams params) async {
    allParams.add(params);
    lastParams = params;
    return const ShareResult('test', ShareResultStatus.success);
  }
}

class MockOrdersRepository implements OrdersRepository {
  @override
  Future<Uint8List> getPdf(String id) async {
    return Uint8List.fromList([1, 2, 3]);
  }

  @override
  Future<Order> changeStatus(String id, String status, {String? note, String? actionDate}) {
    throw UnimplementedError();
  }

  @override
  Future<Order> confirmOrder(String id) {
    throw UnimplementedError();
  }

  @override
  Future<Order> createOrder(Map<String, dynamic> body) {
    throw UnimplementedError();
  }

  @override
  Future<Order> getOrder(String id) {
    throw UnimplementedError();
  }

  @override
  Future<Paginated<Order>> getOrders({String? status, String? search, String? url}) {
    throw UnimplementedError();
  }

  @override
  Future<StatusesResponse> getStatuses() {
    throw UnimplementedError();
  }

  @override
  Future<Order> patchOrder(String id, Map<String, dynamic> body) {
    throw UnimplementedError();
  }
}

void main() {
  late final FakeSharePlatform share;

  setUpAll(() {
    share = FakeSharePlatform();
    SharePlatform.instance = share;
  });

  setUp(() {
    PathProviderPlatform.instance = FakePathProvider();
    share.allParams.clear();
    share.lastParams = null;
  });

  tearDown(() {
    final f = File('/tmp/order_123.pdf');
    if (f.existsSync()) {
      f.deleteSync();
    }
  });

  ProviderContainer container() => ProviderContainer(
    overrides: [ordersRepositoryProvider.overrideWithValue(MockOrdersRepository())],
  );

  test('openPdf: PDF emas, vaqtincha fayl yaratiladi va yoziladi', () async {
    final c = container();
    final sub = c.listen(orderPdfProvider('123'), (_, _) {});
    final notifier = c.read(orderPdfProvider('123').notifier);

    try {
      await notifier.openPdf();
    } catch (_) {}

    final file = File('/tmp/order_123.pdf');
    expect(file.existsSync(), true, reason: 'temp fayl yaratilishi kerak');
    expect(await file.readAsBytes(), [1, 2, 3]);
    sub.close();
  });

  test('sharePdf: fayl ShareParams.files orqali uzatiladi', () async {
    final c = container();
    final sub = c.listen(orderPdfProvider('123'), (_, _) {});
    final notifier = c.read(orderPdfProvider('123').notifier);

    await notifier.sharePdf();

    expect(File('/tmp/order_123.pdf').existsSync(), true);
    expect(share.lastParams, isNotNull);
    expect(share.lastParams!.files!.map((f) => f.path).toList(), ['/tmp/order_123.pdf']);
    expect(share.lastParams!.text, 'Buyurtma PDF');
    expect(c.read(orderPdfProvider('123')).hasError, false);
    sub.close();
  });

  test('shareOrderText: matn formatMoney bilan formatlanadi', () async {
    final c = container();
    final sub = c.listen(orderPdfProvider('123'), (_, _) {});
    final notifier = c.read(orderPdfProvider('123').notifier);

    await notifier.shareOrderText(_order);

    final text = share.lastParams!.text!;
    expect(text, contains('Buyurtma: ORD-001'));
    expect(text, contains('Mijoz: Toshmat'));
    expect(text, contains("Jami: 1\u202F000\u202F000 so'm"));
    expect(text, contains("Muddat: Noma'lum"));
    expect(c.read(orderPdfProvider('123')).hasError, false);
    sub.close();
  });
}
