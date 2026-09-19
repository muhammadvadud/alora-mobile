import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/theme/app_theme.dart';
import 'package:alora_mobile/features/management/catalog_admin/presentation/screens/product_form_screen.dart';

void main() {
  Widget build() {
    return ProviderScope(
      child: MaterialApp(
        locale: const Locale('uz'),
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        theme: AppTheme.light(),
        home: const ProductFormScreen(),
      ),
    );
  }

  testWidgets('renders ProductFormScreen', (tester) async {
    await tester.pumpWidget(build());
    final l10n = await AppLocalizations.delegate.load(const Locale('uz'));
    expect(find.text(l10n.management_productFormTitle), findsOneWidget);
  });
}
