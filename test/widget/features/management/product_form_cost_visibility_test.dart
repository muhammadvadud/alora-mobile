import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
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

const _admin = User(
  id: '1',
  role: Role.admin,
  phone: '123',
  fullName: 'Admin',
  tenant: 'a',
);

const _manager = User(
  id: '2',
  role: Role.manager,
  phone: '456',
  fullName: 'Manager',
  tenant: 'a',
);

class _FormWithVariant extends ProductFormNotifier {
  @override
  ProductFormState build() {
    return const ProductFormState(
      name: '',
      code: '',
      category: '',
      price: '100000',
      priceUnit: PriceUnit.perSqm,
      variants: [
        VariantWriteDto(
          sku: 'V1',
          colorName: 'Qizil',
          colorHex: '#FF0000',
          price: '100000',
          costPrice: '50000',
          priceUnit: PriceUnit.perSqm,
        ),
      ],
    );
  }
}

Future<void> pumpForm(
  WidgetTester tester,
  User user,
  AppLocalizations l10n,
) async {
  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        authProvider.overrideWithValue(AuthState.authenticated(user: user)),
        productFormProvider.overrideWith(() => _FormWithVariant()),
      ],
      child: MaterialApp(
        locale: const Locale('uz'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: AppTheme.light(),
        home: const ProductFormScreen(),
      ),
    ),
  );
  await tester.pump();
}

void main() {
  late AppLocalizations l10n;

  setUpAll(() async {
    l10n = await AppLocalizations.delegate.load(const Locale('uz'));
  });

  testWidgets('Tannarx maydoni manager rolida ko\'rinmaydi', (tester) async {
    await pumpForm(tester, _manager, l10n);

    expect(find.text(l10n.management_productFormCost), findsNothing);
  });

  testWidgets('Tannarx maydoni admin rolida ko\'rinadi', (tester) async {
    await pumpForm(tester, _admin, l10n);

    await tester.scrollUntilVisible(
      find.text(l10n.management_productFormCost),
      200,
      scrollable: find.byType(Scrollable).first,
    );

    expect(find.text(l10n.management_productFormCost), findsOneWidget);
  });
}
