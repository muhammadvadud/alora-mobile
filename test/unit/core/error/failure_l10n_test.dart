import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/core/error/failure.dart';
import 'package:alora_mobile/core/error/failure_l10n.dart';

void main() {
  testWidgets('FailureL10nX to\'g\'ri tarjima qiladi', (tester) async {
    late BuildContext ctx;

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('uz')],
        home: Builder(
          builder: (context) {
            ctx = context;
            return const SizedBox();
          },
        ),
      ),
    );

    expect(const Failure.network().localizedMessage(ctx), "Ulanish yo'q. Internetni tekshiring.");
    expect(const Failure.validation('Test', {}).localizedMessage(ctx), 'Test');
    expect(
      const Failure.auth().localizedMessage(ctx),
      "Sessiya muddati tugadi. Iltimos, qayta kiring.",
    );
    expect(const Failure.permission().localizedMessage(ctx), "Ruxsat yo'q");
    expect(const Failure.notFound().localizedMessage(ctx), "Topilmadi");
    expect(const Failure.limit('Limit msg').localizedMessage(ctx), "Limit msg");
    expect(const Failure.limit('').localizedMessage(ctx), "Limit tugadi");
    expect(
      const Failure.serviceUnavailable().localizedMessage(ctx),
      "AI xizmati vaqtincha ishlamayapti",
    );
    expect(const Failure.server().localizedMessage(ctx), "Server javob bermadi");
    expect(const Failure.unknown('Unknown msg').localizedMessage(ctx), "Unknown msg");
    expect(const Failure.unknown('').localizedMessage(ctx), "Noma'lum xatolik");
  });
}
