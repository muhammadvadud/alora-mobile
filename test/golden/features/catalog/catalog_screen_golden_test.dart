import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/theme/app_theme.dart';
import 'package:alora_mobile/core/connectivity/connectivity_notifier.dart';
import 'package:alora_mobile/core/utils/paginated.dart';
import 'package:alora_mobile/features/catalog/application/providers.dart';
import 'package:alora_mobile/features/catalog/domain/entities/category.dart';
import 'package:alora_mobile/features/catalog/domain/entities/product.dart';
import 'package:alora_mobile/features/catalog/domain/entities/product_variant.dart';
import 'package:alora_mobile/features/catalog/domain/repositories/catalog_repository.dart';
import 'package:alora_mobile/features/catalog/presentation/screens/catalog_screen.dart';
import 'package:alora_mobile/shared/models/price_unit.dart';

class _FakeCatalogRepository implements CatalogRepository {
  @override
  Future<Paginated<Category>> getCategories() async {
    return const Paginated<Category>(
      results: [
        Category(id: 'cat-1', name: 'Portyera', slug: 'portyera'),
        Category(id: 'cat-2', name: 'Tul', slug: 'tul'),
      ],
      next: null,
      previous: null,
    );
  }

  @override
  Future<Paginated<Product>> getProducts({
    String? category,
    String? style,
    String? room,
    String? segment,
    String? priceUnit,
    String? search,
    int? minPrice,
    int? maxPrice,
    String? cursor,
  }) async {
    return const Paginated<Product>(
      results: [
        Product(
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
            ),
          ],
        ),
        Product(
          id: 'p2',
          categoryId: 'cat-2',
          categoryData: null,
          name: 'Tul Charmant',
          code: 'TCH-118',
          variants: [
            ProductVariant(
              id: 'v2',
              sku: 'SKU-2',
              colorName: 'Sutli',
              colorHex: '#F5F0E6',
              widthM: 2.4,
              price: 120000,
              priceUnit: PriceUnit.perSqm,
            ),
          ],
        ),
      ],
      next: null,
      previous: null,
    );
  }

  @override
  Future<Product> getProductDetail(String id) async {
    throw UnimplementedError();
  }
}

void main() {
  setUpAll(() async {
    await loadAppFonts();
  });

  Widget widgetFor(ThemeMode mode) {
    return ProviderScope(
      overrides: [
        catalogRepositoryProvider.overrideWithValue(_FakeCatalogRepository()),
        connectivityProvider.overrideWithValue(true),
      ],
      child: MaterialApp(
        theme: AppTheme.light(),
        darkTheme: AppTheme.dark(),
        themeMode: mode,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        home: const CatalogScreen(),
      ),
    );
  }

  testGoldens('CatalogScreen - Light & Dark', (tester) async {
    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: [Device.phone])
      ..addScenario(name: 'Light', widget: widgetFor(ThemeMode.light))
      ..addScenario(name: 'Dark', widget: widgetFor(ThemeMode.dark));

    await tester.pumpDeviceBuilder(builder);
    await tester.pumpAndSettle();
    await screenMatchesGolden(tester, 'catalog_screen');
  });
}
