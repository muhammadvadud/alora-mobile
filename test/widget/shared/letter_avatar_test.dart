import 'package:flutter_test/flutter_test.dart';
import 'package:alora_mobile/shared/widgets/letter_avatar.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('LetterAvatar testlari', () {
    testWidgets('LetterAvatar ismning birinchi harfi bilan ko\'rsatiladi', (
      tester,
    ) async {
      await tester.pumpWidget(const LetterAvatar(name: 'Alisher').pumpApp());

      expect(find.text('A'), findsOneWidget);
    });

    testWidgets('LetterAvatar ism bo\'sh bo\'lganda ko\'rsatiladi', (
      tester,
    ) async {
      await tester.pumpWidget(const LetterAvatar(name: '').pumpApp());

      expect(find.text('?'), findsOneWidget);
    });
  });
}
