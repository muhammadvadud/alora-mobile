import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:alora_mobile/core/env.dart';
import 'package:alora_mobile/features/profile/presentation/widgets/about_section.dart';

import '../../../helpers/pump_app.dart';

void main() {
  group('AboutSection (20.9)', () {
    testWidgets("versiya, build va muhit Env'dan ko'rsatiladi", (tester) async {
      await tester.pumpWidget(const AboutSection().pumpApp());

      expect(find.text('Versiya'), findsOneWidget);
      expect(find.text('Build'), findsOneWidget);
      expect(find.text('Muhit'), findsOneWidget);
      expect(find.text(Env.appVersion), findsOneWidget);
      expect(find.text(Env.buildNumber), findsOneWidget);
      expect(find.text(Env.env), findsOneWidget);
    });

    testWidgets('ruscha lokalda sarlavhalar tarjima qilinadi', (tester) async {
      await tester.pumpWidget(
        const AboutSection().pumpApp(locale: const Locale('ru')),
      );

      expect(find.text('Версия'), findsOneWidget);
      expect(find.text('Среда'), findsOneWidget);
    });
  });
}
