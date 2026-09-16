import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/theme/app_theme.dart';
import 'package:alora_mobile/core/error/failure.dart';
import 'package:alora_mobile/features/auth/presentation/screens/login_screen.dart';
import 'package:alora_mobile/shared/widgets/app_button.dart';
import 'package:alora_mobile/shared/widgets/app_text_field.dart';
import 'package:alora_mobile/shared/widgets/phone_field.dart';
import 'package:alora_mobile/features/auth/application/providers.dart';

import '../../../unit/features/auth/auth_test_helpers.dart';

/// LoginScreen ni zarur provider hamda l10n bilan chizadi.
Future<void> pumpLogin(
  WidgetTester tester,
  FakeAuthRepository repository,
) async {
  await tester.pumpWidget(
    ProviderScope(
      overrides: [authRepositoryProvider.overrideWithValue(repository)],
      child: MaterialApp(
        locale: const Locale('uz'),
        theme: AppTheme.light,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        home: const LoginScreen(),
      ),
    ),
  );
  await tester.pump();
}

void main() {
  late FakeAuthRepository repository;

  setUp(() {
    repository = FakeAuthRepository();
    addTearDown(() => repository.dispose());
  });

  testWidgets('LoginScreen asosiy elementlarni ko\'rsatadi', (tester) async {
    await pumpLogin(tester, repository);

    expect(find.byType(PhoneField), findsOneWidget);
    expect(find.byType(AppTextField), findsOneWidget);
    expect(find.byType(AppButton), findsOneWidget);
  });

  testWidgets('bo\'sh maydonlar bilan submit xato matnini ko\'rsatadi', (
    tester,
  ) async {
    await pumpLogin(tester, repository);

    await tester.tap(find.byType(AppButton));
    await tester.pumpAndSettle();

    expect(find.textContaining('Telefon raqam'), findsWidgets);
  });

  testWidgets('login xatosi holat matni sifatida korinadi', (tester) async {
    repository.loginFailure = const Failure.auth();

    await pumpLogin(tester, repository);

    await tester.enterText(find.byType(PhoneField), '+998901234567');
    await tester.enterText(find.byType(AppTextField), 'xato');
    await tester.tap(find.byType(AppButton));
    await tester.pumpAndSettle();

    expect(find.textContaining('Kirish'), findsWidgets);
  });

  testWidgets('muvaffaqiyatli login notifierga murojaat qiladi', (
    tester,
  ) async {
    repository.user = testUser();

    await pumpLogin(tester, repository);

    await tester.enterText(find.byType(PhoneField), '+998901234567');
    await tester.enterText(find.byType(AppTextField), 'parol');
    await tester.tap(find.byType(AppButton));
    await tester.pumpAndSettle();

    expect(repository.loginCalls, 1);
  });
}
