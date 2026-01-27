import '../../entities/order_detail.dart';
import '../../repositories/orders_repository.dart';

/// Assign Deliverer Use Case
/// Assigne un livreur à une commande
class AssignDelivererUseCase {
  const AssignDelivererUseCase(this._repository);

  final OrdersRepository _repository;

  Future<OrderDetail> call({required String orderId, required String delivererId}) async {
    if (orderId.trim().isEmpty) {
      throw Exception('ID commande invalide');
    }

    if (delivererId.trim().isEmpty) {
      throw Exception('ID livreur invalide');
    }

    return _repository.assignDeliverer(orderId: orderId, delivererId: delivererId);
  }
}
