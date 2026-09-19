import 'dart:typed_data';

import 'package:dio/dio.dart';

import '../../../../core/network/api_paths.dart';
import '../dto/order_dto.dart';
import '../dto/orders_response_dto.dart';
import '../dto/statuses_response_dto.dart';

abstract class OrdersRemoteDataSource {
  Future<OrdersResponseDto> getOrders({String? status, String? search, String? url});
  Future<OrderDto> getOrder(String id);
  Future<OrderDto> createOrder(Map<String, dynamic> body);
  Future<OrderDto> patchOrder(String id, Map<String, dynamic> body);
  Future<OrderDto> confirmOrder(String id);
  Future<OrderDto> changeStatus(String id, String status, String? note, String? actionDate);
  Future<StatusesResponseDto> getStatuses();
  Future<Uint8List> getPdf(String id);
}

class OrdersRemoteDataSourceImpl implements OrdersRemoteDataSource {
  final Dio dio;

  OrdersRemoteDataSourceImpl(this.dio);

  @override
  Future<OrdersResponseDto> getOrders({String? status, String? search, String? url}) async {
    if (url != null) {
      final response = await dio.get<Map<String, dynamic>>(url);
      return OrdersResponseDto.fromJson(response.data!);
    }

    final queryParameters = <String, dynamic>{};
    if (status != null && status.isNotEmpty) queryParameters['status'] = status;
    if (search != null && search.isNotEmpty) queryParameters['search'] = search;

    final response = await dio.get<Map<String, dynamic>>(
      ApiPaths.orders,
      queryParameters: queryParameters,
    );

    return OrdersResponseDto.fromJson(response.data!);
  }

  @override
  Future<OrderDto> getOrder(String id) async {
    final response = await dio.get<Map<String, dynamic>>(ApiPaths.order(id));
    return OrderDto.fromJson(response.data!);
  }

  @override
  Future<OrderDto> createOrder(Map<String, dynamic> body) async {
    final response = await dio.post<Map<String, dynamic>>(ApiPaths.orders, data: body);
    return OrderDto.fromJson(response.data!);
  }

  @override
  Future<OrderDto> patchOrder(String id, Map<String, dynamic> body) async {
    final response = await dio.patch<Map<String, dynamic>>(ApiPaths.order(id), data: body);
    return OrderDto.fromJson(response.data!);
  }

  @override
  Future<OrderDto> confirmOrder(String id) async {
    final response = await dio.post<Map<String, dynamic>>(ApiPaths.orderConfirm(id));
    return OrderDto.fromJson(response.data!);
  }

  @override
  Future<OrderDto> changeStatus(String id, String status, String? note, String? actionDate) async {
    final data = <String, dynamic>{'status': status};
    if (note != null) data['note'] = note;
    if (actionDate != null) data['action_date'] = actionDate;

    final response = await dio.post<Map<String, dynamic>>(ApiPaths.orderStatus(id), data: data);
    return OrderDto.fromJson(response.data!);
  }

  @override
  Future<StatusesResponseDto> getStatuses() async {
    final response = await dio.get<Map<String, dynamic>>(ApiPaths.orderStatuses);
    return StatusesResponseDto.fromJson(response.data!);
  }

  @override
  Future<Uint8List> getPdf(String id) async {
    final response = await dio.get<List<int>>(
      ApiPaths.orderPdf(id),
      options: Options(responseType: ResponseType.bytes),
    );
    return Uint8List.fromList(response.data!);
  }
}
