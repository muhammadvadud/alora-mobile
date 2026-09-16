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
import 'package:alora_mobile/features/catalog/presentation/screens/product_screen.dart';
import 'package:alora_mobile/shared/models/price_unit.dart';

class _FakeCatalogRepository implements CatalogRepository {
  @override
  Future<Paginated<Category>> getCategories() async {
    throw UnimplementedError();
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
    throw UnimplementedError();
  }

  @override
  Future<Product> getProductDetail(String id) async {
    return Product(
      id: id,
      categoryId: 'cat-1',
      categoryData: const Category(
        id: 'cat-1',
        name: 'Portyera',
        slug: 'portyera',
      ),
      name: 'Velvet Milano',
      code: 'VLM-204',
      description: 'Premium velvet mato',
      fabricType: 'Velvet',
      composition: '100% Poliester',
      care: 'Bino ichida quruq tozalash',
      defaultWidthM: 1.5,
      recommendedRooms: const ['mehmonxona', 'yotoqxona'],
      variants: [
        const ProductVariant(
          id: 'v1',
          sku: 'SKU-1',
          colorName: 'Grafit',
          colorHex: '#4A4A4A',
          widthM: 1.5,
          price: 180000,
          priceUnit: PriceUnit.perSqm,
        ),
        const ProductVariant(
          id: 'v2',
          sku: 'SKU-2',
          colorName: 'Sutli',
          colorHex: '#F5F0E6',
          widthM: 1.5,
          price: 210000,
          priceUnit: PriceUnit.perSqm,
        ),
      ],
    );
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
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: mode,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        home: const ProductScreen(productId: 'p1'),
      ),
    );
  }

  testGoldens('ProductScreen - Light & Dark', (tester) async {
    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: [Device.phone])
      ..addScenario(name: 'Light', widget: widgetFor(ThemeMode.light))
      ..addScenario(name: 'Dark', widget: widgetFor(ThemeMode.dark));

    await tester.pumpDeviceBuilder(builder);
    await tester.pumpAndSettle();
    await screenMatchesGolden(tester, 'product_screen');
  });
}
