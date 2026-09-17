import '../../domain/entities/conversion_stats.dart';
import '../../domain/entities/usage_conversation.dart';
import '../../domain/entities/usage_period.dart';
import '../../domain/entities/usage_summary.dart';
import '../../domain/entities/user_usage.dart';
import '../../domain/repositories/usage_repository.dart';
import '../datasources/usage_remote_ds.dart';
import '../mappers/usage_mapper.dart';

/// Usage statistika repository implementatsiyasi.
class UsageRepositoryImpl implements UsageRepository {
  UsageRepositoryImpl(this._remoteDataSource);

  final UsageRemoteDataSource _remoteDataSource;

  @override
  Future<UsageSummary> summary({required UsagePeriod period, String? userId}) async {
    final dto = await _remoteDataSource.summary(period: period, userId: userId);
    return dto.toEntity();
  }

  @override
  Future<List<UserUsage>> byUser({required UsagePeriod period}) async {
    final dtos = await _remoteDataSource.byUser(period: period);
    return dtos.map((dto) => dto.toEntity()).toList();
  }

  @override
  Future<ConversionStats> conversion() async {
    return (await _remoteDataSource.conversion()).toEntity();
  }

  @override
  Future<List<UsageConversation>> conversations() async {
    final dtos = await _remoteDataSource.conversations();
    return dtos.map((dto) => dto.toEntity()).toList();
  }
}