import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/features/management/catalog_admin/presentation/widgets/bulk_price_sheet.dart';
import 'package:alora_mobile/features/catalog/domain/entities/product_variant.dart';
import 'package:alora_mobile/shared/models/price_unit.dart';
import 'package:alora_mobile/app/theme/app_theme.dart';

void main() {
  testWidgets('BulkPriceSheet preview hisobi', (tester) async {
    final variants = [
      const ProductVariant(
        id: '1',
        sku: 'S1',
        colorName: 'Qizil',
        colorHex: '#ff0000',
        widthM: 2.8,
        price: 100000,
        priceUnit: PriceUnit.perSqm,
      ),
      const ProductVariant(
        id: '2',
        sku: 'S2',
        colorName: 'Ko\'k',
        colorHex: '#0000ff',
        widthM: 2.8,
        price: 200000,
        priceUnit: PriceUnit.perSqm,
      ),
    ];

    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.light(),
        locale: const Locale('uz'),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: BulkPriceSheet(selectedVariants: variants, onSave: (_) {}),
        ),
      ),
    );

    // Wait for localizations to load
    await tester.pumpAndSettle();

    // Tanlash +10%
    await tester.tap(find.text('+10%'));
    await tester.pumpAndSettle();

    // Check preview strings
    expect(find.text('Qizil: 100000 -> 110000'), findsOneWidget);
    expect(find.text('Ko\'k: 200000 -> 220000'), findsOneWidget);

    // Tanlash Yangi narx
    await tester.tap(find.text('Yangi narx'));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField), '150000');
    await tester.pumpAndSettle();

    expect(find.text('Qizil: 100000 -> 150000'), findsOneWidget);
    expect(find.text('Ko\'k: 200000 -> 150000'), findsOneWidget);
  });
}
