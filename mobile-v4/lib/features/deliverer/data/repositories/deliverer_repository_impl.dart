import '../../domain/entities/delivery.dart';
import '../../domain/entities/delivery_stats.dart';
import '../../domain/entities/route.dart';
import '../../domain/repositories/deliverer_repository.dart';
import '../datasources/deliverer_remote_datasource.dart';

/// Deliverer Repository Implementation
/// Implémente le repository des livreurs
class DelivererRepositoryImpl implements DelivererRepository {
  const DelivererRepositoryImpl(this._remoteDatasource);

  final DelivererRemoteDatasource _remoteDatasource;

  @override
  Future<List<Delivery>> getDeliveries({
    String? status,
    DateTime? date,
  }) async {
    try {
      final models = await _remoteDatasource.getDeliveries(
        status: status,
        date: date,
      );

      return models.map((model) => model.toEntity()).toList();
    } catch (e) {
      throw Exception('Erreur lors de la récupération des livraisons: $e');
    }
  }

  @override
  Future<Delivery> getDeliveryById(String id) async {
    try {
      final model = await _remoteDatasource.getDeliveryById(id);
      return model.toEntity();
    } catch (e) {
      throw Exception('Erreur lors de la récupération de la livraison: $e');
    }
  }

  @override
  Future<DeliveryStats> getStats({
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    try {
      final model = await _remoteDatasource.getStats(
        startDate: startDate,
        endDate: endDate,
      );
      return model.toEntity();
    } catch (e) {
      throw Exception('Erreur lors de la récupération des statistiques: $e');
    }
  }

  @override
  Future<Delivery> updateDeliveryStatus({
    required String deliveryId,
    required String status,
  }) async {
    try {
      final model = await _remoteDatasource.updateDeliveryStatus(
        deliveryId,
        status,
      );
      return model.toEntity();
    } catch (e) {
      throw Exception('Erreur lors de la mise à jour du statut: $e');
    }
  }

  @override
  Future<Delivery> startDelivery(String deliveryId) async {
    try {
      final model = await _remoteDatasource.startDelivery(deliveryId);
      return model.toEntity();
    } catch (e) {
      throw Exception('Erreur lors du démarrage de la livraison: $e');
    }
  }

  @override
  Future<Delivery> completeDelivery({
    required String deliveryId,
    String? notes,
    String? signatureUrl,
    String? photoUrl,
  }) async {
    try {
      final model = await _remoteDatasource.completeDelivery(
        deliveryId: deliveryId,
        notes: notes,
        signatureUrl: signatureUrl,
        photoUrl: photoUrl,
      );
      return model.toEntity();
    } catch (e) {
      throw Exception('Erreur lors de la complétion de la livraison: $e');
    }
  }

  @override
  Future<DeliveryRoute> getRoute({
    required double startLat,
    required double startLng,
    required double endLat,
    required double endLng,
  }) async {
    try {
      final model = await _remoteDatasource.getRoute(
        startLat: startLat,
        startLng: startLng,
        endLat: endLat,
        endLng: endLng,
      );
      return model.toEntity();
    } catch (e) {
      throw Exception('Erreur lors de la récupération de l\'itinéraire: $e');
    }
  }

  @override
  Future<void> updateLocation({
    required double latitude,
    required double longitude,
  }) async {
    try {
      await _remoteDatasource.updateLocation(
        latitude: latitude,
        longitude: longitude,
      );
    } catch (e) {
      throw Exception('Erreur lors de la mise à jour de la position: $e');
    }
  }

  @override
  Future<Delivery?> getActiveDelivery() async {
    try {
      final model = await _remoteDatasource.getActiveDelivery();
      return model?.toEntity();
    } catch (e) {
      return null;
    }
  }
}
