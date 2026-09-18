import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:alora_mobile/core/storage/secure_storage.dart';
import 'package:alora_mobile/features/customer_mode/application/providers.dart';

class MockSecureStorage extends Mock implements SecureStorage {}

void main() {
  late MockSecureStorage mockStorage;
  late ProviderContainer container;

  setUp(() {
    mockStorage = MockSecureStorage();
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

  test('disable clears pin when correct', () async {
    when(() => mockStorage.getPin()).thenAnswer((_) async => '1234');
    when(() => mockStorage.savePin('1234')).thenAnswer((_) async {});
    when(() => mockStorage.clearPin()).thenAnswer((_) async {});

    final notifier = container.read(customerModeNotifierProvider.notifier);
    // Setup state
    await notifier.enable('1234');

    final success = await notifier.disable('1234');

    expect(success, true);
    verify(() => mockStorage.clearPin()).called(1);
    expect(container.read(customerModeNotifierProvider), false);
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
      expect(result1, false);
      expect(notifier.errorCount, 1);

      // Second wrong attempt
      final result2 = await notifier.disable('1111');
      expect(result2, false);
      expect(notifier.errorCount, 2);

      // Third wrong attempt throws
      await expectLater(
        () => notifier.disable('1111'),
        throwsA(
          isA<Exception>().having(
            (e) => e.toString(),
            'message',
            contains('3 marta xato'),
          ),
        ),
      );

      expect(notifier.lockUntil, isNotNull);

      // Further attempts while locked throw immediately
      await expectLater(
        () => notifier.disable('1111'),
        throwsA(
          isA<Exception>().having(
            (e) => e.toString(),
            'message',
            contains('soniya kuting'),
          ),
        ),
      );
    },
  );
}
