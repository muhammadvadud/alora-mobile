import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/theme/app_theme.dart';
import 'package:alora_mobile/core/connectivity/connectivity_notifier.dart';
import 'package:alora_mobile/features/catalog/application/providers.dart'
    as catalog_providers;
import 'package:alora_mobile/features/catalog/domain/entities/product.dart';
import 'package:alora_mobile/features/catalog/domain/entities/product_image.dart';
import 'package:alora_mobile/features/catalog/domain/entities/product_variant.dart';
import 'package:alora_mobile/features/catalog/domain/repositories/catalog_repository.dart';
import 'package:alora_mobile/features/catalog/presentation/screens/product_screen.dart';
import 'package:alora_mobile/features/catalog/presentation/widgets/product_variant_selector.dart';
import 'package:alora_mobile/shared/models/price_unit.dart';

class MockCatalogRepository extends Mock implements CatalogRepository {}

Product _product() => const Product(
  id: 'p1',
  categoryId: 'cat-1',
  categoryData: null,
  name: 'Velvet Milano',
  code: 'VLM-204',
  variants: [
    ProductVariant(
      id: 'v1',
      sku: 'SKU-1',
      colorName: 'Grafit',
      colorHex: '#4A4A4A',
      widthM: 1.5,
      price: 180000,
      priceUnit: PriceUnit.perSqm,
      images: [
        ProductImage(
          id: 'i1',
          productId: 'p1',
          variantId: 'v1',
          imageUrl: 'https://example.com/v1.jpg',
          isPrimary: true,
        ),
      ],
    ),
    ProductVariant(
      id: 'v2',
      sku: 'SKU-2',
      colorName: 'Sutli',
      colorHex: '#F5F0E6',
      widthM: 1.5,
      price: 210000,
      priceUnit: PriceUnit.perSqm,
      images: [
        ProductImage(
          id: 'i2',
          productId: 'p1',
          variantId: 'v2',
          imageUrl: 'https://example.com/v2.jpg',
          isPrimary: true,
        ),
      ],
    ),
  ],
);

Future<void> _pumpProduct(
  WidgetTester tester, {
  required MockCatalogRepository mockRepo,
}) async {
  tester.view.physicalSize = const Size(1170, 2532); // iPhone: 390x844 @3x
  tester.view.devicePixelRatio = 3.0;
  addTearDown(tester.view.reset);

  final container = ProviderContainer(
    overrides: [
      catalog_providers.catalogRepositoryProvider.overrideWithValue(mockRepo),
      connectivityProvider.overrideWithValue(true),
    ],
  );
  addTearDown(container.dispose);

  await tester.pumpWidget(
    UncontrolledProviderScope(
      container: container,
      child: MaterialApp(
        theme: AppTheme.light(),
        locale: const Locale('uz'),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        home: const ProductScreen(productId: 'p1'),
      ),
    ),
  );
}

void main() {
  late MockCatalogRepository mockRepo;

  setUp(() {
    mockRepo = MockCatalogRepository();
    when(() => mockRepo.getProductDetail('p1'))
        .thenAnswer((_) async => _product());
  });

  testWidgets('shows product name, price and color of first variant', (
    tester,
  ) async {
    await _pumpProduct(tester, mockRepo: mockRepo);
    await tester.pumpAndSettle();

    expect(find.text('Velvet Milano'), findsWidgets);
    expect(find.textContaining('Grafit'), findsWidgets);
    expect(find.textContaining('so\'m'), findsWidgets);
    // UI'da "stock" so'zi bo'lmasligi kerak (Q8)
    expect(
      find.textContaining(RegExp('omborda|stock', caseSensitive: false)),
      findsNothing,
    );
  });

  testWidgets('tapping second variant updates selected color', (tester) async {
    await _pumpProduct(tester, mockRepo: mockRepo);
    await tester.pumpAndSettle();

    // Ikkinchi variant chipi (28x28 aylana) topish — rang nomi yonidagi variant
    expect(find.textContaining('Grafit'), findsWidgets);

    // Variant selector ichidagi ikkinchi tegiladigan aylana
    final dots = find.descendant(
      of: find.byType(ProductVariantSelector),
      matching: find.byType(GestureDetector),
    );
    expect(dots, findsNWidgets(2));

    await tester.tap(dots.at(1));
    await tester.pumpAndSettle();

    expect(find.textContaining('Sutli'), findsWidgets);
    expect(find.textContaining('Grafit'), findsNothing);
  });

  testWidgets('AI and Add-to-account buttons are present', (tester) async {
    await _pumpProduct(tester, mockRepo: mockRepo);
    await tester.pumpAndSettle();

    expect(find.text('AI\'dan so\'rash'), findsOneWidget);
    expect(find.text('Hisobga qo\'shish'), findsOneWidget);
  });
}
