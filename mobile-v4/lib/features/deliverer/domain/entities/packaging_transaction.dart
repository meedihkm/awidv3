import 'package:freezed_annotation/freezed_annotation.dart';

part 'packaging_transaction.freezed.dart';
part 'packaging_transaction.g.dart';

/// Transaction de Consigne
/// Entité représentant une transaction de consigne (dépôt/retour)
@freezed
class PackagingTransaction with _$PackagingTransaction {
  const factory PackagingTransaction({
    required String id,
    required String delivererId,
    required String customerId,
    required String customerName,
    required PackagingTransactionType type,
    required List<PackagingItem> items,
    required DateTime transactionDate,
    String? notes,
    String? qrCodeData,
    @Default(false) bool isUploaded,
    DateTime? uploadedAt,
    DateTime? createdAt,
  }) = _PackagingTransaction;

  factory PackagingTransaction.fromJson(Map<String, dynamic> json) =>
      _$PackagingTransactionFromJson(json);
}

/// Type de Transaction de Consigne
enum PackagingTransactionType {
  @JsonValue('deposit')
  deposit, // Dépôt de consignes
  @JsonValue('return')
  return_, // Retour de consignes
}

/// Article de Consigne
/// Représente un type de consigne avec sa quantité
@freezed
class PackagingItem with _$PackagingItem {
  const factory PackagingItem({
    required String packagingId,
    required String packagingName,
    required int quantity,
    required double unitValue, // Valeur unitaire de la consigne
    String? description,
  }) = _PackagingItem;

  factory PackagingItem.fromJson(Map<String, dynamic> json) =>
      _$PackagingItemFromJson(json);
}

extension PackagingTransactionTypeX on PackagingTransactionType {
  /// Retourne le nom d'affichage du type
  String get displayName {
    switch (this) {
      case PackagingTransactionType.deposit:
        return 'Dépôt';
      case PackagingTransactionType.return_:
        return 'Retour';
    }
  }

  /// Retourne l'icône du type
  String get icon {
    switch (this) {
      case PackagingTransactionType.deposit:
        return '📦';
      case PackagingTransactionType.return_:
        return '↩️';
    }
  }

  /// Retourne la couleur du type
  String get color {
    switch (this) {
      case PackagingTransactionType.deposit:
        return 'blue';
      case PackagingTransactionType.return_:
        return 'green';
    }
  }

  /// Retourne la description de l'action
  String get actionDescription {
    switch (this) {
      case PackagingTransactionType.deposit:
        return 'Consignes déposées chez le client';
      case PackagingTransactionType.return_:
        return 'Consignes récupérées du client';
    }
  }
}

extension PackagingTransactionX on PackagingTransaction {
  /// Retourne la date formatée
  String get transactionDateFormatted {
    return '${transactionDate.day.toString().padLeft(2, '0')}/'
        '${transactionDate.month.toString().padLeft(2, '0')}/'
        '${transactionDate.year} à '
        '${transactionDate.hour.toString().padLeft(2, '0')}:'
        '${transactionDate.minute.toString().padLeft(2, '0')}';
  }

  /// Retourne le nombre total d'articles
  int get totalItems {
    return items.fold(0, (sum, item) => sum + item.quantity);
  }

  /// Retourne la valeur totale des consignes
  double get totalValue {
    return items.fold(0.0, (sum, item) => sum + (item.quantity * item.unitValue));
  }

  /// Retourne la valeur totale formatée
  String get totalValueFormatted {
    return '${totalValue.toStringAsFixed(0).replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]} ',
        )} DZD';
  }

  /// Retourne le nombre de types de consignes différents
  int get packagingTypesCount => items.length;

  /// Retourne le statut d'upload
  String get uploadStatus {
    return isUploaded ? 'Synchronisé' : 'En attente';
  }

  /// Retourne l'icône de statut
  String get statusIcon {
    return isUploaded ? '✅' : '⏳';
  }

  /// Retourne la couleur de statut
  String get statusColor {
    return isUploaded ? 'green' : 'orange';
  }

  /// Vérifie si la transaction peut être uploadée
  bool get canBeUploaded {
    return !isUploaded && items.isNotEmpty;
  }

  /// Retourne un résumé de la transaction
  String get summary {
    return '${type.displayName} - $totalItems consigne${totalItems > 1 ? 's' : ''}'
        ' ($totalValueFormatted)';
  }

  /// Retourne la description complète
  String get description {
    return '${type.actionDescription} le $transactionDateFormatted'
        ' - $totalItems article${totalItems > 1 ? 's' : ''}'
        ' pour une valeur de $totalValueFormatted';
  }

  /// Retourne la liste des articles formatée
  String get itemsFormatted {
    return items.map((item) => '${item.quantity}x ${item.packagingName}').join(', ');
  }

  /// Vérifie si la transaction a un QR code
  bool get hasQrCode => qrCodeData?.isNotEmpty == true;

  /// Retourne l'impact sur le solde client (positif = crédit, négatif = débit)
  double get balanceImpact {
    switch (type) {
      case PackagingTransactionType.deposit:
        return totalValue; // Le client doit des consignes
      case PackagingTransactionType.return_:
        return -totalValue; // Le client récupère des consignes
    }
  }

  /// Retourne la description de l'impact sur le solde
  String get balanceImpactDescription {
    final impact = balanceImpact;
    if (impact > 0) {
      return '+$totalValueFormatted (dette consignes)';
    } else {
      return '-$totalValueFormatted (crédit consignes)';
    }
  }
}

extension PackagingItemX on PackagingItem {
  /// Retourne la valeur totale de cet article
  double get totalValue => quantity * unitValue;

  /// Retourne la valeur totale formatée
  String get totalValueFormatted {
    return '${totalValue.toStringAsFixed(0).replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]} ',
        )} DZD';
  }

  /// Retourne la valeur unitaire formatée
  String get unitValueFormatted {
    return '${unitValue.toStringAsFixed(0)} DZD';
  }

  /// Retourne la description complète de l'article
  String get fullDescription {
    return '$quantity x $packagingName à $unitValueFormatted = $totalValueFormatted'
        '${description?.isNotEmpty == true ? ' ($description)' : ''}';
  }

  /// Retourne la description courte
  String get shortDescription {
    return '$quantity x $packagingName';
  }
}