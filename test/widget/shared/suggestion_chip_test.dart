import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:alora_mobile/shared/widgets/suggestion_chip.dart';
import 'package:alora_mobile/app/theme/app_theme.dart';

void main() {
  Widget buildApp(Widget child) {
    return MaterialApp(
      theme: AppTheme.light(),
      home: Scaffold(body: Center(child: child)),
    );
  }

  testWidgets('SuggestionChip renders title and subtitle', (tester) async {
    var tapped = false;
    await tester.pumpWidget(
      buildApp(
        SuggestionChip(title: 'Design Logo', subtitle: 'For my brand', onTap: () => tapped = true),
      ),
    );

    expect(find.text('Design Logo'), findsOneWidget);
    expect(find.text('For my brand'), findsOneWidget);

    await tester.tap(find.byType(SuggestionChip));
    expect(tapped, isTrue);
  });
}
