import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:alora_mobile/core/network/dio_client.dart';

import '../data/datasources/profile_remote_ds.dart';
import '../data/repositories/profile_repository_impl.dart';
import '../domain/repositories/profile_repository.dart';

part 'providers.g.dart';

/// Profil backend data source
@Riverpod(keepAlive: true)
ProfileRemoteDataSource profileRemoteDataSource(Ref ref) {
  return ProfileRemoteDataSource(ref.watch(dioProvider));
}

/// Profil repository (testlarda override qilinadi)
@Riverpod(keepAlive: true)
ProfileRepository profileRepository(Ref ref) {
  return ProfileRepositoryImpl(ref.watch(profileRemoteDataSourceProvider));
}