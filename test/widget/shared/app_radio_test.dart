import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:alora_mobile/shared/widgets/app_radio.dart';
import 'package:alora_mobile/app/theme/app_theme.dart';

void main() {
  Widget buildApp(Widget child) {
    return MaterialApp(
      theme: AppTheme.light(),
      home: Scaffold(body: Center(child: child)),
    );
  }

  testWidgets('AppRadio handles state', (tester) async {
    var tapped = false;
    await tester.pumpWidget(buildApp(AppRadio(isSelected: false, onTap: () => tapped = true)));

    expect(find.byType(AppRadio), findsOneWidget);
    await tester.tap(find.byType(AppRadio));
    expect(tapped, isTrue);
  });
}
