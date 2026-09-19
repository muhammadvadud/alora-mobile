import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:alora_mobile/shared/widgets/scroll_down_button.dart';
import 'package:alora_mobile/app/theme/app_theme.dart';

void main() {
  Widget buildApp(Widget child) {
    return MaterialApp(
      theme: AppTheme.light(),
      home: Scaffold(body: Center(child: child)),
    );
  }

  testWidgets('ScrollDownButton works', (tester) async {
    var tapped = false;
    await tester.pumpWidget(buildApp(ScrollDownButton(onPressed: () => tapped = true)));

    expect(find.byType(ScrollDownButton), findsOneWidget);
    await tester.tap(find.byType(ScrollDownButton));
    expect(tapped, isTrue);
  });
}
