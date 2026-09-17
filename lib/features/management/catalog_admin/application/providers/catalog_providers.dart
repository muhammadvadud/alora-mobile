import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/repositories/catalog_write_repository.dart';
import '../../data/repositories/catalog_write_repository_impl.dart';
import '../../data/datasources/catalog_write_data_source.dart';
import 'package:dio/dio.dart';

part 'catalog_providers.g.dart';

@riverpod
Dio dio(Ref ref) {
  return Dio();
}

@riverpod
CatalogWriteRepository catalogWriteRepository(Ref ref) {
  final dioClient = ref.watch(dioProvider);
  final dataSource = CatalogWriteDataSourceImpl(dioClient);
  return CatalogWriteRepositoryImpl(dataSource);
}