import 'dart:typed_data';

import '../../../../core/utils/paginated.dart';
import '../entities/order.dart';
import '../entities/statuses_response.dart';

abstract class OrdersRepository {
  Future<Paginated<Order>> getOrders({String? status, String? search, String? url});
  Future<Order> getOrder(String id);
  Future<Order> createOrder(Map<String, dynamic> body);
  Future<Order> patchOrder(String id, Map<String, dynamic> body);
  Future<Order> confirmOrder(String id);
  Future<Order> changeStatus(String id, String status, {String? note, String? actionDate});
  Future<StatusesResponse> getStatuses();
  Future<Uint8List> getPdf(String id);
}
