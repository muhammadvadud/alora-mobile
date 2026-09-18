import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:alora_mobile/core/connectivity/offline_flush_notifier.dart';

void main() {
  test('boshlang\'ich holat bo\'sh ro\'yxat', () {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    expect(container.read(offlineFlushMessagesProvider), isEmpty);
  });

  test('add() xabarni qo\'shadi, clear() tozalaydi', () {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    container.read(offlineFlushMessagesProvider.notifier).add('xat_1');
    container.read(offlineFlushMessagesProvider.notifier).add('xat_2');

    expect(container.read(offlineFlushMessagesProvider), ['xat_1', 'xat_2']);

    container.read(offlineFlushMessagesProvider.notifier).clear();
    expect(container.read(offlineFlushMessagesProvider), isEmpty);
  });
}
