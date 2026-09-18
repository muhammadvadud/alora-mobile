import 'package:alora_mobile/core/error/failure.dart';
import 'package:alora_mobile/features/management/domain/entities/conversion_stats.dart';
import 'package:alora_mobile/features/management/domain/entities/usage_conversation.dart';
import 'package:alora_mobile/features/management/domain/entities/usage_daily_point.dart';
import 'package:alora_mobile/features/management/domain/entities/usage_period.dart';
import 'package:alora_mobile/features/management/domain/entities/usage_summary.dart';
import 'package:alora_mobile/features/management/domain/entities/user_usage.dart';
import 'package:alora_mobile/features/management/domain/repositories/usage_repository.dart';

/// Testlarda ishlatiladigan [UsageSummary] namunasi.
UsageSummary testUsageSummary({
  String period = 'day',
  int costUzs = 0,
  int conversations = 0,
  int messages = 0,
  int tokens = 0,
  int orders = 0,
  List<UsageDailyPoint> daily = const [],
}) {
  return UsageSummary(
    period: period,
    costUzs: costUzs,
    conversations: conversations,
    messages: messages,
    tokens: tokens,
    orders: orders,
    daily: daily,
  );
}

/// Testlarda ishlatiladigan [UserUsage] namunasi.
UserUsage testUserUsage({
  String userId = 'employee-1',
  String? fullName = 'Akmal Karimov',
  int costUzs = 0,
  int conversations = 0,
  int messages = 0,
  int tokens = 0,
}) {
  return UserUsage(
    userId: userId,
    fullName: fullName,
    costUzs: costUzs,
    conversations: conversations,
    messages: messages,
    tokens: tokens,
  );
}

/// Testlarda ishlatiladigan [ConversionStats] namunasi.
ConversionStats testConversionStats({
  int totalConversations = 0,
  int withOrder = 0,
  double? conversionRate,
}) {
  return ConversionStats(
    totalConversations: totalConversations,
    withOrder: withOrder,
    conversionRate: conversionRate,
  );
}

/// Testlarda ishlatiladigan [UsageDailyPoint] namunasi.
UsageDailyPoint testUsageDailyPoint({required DateTime date, int costUzs = 0}) {
  return UsageDailyPoint(date: date, costUzs: costUzs);
}

/// [UsageRepository] interfeysining boshqariladigan fakesi.
/// Xatoliklar va natijalar testda sozlanadi, chaqiruvlar hisoblanadi.
class FakeUsageRepository implements UsageRepository {
  UsageSummary summaryResult = const UsageSummary(period: 'day');
  Failure? summaryFailure;
  final List<({UsagePeriod period, String? userId})> summaryCalls = [];

  List<UserUsage> byUserResult = const [];
  Failure? byUserFailure;
  final List<UsagePeriod> byUserPeriods = [];

  ConversionStats conversionResult = const ConversionStats();
  Failure? conversionFailure;
  int conversionCalls = 0;

  List<UsageConversation> conversationsResult = const [];
  Failure? conversationsFailure;
  int conversationsCalls = 0;

  @override
  Future<UsageSummary> summary({
    required UsagePeriod period,
    String? userId,
  }) async {
    summaryCalls.add((period: period, userId: userId));
    final failure = summaryFailure;
    if (failure != null) throw failure;
    return summaryResult;
  }

  @override
  Future<List<UserUsage>> byUser({required UsagePeriod period}) async {
    byUserPeriods.add(period);
    final failure = byUserFailure;
    if (failure != null) throw failure;
    return byUserResult;
  }

  @override
  Future<ConversionStats> conversion() async {
    conversionCalls++;
    final failure = conversionFailure;
    if (failure != null) throw failure;
    return conversionResult;
  }

  @override
  Future<List<UsageConversation>> conversations() async {
    conversationsCalls++;
    final failure = conversationsFailure;
    if (failure != null) throw failure;
    return conversationsResult;
  }
}
