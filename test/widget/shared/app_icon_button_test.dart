import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:alora_mobile/shared/widgets/app_icon_button.dart';
import 'package:alora_mobile/app/theme/app_theme.dart';

void main() {
  Widget buildApp(Widget child) {
    return MaterialApp(
      theme: AppTheme.light(),
      home: Scaffold(body: Center(child: child)),
    );
  }

  testWidgets('AppIconButton.muted renders correctly', (tester) async {
    var pressed = false;
    await tester.pumpWidget(
      buildApp(
        AppIconButton.muted(
          icon: LucideIcons.mic,
          semanticLabel: 'Mute',
          onPressed: () => pressed = true,
        ),
      ),
    );

    expect(find.byIcon(LucideIcons.mic), findsOneWidget);
    await tester.tap(find.byType(AppIconButton));
    expect(pressed, isTrue);
  });

  testWidgets('AppIconButton.accent renders correctly', (tester) async {
    var pressed = false;
    await tester.pumpWidget(
      buildApp(
        AppIconButton.accent(
          icon: LucideIcons.arrowUp,
          semanticLabel: 'Send',
          onPressed: () => pressed = true,
        ),
      ),
    );

    expect(find.byIcon(LucideIcons.arrowUp), findsOneWidget);
    await tester.tap(find.byType(AppIconButton));
    expect(pressed, isTrue);
  });
}
