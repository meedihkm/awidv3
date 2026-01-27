import '../../domain/entities/order_detail.dart';
import '../../domain/repositories/orders_repository.dart';
import '../datasources/orders_remote_datasource.dart';

/// Orders Repository Implementation
/// Implémente le repository des commandes
class OrdersRepositoryImpl implements OrdersRepository {
  const OrdersRepositoryImpl(this._remoteDatasource);

  final OrdersRemoteDatasource _remoteDatasource;

  @override
  Future<List<OrderDetail>> getOrders({
    int? page,
    int? limit,
    String? status,
    String? customerId,
    String? delivererId,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    try {
      final models = await _remoteDatasource.getOrders(
        page: page,
        limit: limit,
        status: status,
        customerId: customerId,
        delivererId: delivererId,
        startDate: startDate,
        endDate: endDate,
      );

      return models.map((model) => model.toEntity()).toList();
    } catch (e) {
      throw Exception('Erreur lors de la récupération des commandes: $e');
    }
  }

  @override
  Future<OrderDetail> getOrderById(String id) async {
    try {
      final model = await _remoteDatasource.getOrderById(id);
      return model.toEntity();
    } catch (e) {
      throw Exception('Erreur lors de la récupération de la commande: $e');
    }
  }

  @override
  Future<OrderDetail> updateOrderStatus({required String id, required String status}) async {
    try {
      final model = await _remoteDatasource.updateOrderStatus(id, status);
      return model.toEntity();
    } catch (e) {
      throw Exception('Erreur lors de la mise à jour du statut de la commande: $e');
    }
  }

  @override
  Future<OrderDetail> assignDeliverer({required String orderId, required String delivererId}) async {
    try {
      final model = await _remoteDatasource.assignDeliverer(orderId, delivererId);
      return model.toEntity();
    } catch (e) {
      throw Exception('Erreur lors de l\'assignation du livreur à la commande: $e');
    }
  }

  @override
  Future<OrderDetail> cancelOrder({required String id, required String reason}) async {
    try {
      final model = await _remoteDatasource.cancelOrder(id, reason);
      return model.toEntity();
    } catch (e) {
      throw Exception('Erreur lors de l\'annulation de la commande: $e');
    }
  }

  @override
  Future<Map<String, dynamic>> getOrderStatistics({DateTime? startDate, DateTime? endDate}) async {
    try {
      return await _remoteDatasource.getOrderStatistics(startDate: startDate, endDate: endDate);
    } catch (e) {
      throw Exception('Erreur lors de la récupération des statistiques: $e');
    }
  }
}
