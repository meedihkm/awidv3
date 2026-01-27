import '../entities/order_detail.dart';

/// Orders Repository Interface
/// Définit les opérations pour la gestion des commandes
abstract class OrdersRepository {
  /// Get all orders with optional filters
  Future<List<OrderDetail>> getOrders({
    int? page,
    int? limit,
    String? status,
    String? customerId,
    String? delivererId,
    DateTime? startDate,
    DateTime? endDate,
  });

  /// Get order by ID
  Future<OrderDetail> getOrderById(String id);

  /// Update order status
  Future<OrderDetail> updateOrderStatus({required String id, required String status});

  /// Assign deliverer to order
  Future<OrderDetail> assignDeliverer({required String orderId, required String delivererId});

  /// Cancel order
  Future<OrderDetail> cancelOrder({required String id, required String reason});

  /// Get order statistics
  Future<Map<String, dynamic>> getOrderStatistics({DateTime? startDate, DateTime? endDate});
}
