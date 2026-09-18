import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/theme/app_theme.dart';
import 'package:alora_mobile/core/utils/paginated.dart';
import 'package:alora_mobile/features/catalog/application/providers.dart'
    as catalog_providers;
import 'package:alora_mobile/features/catalog/domain/entities/category.dart';
import 'package:alora_mobile/features/catalog/domain/entities/product.dart';
import 'package:alora_mobile/features/catalog/domain/entities/product_variant.dart';
import 'package:alora_mobile/features/catalog/domain/repositories/catalog_repository.dart';
import 'package:alora_mobile/features/catalog/presentation/screens/catalog_screen.dart';
import 'package:alora_mobile/core/connectivity/connectivity_notifier.dart';
import 'package:alora_mobile/shared/models/price_unit.dart';
import 'package:alora_mobile/shared/widgets/product_card.dart';
import 'package:alora_mobile/shared/widgets/skeleton.dart';

class MockCatalogRepository extends Mock implements CatalogRepository {}

Product _product(String id, String name) => Product(
  id: id,
  categoryId: 'cat-1',
  categoryData: null,
  name: name,
  code: 'CODE-$id',
  variants: [
    ProductVariant(
      id: 'var-$id',
      sku: 'SKU-$id',
      colorName: 'Grafit',
      colorHex: '#4A4A4A',
      widthM: 1.5,
      price: 180000,
      priceUnit: PriceUnit.perSqm,
    ),
  ],
);

void _stubRepo(MockCatalogRepository mockRepo) {
  when(() => mockRepo.getCategories()).thenAnswer(
    (_) async => const Paginated<Category>(
      results: [
        Category(id: 'cat-1', name: 'Portyera', slug: 'portyera'),
        Category(id: 'cat-2', name: 'Tul', slug: 'tul'),
      ],
      next: null,
      previous: null,
    ),
  );

  when(
    () => mockRepo.getProducts(
      category: any(named: 'category'),
      style: any(named: 'style'),
      room: any(named: 'room'),
      segment: any(named: 'segment'),
      priceUnit: any(named: 'priceUnit'),
      search: any(named: 'search'),
      minPrice: any(named: 'minPrice'),
      maxPrice: any(named: 'maxPrice'),
      cursor: any(named: 'cursor'),
    ),
  ).thenAnswer(
    (_) async => Paginated<Product>(
      results: [_product('p1', 'Velvet Milano'), _product('p2', 'Chiffon')],
      next: null,
      previous: null,
    ),
  );
}

Future<ProviderContainer> _pumpCatalog(
  WidgetTester tester, {
  required MockCatalogRepository mockRepo,
}) async {
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
        home: const CatalogScreen(),
      ),
    ),
  );
  return container;
}

void main() {
  testWidgets('shows skeleton while loading, then grid of products', (
    tester,
  ) async {
    final mockRepo = MockCatalogRepository();
    when(() => mockRepo.getCategories()).thenAnswer(
      (_) async => const Paginated<Category>(
        results: [Category(id: 'cat-1', name: 'Portyera', slug: 'portyera')],
        next: null,
        previous: null,
      ),
    );

    final productsCompleter = Completer<Paginated<Product>>();
    when(
      () => mockRepo.getProducts(
        category: any(named: 'category'),
        style: any(named: 'style'),
        room: any(named: 'room'),
        segment: any(named: 'segment'),
        priceUnit: any(named: 'priceUnit'),
        search: any(named: 'search'),
        minPrice: any(named: 'minPrice'),
        maxPrice: any(named: 'maxPrice'),
        cursor: any(named: 'cursor'),
      ),
    ).thenAnswer((_) => productsCompleter.future);

    await _pumpCatalog(tester, mockRepo: mockRepo);
    await tester.pump();

    // dastlab skeleton (isLoading = true, products empty)
    expect(find.byType(SkeletonBox), findsWidgets);

    productsCompleter.complete(
      Paginated<Product>(
        results: [_product('p1', 'Velvet Milano'), _product('p2', 'Chiffon')],
        next: null,
        previous: null,
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byType(SkeletonBox), findsNothing);
    // 2 ustunli grid: 2 ta kartochka
    expect(find.byType(ProductCard), findsNWidgets(2));
    expect(find.text('Velvet Milano'), findsOneWidget);
    expect(find.text('Chiffon'), findsOneWidget);
    // "Omborda"/stock UI bo'lmasligi kerak (Q8)
    expect(
      find.textContaining(RegExp('omborda|stock', caseSensitive: false)),
      findsNothing,
    );
  });

  testWidgets('shows category chips (Hammasi + backend categories)', (
    tester,
  ) async {
    final mockRepo = MockCatalogRepository();
    _stubRepo(mockRepo);
    await _pumpCatalog(tester, mockRepo: mockRepo);
    await tester.pumpAndSettle();

    expect(find.text('Hammasi'), findsOneWidget);
    expect(find.text('Portyera'), findsOneWidget);
    expect(find.text('Tul'), findsOneWidget);
  });

  testWidgets('empty products → EmptyState', (tester) async {
    final mockRepo = MockCatalogRepository();
    when(() => mockRepo.getCategories()).thenAnswer(
      (_) async =>
          const Paginated<Category>(results: [], next: null, previous: null),
    );
    when(
      () => mockRepo.getProducts(
        category: any(named: 'category'),
        style: any(named: 'style'),
        room: any(named: 'room'),
        segment: any(named: 'segment'),
        priceUnit: any(named: 'priceUnit'),
        search: any(named: 'search'),
        minPrice: any(named: 'minPrice'),
        maxPrice: any(named: 'maxPrice'),
        cursor: any(named: 'cursor'),
      ),
    ).thenAnswer(
      (_) async =>
          const Paginated<Product>(results: [], next: null, previous: null),
    );

    await _pumpCatalog(tester, mockRepo: mockRepo);
    await tester.pumpAndSettle();

    expect(find.byType(ProductCard), findsNothing);
    expect(find.text('Hammasi'), findsOneWidget);
  });

  testWidgets('filter button opens bottom sheet', (tester) async {
    final mockRepo = MockCatalogRepository();
    _stubRepo(mockRepo);
    await _pumpCatalog(tester, mockRepo: mockRepo);
    await tester.pumpAndSettle();

    await tester.tap(find.byType(FilterButton));
    await tester.pumpAndSettle();

    expect(find.byType(BottomSheet), findsOneWidget);
    expect(find.textContaining('Ko\'rsatish'), findsOneWidget);
  });
}
