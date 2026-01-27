import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_summary.freezed.dart';

/// Order Summary Entity
/// Résumé d'une commande pour la liste
@freezed
class OrderSummary with _$OrderSummary {
  const factory OrderSummary({
    required String id,
    required String customerName,
    required String customerOrganization,
    required String status,
    required double totalAmount,
    required int itemsCount,
    required DateTime createdAt,
    String? delivererName,
    DateTime? deliveryTime,
  }) = _OrderSummary;

  const OrderSummary._();

  /// Check if order is pending
  bool get isPending => status == 'pending' || status == 'confirmed';

  /// Check if order is in progress
  bool get isInProgress => status == 'preparing' || status == 'ready' || status == 'in_delivery';

  /// Check if order is completed
  bool get isCompleted => status == 'delivered';

  /// Get status color
  String get statusColor {
    switch (status) {
      case 'pending':
        return 'warning';
      case 'confirmed':
      case 'preparing':
        return 'info';
      case 'ready':
      case 'in_delivery':
        return 'primary';
      case 'delivered':
        return 'success';
      case 'cancelled':
        return 'error';
      default:
        return 'default';
    }
  }
}
