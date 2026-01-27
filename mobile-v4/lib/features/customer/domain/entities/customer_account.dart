import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_account.freezed.dart';
part 'customer_account.g.dart';

/// Compte Client
/// Entité représentant le compte et les informations d'un client
@freezed
class CustomerAccount with _$CustomerAccount {
  const factory CustomerAccount({
    required String id,
    required String organizationId,
    required String organizationName,
    required String name,
    required String email,
    String? phone,
    String? address,
    double? latitude,
    double? longitude,
    required CustomerCreditInfo creditInfo,
    required CustomerPackagingInfo packagingInfo,
    required CustomerStats stats,
    List<CustomerContact>? contacts,
    CustomerSettings? settings,
    @Default(true) bool isActive,
    DateTime? lastOrderDate,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _CustomerAccount;

  factory CustomerAccount.fromJson(Map<String, dynamic> json) =>
      _$CustomerAccountFromJson(json);
}

/// Informations de Crédit Client
@freezed
class CustomerCreditInfo with _$CustomerCreditInfo {
  const factory CustomerCreditInfo({
    required double creditLimit,
    required double currentBalance,
    required double availableCredit,
    required int daysOverdue,
    DateTime? lastPaymentDate,
    required double lastPaymentAmount,
    @Default(false) bool isCreditBlocked,
    String? blockReason,
  }) = _CustomerCreditInfo;

  factory CustomerCreditInfo.fromJson(Map<String, dynamic> json) =>
      _$CustomerCreditInfoFromJson(json);
}

/// Informations Consignes Client
@freezed
class CustomerPackagingInfo with _$CustomerPackagingInfo {
  const factory CustomerPackagingInfo({
    required double totalValue,
    required int totalQuantity,
    required List<CustomerPackagingItem> items,
    DateTime? lastTransactionDate,
  }) = _CustomerPackagingInfo;

  factory CustomerPackagingInfo.fromJson(Map<String, dynamic> json) =>
      _$CustomerPackagingInfoFromJson(json);
}

/// Article Consigne Client
@freezed
class CustomerPackagingItem with _$CustomerPackagingItem {
  const factory CustomerPackagingItem({
    required String packagingId,
    required String packagingName,
    required int quantity,
    required double unitValue,
    required double totalValue,
  }) = _CustomerPackagingItem;

  factory CustomerPackagingItem.fromJson(Map<String, dynamic> json) =>
      _$CustomerPackagingItemFromJson(json);
}

/// Statistiques Client
@freezed
class CustomerStats with _$CustomerStats {
  const factory CustomerStats({
    required int totalOrders,
    required int completedOrders,
    required int cancelledOrders,
    required double totalSpent,
    required double averageOrderValue,
    required int daysAsCustomer,
    double? averageRating,
  }) = _CustomerStats;

  factory CustomerStats.fromJson(Map<String, dynamic> json) =>
      _$CustomerStatsFromJson(json);
}

/// Contact Client
@freezed
class CustomerContact with _$CustomerContact {
  const factory CustomerContact({
    required String id,
    required String name,
    required String role,
    String? phone,
    String? email,
    @Default(true) bool isPrimary,
  }) = _CustomerContact;

  factory CustomerContact.fromJson(Map<String, dynamic> json) =>
      _$CustomerContactFromJson(json);
}

/// Paramètres Client
@freezed
class CustomerSettings with _$CustomerSettings {
  const factory CustomerSettings({
    @Default(true) bool emailNotifications,
    @Default(true) bool smsNotifications,
    @Default(true) bool pushNotifications,
    @Default(true) bool orderConfirmations,
    @Default(true) bool deliveryUpdates,
    @Default(true) bool paymentReminders,
    @Default(true) bool promotionalOffers,
    String? preferredLanguage,
    String? preferredCurrency,
  }) = _CustomerSettings;

  factory CustomerSettings.fromJson(Map<String, dynamic> json) =>
      _$CustomerSettingsFromJson(json);
}

extension CustomerAccountX on CustomerAccount {
  /// Retourne le solde crédit formaté
  String get currentBalanceFormatted {
    return '${creditInfo.currentBalance.toStringAsFixed(0).replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]} ',
        )} DZD';
  }

  /// Retourne la limite de crédit formatée
  String get creditLimitFormatted {
    return '${creditInfo.creditLimit.toStringAsFixed(0).replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]} ',
        )} DZD';
  }

  /// Retourne le crédit disponible formaté
  String get availableCreditFormatted {
    return '${creditInfo.availableCredit.toStringAsFixed(0).replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]} ',
        )} DZD';
  }

  /// Retourne le pourcentage d'utilisation du crédit
  double get creditUsagePercentage {
    if (creditInfo.creditLimit == 0) return 0;
    return (creditInfo.currentBalance / creditInfo.creditLimit) * 100;
  }

  /// Vérifie si le crédit est proche de la limite
  bool get isCreditNearLimit {
    return creditUsagePercentage >= 80;
  }

  /// Vérifie si le crédit est dépassé
  bool get isCreditExceeded {
    return creditInfo.currentBalance > creditInfo.creditLimit;
  }

  /// Vérifie si le compte est en retard
  bool get isOverdue {
    return creditInfo.daysOverdue > 0;
  }

  /// Retourne le statut du crédit
  String get creditStatus {
    if (creditInfo.isCreditBlocked) return 'Bloqué';
    if (isCreditExceeded) return 'Dépassé';
    if (isCreditNearLimit) return 'Attention';
    return 'Normal';
  }

  /// Retourne la couleur du statut crédit
  String get creditStatusColor {
    if (creditInfo.isCreditBlocked) return 'red';
    if (isCreditExceeded) return 'red';
    if (isCreditNearLimit) return 'orange';
    return 'green';
  }

  /// Retourne le total consignes formaté
  String get packagingTotalFormatted {
    return '${packagingInfo.totalValue.toStringAsFixed(0).replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]} ',
        )} DZD';
  }

  /// Vérifie si le client a des consignes
  bool get hasPackaging {
    return packagingInfo.totalValue > 0;
  }

  /// Retourne le nombre de types de consignes
  int get packagingTypesCount {
    return packagingInfo.items.length;
  }

  /// Retourne le taux de complétion des commandes
  double get orderCompletionRate {
    if (stats.totalOrders == 0) return 0;
    return (stats.completedOrders / stats.totalOrders) * 100;
  }

  /// Retourne le montant total dépensé formaté
  String get totalSpentFormatted {
    return '${stats.totalSpent.toStringAsFixed(0).replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]} ',
        )} DZD';
  }

  /// Retourne la valeur moyenne de commande formatée
  String get averageOrderValueFormatted {
    return '${stats.averageOrderValue.toStringAsFixed(0).replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]} ',
        )} DZD';
  }

  /// Retourne le contact principal
  CustomerContact? get primaryContact {
    return contacts?.firstWhere(
      (contact) => contact.isPrimary,
      orElse: () => contacts!.first,
    );
  }

  /// Vérifie si les notifications sont activées
  bool get hasNotificationsEnabled {
    return settings?.emailNotifications == true ||
        settings?.smsNotifications == true ||
        settings?.pushNotifications == true;
  }

  /// Retourne un résumé du compte
  String get summary {
    return '$name - $currentBalanceFormatted de dette - ${stats.totalOrders} commandes';
  }
}

extension CustomerCreditInfoX on CustomerCreditInfo {
  /// Retourne le pourcentage d'utilisation
  double get usagePercentage {
    if (creditLimit == 0) return 0;
    return (currentBalance / creditLimit) * 100;
  }

  /// Vérifie si le crédit est sain
  bool get isHealthy {
    return !isCreditBlocked && currentBalance <= creditLimit && daysOverdue == 0;
  }

  /// Retourne le message de statut
  String get statusMessage {
    if (isCreditBlocked) {
      return 'Crédit bloqué${blockReason != null ? ': $blockReason' : ''}';
    }
    if (currentBalance > creditLimit) {
      return 'Limite de crédit dépassée de ${(currentBalance - creditLimit).toStringAsFixed(0)} DZD';
    }
    if (daysOverdue > 0) {
      return 'Paiement en retard de $daysOverdue jour${daysOverdue > 1 ? 's' : ''}';
    }
    return 'Crédit en règle';
  }
}

extension CustomerPackagingInfoX on CustomerPackagingInfo {
  /// Vérifie si le client a des consignes
  bool get hasPackaging {
    return totalValue > 0 && totalQuantity > 0;
  }

  /// Retourne le nombre de types différents
  int get typesCount {
    return items.length;
  }

  /// Retourne la valeur moyenne par article
  double get averageValuePerItem {
    if (totalQuantity == 0) return 0;
    return totalValue / totalQuantity;
  }
}

extension CustomerStatsX on CustomerStats {
  /// Retourne le taux de complétion
  double get completionRate {
    if (totalOrders == 0) return 0;
    return (completedOrders / totalOrders) * 100;
  }

  /// Retourne le taux d'annulation
  double get cancellationRate {
    if (totalOrders == 0) return 0;
    return (cancelledOrders / totalOrders) * 100;
  }

  /// Vérifie si le client est fidèle
  bool get isLoyal {
    return daysAsCustomer >= 90 && totalOrders >= 10;
  }

  /// Retourne le niveau du client
  String get customerLevel {
    if (totalOrders >= 100) return 'Platine';
    if (totalOrders >= 50) return 'Or';
    if (totalOrders >= 20) return 'Argent';
    if (totalOrders >= 5) return 'Bronze';
    return 'Nouveau';
  }
}
