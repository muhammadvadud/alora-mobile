import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:alora_mobile/core/network/dio_client.dart';

import '../data/datasources/settings_remote_ds.dart';
import '../data/repositories/settings_repository_impl.dart';
import '../domain/repositories/settings_repository.dart';

part 'providers.g.dart';

/// Sozlamalar backend data source
@Riverpod(keepAlive: true)
SettingsRemoteDataSource settingsRemoteDataSource(Ref ref) {
  return SettingsRemoteDataSourceImpl(ref.watch(dioProvider));
}

/// Sozlamalar repository
@Riverpod(keepAlive: true)
SettingsRepository settingsRepository(Ref ref) {
  return SettingsRepositoryImpl(ref.watch(settingsRemoteDataSourceProvider));
}
