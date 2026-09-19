import 'package:flutter_test/flutter_test.dart';
import 'package:alora_mobile/core/dev/component_gallery.dart';
import 'package:alora_mobile/shared/widgets/app_button.dart';
import 'package:alora_mobile/shared/widgets/app_chip.dart';

import '../../helpers/pump_app.dart';

void main() {
  testWidgets('ComponentGallery renders without errors', (tester) async {
    await tester.pumpWidget(const ComponentGallery(showAnimations: false).pumpApp());
    await tester.pumpAndSettle();

    expect(find.byType(AppButton), findsWidgets);
    expect(find.byType(AppChip), findsWidgets);
  });

  testWidgets('AppButton onTap works', (tester) async {
    bool tapped = false;
    await tester.pumpWidget(AppButton(text: 'Tap me', onPressed: () => tapped = true).pumpApp());

    await tester.tap(find.byType(AppButton));
    await tester.pumpAndSettle();

    expect(tapped, isTrue);
  });
}
