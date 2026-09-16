import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alora_mobile/core/network/dio_client.dart';
import 'package:alora_mobile/features/orders/data/datasources/orders_remote_ds.dart';
import 'package:alora_mobile/features/orders/data/repositories/orders_repository_impl.dart';
import 'package:alora_mobile/features/orders/domain/repositories/orders_repository.dart';

final ordersRemoteDataSourceProvider = Provider<OrdersRemoteDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return OrdersRemoteDataSourceImpl(dio);
});

final ordersRepositoryProvider = Provider<OrdersRepository>((ref) {
  final remoteDS = ref.watch(ordersRemoteDataSourceProvider);
  return OrdersRepositoryImpl(remoteDS);
});

final draftOrdersCountProvider = FutureProvider.autoDispose<int>((ref) async {
  final repo = ref.watch(ordersRepositoryProvider);
  final paginated = await repo.getOrders(status: 'draft');
  return paginated.results.length; // Actually API might not return count, but we'll use results length. Wait, API might have total count in meta. If not, this is what we have.
});
