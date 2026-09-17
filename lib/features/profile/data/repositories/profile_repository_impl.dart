import '../../domain/entities/profile_limit.dart';
import '../../domain/repositories/profile_repository.dart';
import '../datasources/profile_remote_ds.dart';
import '../dto/profile_limit_dto.dart';

/// Profil repository'si (auth/me limit blo'gi + bugungi sarf).
class ProfileRepositoryImpl implements ProfileRepository {
  ProfileRepositoryImpl(this._remoteDataSource);

  final ProfileRemoteDataSource _remoteDataSource;

  @override
  Future<ProfileLimit?> getLimit() async {
    final dto = await _remoteDataSource.meLimit();
    return dto?.toEntity();
  }

  @override
  Future<int> getTodayCost(String userId) async {
    return _remoteDataSource.todayCost(userId);
  }
}

extension ProfileLimitDtoMapper on ProfileLimitDto {
  ProfileLimit toEntity() {
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
}