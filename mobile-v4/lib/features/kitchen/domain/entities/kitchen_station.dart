import 'package:freezed_annotation/freezed_annotation.dart';

part 'kitchen_station.freezed.dart';

/// Type de station de cuisine
enum StationType {
  preparation, // Préparation
  cooking, // Cuisson
  assembly, // Assemblage
  packaging, // Emballage
  quality, // Contrôle qualité
}

/// Statut de station
enum StationStatus {
  available, // Disponible
  busy, // Occupée
  maintenance, // En maintenance
  offline, // Hors ligne
}

/// Entité représentant une station de travail en cuisine
@freezed
class KitchenStation with _$KitchenStation {
  const factory KitchenStation({
    required String id,
    required String name,
    required StationType type,
    required StationStatus status,
    String? assignedStaffId,
    String? assignedStaffName,
    List<String>? currentOrderIds,
    int? capacity,
    int? activeOrders,
    DateTime? lastActivityTime,
    String? notes,
  }) = _KitchenStation;

  const KitchenStation._();

  /// Est disponible pour nouvelle commande
  bool get isAvailable {
    if (status != StationStatus.available) return false;
    if (capacity == null) return true;
    return (activeOrders ?? 0) < capacity!;
  }

  /// Taux d'occupation en pourcentage
  double get occupancyRate {
    if (capacity == null || capacity == 0) return 0;
    return ((activeOrders ?? 0) / capacity!) * 100;
  }

  /// Est surchargée
  bool get isOverloaded {
    return occupancyRate > 80;
  }

  /// Nombre de commandes en attente
  int get pendingOrdersCount {
    return currentOrderIds?.length ?? 0;
  }
}

/// Affectation de station
@freezed
class StationAssignment with _$StationAssignment {
  const factory StationAssignment({
    required String orderId,
    required String stationId,
    required String stationName,
    required DateTime assignedAt,
    DateTime? startedAt,
    DateTime? completedAt,
    String? assignedBy,
    String? notes,
  }) = _StationAssignment;

  const StationAssignment._();

  /// Durée d'affectation en minutes
  int? get durationMinutes {
    if (startedAt == null) return null;
    final endTime = completedAt ?? DateTime.now();
    return endTime.difference(startedAt!).inMinutes;
  }

  /// Est en cours
  bool get isActive {
    return startedAt != null && completedAt == null;
  }

  /// Est terminée
  bool get isCompleted {
    return completedAt != null;
  }
}
