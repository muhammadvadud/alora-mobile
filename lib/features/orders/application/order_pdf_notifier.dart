import 'dart:io';

import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../core/utils/date_format.dart';
import '../../../../core/utils/money_format.dart';
import '../domain/entities/order.dart';
import 'providers.dart';

part 'order_pdf_notifier.g.dart';

@riverpod
class OrderPdfNotifier extends _$OrderPdfNotifier {
  @override
  FutureOr<void> build(String id) {}

  Future<void> openPdf() async {
    state = const AsyncValue.loading();
    try {
      final repo = ref.read(ordersRepositoryProvider);
      final bytes = await repo.getPdf(id);

      final tempDir = await getTemporaryDirectory();
      final file = File('${tempDir.path}/order_$id.pdf');
      await file.writeAsBytes(bytes);

      state = const AsyncValue.data(null);
      await OpenFilex.open(file.path);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> sharePdf() async {
    state = const AsyncValue.loading();
    try {
      final repo = ref.read(ordersRepositoryProvider);
      final bytes = await repo.getPdf(id);

      final tempDir = await getTemporaryDirectory();
      final file = File('${tempDir.path}/order_$id.pdf');
      await file.writeAsBytes(bytes);

      state = const AsyncValue.data(null);
      await SharePlus.instance.share(ShareParams(files: [XFile(file.path)], text: 'Buyurtma PDF'));
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> shareOrderText(Order order) async {
    state = const AsyncValue.loading();
    try {
      final buffer = StringBuffer();
      buffer.writeln('Buyurtma: ${order.number ?? "Noma'lum"}');
      buffer.writeln('Mijoz: ${order.customerName ?? "Noma'lum"}');
      buffer.writeln('Jami: ${formatMoney(order.total ?? 0)}');
      if (order.createdAt != null) {
        buffer.writeln('Yaratilgan: ${formatDate(order.createdAt!)}');
      } else {
        buffer.writeln("Yaratilgan: Noma'lum");
      }

      state = const AsyncValue.data(null);
      await SharePlus.instance.share(ShareParams(text: buffer.toString()));
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
