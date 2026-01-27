import '../entities/delivery.dart';
import '../entities/delivery_stats.dart';
import '../entities/route.dart';

/// Deliverer Repository Interface
/// Définit les opérations pour les livreurs
abstract class DelivererRepository {
  /// Get deliveries assigned to deliverer
  Future<List<Delivery>> getDeliveries({
    String? status,
    DateTime? date,
  });

  /// Get delivery by ID
  Future<Delivery> getDeliveryById(String id);

  /// Get deliverer statistics
  Future<DeliveryStats> getStats({
    DateTime? startDate,
    DateTime? endDate,
  });

  /// Update delivery status
  Future<Delivery> updateDeliveryStatus({
    required String deliveryId,
    required String status,
  });

  /// Start delivery (pick up)
  Future<Delivery> startDelivery(String deliveryId);

  /// Complete delivery
  Future<Delivery> completeDelivery({
    required String deliveryId,
    String? notes,
    String? signatureUrl,
    String? photoUrl,
  });

  /// Get route to delivery
  Future<DeliveryRoute> getRoute({
    required double startLat,
    required double startLng,
    required double endLat,
    required double endLng,
  });

  /// Update deliverer location
  Future<void> updateLocation({
    required double latitude,
    required double longitude,
  });

  /// Get active delivery (in progress)
  Future<Delivery?> getActiveDelivery();
}
