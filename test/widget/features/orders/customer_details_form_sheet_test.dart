import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/features/chat/domain/entities/order_draft.dart';
import 'package:alora_mobile/features/orders/presentation/widgets/customer_details_form_sheet.dart';
import 'package:alora_mobile/shared/widgets/phone_field.dart';
import 'package:alora_mobile/shared/widgets/app_text_field.dart';
import 'package:alora_mobile/app/theme/app_theme.dart';

void main() {
  Future<void> pumpSheet(WidgetTester tester, OrderDraft draft) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: AppTheme.light(isCustomerMode: false),
        locale: const Locale('uz'),
        home: Scaffold(
          body: CustomerDetailsFormSheet(draft: draft),
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  final emptyDraft = const OrderDraft(
    measurements: [],
    total: 0,
    missingFields: [],
  );

  testWidgets('Form renders correctly and validates empty input', (tester) async {
    await pumpSheet(tester, emptyDraft);

    expect(find.byType(CustomerDetailsFormSheet), findsOneWidget);
    expect(find.byType(AppTextField), findsNWidgets(2)); // Name and Address
    expect(find.byType(PhoneField), findsOneWidget);

    final createBtn = find.text('Buyurtma yaratish');
    await tester.tap(createBtn.last);
    await tester.pumpAndSettle();

    // Check validation errors (l10n keys from mock or actual text)
    expect(find.text('Ushbu maydonni to\'ldirish majburiy'), findsWidgets);
  });

  testWidgets('Form returns updated draft when valid', (tester) async {
    final validDraft = emptyDraft.copyWith(
      customerName: 'Test User',
      phone: '+998 90 123 45 67',
      address: 'Test Address',
    );
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: AppTheme.light(isCustomerMode: false),
        locale: const Locale('uz'),
        home: Scaffold(
          body: Builder(
            builder: (context) => ElevatedButton(
              onPressed: () async {
                final result = await CustomerDetailsFormSheet.show(context, validDraft);
                if (result != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Result: ${result.customerName}')),
                  );
                }
              },
              child: const Text('Open Sheet'),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text('Open Sheet'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Buyurtma yaratish').last);
    await tester.pumpAndSettle();

    expect(find.text('Result: Test User'), findsOneWidget);
  });

  testWidgets('Cancel button pops with null', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: AppTheme.light(isCustomerMode: false),
        locale: const Locale('uz'),
        home: Scaffold(
          body: Builder(
            builder: (context) => ElevatedButton(
              onPressed: () async {
                final result = await CustomerDetailsFormSheet.show(context, emptyDraft);
                if (result == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Result: Null')),
                  );
                }
              },
              child: const Text('Open Sheet'),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text('Open Sheet'));
    await tester.pumpAndSettle();

    final cancelBtn = find.text('Bekor qilish');
    await tester.tap(cancelBtn.last);
    await tester.pumpAndSettle();

    expect(find.text('Result: Null'), findsOneWidget);
  });
}
