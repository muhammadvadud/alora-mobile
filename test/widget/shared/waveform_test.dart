import 'package:flutter_test/flutter_test.dart';
import 'package:alora_mobile/shared/widgets/waveform.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('Waveform testlari', () {
    testWidgets('Waveform ai speaking emas holatda ko\'rsatiladi', (
      tester,
    ) async {
      final amplitudes = [0.1, 0.5, 0.8, 1.0, 0.2];

      await tester.pumpWidget(
        Waveform(amplitudes: amplitudes, isAiSpeaking: false).pumpApp(),
      );

      expect(find.byType(Waveform), findsOneWidget);
    });

    testWidgets('Waveform ai speaking holatda ko\'rsatiladi', (tester) async {
      final amplitudes = [0.1, 0.5, 0.8];

      await tester.pumpWidget(
        Waveform(amplitudes: amplitudes, isAiSpeaking: true).pumpApp(),
      );

      expect(find.byType(Waveform), findsOneWidget);
    });
  });
}
