import 'package:freezed_annotation/freezed_annotation.dart';

part 'delivery.freezed.dart';

/// Delivery Entity
/// Représente une livraison assignée à un livreur
@freezed
class Delivery with _$Delivery {
  const factory Delivery({
    required String id,
    required String orderId,
    required String orderNumber,
    required String status,
    required String customerName,
    required String customerPhone,
    required String deliveryAddress,
    required double latitude,
    required double longitude,
    required double totalAmount,
    required DateTime scheduledFor,
    String? deliveryInstructions,
    String? customerOrganization,
    int? itemsCount,
    DateTime? pickedUpAt,
    DateTime? deliveredAt,
    DateTime? createdAt,
  }) = _Delivery;

  const Delivery._();

  /// Check if delivery is pending
  bool get isPending => status == 'pending' || status == 'assigned';

  /// Check if delivery is in progress
  bool get isInProgress => status == 'picked_up' || status == 'in_transit';

  /// Check if delivery is completed
  bool get isCompleted => status == 'delivered' || status == 'completed';

  /// Check if delivery is cancelled
  bool get isCancelled => status == 'cancelled' || status == 'failed';

  /// Check if delivery can be started
  bool get canBeStarted => isPending;

  /// Check if delivery can be completed
  bool get canBeCompleted => isInProgress;

  /// Get status display name
  String get statusDisplayName {
    switch (status) {
      case 'pending':
        return 'En attente';
      case 'assigned':
        return 'Assignée';
      case 'picked_up':
        return 'Récupérée';
      case 'in_transit':
        return 'En transit';
      case 'delivered':
        return 'Livrée';
      case 'completed':
        return 'Complétée';
      case 'cancelled':
        return 'Annulée';
      case 'failed':
        return 'Échouée';
      default:
        return status;
    }
  }

  /// Get status color
  String get statusColor {
    switch (status) {
      case 'pending':
      case 'assigned':
        return 'orange';
      case 'picked_up':
        return 'blue';
      case 'in_transit':
        return 'indigo';
      case 'delivered':
      case 'completed':
        return 'green';
      case 'cancelled':
      case 'failed':
        return 'red';
      default:
        return 'grey';
    }
  }

  /// Get priority level (based on scheduled time)
  int get priorityLevel {
    if (scheduledFor.isBefore(DateTime.now())) {
      return 3; // Urgent (late)
    } else if (scheduledFor.difference(DateTime.now()).inHours < 1) {
      return 2; // High (within 1 hour)
    } else if (scheduledFor.difference(DateTime.now()).inHours < 3) {
      return 1; // Medium (within 3 hours)
    }
    return 0; // Normal
  }

  /// Get priority label
  String get priorityLabel {
    switch (priorityLevel) {
      case 3:
        return 'Urgent';
      case 2:
        return 'Prioritaire';
      case 1:
        return 'Moyen';
      default:
        return 'Normal';
    }
  }

  /// Get priority color
  String get priorityColor {
    switch (priorityLevel) {
      case 3:
        return 'red';
      case 2:
        return 'orange';
      case 1:
        return 'yellow';
      default:
        return 'green';
    }
  }

  /// Check if delivery is late
  bool get isLate => !isCompleted && scheduledFor.isBefore(DateTime.now());

  /// Get estimated duration (in minutes)
  int? get estimatedDuration {
    if (pickedUpAt != null && deliveredAt != null) {
      return deliveredAt!.difference(pickedUpAt!).inMinutes;
    }
    return null;
  }
}
