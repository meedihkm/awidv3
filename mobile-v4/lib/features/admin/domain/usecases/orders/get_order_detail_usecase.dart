import '../../entities/order_detail.dart';
import '../../repositories/orders_repository.dart';

/// Get Order Detail Use Case
/// Récupère les détails complets d'une commande
class GetOrderDetailUseCase {
  const GetOrderDetailUseCase(this._repository);

  final OrdersRepository _repository;

  Future<OrderDetail> call(String id) async {
    if (id.trim().isEmpty) {
      throw Exception('ID commande invalide');
    }

    return _repository.getOrderById(id);
  }
}
