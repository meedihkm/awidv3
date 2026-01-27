import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_detail.freezed.dart';

/// Order Item Entity
@freezed
class OrderItem with _$OrderItem {
  const factory OrderItem({
    required String productId,
    required String productName,
    required int quantity,
    required double unitPrice,
    required double totalPrice,
    String? notes,
  }) = _OrderItem;
}

/// Order Detail Entity
/// Représente les détails complets d'une commande
@freezed
class OrderDetail with _$OrderDetail {
  const factory OrderDetail({
    required String id,
    required String orderNumber,
    required String status,
    required String customerId,
    required String customerName,
    required String organizationId,
    required String organizationName,
    required List<OrderItem> items,
    required double subtotal,
    required double deliveryFee,
    required double totalAmount,
    required DateTime createdAt,
    String? delivererId,
    String? delivererName,
    String? deliveryAddress,
    String? deliveryInstructions,
    String? paymentMethod,
    String? paymentStatus,
    DateTime? scheduledFor,
    DateTime? deliveredAt,
    DateTime? updatedAt,
  }) = _OrderDetail;

  const OrderDetail._();

  /// Get total items count
  int get totalItems => items.fold(0, (sum, item) => sum + item.quantity);

  /// Check if order is completed
  bool get isCompleted => status == 'delivered' || status == 'completed';

  /// Check if order is cancelled
  bool get isCancelled => status == 'cancelled';

  /// Check if order is pending
  bool get isPending => status == 'pending';

  /// Check if order is in progress
  bool get isInProgress =>
      status == 'confirmed' || status == 'preparing' || status == 'ready' || status == 'in_delivery';

  /// Check if order can be cancelled
  bool get canBeCancelled => isPending || status == 'confirmed';

  /// Check if order can be assigned
  bool get canBeAssigned => delivererId == null && (status == 'ready' || status == 'confirmed');

  /// Get status display name
  String get statusDisplayName {
    switch (status) {
      case 'pending':
        return 'En attente';
      case 'confirmed':
        return 'Confirmée';
      case 'preparing':
        return 'En préparation';
      case 'ready':
        return 'Prête';
      case 'in_delivery':
        return 'En livraison';
      case 'delivered':
        return 'Livrée';
      case 'completed':
        return 'Complétée';
      case 'cancelled':
        return 'Annulée';
      default:
        return status;
    }
  }

  /// Get status color
  String get statusColor {
    switch (status) {
      case 'pending':
        return 'orange';
      case 'confirmed':
        return 'blue';
      case 'preparing':
        return 'purple';
      case 'ready':
        return 'cyan';
      case 'in_delivery':
        return 'indigo';
      case 'delivered':
      case 'completed':
        return 'green';
      case 'cancelled':
        return 'red';
      default:
        return 'grey';
    }
  }

  /// Get payment status display
  String get paymentStatusDisplay {
    switch (paymentStatus) {
      case 'pending':
        return 'En attente';
      case 'paid':
        return 'Payée';
      case 'partial':
        return 'Partielle';
      case 'failed':
        return 'Échouée';
      default:
        return paymentStatus ?? 'Non défini';
    }
  }

  /// Get payment status color
  String get paymentStatusColor {
    switch (paymentStatus) {
      case 'paid':
        return 'green';
      case 'partial':
        return 'orange';
      case 'failed':
        return 'red';
      default:
        return 'grey';
    }
  }
}
