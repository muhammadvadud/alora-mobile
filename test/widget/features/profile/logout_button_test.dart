import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/theme/app_theme.dart';
import 'package:alora_mobile/features/auth/application/providers.dart';
import 'package:alora_mobile/features/profile/presentation/widgets/logout_button.dart';

import '../../../unit/features/auth/auth_test_helpers.dart';

void main() {
  Widget app(FakeAuthRepository auth) {
    return ProviderScope(
      overrides: [authRepositoryProvider.overrideWithValue(auth)],
      child: MaterialApp(
        theme: AppTheme.light(),
        locale: const Locale('uz'),
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        home: const Scaffold(body: LogoutButton()),
      ),
    );
  }

  testWidgets('chiqish: tasdiqlash dialogi ochiladi va logout chaqiriladi', (
    tester,
  ) async {
    final auth = FakeAuthRepository()
      ..accessToken = 'access-token'
      ..refreshToken = 'refresh-token'
      ..user = testUser();

    await tester.pumpWidget(app(auth));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Chiqish'));
    await tester.pumpAndSettle();

    expect(find.text('Chiqish?'), findsOneWidget);
    expect(find.text('Hisobingizdan chiqmoqchimisiz?'), findsOneWidget);

    await tester.tap(find.text('Bekor qilish'));
    await tester.pumpAndSettle();
    expect(auth.logoutCalls, 0);

    await tester.tap(find.text('Chiqish'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Chiqish').last);
    await tester.pumpAndSettle();

    expect(auth.logoutCalls, 1);
  });
}
