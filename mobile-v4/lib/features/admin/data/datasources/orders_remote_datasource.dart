import '../../../../core/network/dio_client.dart';
import '../models/order_detail_model.dart';

/// Orders Remote Datasource
/// Gère les appels API pour les commandes
class OrdersRemoteDatasource {
  const OrdersRemoteDatasource(this._dioClient);

  final DioClient _dioClient;

  /// Get all orders
  Future<List<OrderDetailModel>> getOrders({
    int? page,
    int? limit,
    String? status,
    String? customerId,
    String? delivererId,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    final queryParams = <String, dynamic>{};

    if (page != null) queryParams['page'] = page;
    if (limit != null) queryParams['limit'] = limit;
    if (status != null) queryParams['status'] = status;
    if (customerId != null) queryParams['customer_id'] = customerId;
    if (delivererId != null) queryParams['deliverer_id'] = delivererId;
    if (startDate != null) {
      queryParams['start_date'] = startDate.toIso8601String();
    }
    if (endDate != null) queryParams['end_date'] = endDate.toIso8601String();

    final response = await _dioClient.get('/api/v1/orders', queryParameters: queryParams);

    final List<dynamic> data = response.data['data'] ?? response.data;
    return data.map((json) => OrderDetailModel.fromJson(json)).toList();
  }

  /// Get order by ID
  Future<OrderDetailModel> getOrderById(String id) async {
    final response = await _dioClient.get('/api/v1/orders/$id');

    return OrderDetailModel.fromJson(response.data['data'] ?? response.data);
  }

  /// Update order status
  Future<OrderDetailModel> updateOrderStatus(String id, String status) async {
    final response = await _dioClient.patch('/api/v1/orders/$id/status', data: {'status': status});

    return OrderDetailModel.fromJson(response.data['data'] ?? response.data);
  }

  /// Assign deliverer
  Future<OrderDetailModel> assignDeliverer(String orderId, String delivererId) async {
    final response = await _dioClient.post('/api/v1/orders/$orderId/assign', data: {'deliverer_id': delivererId});

    return OrderDetailModel.fromJson(response.data['data'] ?? response.data);
  }

  /// Cancel order
  Future<OrderDetailModel> cancelOrder(String id, String reason) async {
    final response = await _dioClient.post('/api/v1/orders/$id/cancel', data: {'reason': reason});

    return OrderDetailModel.fromJson(response.data['data'] ?? response.data);
  }

  /// Get order statistics
  Future<Map<String, dynamic>> getOrderStatistics({DateTime? startDate, DateTime? endDate}) async {
    final queryParams = <String, dynamic>{};

    if (startDate != null) {
      queryParams['start_date'] = startDate.toIso8601String();
    }
    if (endDate != null) queryParams['end_date'] = endDate.toIso8601String();

    final response = await _dioClient.get('/api/v1/orders/statistics', queryParameters: queryParams);

    return response.data['data'] ?? response.data;
  }
}
