import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_delivery.freezed.dart';
part 'customer_delivery.g.dart';

/// Livraison Client
/// Entité représentant une livraison en cours vue par le client
@freezed
class CustomerDelivery with _$CustomerDelivery {
  const factory CustomerDelivery({
    required String id,
    required String deliveryNumber,
    required String customerId,
    required String customerName,
    required String delivererId,
    required String delivererName,
    String? delivererPhone,
    String? delivererPhoto,
    required List<String> orderIds,
    required int ordersCount,
    required double totalAmount,
    required DeliveryStatus status,
    required DateTime scheduledDate,
    DateTime? startedAt,
    DateTime? estimatedArrival,
    DateTime? completedAt,
    required String deliveryAddress,
    double? deliveryLatitude,
    double? deliveryLongitude,
    double? currentLatitude,
    double? currentLongitude,
    double? distanceRemaining,
    List<DeliveryTrackingPoint>? trackingPoints,
    String? notes,
    String? proofOfDeliveryId,
    @Default(false) bool hasProofOfDelivery,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _CustomerDelivery;

  const CustomerDelivery._();

  factory CustomerDelivery.fromJson(Map<String, dynamic> json) =>
      _$CustomerDeliveryFromJson(json);

  /// Message de statut formaté
  String get statusMessage {
    switch (status) {
      case DeliveryStatus.scheduled:
        return 'Livraison planifiée';
      case DeliveryStatus.assigned:
        return 'Livreur assigné';
      case DeliveryStatus.inProgress:
        return 'En cours de livraison';
      case DeliveryStatus.nearDestination:
        return 'Proche de la destination';
      case DeliveryStatus.arrived:
        return 'Livreur arrivé';
      case DeliveryStatus.completed:
        return 'Livraison terminée';
      case DeliveryStatus.failed:
        return 'Livraison échouée';
      case DeliveryStatus.cancelled:
        return 'Livraison annulée';
    }
  }

  /// Temps restant estimé formaté
  String get estimatedTimeRemaining {
    if (estimatedArrival == null) return 'Non disponible';
    final now = DateTime.now();
    if (estimatedArrival!.isBefore(now)) return 'Arrivé';
    final diff = estimatedArrival!.difference(now);
    if (diff.inMinutes < 60) {
      return '${diff.inMinutes} min';
    }
    return '${diff.inHours}h ${diff.inMinutes % 60}min';
  }

  /// Distance restante formatée
  String get distanceRemainingFormatted {
    if (distanceRemaining == null) return 'Non disponible';
    if (distanceRemaining! < 1) {
      return '${(distanceRemaining! * 1000).toStringAsFixed(0)} m';
    }
    return '${distanceRemaining!.toStringAsFixed(1)} km';
  }

  /// Montant total formaté
  String get totalAmountFormatted {
    return '${totalAmount.toStringAsFixed(2)} €';
  }
}

/// Point de Suivi de Livraison
@freezed
class DeliveryTrackingPoint with _$DeliveryTrackingPoint {
  const factory DeliveryTrackingPoint({
    required String id,
    required double latitude,
    required double longitude,
    required DateTime timestamp,
    double? speed,
    double? accuracy,
  }) = _DeliveryTrackingPoint;

  factory DeliveryTrackingPoint.fromJson(Map<String, dynamic> json) =>
      _$DeliveryTrackingPointFromJson(json);
}

/// Statut de Livraison
enum DeliveryStatus {
  @JsonValue('scheduled')
  scheduled,
  @JsonValue('assigned')
  assigned,
  @JsonValue('in_progress')
  inProgress,
  @JsonValue('near_destination')
  nearDestination,
  @JsonValue('arrived')
  arrived,
  @JsonValue('completed')
  completed,
  @JsonValue('failed')
  failed,
  @JsonValue('cancelled')
  cancelled,
}

extension DeliveryStatusX on DeliveryStatus {
  /// Retourne le label d'affichage
  String get displayName {
    switch (this) {
      case DeliveryStatus.scheduled:
        return 'Planifiée';
      case DeliveryStatus.assigned:
        return 'Assignée';
      case DeliveryStatus.inProgress:
        return 'En cours';
      case DeliveryStatus.nearDestination:
        return 'Proche';
      case DeliveryStatus.arrived:
        return 'Arrivée';
      case DeliveryStatus.completed:
        return 'Terminée';
      case DeliveryStatus.failed:
        return 'Échec';
      case DeliveryStatus.cancelled:
        return 'Annulée';
    }
  }

  /// Retourne la couleur du statut
  String get color {
    switch (this) {
      case DeliveryStatus.scheduled:
        return 'blue';
      case DeliveryStatus.assigned:
        return 'purple';
      case DeliveryStatus.inProgress:
        return 'orange';
      case DeliveryStatus.nearDestination:
        return 'amber';
      case DeliveryStatus.arrived:
        return 'green';
      case DeliveryStatus.completed:
        return 'green';
      case DeliveryStatus.failed:
        return 'red';
      case DeliveryStatus.cancelled:
        return 'grey';
    }
  }

  /// Retourne l'icône du statut
  String get icon {
    switch (this) {
      case DeliveryStatus.scheduled:
        return '📅';
      case DeliveryStatus.assigned:
        return '👤';
      case DeliveryStatus.inProgress:
        return '🚚';
      case DeliveryStatus.nearDestination:
        return '📍';
      case DeliveryStatus.arrived:
        return '🏁';
      case DeliveryStatus.completed:
        return '✅';
      case DeliveryStatus.failed:
        return '❌';
      case DeliveryStatus.cancelled:
        return '🚫';
    }
  }

  /// Vérifie si la livraison est active
  bool get isActive {
    return this == DeliveryStatus.assigned ||
        this == DeliveryStatus.inProgress ||
        this == DeliveryStatus.nearDestination ||
        this == DeliveryStatus.arrived;
  }

  /// Vérifie si la livraison est terminée
  bool get isCompleted {
    return this == DeliveryStatus.completed ||
        this == DeliveryStatus.failed ||
        this == DeliveryStatus.cancelled;
  }

  /// Vérifie si la livraison peut être suivie
  bool get isTrackable {
    return this == DeliveryStatus.inProgress ||
        this == DeliveryStatus.nearDestination ||
        this == DeliveryStatus.arrived;
  }

  /// Retourne le pourcentage de progression
  int get progressPercentage {
    switch (this) {
      case DeliveryStatus.scheduled:
        return 0;
      case DeliveryStatus.assigned:
        return 20;
      case DeliveryStatus.inProgress:
        return 50;
      case DeliveryStatus.nearDestination:
        return 80;
      case DeliveryStatus.arrived:
        return 90;
      case DeliveryStatus.completed:
        return 100;
      case DeliveryStatus.failed:
      case DeliveryStatus.cancelled:
        return 0;
    }
  }
}

extension CustomerDeliveryX on CustomerDelivery {
  /// Retourne le montant formaté
  String get totalAmountFormatted {
    return '${totalAmount.toStringAsFixed(0).replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]} ',
        )} DZD';
  }

  /// Retourne la date planifiée formatée
  String get scheduledDateFormatted {
    return '${scheduledDate.day.toString().padLeft(2, '0')}/'
        '${scheduledDate.month.toString().padLeft(2, '0')}/'
        '${scheduledDate.year} à '
        '${scheduledDate.hour.toString().padLeft(2, '0')}:'
        '${scheduledDate.minute.toString().padLeft(2, '0')}';
  }

  /// Retourne l'heure d'arrivée estimée formatée
  String? get estimatedArrivalFormatted {
    if (estimatedArrival == null) return null;
    return '${estimatedArrival!.hour.toString().padLeft(2, '0')}:'
        '${estimatedArrival!.minute.toString().padLeft(2, '0')}';
  }

  /// Retourne le temps restant estimé
  String? get estimatedTimeRemaining {
    if (estimatedArrival == null) return null;
    final now = DateTime.now();
    if (estimatedArrival!.isBefore(now)) return 'Arrivée imminente';

    final difference = estimatedArrival!.difference(now);
    if (difference.inMinutes < 60) {
      return '${difference.inMinutes} min';
    } else {
      final hours = difference.inHours;
      final minutes = difference.inMinutes % 60;
      return '${hours}h ${minutes}min';
    }
  }

  /// Retourne la distance restante formatée
  String? get distanceRemainingFormatted {
    if (distanceRemaining == null) return null;
    if (distanceRemaining! < 1) {
      return '${(distanceRemaining! * 1000).toStringAsFixed(0)} m';
    }
    return '${distanceRemaining!.toStringAsFixed(1)} km';
  }

  /// Vérifie si la position actuelle est disponible
  bool get hasCurrentLocation {
    return currentLatitude != null && currentLongitude != null;
  }

  /// Vérifie si la position de destination est disponible
  bool get hasDeliveryLocation {
    return deliveryLatitude != null && deliveryLongitude != null;
  }

  /// Vérifie si le suivi est disponible
  bool get hasTracking {
    return hasCurrentLocation && status.isTrackable;
  }

  /// Retourne le nombre de points de suivi
  int get trackingPointsCount {
    return trackingPoints?.length ?? 0;
  }

  /// Vérifie si le livreur est proche
  bool get isNearby {
    return status == DeliveryStatus.nearDestination ||
        status == DeliveryStatus.arrived ||
        (distanceRemaining != null && distanceRemaining! < 1);
  }

  /// Retourne un résumé de la livraison
  String get summary {
    return 'Livraison #$deliveryNumber - $ordersCount commande${ordersCount > 1 ? 's' : ''} - $totalAmountFormatted';
  }

  /// Retourne le message de statut pour le client
  String get statusMessage {
    switch (status) {
      case DeliveryStatus.scheduled:
        return 'Votre livraison est planifiée pour $scheduledDateFormatted';
      case DeliveryStatus.assigned:
        return '$delivererName a été assigné à votre livraison';
      case DeliveryStatus.inProgress:
        return '$delivererName est en route vers vous';
      case DeliveryStatus.nearDestination:
        return '$delivererName arrive dans quelques minutes';
      case DeliveryStatus.arrived:
        return '$delivererName est arrivé à votre adresse';
      case DeliveryStatus.completed:
        return 'Livraison terminée avec succès';
      case DeliveryStatus.failed:
        return 'La livraison a échoué';
      case DeliveryStatus.cancelled:
        return 'La livraison a été annulée';
    }
  }
}

extension DeliveryTrackingPointX on DeliveryTrackingPoint {
  /// Retourne l'heure formatée
  String get timeFormatted {
    return '${timestamp.hour.toString().padLeft(2, '0')}:'
        '${timestamp.minute.toString().padLeft(2, '0')}';
  }

  /// Retourne la vitesse formatée
  String? get speedFormatted {
    if (speed == null) return null;
    return '${speed!.toStringAsFixed(0)} km/h';
  }

  /// Retourne la précision formatée
  String? get accuracyFormatted {
    if (accuracy == null) return null;
    return '±${accuracy!.toStringAsFixed(0)} m';
  }
}
