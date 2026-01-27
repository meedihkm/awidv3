import '../entities/delivery.dart';
import '../repositories/deliverer_repository.dart';

/// Get Deliveries Use Case
/// Récupère les livraisons assignées au livreur
class GetDeliveriesUseCase {
  const GetDeliveriesUseCase(this._repository);

  final DelivererRepository _repository;

  Future<List<Delivery>> call({
    String? status,
    DateTime? date,
  }) async {
    return _repository.getDeliveries(
      status: status,
      date: date,
    );
  }
}
