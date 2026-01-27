import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_order.freezed.dart';
part 'customer_order.g.dart';

/// Commande Client
/// Entité représentant une commande vue par le client
@freezed
class CustomerOrder with _$CustomerOrder {
  const factory CustomerOrder({
    required String id,
    required String orderNumber,
    required String customerId,
    required String customerName,
    required DateTime orderDate,
    required DateTime? deliveryDate,
    required OrderStatus status,
    required List<CustomerOrderItem> items,
    required double subtotal,
    required double deliveryFee,
    required double packagingDeposit,
    required double totalAmount,
    required double paidAmount,
    required double remainingAmount,
    String? delivererId,
    String? delivererName,
    String? deliveryAddress,
    String? notes,
    String? cancellationReason,
    DateTime? cancelledAt,
    DateTime? completedAt,
    @Default(false) bool hasProofOfDelivery,
    String? proofOfDeliveryId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _CustomerOrder;

  factory CustomerOrder.fromJson(Map<String, dynamic> json) =>
      _$CustomerOrderFromJson(json);
}

/// Article de Commande Client
@freezed
class CustomerOrderItem with _$CustomerOrderItem {
  const factory CustomerOrderItem({
    required String id,
    required String productId,
    required String productName,
    required String productCode,
    required int quantity,
    required double unitPrice,
    required double totalPrice,
    String? productImage,
    String? unit,
    String? notes,
  }) = _CustomerOrderItem;

  factory CustomerOrderItem.fromJson(Map<String, dynamic> json) =>
      _$CustomerOrderItemFromJson(json);
}

/// Statut de Commande
enum OrderStatus {
  @JsonValue('pending')
  pending,
  @JsonValue('confirmed')
  confirmed,
  @JsonValue('preparing')
  preparing,
  @JsonValue('ready')
  ready,
  @JsonValue('in_delivery')
  inDelivery,
  @JsonValue('delivered')
  delivered,
  @JsonValue('cancelled')
  cancelled,
  @JsonValue('failed')
  failed,
}

extension OrderStatusX on OrderStatus {
  /// Retourne le label d'affichage
  String get displayName {
    switch (this) {
      case OrderStatus.pending:
        return 'En attente';
      case OrderStatus.confirmed:
        return 'Confirmée';
      case OrderStatus.preparing:
        return 'En préparation';
      case OrderStatus.ready:
        return 'Prête';
      case OrderStatus.inDelivery:
        return 'En livraison';
      case OrderStatus.delivered:
        return 'Livrée';
      case OrderStatus.cancelled:
        return 'Annulée';
      case OrderStatus.failed:
        return 'Échec';
    }
  }

  /// Retourne la couleur du statut
  String get color {
    switch (this) {
      case OrderStatus.pending:
        return 'orange';
      case OrderStatus.confirmed:
        return 'blue';
      case OrderStatus.preparing:
        return 'purple';
      case OrderStatus.ready:
        return 'green';
      case OrderStatus.inDelivery:
        return 'teal';
      case OrderStatus.delivered:
        return 'green';
      case OrderStatus.cancelled:
        return 'red';
      case OrderStatus.failed:
        return 'red';
    }
  }

  /// Retourne l'icône du statut
  String get icon {
    switch (this) {
      case OrderStatus.pending:
        return '⏳';
      case OrderStatus.confirmed:
        return '✅';
      case OrderStatus.preparing:
        return '👨‍🍳';
      case OrderStatus.ready:
        return '📦';
      case OrderStatus.inDelivery:
        return '🚚';
      case OrderStatus.delivered:
        return '✅';
      case OrderStatus.cancelled:
        return '❌';
      case OrderStatus.failed:
        return '⚠️';
    }
  }

  /// Vérifie si la commande est en cours
  bool get isActive {
    return this == OrderStatus.pending ||
        this == OrderStatus.confirmed ||
        this == OrderStatus.preparing ||
        this == OrderStatus.ready ||
        this == OrderStatus.inDelivery;
  }

  /// Vérifie si la commande est terminée
  bool get isCompleted {
    return this == OrderStatus.delivered ||
        this == OrderStatus.cancelled ||
        this == OrderStatus.failed;
  }

  /// Vérifie si la commande peut être suivie
  bool get isTrackable {
    return this == OrderStatus.inDelivery;
  }
}

extension CustomerOrderX on CustomerOrder {
  /// Retourne le montant formaté
  String get totalAmountFormatted {
    return '${totalAmount.toStringAsFixed(0).replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]} ',
        )} DZD';
  }

  /// Retourne le montant restant formaté
  String get remainingAmountFormatted {
    return '${remainingAmount.toStringAsFixed(0).replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]} ',
        )} DZD';
  }

  /// Retourne la date de commande formatée
  String get orderDateFormatted {
    return '${orderDate.day.toString().padLeft(2, '0')}/'
        '${orderDate.month.toString().padLeft(2, '0')}/'
        '${orderDate.year} à '
        '${orderDate.hour.toString().padLeft(2, '0')}:'
        '${orderDate.minute.toString().padLeft(2, '0')}';
  }

  /// Retourne la date de livraison formatée
  String? get deliveryDateFormatted {
    if (deliveryDate == null) return null;
    return '${deliveryDate!.day.toString().padLeft(2, '0')}/'
        '${deliveryDate!.month.toString().padLeft(2, '0')}/'
        '${deliveryDate!.year} à '
        '${deliveryDate!.hour.toString().padLeft(2, '0')}:'
        '${deliveryDate!.minute.toString().padLeft(2, '0')}';
  }

  /// Retourne le nombre d'articles
  int get itemsCount => items.length;

  /// Retourne la quantité totale
  int get totalQuantity {
    return items.fold(0, (sum, item) => sum + item.quantity);
  }

  /// Vérifie si la commande est payée
  bool get isPaid => remainingAmount <= 0;

  /// Vérifie si la commande est partiellement payée
  bool get isPartiallyPaid => paidAmount > 0 && remainingAmount > 0;

  /// Vérifie si la commande est impayée
  bool get isUnpaid => paidAmount == 0;

  /// Retourne le statut de paiement
  String get paymentStatus {
    if (isPaid) return 'Payée';
    if (isPartiallyPaid) return 'Partiellement payée';
    return 'Impayée';
  }

  /// Retourne le pourcentage de paiement
  double get paymentPercentage {
    if (totalAmount == 0) return 0;
    return (paidAmount / totalAmount) * 100;
  }

  /// Vérifie si la commande peut être annulée
  bool get canBeCancelled {
    return status == OrderStatus.pending || status == OrderStatus.confirmed;
  }

  /// Vérifie si la commande peut être suivie
  bool get canBeTracked {
    return status.isTrackable && delivererId != null;
  }

  /// Retourne un résumé de la commande
  String get summary {
    return 'Commande #$orderNumber - $itemsCount article${itemsCount > 1 ? 's' : ''} - $totalAmountFormatted';
  }
}

extension CustomerOrderItemX on CustomerOrderItem {
  /// Retourne le prix unitaire formaté
  String get unitPriceFormatted {
    return '${unitPrice.toStringAsFixed(0)} DZD';
  }

  /// Retourne le prix total formaté
  String get totalPriceFormatted {
    return '${totalPrice.toStringAsFixed(0)} DZD';
  }

  /// Retourne la description complète
  String get description {
    return '$productName${unit != null ? ' ($unit)' : ''} x $quantity';
  }
}
