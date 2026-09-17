import 'package:flutter_test/flutter_test.dart';
import 'package:alora_mobile/features/management/knowledge/presentation/screens/knowledge_screen.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('KnowledgeScreen test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: KnowledgeScreen()));
    await tester.pumpAndSettle();
    expect(find.text('Knowledge Rules List'), findsOneWidget);
    await expectLater(
      find.byType(KnowledgeScreen),
      matchesGoldenFile('goldens/knowledge_screen.png'),
    );
  });
}
