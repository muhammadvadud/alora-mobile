import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:alora_mobile/shared/widgets/app_list_tile.dart';
import 'package:alora_mobile/app/theme/app_theme.dart';

void main() {
  Widget buildApp(Widget child) {
    return MaterialApp(
      theme: AppTheme.light(),
      home: Scaffold(body: Center(child: child)),
    );
  }

  testWidgets('AppListTile renders correctly', (tester) async {
    var tapped = false;
    await tester.pumpWidget(
      buildApp(AppListTile(title: 'Title', subtitle: 'Subtitle', onTap: () => tapped = true)),
    );

    expect(find.text('Title'), findsOneWidget);
    expect(find.text('Subtitle'), findsOneWidget);

    await tester.tap(find.byType(AppListTile));
    expect(tapped, isTrue);
  });
}
