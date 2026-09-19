import 'package:flutter_test/flutter_test.dart';
import 'package:alora_mobile/shared/widgets/money_text.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('MoneyText Widget Testlari', () {
    testWidgets('default formatter miqdorni bo\'sh joy bilan ajratadi', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MoneyText(amount: 2748000).pumpApp());

      expect(find.text('2 748 000'), findsOneWidget);
      expect(find.text(" so'm"), findsOneWidget);
    });

    testWidgets('kustom formatter parametri ishlatiladi', (WidgetTester tester) async {
      await tester.pumpWidget(
        MoneyText(amount: 2748000, formatter: (amount) => '$amount сум').pumpApp(),
      );

      expect(find.text('2748000 сум'), findsOneWidget);
    });

    testWidgets('maxsus suffix ko\'rsatiladi', (WidgetTester tester) async {
      await tester.pumpWidget(const MoneyText(amount: 5000, suffix: ' ming').pumpApp());

      expect(find.text('5 000'), findsOneWidget);
      expect(find.text(' ming'), findsOneWidget);
    });

    testWidgets('0 miqdor ko\'rsatiladi', (WidgetTester tester) async {
      await tester.pumpWidget(const MoneyText(amount: 0).pumpApp());

      expect(find.text('0'), findsOneWidget);
    });

    testWidgets('kichik miqdor uch guruhdan kam ajratilmaydi', (WidgetTester tester) async {
      await tester.pumpWidget(const MoneyText(amount: 999).pumpApp());

      expect(find.text('999'), findsOneWidget);
    });

    testWidgets('millionlik miqdor ikki bo\'sh joy bilan ajratiladi', (WidgetTester tester) async {
      await tester.pumpWidget(const MoneyText(amount: 27000000).pumpApp());

      expect(find.text('27 000 000'), findsOneWidget);
    });
  });
}
