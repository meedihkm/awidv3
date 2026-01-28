import 'package:freezed_annotation/freezed_annotation.dart';

part 'unpaid_order.freezed.dart';
part 'unpaid_order.g.dart';

/// Unpaid Order
/// Représente une commande impayée pour l'encaissement
@freezed
class UnpaidOrder with _$UnpaidOrder {
  const factory UnpaidOrder({
    required String orderId,
    required String orderNumber,
    required DateTime orderDate,
    required double totalAmount,
    required double paidAmount,
    required double remainingAmount,
    String? notes,
  }) = _UnpaidOrder;

  factory UnpaidOrder.fromJson(Map<String, dynamic> json) =>
      _$UnpaidOrderFromJson(json);

  const UnpaidOrder._();

  /// Check if order is fully paid
  bool get isFullyPaid => remainingAmount <= 0;

  /// Check if order is partially paid
  bool get isPartiallyPaid => paidAmount > 0 && remainingAmount > 0;

  /// Get payment percentage
  double get paymentPercentage {
    if (totalAmount == 0) return 0;
    return (paidAmount / totalAmount) * 100;
  }

  /// Get formatted remaining amount
  String get remainingAmountFormatted {
    return '${remainingAmount.toStringAsFixed(0).replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]} ',
        )} DZD';
  }

  /// Get formatted total amount
  String get totalAmountFormatted {
    return '${totalAmount.toStringAsFixed(0).replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]} ',
        )} DZD';
  }

  /// Get formatted order date
  String get orderDateFormatted {
    return '${orderDate.day.toString().padLeft(2, '0')}/'
        '${orderDate.month.toString().padLeft(2, '0')}/'
        '${orderDate.year}';
  }
}

/// Manual Allocation
/// Représente une allocation manuelle de paiement à une commande
@freezed
class ManualAllocation with _$ManualAllocation {
  const factory ManualAllocation({
    required String orderId,
    required double amount,
  }) = _ManualAllocation;

  factory ManualAllocation.fromJson(Map<String, dynamic> json) =>
      _$ManualAllocationFromJson(json);
}
