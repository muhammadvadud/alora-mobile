
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alora_mobile/features/management/catalog_admin/presentation/screens/product_form_screen.dart';

void main() {
  testWidgets('renders ProductFormScreen', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: MaterialApp(home: ProductFormScreen())));
    expect(find.text('Product Form'), findsOneWidget);
  });

  testWidgets('ProductFormScreen golden', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: MaterialApp(home: ProductFormScreen())));
    await expectLater(
      find.byType(ProductFormScreen),
      matchesGoldenFile('goldens/product_form_screen.png'),
    );
  });
}
