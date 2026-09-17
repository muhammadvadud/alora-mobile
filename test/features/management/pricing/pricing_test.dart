import 'package:flutter_test/flutter_test.dart';
import 'package:alora_mobile/features/management/pricing/presentation/screens/pricing_rules_screen.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('PricingRulesScreen test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: PricingRulesScreen()));
    await tester.pumpAndSettle();
    expect(find.text('Pricing Rules'), findsOneWidget);
    await expectLater(
      find.byType(PricingRulesScreen),
      matchesGoldenFile('goldens/pricing_rules_screen.png'),
    );
  });
}
