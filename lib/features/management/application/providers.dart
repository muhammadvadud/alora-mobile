import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:alora_mobile/core/network/dio_client.dart';

import '../data/datasources/team_remote_ds.dart';
import '../data/datasources/usage_remote_ds.dart';
import '../data/repositories/team_repository_impl.dart';
import '../data/repositories/usage_repository_impl.dart';
import '../domain/repositories/team_repository.dart';
import '../domain/repositories/usage_repository.dart';

part 'providers.g.dart';

/// Usage statistika backend data source
@Riverpod(keepAlive: true)
UsageRemoteDataSource usageRemoteDataSource(Ref ref) {
  return UsageRemoteDataSource(ref.watch(dioProvider));
}

/// Usage statistika repository
@Riverpod(keepAlive: true)
UsageRepository usageRepository(Ref ref) {
  return UsageRepositoryImpl(ref.watch(usageRemoteDataSourceProvider));
}

/// Jamoa backend data source
@Riverpod(keepAlive: true)
TeamRemoteDataSource teamRemoteDataSource(Ref ref) {
  return TeamRemoteDataSource(ref.watch(dioProvider));
}

/// Jamoa repository
@Riverpod(keepAlive: true)
TeamRepository teamRepository(Ref ref) {
  return TeamRepositoryImpl(ref.watch(teamRemoteDataSourceProvider));
}