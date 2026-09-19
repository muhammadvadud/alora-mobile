import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:alora_mobile/shared/widgets/empty_state.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('EmptyState Widget Testlari', () {
    testWidgets('sarlavha va matn ko\'rsatiladi', (WidgetTester tester) async {
      await tester.pumpWidget(
        const EmptyState(title: 'Suhbat yo\'q', message: 'Yangi suhbat boshlang').pumpApp(),
      );

      expect(find.text('Suhbat yo\'q'), findsOneWidget);
      expect(find.text('Yangi suhbat boshlang'), findsOneWidget);
    });

    testWidgets('tugma bosilganda onTap callback chaqiriladi', (WidgetTester tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        EmptyState(
          title: 'Bo\'sh',
          actionText: 'Qo\'shish',
          onAction: () {
            tapped = true;
          },
        ).pumpApp(),
      );

      expect(find.text('Qo\'shish'), findsOneWidget);
      await tester.tap(find.text('Qo\'shish'));
      await tester.pump();

      expect(tapped, isTrue);
    });

    testWidgets('actionText yo\'q bo\'lsa tugma ko\'rinmaydi', (WidgetTester tester) async {
      await tester.pumpWidget(const EmptyState(title: 'Sarlavha').pumpApp());

      expect(find.text('Sarlavha'), findsOneWidget);
      expect(find.byType(TextButton), findsNothing);
    });

    testWidgets('icon ko\'rsatiladi', (WidgetTester tester) async {
      await tester.pumpWidget(const EmptyState(title: 'Sarlavha', icon: Icons.inbox).pumpApp());

      expect(find.byIcon(Icons.inbox), findsOneWidget);
    });

    testWidgets('image ko\'rsatiladi', (WidgetTester tester) async {
      await tester.pumpWidget(
        const EmptyState(title: 'Sarlavha', icon: LucideIcons.inbox).pumpApp(),
      );

      expect(find.byIcon(LucideIcons.inbox), findsOneWidget);
    });
  });
}
