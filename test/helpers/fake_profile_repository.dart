import 'package:alora_mobile/core/error/failure.dart';
import 'package:alora_mobile/features/profile/domain/entities/profile_limit.dart';
import 'package:alora_mobile/features/profile/domain/repositories/profile_repository.dart';

/// Testlarda ishlatiladigan [ProfileLimit] namunasi.
ProfileLimit testProfileLimit({
  String id = 'limit-1',
  String userId = 'user-1',
  String period = 'daily',
  bool isUnlimited = false,
  int? maxTokens,
  String? maxCostUzs,
  int? maxMessages,
  String onExceed = 'warn',
  bool isActive = true,
}) {
  return ProfileLimit(
    id: id,
    userId: userId,
    period: period,
    isUnlimited: isUnlimited,
    maxTokens: maxTokens,
    maxCostUzs: maxCostUzs,
    maxMessages: maxMessages,
    onExceed: onExceed,
    isActive: isActive,
  );
}

/// [ProfileRepository] interfeysining boshqariladigan fakesi.
/// Xatoliklar testda sozlanadi, chaqiruvlar hisoblanadi.
class FakeProfileRepository implements ProfileRepository {
  ProfileLimit? limit;
  Failure? limitFailure;

  int? todayCost;
  Failure? todayCostFailure;

  int limitCalls = 0;
  int todayCostCalls = 0;
  final List<String> todayCostUsers = [];

  @override
  Future<ProfileLimit?> getLimit() async {
    limitCalls++;
    final failure = limitFailure;
    if (failure != null) throw failure;
    return limit;
  }

  @override
  Future<int> getTodayCost(String userId) async {
    todayCostCalls++;
    todayCostUsers.add(userId);
    final failure = todayCostFailure;
    if (failure != null) throw failure;
    return todayCost ?? 0;
  }
}
