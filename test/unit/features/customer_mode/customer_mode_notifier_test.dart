import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:alora_mobile/core/storage/secure_storage.dart';
import 'package:alora_mobile/features/customer_mode/application/pin_result.dart';
import 'package:alora_mobile/features/customer_mode/application/providers.dart';

class MockSecureStorage extends Mock implements SecureStorage {}

void main() {
  late MockSecureStorage mockStorage;
  late ProviderContainer container;

  setUp(() {
    mockStorage = MockSecureStorage();
    when(() => mockStorage.getPinErrorCount()).thenAnswer((_) async => 0);
    when(() => mockStorage.getPinLockUntil()).thenAnswer((_) async => null);
    when(
      () => mockStorage.savePinLock(
        errorCount: any(named: 'errorCount'),
        lockUntil: any(named: 'lockUntil'),
      ),
    ).thenAnswer((_) async {});
    when(() => mockStorage.clearPinLock()).thenAnswer((_) async {});
    container = ProviderContainer(
      overrides: [secureStorageProvider.overrideWithValue(mockStorage)],
    );
  });

  tearDown(() {
    container.dispose();
  });

  test('initial state is false and then reads storage', () async {
    when(() => mockStorage.getPin()).thenAnswer((_) async => '1234');

    // Listen to trigger build
    final sub = container.listen(customerModeNotifierProvider, (_, _) {});

    // Initially false before init completes
    expect(container.read(customerModeNotifierProvider), false);

    // Wait for microtasks
    await Future.delayed(Duration.zero);

    expect(container.read(customerModeNotifierProvider), true);
    sub.close();
  });

  test('enable saves pin and sets state to true', () async {
    when(() => mockStorage.getPin()).thenAnswer((_) async => null);
    when(() => mockStorage.savePin('1234')).thenAnswer((_) async {});

    final notifier = container.read(customerModeNotifierProvider.notifier);

    await notifier.enable('1234');

    verify(() => mockStorage.savePin('1234')).called(1);
    expect(container.read(customerModeNotifierProvider), true);
  });

  test(
    'disable increments error count on wrong pin and blocks after 3',
    () async {
      when(() => mockStorage.getPin()).thenAnswer((_) async => '1234');
      when(() => mockStorage.savePin('1234')).thenAnswer((_) async {});

      final notifier = container.read(customerModeNotifierProvider.notifier);
      await notifier.enable('1234');

      // First wrong attempt
      final result1 = await notifier.disable('1111');
      expect(result1, isA<PinWrong>());
      expect((result1 as PinWrong).attemptsLeft, 2);
      expect(notifier.errorCount, 1);

      // Second wrong attempt
      final result2 = await notifier.disable('1111');
      expect(result2, isA<PinWrong>());
      expect((result2 as PinWrong).attemptsLeft, 1);
      expect(notifier.errorCount, 2);

      // Third wrong attempt locks
      final result3 = await notifier.disable('1111');
      expect(result3, isA<PinLocked>());
      expect((result3 as PinLocked).seconds, 30);
      expect(notifier.lockUntil, isNotNull);

      // Further attempts while locked return PinLocked
      final result4 = await notifier.disable('1111');
      expect(result4, isA<PinLocked>());
    },
  );

  test('disable returns PinOk and clears pin when correct', () async {
    when(() => mockStorage.getPin()).thenAnswer((_) async => '1234');
    when(() => mockStorage.savePin('1234')).thenAnswer((_) async {});
    when(() => mockStorage.clearPin()).thenAnswer((_) async {});

    final notifier = container.read(customerModeNotifierProvider.notifier);
    await notifier.enable('1234');

    final result = await notifier.disable('1234');

    expect(result, isA<PinOk>());
    verify(() => mockStorage.clearPin()).called(1);
    expect(container.read(customerModeNotifierProvider), false);
  });

  test(
    'qulf muddati storage\'dan tiklanadi (ilova qayta ochilganda ham qulf)',
    () async {
      when(() => mockStorage.getPin()).thenAnswer((_) async => '1234');
      when(() => mockStorage.getPinLockUntil()).thenAnswer(
        (_) async => DateTime.now().add(const Duration(seconds: 20)),
      );

      final sub = container.listen(customerModeNotifierProvider, (_, _) {});
      await Future<void>.delayed(Duration.zero);

      final result = await container
          .read(customerModeNotifierProvider.notifier)
          .disable('1234');
      expect(result, isA<PinLocked>());
      verifyNever(() => mockStorage.clearPin());
      sub.close();
    },
  );

  test('xato urinish soni storage\'ga yoziladi', () async {
    when(() => mockStorage.getPin()).thenAnswer((_) async => '1234');

    final sub = container.listen(customerModeNotifierProvider, (_, _) {});
    await Future<void>.delayed(Duration.zero);

    final result = await container
        .read(customerModeNotifierProvider.notifier)
        .disable('0000');
    expect(result, isA<PinWrong>());
    verify(() => mockStorage.savePinLock(errorCount: 1)).called(1);
    sub.close();
  });
}
