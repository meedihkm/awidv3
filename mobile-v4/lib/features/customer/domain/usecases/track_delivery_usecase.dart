import 'dart:math';

import '../entities/customer_delivery.dart';
import '../repositories/customer_repository.dart';

/// Use Case: Suivre une Livraison
/// Gère le suivi en temps réel d'une livraison pour le client
class TrackDeliveryUseCase {
  final CustomerRepository _repository;

  const TrackDeliveryUseCase(this._repository);

  /// Récupère les informations de suivi d'une livraison
  Future<TrackDeliveryResult> execute(String deliveryId) async {
    try {
      // 1. Valider l'ID
      if (deliveryId.isEmpty) {
        throw ArgumentError('L\'ID de livraison est requis');
      }

      // 2. Récupérer les informations de livraison
      final delivery = await _repository.getDelivery(deliveryId);

      if (delivery == null) {
        return TrackDeliveryResult.failure(
          error: 'Livraison non trouvée',
          deliveryId: deliveryId,
        );
      }

      // 3. Vérifier si la livraison peut être suivie
      if (!delivery.status.isTrackable) {
        return TrackDeliveryResult.notTrackable(
          delivery: delivery,
          reason: 'La livraison n\'est pas encore en cours',
        );
      }

      return TrackDeliveryResult.success(delivery: delivery);
    } catch (error) {
      return TrackDeliveryResult.failure(
        error: error.toString(),
        deliveryId: deliveryId,
      );
    }
  }

  /// Récupère les livraisons actives du client
  Future<GetActiveDeliveriesResult> getActiveDeliveries(
      String customerId) async {
    try {
      if (customerId.isEmpty) {
        throw ArgumentError('L\'ID du client est requis');
      }

      final deliveries = await _repository.getActiveDeliveries(customerId);

      return GetActiveDeliveriesResult.success(deliveries: deliveries);
    } catch (error) {
      return GetActiveDeliveriesResult.failure(
        error: error.toString(),
        customerId: customerId,
      );
    }
  }

  /// Récupère l'historique des livraisons
  Future<GetDeliveriesHistoryResult> getDeliveriesHistory(
    String customerId, {
    DateTime? startDate,
    DateTime? endDate,
    int? limit,
  }) async {
    try {
      if (customerId.isEmpty) {
        throw ArgumentError('L\'ID du client est requis');
      }

      final deliveries = await _repository.getDeliveriesHistory(
        customerId: customerId,
        startDate: startDate,
        endDate: endDate,
        limit: limit,
      );

      return GetDeliveriesHistoryResult.success(deliveries: deliveries);
    } catch (error) {
      return GetDeliveriesHistoryResult.failure(
        error: error.toString(),
        customerId: customerId,
      );
    }
  }

  /// Calcule la distance entre deux points GPS
  double calculateDistance({
    required double lat1,
    required double lon1,
    required double lat2,
    required double lon2,
  }) {
    // Formule de Haversine pour calculer la distance
    const double earthRadius = 6371; // Rayon de la Terre en km

    final dLat = _toRadians(lat2 - lat1);
    final dLon = _toRadians(lon2 - lon1);

    final a = sin(dLat / 2) * sin(dLat / 2) +
        cos(_toRadians(lat1)) *
            cos(_toRadians(lat2)) *
            sin(dLon / 2) *
            sin(dLon / 2);

    final c = 2 * asin(sqrt(a));

    return earthRadius * c;
  }

  /// Estime le temps d'arrivée
  DateTime? estimateArrival({
    required double distanceKm,
    double averageSpeedKmh = 30,
  }) {
    if (distanceKm <= 0) return DateTime.now();

    final hours = distanceKm / averageSpeedKmh;
    final minutes = (hours * 60).round();

    return DateTime.now().add(Duration(minutes: minutes));
  }

  /// Convertit des degrés en radians
  double _toRadians(double degrees) {
    return degrees * (3.14159265359 / 180);
  }
}

/// Résultat du suivi de livraison
abstract class TrackDeliveryResult {
  const TrackDeliveryResult();

  factory TrackDeliveryResult.success({
    required CustomerDelivery delivery,
  }) = TrackDeliverySuccess;

  factory TrackDeliveryResult.notTrackable({
    required CustomerDelivery delivery,
    required String reason,
  }) = TrackDeliveryNotTrackable;

  factory TrackDeliveryResult.failure({
    required String error,
    required String deliveryId,
  }) = TrackDeliveryFailure;

  bool get isSuccess => this is TrackDeliverySuccess;
  bool get isNotTrackable => this is TrackDeliveryNotTrackable;
  bool get isFailure => this is TrackDeliveryFailure;
}

class TrackDeliverySuccess extends TrackDeliveryResult {
  final CustomerDelivery delivery;

  const TrackDeliverySuccess({required this.delivery});

  bool get hasCurrentLocation => delivery.hasCurrentLocation;
  bool get hasEstimatedArrival => delivery.estimatedArrival != null;
  bool get isNearby => delivery.isNearby;
}

class TrackDeliveryNotTrackable extends TrackDeliveryResult {
  final CustomerDelivery delivery;
  final String reason;

  const TrackDeliveryNotTrackable({
    required this.delivery,
    required this.reason,
  });
}

class TrackDeliveryFailure extends TrackDeliveryResult {
  final String error;
  final String deliveryId;

  const TrackDeliveryFailure({
    required this.error,
    required this.deliveryId,
  });
}

/// Résultat des livraisons actives
abstract class GetActiveDeliveriesResult {
  const GetActiveDeliveriesResult();

  factory GetActiveDeliveriesResult.success({
    required List<CustomerDelivery> deliveries,
  }) = GetActiveDeliveriesSuccess;

  factory GetActiveDeliveriesResult.failure({
    required String error,
    required String customerId,
  }) = GetActiveDeliveriesFailure;

  bool get isSuccess => this is GetActiveDeliveriesSuccess;
  bool get isFailure => this is GetActiveDeliveriesFailure;
}

class GetActiveDeliveriesSuccess extends GetActiveDeliveriesResult {
  final List<CustomerDelivery> deliveries;

  const GetActiveDeliveriesSuccess({required this.deliveries});

  bool get isEmpty => deliveries.isEmpty;
  bool get isNotEmpty => deliveries.isNotEmpty;
  int get count => deliveries.length;

  /// Retourne les livraisons qui peuvent être suivies
  List<CustomerDelivery> get trackableDeliveries {
    return deliveries.where((d) => d.status.isTrackable).toList();
  }

  /// Retourne les livraisons proches
  List<CustomerDelivery> get nearbyDeliveries {
    return deliveries.where((d) => d.isNearby).toList();
  }
}

class GetActiveDeliveriesFailure extends GetActiveDeliveriesResult {
  final String error;
  final String customerId;

  const GetActiveDeliveriesFailure({
    required this.error,
    required this.customerId,
  });
}

/// Résultat de l'historique des livraisons
abstract class GetDeliveriesHistoryResult {
  const GetDeliveriesHistoryResult();

  factory GetDeliveriesHistoryResult.success({
    required List<CustomerDelivery> deliveries,
  }) = GetDeliveriesHistorySuccess;

  factory GetDeliveriesHistoryResult.failure({
    required String error,
    required String customerId,
  }) = GetDeliveriesHistoryFailure;

  bool get isSuccess => this is GetDeliveriesHistorySuccess;
  bool get isFailure => this is GetDeliveriesHistoryFailure;
}

class GetDeliveriesHistorySuccess extends GetDeliveriesHistoryResult {
  final List<CustomerDelivery> deliveries;

  const GetDeliveriesHistorySuccess({required this.deliveries});

  bool get isEmpty => deliveries.isEmpty;
  bool get isNotEmpty => deliveries.isNotEmpty;
  int get count => deliveries.length;

  /// Retourne les livraisons complétées
  List<CustomerDelivery> get completedDeliveries {
    return deliveries
        .where((d) => d.status == DeliveryStatus.completed)
        .toList();
  }

  /// Retourne les livraisons échouées
  List<CustomerDelivery> get failedDeliveries {
    return deliveries.where((d) => d.status == DeliveryStatus.failed).toList();
  }

  /// Retourne le taux de succès
  double get successRate {
    if (deliveries.isEmpty) return 0;
    final completed = completedDeliveries.length;
    return (completed / deliveries.length) * 100;
  }
}

class GetDeliveriesHistoryFailure extends GetDeliveriesHistoryResult {
  final String error;
  final String customerId;

  const GetDeliveriesHistoryFailure({
    required this.error,
    required this.customerId,
  });
}
