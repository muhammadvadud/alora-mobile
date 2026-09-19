import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/theme/app_theme.dart';
import 'package:alora_mobile/features/auth/application/auth_notifier.dart';
import 'package:alora_mobile/features/auth/application/auth_state.dart';
import 'package:alora_mobile/features/auth/domain/entities/user.dart';
import 'package:alora_mobile/features/management/catalog_admin/application/notifiers/product_form_notifier.dart';
import 'package:alora_mobile/features/management/catalog_admin/application/notifiers/product_form_state.dart';
import 'package:alora_mobile/features/management/catalog_admin/data/dto/catalog_write_dtos.dart';
import 'package:alora_mobile/features/management/catalog_admin/presentation/screens/product_form_screen.dart';
import 'package:alora_mobile/shared/models/price_unit.dart';
import 'package:alora_mobile/shared/models/role.dart';

const _manager = User(
  id: 'u2',
  role: Role.manager,
  phone: '+998900000002',
  fullName: 'Manager',
  tenant: 't1',
);

/// S-22 uchun to'ldirilgan forma holati (2 variant, tannarx manager'ga ko'rinmaydi).
class _FilledForm extends ProductFormNotifier {
  @override
  ProductFormState build() {
    return const ProductFormState(
      name: 'Belgiya parda',
      code: 'BEL-001',
      category: 'c1',
      price: '180000',
      priceUnit: PriceUnit.perSqm,
      variants: [
        VariantWriteDto(
          sku: 'BEL-001-01',
          colorName: 'Zumrad',
          colorHex: '#0E5751',
          price: '180000',
          costPrice: '120000',
          priceUnit: PriceUnit.perSqm,
        ),
        VariantWriteDto(
          sku: 'BEL-001-02',
          colorName: 'Bronza',
          colorHex: '#8A6620',
          price: '190000',
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
        authProvider.overrideWithValue(const AuthState.authenticated(user: _manager)),
        productFormProvider.overrideWith(_FilledForm.new),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light(),
        darkTheme: AppTheme.dark(),
        themeMode: mode,
        locale: const Locale('uz'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const ProductFormScreen(),
      ),
    );
  }

  testGoldens("S-22 Mahsulot tahriri — yorug'/qorong'i", (tester) async {
    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: [Device.phone])
      ..addScenario(name: 'Light', widget: widgetFor(ThemeMode.light))
      ..addScenario(name: 'Dark', widget: widgetFor(ThemeMode.dark));

    await tester.pumpDeviceBuilder(builder);
    await tester.pumpAndSettle();
    await screenMatchesGolden(tester, 'product_form_screen');
  });
}
