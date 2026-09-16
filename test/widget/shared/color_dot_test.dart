import 'package:flutter_test/flutter_test.dart';
import 'package:alora_mobile/shared/widgets/color_dot.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('ColorDot testlari', () {
    testWidgets('ColorDot normal holatda ko\'rsatiladi', (tester) async {
      await tester.pumpWidget(
        const ColorDot(colorHex: '#FF5733', size: 16.0).pumpApp(),
      );

      expect(find.byType(ColorDot), findsOneWidget);
    });
  });
}
