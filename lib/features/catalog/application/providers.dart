import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:alora_mobile/core/network/dio_client.dart';

import '../data/datasources/catalog_local_ds.dart';
import '../data/datasources/catalog_remote_ds.dart';
import '../data/repositories/catalog_repository_impl.dart';
import '../domain/repositories/catalog_repository.dart';

part 'providers.g.dart';

@Riverpod(keepAlive: true)
CatalogRemoteDataSource catalogRemoteDataSource(Ref ref) {
  return CatalogRemoteDataSource(ref.watch(dioProvider));
}

@Riverpod(keepAlive: true)
CatalogLocalDataSource catalogLocalDataSource(Ref ref) {
  return CatalogLocalDataSource();
}

@Riverpod(keepAlive: true)
CatalogRepository catalogRepository(Ref ref) {
  return CatalogRepositoryImpl(
    ref.watch(catalogRemoteDataSourceProvider),
    ref.watch(catalogLocalDataSourceProvider),
  );
}
