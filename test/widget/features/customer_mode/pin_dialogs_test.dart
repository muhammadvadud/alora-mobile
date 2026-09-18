import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:alora_mobile/core/storage/secure_storage.dart';
import 'package:alora_mobile/features/customer_mode/application/providers.dart';
import 'package:alora_mobile/features/customer_mode/presentation/widgets/pin_dialogs.dart';
import 'package:alora_mobile/app/theme/app_theme.dart';

class MockSecureStorage extends Mock implements SecureStorage {}

void main() {
  late MockSecureStorage mockStorage;

  setUp(() {
    mockStorage = MockSecureStorage();
  });

  Widget createWidgetUnderTest(Widget child) {
    return ProviderScope(
      overrides: [secureStorageProvider.overrideWithValue(mockStorage)],
      child: MaterialApp(
        theme: AppTheme.light(),
        home: Scaffold(body: child),
      ),
    );
  }

  testWidgets('SetPinDialog complete flow', (WidgetTester tester) async {
    when(() => mockStorage.getPin()).thenAnswer((_) async => null);
    when(() => mockStorage.savePin('1234')).thenAnswer((_) async {});

    await tester.pumpWidget(createWidgetUnderTest(const SetPinDialog()));

    // Allow Provider initialization
    await tester.pumpAndSettle();

    expect(find.text('PIN kodni o\'rnating'), findsOneWidget);

    // Enter 1234
    await tester.tap(find.text('1'));
    await tester.pump();
    await tester.tap(find.text('2'));
    await tester.pump();
    await tester.tap(find.text('3'));
    await tester.pump();
    await tester.tap(find.text('4'));
    await tester.pumpAndSettle();

    expect(find.text('PIN kodni tasdiqlang'), findsOneWidget);

    // Enter 1234 again
    await tester.tap(find.text('1'));
    await tester.pump();
    await tester.tap(find.text('2'));
    await tester.pump();
    await tester.tap(find.text('3'));
    await tester.pump();
    await tester.tap(find.text('4'));
    await tester.pumpAndSettle();

    verify(() => mockStorage.savePin('1234')).called(1);
    // Dialog closes
    expect(find.byType(SetPinDialog), findsNothing);
  });

  testWidgets('EnterPinDialog wrong pin shows error', (
    WidgetTester tester,
  ) async {
    when(() => mockStorage.getPin()).thenAnswer((_) async => '1234');
    when(() => mockStorage.savePin('1234')).thenAnswer((_) async {});

    final container = ProviderContainer(
      overrides: [secureStorageProvider.overrideWithValue(mockStorage)],
    );

    // Enable first
    await container.read(customerModeNotifierProvider.notifier).enable('1234');

    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: MaterialApp(
          theme: AppTheme.light(),
          home: const Scaffold(body: EnterPinDialog()),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('PIN kodni kiriting'), findsOneWidget);

    // Enter 1111
    await tester.tap(find.text('1'));
    await tester.pump();
    await tester.tap(find.text('1'));
    await tester.pump();
    await tester.tap(find.text('1'));
    await tester.pump();
    await tester.tap(find.text('1'));
    await tester.pumpAndSettle();

    expect(find.text('Noto\'g\'ri PIN kod'), findsOneWidget);
  });
}
