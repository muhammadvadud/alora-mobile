import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/theme/app_theme.dart';
import 'package:alora_mobile/features/management/application/providers.dart';
import 'package:alora_mobile/features/management/domain/entities/conversion_stats.dart';
import 'package:alora_mobile/features/management/domain/entities/usage_conversation.dart';
import 'package:alora_mobile/features/management/domain/entities/usage_period.dart';
import 'package:alora_mobile/features/management/domain/entities/usage_summary.dart';
import 'package:alora_mobile/features/management/domain/entities/user_usage.dart';
import 'package:alora_mobile/features/management/domain/repositories/usage_repository.dart';
import 'package:alora_mobile/features/management/presentation/screens/management_screen.dart';
import 'package:alora_mobile/shared/widgets/error_state.dart';
import 'package:alora_mobile/shared/widgets/skeleton.dart';

import '../../../helpers/fake_usage_repository.dart';

Future<void> _pumpManagement(
  WidgetTester tester, {
  required UsageRepository usageRepository,
}) async {
  final container = ProviderContainer(
    overrides: [usageRepositoryProvider.overrideWithValue(usageRepository)],
  );
  addTearDown(container.dispose);

  await tester.pumpWidget(
    UncontrolledProviderScope(
      container: container,
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
        home: const ManagementScreen(),
      ),
    ),
  );
}

/// Barcha so'rovlarda oddiy (Failure bo'lmagan) xato otuvchi repository.
/// Bug 2 regressiyasi: provider buni [Failure.unknown] ga o'rashi kerak.
class _ThrowingUsageRepository implements UsageRepository {
  @override
  Future<UsageSummary> summary({
    required UsagePeriod period,
    String? userId,
  }) async {
    throw Exception('kutilmagan xato');
  }

  @override
  Future<List<UserUsage>> byUser({required UsagePeriod period}) async {
    throw Exception('kutilmagan xato');
  }

  @override
  Future<ConversionStats> conversion() async {
    throw Exception('kutilmagan xato');
  }

  @override
  Future<List<UsageConversation>> conversations() async {
    throw Exception('kutilmagan xato');
  }
}

/// Skeletondan keyingi holatni tekshirish uchun so'rovlarni ushlab
/// turadigan repository (completer orqali qo'lda yakunlanadi).
class _ControlledUsageRepository implements UsageRepository {
  final Completer<UsageSummary> summaryCompleter;
  final Completer<List<UserUsage>> byUserCompleter;
  final Completer<ConversionStats> conversionCompleter;

  _ControlledUsageRepository({
    required this.summaryCompleter,
    required this.byUserCompleter,
    required this.conversionCompleter,
  });

  @override
  Future<UsageSummary> summary({required UsagePeriod period, String? userId}) =>
      summaryCompleter.future;

  @override
  Future<List<UserUsage>> byUser({required UsagePeriod period}) =>
      byUserCompleter.future;

  @override
  Future<ConversionStats> conversion() => conversionCompleter.future;

  @override
  Future<List<UsageConversation>> conversations() async => const [];
}

void main() {
  late FakeUsageRepository usageRepository;

  setUp(() {
    usageRepository = FakeUsageRepository();
    usageRepository.summaryResult = testUsageSummary(
      period: 'day',
      costUzs: 250000,
      conversations: 12,
      daily: [
        testUsageDailyPoint(date: DateTime(2026, 9, 15), costUzs: 100000),
        testUsageDailyPoint(date: DateTime(2026, 9, 16), costUzs: 150000),
      ],
    );
    usageRepository.conversionResult = testConversionStats(
      totalConversations: 12,
      withOrder: 3,
      conversionRate: 25,
    );
    usageRepository.byUserResult = [
      testUserUsage(userId: 'employee-1', costUzs: 120000, conversations: 6),
      testUserUsage(userId: 'employee-2', fullName: null, costUzs: 80000),
    ];
  });

  testWidgets('yuklash avvalida skeleton, keyin statistika ko\'rinadi', (
    tester,
  ) async {
    final summaryCompleter = Completer<UsageSummary>();
    final byUserCompleter = Completer<List<UserUsage>>();
    final conversionCompleter = Completer<ConversionStats>();

    await _pumpManagement(
      tester,
      usageRepository: _ControlledUsageRepository(
        summaryCompleter: summaryCompleter,
        byUserCompleter: byUserCompleter,
        conversionCompleter: conversionCompleter,
      ),
    );
    await tester.pump();

    expect(find.byType(SkeletonBox), findsWidgets);

    summaryCompleter.complete(
      testUsageSummary(period: 'day', costUzs: 250000, conversations: 12),
    );
    byUserCompleter.complete(usageRepository.byUserResult);
    conversionCompleter.complete(usageRepository.conversionResult);
    await tester.pumpAndSettle();

    expect(find.byType(SkeletonBox), findsNothing);
    expect(find.text('12'), findsOneWidget); // Suhbatlar
    expect(find.text('3'), findsOneWidget); // Buyurtmalar
    expect(find.text('25%'), findsOneWidget); // Konversiya
    expect(find.text('Akmal Karimov'), findsWidgets); // reyting qatori
  });

  testWidgets('davr "Hafta" tanlanganda repo yangi davr bilan chaqiriladi', (
    tester,
  ) async {
    await _pumpManagement(tester, usageRepository: usageRepository);
    await tester.pumpAndSettle();

    usageRepository.summaryCalls.clear();
    usageRepository.byUserPeriods.clear();

    await tester.tap(find.text('Hafta'));
    await tester.pumpAndSettle();

    expect(usageRepository.summaryCalls.last.period, UsagePeriod.week);
    expect(usageRepository.byUserPeriods.last, UsagePeriod.week);
  });

  testWidgets('non-Failure xato ErrorState ko\'rinadi (regressiya bug 2)', (
    tester,
  ) async {
    await _pumpManagement(tester, usageRepository: _ThrowingUsageRepository());
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
    expect(find.byType(ErrorState), findsOneWidget);
    expect(find.byType(SkeletonBox), findsNothing);
  });
}
