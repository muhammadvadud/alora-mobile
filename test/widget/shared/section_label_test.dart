import 'package:flutter_test/flutter_test.dart';
import 'package:alora_mobile/shared/widgets/section_label.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('SectionLabel testlari', () {
    testWidgets('SectionLabel matni katta harflarda ko\'rsatiladi', (
      tester,
    ) async {
      await tester.pumpWidget(const SectionLabel('bo\'lim nomi').pumpApp());

      expect(find.text('BO\'LIM NOMI'), findsOneWidget);
    });
  });
}
