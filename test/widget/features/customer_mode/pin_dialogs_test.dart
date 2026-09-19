import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/core/storage/secure_storage.dart';
import 'package:alora_mobile/features/customer_mode/application/providers.dart';
import 'package:alora_mobile/features/customer_mode/presentation/widgets/pin_dialogs.dart';
import 'package:alora_mobile/app/theme/app_theme.dart';

class MockSecureStorage extends Mock implements SecureStorage {}

void main() {
  late MockSecureStorage mockStorage;

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
  });

  Widget wrapApp(Widget child) {
    return MaterialApp(
      theme: AppTheme.light(),
      locale: const Locale('uz'),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: Scaffold(body: child),
    );
  }

  Widget createWidgetUnderTest(Widget child) {
    return ProviderScope(
      overrides: [secureStorageProvider.overrideWithValue(mockStorage)],
      child: wrapApp(child),
    );
  }

  testWidgets('SetPinDialog complete flow', (WidgetTester tester) async {
    when(() => mockStorage.getPin()).thenAnswer((_) async => null);
    when(() => mockStorage.savePin('1234')).thenAnswer((_) async {});

    await tester.pumpWidget(createWidgetUnderTest(const SetPinDialog()));

    // Allow Provider initialization
    await tester.pumpAndSettle();

    expect(find.text('Mijoz rejimi uchun PIN o\'rnating'), findsOneWidget);

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
        child: wrapApp(const EnterPinDialog()),
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

    expect(
      find.text('PIN kod noto\'g\'ri. Yana 2 urinish qoldi.'),
      findsOneWidget,
    );
  });
}
