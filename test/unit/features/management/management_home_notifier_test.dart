import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:alora_mobile/core/error/failure.dart';
import 'package:alora_mobile/features/management/application/management_home_notifier.dart';
import 'package:alora_mobile/features/management/application/management_period_notifier.dart';
import 'package:alora_mobile/features/management/application/providers.dart';
import 'package:alora_mobile/features/management/domain/entities/conversion_stats.dart';
import 'package:alora_mobile/features/management/domain/entities/usage_conversation.dart';
import 'package:alora_mobile/features/management/domain/entities/usage_period.dart';
import 'package:alora_mobile/features/management/domain/entities/usage_summary.dart';
import 'package:alora_mobile/features/management/domain/entities/user_usage.dart';
import 'package:alora_mobile/features/management/domain/repositories/usage_repository.dart';

import '../../../helpers/fake_usage_repository.dart';

void main() {
  late ProviderContainer container;
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

    container = ProviderContainer(
      overrides: [usageRepositoryProvider.overrideWithValue(usageRepository)],
    );
    addTearDown(container.dispose);
  });

  test('boshlang\'ich yuklash summary/conversion/byUser chaqiradi', () async {
    final data = await container.read(managementHomeProvider.future);

    expect(usageRepository.summaryCalls.length, 1);
    expect(usageRepository.summaryCalls.single.period, UsagePeriod.day);
    expect(usageRepository.summaryCalls.single.userId, isNull);
    expect(usageRepository.conversionCalls, 1);
    expect(usageRepository.byUserPeriods, [UsagePeriod.day]);

    expect(data.usage.costUzs, 250000);
    expect(data.usage.conversations, 12);
    expect(data.conversion.withOrder, 3);
    expect(data.ranking.length, 2);
    expect(data.ranking.first.fullName, 'Akmal Karimov');
  });

  test('davr o\'zgarsa ma\'lumotlar qayta yuklanadi', () async {
    final sub = container.listen(managementHomeProvider, (_, _) {});
    await container.read(managementHomeProvider.future);

    container
        .read(managementPeriodProvider.notifier)
        .setPeriod(UsagePeriod.week);
    await pumpEventQueue();

    expect(usageRepository.summaryCalls.length, 2);
    expect(usageRepository.summaryCalls.last.period, UsagePeriod.week);
    expect(usageRepository.byUserPeriods.last, UsagePeriod.week);
    sub.close();
  });

  test('conversion xatosi provider error holatiga o\'tadi', () async {
    usageRepository.conversionFailure = const Failure.network();

    final sub = container.listen(managementHomeProvider, (_, _) {});
    await pumpEventQueue();

    expect(sub.read().hasError, isTrue);
    expect(sub.read().error, isA<Failure>());
    sub.close();
  });

  test('summary xatosi provider error holatiga o\'tadi', () async {
    usageRepository.summaryFailure = const Failure.server();

    final sub = container.listen(managementHomeProvider, (_, _) {});
    await pumpEventQueue();

    expect(sub.read().hasError, isTrue);
    expect(sub.read().error, isA<Failure>());
    sub.close();
  });

  test(
    'non-Failure xatolik Failure.unknown ga o\'raladi (regressiya)',
    () async {
      final throwing = _ThrowingUsageRepository();

      final container = ProviderContainer(
        overrides: [usageRepositoryProvider.overrideWithValue(throwing)],
      );
      addTearDown(container.dispose);

      final sub = container.listen(managementHomeProvider, (_, _) {});
      await pumpEventQueue();

      expect(sub.read().hasError, isTrue);
      final failure = sub.read().error;
      expect(failure, isA<Failure>());
      expect(failure.toString(), contains('boom'));
      sub.close();
    },
  );
}

/// Barcha so'rovlarda oddiy (Failure bo'lmagan) xato otuvchi repository.
class _ThrowingUsageRepository implements UsageRepository {
  @override
  Future<UsageSummary> summary({
    required UsagePeriod period,
    String? userId,
  }) async {
    throw Exception('boom');
  }

  @override
  Future<ConversionStats> conversion() async {
    throw Exception('boom');
  }

  @override
  Future<List<UserUsage>> byUser({required UsagePeriod period}) async {
    throw Exception('boom');
  }

  @override
  Future<List<UsageConversation>> conversations() async {
    throw Exception('boom');
  }
}
