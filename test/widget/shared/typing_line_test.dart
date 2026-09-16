import 'package:flutter_test/flutter_test.dart';
import 'package:alora_mobile/shared/widgets/typing_line.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('TypingLine testlari', () {
    testWidgets('TypingLine animatsiya bilan ko\'rsatiladi', (tester) async {
      await tester.pumpWidget(const TypingLine().pumpApp());

      expect(find.byType(TypingLine), findsOneWidget);
    });
  });
}
