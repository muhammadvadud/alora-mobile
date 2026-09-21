import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/theme/app_theme.dart';
import 'package:alora_mobile/features/auth/application/providers.dart';
import 'package:alora_mobile/features/profile/application/providers.dart';
import 'package:alora_mobile/features/profile/domain/entities/profile_limit.dart';
import 'package:alora_mobile/features/profile/domain/repositories/profile_repository.dart';
import 'package:alora_mobile/features/profile/presentation/widgets/spend_section.dart';
import 'package:alora_mobile/shared/models/role.dart';
import 'package:alora_mobile/shared/widgets/limit_progress_bar.dart';
import 'package:alora_mobile/shared/widgets/skeleton.dart';

import '../../../helpers/fake_profile_repository.dart';
import '../../../unit/features/auth/auth_test_helpers.dart';

/// So'rovlarni ushlab turuvchi repository (skeleton holatini ko'rish uchun).
class _PendingProfileRepository implements ProfileRepository {
  final limitCompleter = Completer<ProfileLimit?>();
  final costCompleter = Completer<int>();

  @override
  Future<ProfileLimit?> getLimit() => limitCompleter.future;

  @override
  Future<int> getTodayCost(String userId) => costCompleter.future;

  @override
  Future<void> changePassword({
    required String password,
    required String passwordConfirmation,
  }) async {}
}

Future<void> _pumpSpend(
  WidgetTester tester, {
  required ProfileRepository repository,
  Role role = Role.manager,
}) async {
  final auth = FakeAuthRepository()
    ..accessToken = 'access-token'
    ..refreshToken = 'refresh-token'
    ..user = testUser(role: role);

  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        authRepositoryProvider.overrideWithValue(auth),
        profileRepositoryProvider.overrideWithValue(repository),
      ],
      child: MaterialApp(
        theme: AppTheme.light(),
        locale: const Locale('uz'),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        home: const Scaffold(body: SpendSection()),
      ),
    ),
  );
}

void main() {
  testWidgets('yuklanayotganda skeleton ko\'rsatiladi', (tester) async {
    final repository = _PendingProfileRepository();

    await _pumpSpend(tester, repository: repository);
    await tester.pump();

    expect(find.byType(SkeletonBox), findsOneWidget);

    repository.limitCompleter.complete(testProfileLimit(maxCostUzs: '500000.00'));
    repository.costCompleter.complete(100000);
    await tester.pumpAndSettle();

    expect(find.byType(SkeletonBox), findsNothing);
    expect(find.text('Bugungi sarf'), findsWidgets);

    await tester.pumpWidget(const SizedBox());
  });

  testWidgets('limit o\'rnatilmagan bo\'lsa notSet holati', (tester) async {
    final repository = FakeProfileRepository()..limit = null;

    await _pumpSpend(tester, repository: repository);
    await tester.pumpAndSettle();

    expect(find.text('Limit o\'rnatilmagan'), findsOneWidget);
    expect(find.text('Kunlik limit soat 24:00 da yangilanadi'), findsOneWidget);

    await tester.pumpWidget(const SizedBox());
  });

  testWidgets('cheksiz limit bo\'lsa ∞ ko\'rsatiladi', (tester) async {
    final repository = FakeProfileRepository()..limit = testProfileLimit(isUnlimited: true);

    await _pumpSpend(tester, repository: repository);
    await tester.pumpAndSettle();

    expect(find.text('∞'), findsOneWidget);
    expect(find.text('Cheksiz'), findsOneWidget);

    await tester.pumpWidget(const SizedBox());
  });

  testWidgets('maxCost 0 (cheklovsiz) bo\'lsa "Cheklov yo\'q" ko\'rsatiladi, 0 so\'m emas', (tester) async {
    final repository = FakeProfileRepository()..limit = testProfileLimit(maxCostUzs: '0.00');

    await _pumpSpend(tester, repository: repository);
    await tester.pumpAndSettle();

    expect(find.text('∞'), findsOneWidget);
    expect(find.text("Cheklov yo'q"), findsOneWidget);
    expect(find.textContaining('0 / 0'), findsNothing);

    await tester.pumpWidget(const SizedBox());
  });

  testWidgets('limit maxCost null bo\'lsa notSet holati', (tester) async {
    final repository = FakeProfileRepository()..limit = testProfileLimit(maxCostUzs: null);

    await _pumpSpend(tester, repository: repository);
    await tester.pumpAndSettle();

    expect(find.text('Limit o\'rnatilmagan'), findsOneWidget);

    await tester.pumpWidget(const SizedBox());
  });

  testWidgets('maxCost va todayCost bo\'lsa progress bar ko\'rsatiladi', (tester) async {
    final repository = FakeProfileRepository()
      ..limit = testProfileLimit(maxCostUzs: '500000.00')
      ..todayCost = 100000;

    await _pumpSpend(tester, repository: repository);
    await tester.pumpAndSettle();

    expect(find.byType(LimitProgressBar), findsOneWidget);
    expect(find.textContaining('so\'m'), findsWidgets);
    expect(find.text('Kunlik limit soat 24:00 da yangilanadi'), findsOneWidget);

    await tester.pumpWidget(const SizedBox());
  });

  testWidgets('manager bo\'lmasa todayCost so\'ralmaydi', (tester) async {
    final repository = FakeProfileRepository()..limit = testProfileLimit(maxCostUzs: '500000.00');

    await _pumpSpend(tester, repository: repository, role: Role.employee);
    await tester.pumpAndSettle();

    expect(repository.todayCostCalls, 0);
    expect(find.textContaining('so\'m'), findsOneWidget);
    expect(find.byType(LimitProgressBar), findsNothing);

    await tester.pumpWidget(const SizedBox());
  });
}
