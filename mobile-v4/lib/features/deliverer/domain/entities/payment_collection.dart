import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_collection.freezed.dart';
part 'payment_collection.g.dart';

/// Encaissement de Paiement
/// Entité représentant un encaissement de paiement par le livreur
@freezed
class PaymentCollection with _$PaymentCollection {
  const factory PaymentCollection({
    required String id,
    required String delivererId,
    required String customerId,
    required String customerName,
    required double amount,
    required PaymentMode mode,
    required DateTime collectedAt,
    required List<PaymentAllocation> allocations,
    String? reference, // Numéro chèque, référence virement, etc.
    String? notes,
    String? receiptImagePath,
    @Default(false) bool isUploaded,
    DateTime? uploadedAt,
    DateTime? createdAt,
  }) = _PaymentCollection;

  factory PaymentCollection.fromJson(Map<String, dynamic> json) =>
      _$PaymentCollectionFromJson(json);
}

/// Mode de Paiement
enum PaymentMode {
  @JsonValue('cash')
  cash,
  @JsonValue('check')
  check,
  @JsonValue('transfer')
  transfer,
  @JsonValue('card')
  card,
}

/// Allocation de Paiement
/// Représente l'affectation d'un paiement à des commandes spécifiques
@freezed
class PaymentAllocation with _$PaymentAllocation {
  const factory PaymentAllocation({
    required String orderId,
    required String orderNumber,
    required double allocatedAmount,
    required DateTime orderDate,
    @Default(false) bool isFullyPaid,
  }) = _PaymentAllocation;

  factory PaymentAllocation.fromJson(Map<String, dynamic> json) =>
      _$PaymentAllocationFromJson(json);
}

extension PaymentModeX on PaymentMode {
  /// Retourne le nom d'affichage du mode de paiement
  String get displayName {
    switch (this) {
      case PaymentMode.cash:
        return 'Espèces';
      case PaymentMode.check:
        return 'Chèque';
      case PaymentMode.transfer:
        return 'Virement';
      case PaymentMode.card:
        return 'Carte';
    }
  }

  /// Retourne l'icône du mode de paiement
  String get icon {
    switch (this) {
      case PaymentMode.cash:
        return '💵';
      case PaymentMode.check:
        return '📝';
      case PaymentMode.transfer:
        return '🏦';
      case PaymentMode.card:
        return '💳';
    }
  }

  /// Retourne la couleur du mode de paiement
  String get color {
    switch (this) {
      case PaymentMode.cash:
        return 'green';
      case PaymentMode.check:
        return 'blue';
      case PaymentMode.transfer:
        return 'purple';
      case PaymentMode.card:
        return 'orange';
    }
  }

  /// Vérifie si le mode nécessite une référence
  bool get requiresReference {
    return this == PaymentMode.check || this == PaymentMode.transfer;
  }
}

extension PaymentCollectionX on PaymentCollection {
  /// Retourne le montant formaté
  String get amountFormatted {
    return '${amount.toStringAsFixed(0).replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]} ',
        )} DZD';
  }

  /// Retourne la date formatée
  String get collectedAtFormatted {
    return '${collectedAt.day.toString().padLeft(2, '0')}/'
        '${collectedAt.month.toString().padLeft(2, '0')}/'
        '${collectedAt.year} à '
        '${collectedAt.hour.toString().padLeft(2, '0')}:'
        '${collectedAt.minute.toString().padLeft(2, '0')}';
  }

  /// Retourne le nombre de commandes payées
  int get ordersCount => allocations.length;

  /// Retourne le montant total alloué
  double get totalAllocated {
    return allocations.fold(0.0, (sum, allocation) => sum + allocation.allocatedAmount);
  }

  /// Vérifie si le paiement est entièrement alloué
  bool get isFullyAllocated {
    return (amount - totalAllocated).abs() < 0.01; // Tolérance de 1 centime
  }

  /// Retourne le montant non alloué
  double get unallocatedAmount {
    return amount - totalAllocated;
  }

  /// Retourne le statut d'allocation
  String get allocationStatus {
    if (isFullyAllocated) return 'Entièrement alloué';
    if (totalAllocated > 0) return 'Partiellement alloué';
    return 'Non alloué';
  }

  /// Retourne l'icône de statut
  String get statusIcon {
    if (isUploaded) return '✅';
    if (isFullyAllocated) return '💰';
    return '⏳';
  }

  /// Retourne la couleur de statut
  String get statusColor {
    if (isUploaded) return 'green';
    if (isFullyAllocated) return 'blue';
    return 'orange';
  }

  /// Vérifie si le paiement peut être uploadé
  bool get canBeUploaded {
    return !isUploaded && isFullyAllocated;
  }

  /// Retourne un résumé du paiement
  String get summary {
    return '${mode.displayName} - $amountFormatted'
        '${reference?.isNotEmpty == true ? ' ($reference)' : ''}'
        ' - $ordersCount commande${ordersCount > 1 ? 's' : ''}';
  }

  /// Retourne la description complète
  String get description {
    return 'Paiement de $amountFormatted en ${mode.displayName.toLowerCase()}'
        ' reçu le $collectedAtFormatted'
        ' pour $ordersCount commande${ordersCount > 1 ? 's' : ''}';
  }
}

extension PaymentAllocationX on PaymentAllocation {
  /// Retourne le montant formaté
  String get allocatedAmountFormatted {
    return '${allocatedAmount.toStringAsFixed(0).replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]} ',
        )} DZD';
  }

  /// Retourne la date de commande formatée
  String get orderDateFormatted {
    return '${orderDate.day.toString().padLeft(2, '0')}/'
        '${orderDate.month.toString().padLeft(2, '0')}/'
        '${orderDate.year}';
  }

  /// Retourne le statut de paiement
  String get paymentStatus {
    return isFullyPaid ? 'Payée' : 'Partiellement payée';
  }

  /// Retourne l'icône de statut
  String get statusIcon {
    return isFullyPaid ? '✅' : '⏳';
  }
}