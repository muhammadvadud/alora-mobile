import 'dart:typed_data';

import '../../../../core/utils/paginated.dart';
import '../../domain/entities/order.dart';
import '../../domain/entities/statuses_response.dart';
import '../../domain/repositories/orders_repository.dart';
import '../datasources/orders_remote_ds.dart';
import '../mappers/order_mapper.dart';

class OrdersRepositoryImpl implements OrdersRepository {
  final OrdersRemoteDataSource remoteDataSource;

  StatusesResponse? _cachedStatuses;
  DateTime? _cachedStatusesTime;

  OrdersRepositoryImpl(this.remoteDataSource);

  @override
  Future<Paginated<Order>> getOrders({
    String? status,
    String? search,
    String? url,
  }) async {
    final responseDto = await remoteDataSource.getOrders(
      status: status,
      search: search,
      url: url,
    );
    return Paginated<Order>(
      next: responseDto.next,
      previous: responseDto.previous,
      results: responseDto.results.map((e) => e.toEntity()).toList(),
    );
  }

  @override
  Future<Order> getOrder(String id) async {
    final responseDto = await remoteDataSource.getOrder(id);
    return responseDto.toEntity();
  }

  @override
  Future<Order> createOrder(Map<String, dynamic> body) async {
    final responseDto = await remoteDataSource.createOrder(body);
    return responseDto.toEntity();
  }

  @override
  Future<Order> patchOrder(String id, Map<String, dynamic> body) async {
    final responseDto = await remoteDataSource.patchOrder(id, body);
    return responseDto.toEntity();
  }

  @override
  Future<Order> confirmOrder(String id) async {
    final responseDto = await remoteDataSource.confirmOrder(id);
    return responseDto.toEntity();
  }

  @override
  Future<Order> changeStatus(
    String id,
    String status, {
    String? note,
    String? actionDate,
  }) async {
    final responseDto = await remoteDataSource.changeStatus(
      id,
      status,
      note,
      actionDate,
    );
    return responseDto.toEntity();
  }

  @override
  Future<StatusesResponse> getStatuses() async {
    if (_cachedStatuses != null && _cachedStatusesTime != null) {
      final now = DateTime.now();
      if (now.difference(_cachedStatusesTime!).inHours < 1) {
        return _cachedStatuses!;
      }
    }

    final responseDto = await remoteDataSource.getStatuses();

    final entity = StatusesResponse(
      statuses: responseDto.statuses.map((e) => e.toEntity()).toList(),
      transitions: responseDto.transitions,
    );

    _cachedStatuses = entity;
    _cachedStatusesTime = DateTime.now();

    return entity;
  }

  @override
  Future<Uint8List> getPdf(String id) {
    return remoteDataSource.getPdf(id);
  }
}
