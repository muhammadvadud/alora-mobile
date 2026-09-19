import 'package:flutter_test/flutter_test.dart';
import 'package:alora_mobile/shared/widgets/app_chip.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('AppChip va AppCountChip Widget Tests', () {
    testWidgets('AppChip unselected holatda korsatiladi va bosiladi', (WidgetTester tester) async {
      bool isTapped = false;
      await tester.pumpWidget(
        AppChip(
          label: 'Barchasi',
          state: AppChipState.unselected,
          onTap: () {
            isTapped = true;
          },
        ).pumpApp(),
      );

      expect(find.text('Barchasi'), findsOneWidget);
      await tester.tap(find.byType(AppChip));
      await tester.pumpAndSettle();

      expect(isTapped, isTrue);
    });

    testWidgets('AppChip selected holatda tekshiriladi', (WidgetTester tester) async {
      await tester.pumpWidget(
        const AppChip(label: 'Tanlangan', state: AppChipState.selected).pumpApp(),
      );

      expect(find.text('Tanlangan'), findsOneWidget);
    });

    testWidgets('AppCountChip unselected holatda va count bilan korsatiladi', (
      WidgetTester tester,
    ) async {
      bool isTapped = false;
      await tester.pumpWidget(
        AppCountChip(
          label: 'Yangi',
          count: 5,
          isSelected: false,
          onTap: () {
            isTapped = true;
          },
        ).pumpApp(),
      );

      expect(find.text('Yangi'), findsOneWidget);
      expect(find.text('5'), findsOneWidget);

      await tester.tap(find.byType(AppCountChip));
      await tester.pumpAndSettle();

      expect(isTapped, isTrue);
    });

    testWidgets('AppCountChip selected holatda tekshiriladi', (WidgetTester tester) async {
      await tester.pumpWidget(
        const AppCountChip(label: 'Jarayonda', count: 12, isSelected: true).pumpApp(),
      );

      expect(find.text('Jarayonda'), findsOneWidget);
      expect(find.text('12'), findsOneWidget);
    });
  });
}
