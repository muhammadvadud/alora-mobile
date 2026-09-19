import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:alora_mobile/app/global_listeners.dart';
import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/theme/app_theme.dart';
import 'package:alora_mobile/core/connectivity/offline_flush_notifier.dart';
import 'package:alora_mobile/features/auth/application/session_expired_notifier.dart';

void main() {
  late AppLocalizations l10n;

  setUpAll(() async {
    l10n = await AppLocalizations.delegate.load(const Locale('uz'));
  });

  Future<ProviderContainer> pumpListeners(WidgetTester tester) async {
    final container = ProviderContainer();
    addTearDown(container.dispose);
    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: MaterialApp(
          theme: AppTheme.light(),
          locale: const Locale('uz'),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: const GlobalListeners(child: Scaffold(body: Text('content'))),
        ),
      ),
    );
    await tester.pump();
    return container;
  }

  testWidgets('oflayn navbatda xatolar bo\'lsa snackbar ko\'rsatiladi', (tester) async {
    final container = await pumpListeners(tester);

    container.read(offlineFlushMessagesProvider.notifier).add("Saqlanmadi: Noma'lum xato");
    await tester.pump();
    await tester.pumpAndSettle();

    expect(find.text(l10n.offline_flushFailed), findsOneWidget);
    expect(find.byType(SnackBar), findsOneWidget);

    await tester.pumpAndSettle(const Duration(seconds: 5));
    expect(find.byType(SnackBar), findsNothing);
    expect(container.read(offlineFlushMessagesProvider), isEmpty);
  });

  testWidgets('sessiya tugashi hodisasi snackbar ko\'rsatadi', (tester) async {
    final container = await pumpListeners(tester);

    container.read(sessionExpiredProvider.notifier).trigger();
    await tester.pump();
    await tester.pumpAndSettle();

    expect(find.text(l10n.error_auth), findsOneWidget);
    expect(find.byType(SnackBar), findsOneWidget);
  });
}
