import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:alora_mobile/features/auth/application/session_expired_notifier.dart';

void main() {
  test('boshlang\'ich holat 0 bo\'ladi', () {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    expect(container.read(sessionExpiredProvider), 0);
  });

  test('trigger() har chaqirilganda sanoqni oshiriladi', () {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    container.read(sessionExpiredProvider.notifier).trigger();
    container.read(sessionExpiredProvider.notifier).trigger();

    expect(container.read(sessionExpiredProvider), 2);
  });
}
