import '../entities/proof_of_delivery.dart';
import '../entities/payment_collection.dart';
import '../entities/packaging_transaction.dart';

/// Repository pour les Actions de Livraison
/// Interface pour gérer les preuves de livraison, paiements et consignes
abstract class DeliveryActionsRepository {
  // ==================== PREUVE DE LIVRAISON ====================

  /// Enregistre une preuve de livraison
  Future<void> saveProofOfDelivery(ProofOfDelivery proof);

  /// Upload une preuve de livraison vers le serveur
  Future<void> uploadProofOfDelivery(String proofId);

  /// Récupère les preuves de livraison d'un livreur
  Future<List<ProofOfDelivery>> getProofsOfDelivery({
    required String delivererId,
    DateTime? startDate,
    DateTime? endDate,
    bool? isUploaded,
  });

  /// Récupère une preuve de livraison par ID
  Future<ProofOfDelivery?> getProofOfDelivery(String proofId);

  /// Supprime une preuve de livraison locale
  Future<void> deleteProofOfDelivery(String proofId);

  /// Upload toutes les preuves en attente
  Future<void> uploadPendingProofs(String delivererId);

  // ==================== PAIEMENTS ====================

  /// Enregistre un encaissement de paiement
  Future<void> savePaymentCollection(PaymentCollection payment);

  /// Upload un paiement vers le serveur
  Future<void> uploadPaymentCollection(String paymentId);

  /// Récupère les paiements d'un livreur
  Future<List<PaymentCollection>> getPaymentCollections({
    required String delivererId,
    DateTime? startDate,
    DateTime? endDate,
    PaymentMode? mode,
    bool? isUploaded,
  });

  /// Récupère un paiement par ID
  Future<PaymentCollection?> getPaymentCollection(String paymentId);

  /// Supprime un paiement local
  Future<void> deletePaymentCollection(String paymentId);

  /// Upload tous les paiements en attente
  Future<void> uploadPendingPayments(String delivererId);

  /// Récupère les commandes impayées d'un client
  Future<List<UnpaidOrder>> getUnpaidOrders(String customerId);

  /// Calcule l'allocation automatique d'un paiement
  Future<List<PaymentAllocation>> calculateAutoAllocation({
    required String customerId,
    required double amount,
  });

  // ==================== CONSIGNES ====================

  /// Enregistre une transaction de consigne
  Future<void> savePackagingTransaction(PackagingTransaction transaction);

  /// Upload une transaction de consigne vers le serveur
  Future<void> uploadPackagingTransaction(String transactionId);

  /// Récupère les transactions de consignes d'un livreur
  Future<List<PackagingTransaction>> getPackagingTransactions({
    required String delivererId,
    DateTime? startDate,
    DateTime? endDate,
    PackagingTransactionType? type,
    bool? isUploaded,
  });

  /// Récupère une transaction de consigne par ID
  Future<PackagingTransaction?> getPackagingTransaction(String transactionId);

  /// Supprime une transaction de consigne locale
  Future<void> deletePackagingTransaction(String transactionId);

  /// Upload toutes les transactions en attente
  Future<void> uploadPendingTransactions(String delivererId);

  /// Récupère le solde consignes d'un client
  Future<PackagingBalance> getPackagingBalance(String customerId);

  /// Récupère les types de consignes disponibles
  Future<List<PackagingType>> getPackagingTypes();

  /// Scan un QR code de consigne
  Future<PackagingQrData?> scanPackagingQrCode(String qrData);

  // ==================== HISTORIQUE & STATISTIQUES ====================

  /// Récupère l'historique complet des livraisons d'un livreur
  Future<List<DeliveryHistoryItem>> getDeliveryHistory({
    required String delivererId,
    DateTime? startDate,
    DateTime? endDate,
    String? status,
    String? customerId,
    int? limit,
    int? offset,
  });

  /// Récupère les gains d'un livreur
  Future<DelivererEarnings> getDelivererEarnings({
    required String delivererId,
    DateTime? startDate,
    DateTime? endDate,
  });

  /// Récupère les statistiques détaillées d'un livreur
  Future<DelivererDetailedStats> getDetailedStats({
    required String delivererId,
    DateTime? startDate,
    DateTime? endDate,
  });

  // ==================== SYNCHRONISATION ====================

  /// Synchronise toutes les données en attente
  Future<SyncResult> syncAllPendingData(String delivererId);

  /// Vérifie le statut de synchronisation
  Future<SyncStatus> getSyncStatus(String delivererId);

  /// Force la synchronisation complète
  Future<void> forceSyncAll(String delivererId);
}

// ==================== CLASSES AUXILIAIRES ====================

/// Commande Impayée
class UnpaidOrder {
  final String id;
  final String orderNumber;
  final DateTime orderDate;
  final double totalAmount;
  final double paidAmount;
  final double remainingAmount;
  final int daysSinceOrder;

  const UnpaidOrder({
    required this.id,
    required this.orderNumber,
    required this.orderDate,
    required this.totalAmount,
    required this.paidAmount,
    required this.remainingAmount,
    required this.daysSinceOrder,
  });

  double get unpaidAmount => totalAmount - paidAmount;
  bool get isFullyUnpaid => paidAmount == 0;
  bool get isPartiallyPaid => paidAmount > 0 && paidAmount < totalAmount;
}

/// Solde Consignes Client
class PackagingBalance {
  final String customerId;
  final String customerName;
  final List<PackagingBalanceItem> items;
  final double totalValue;
  final DateTime lastUpdated;

  const PackagingBalance({
    required this.customerId,
    required this.customerName,
    required this.items,
    required this.totalValue,
    required this.lastUpdated,
  });

  bool get hasPositiveBalance => totalValue > 0;
  bool get hasNegativeBalance => totalValue < 0;
  bool get isBalanced => totalValue == 0;
}

/// Article du Solde Consignes
class PackagingBalanceItem {
  final String packagingId;
  final String packagingName;
  final int quantity;
  final double unitValue;
  final double totalValue;

  const PackagingBalanceItem({
    required this.packagingId,
    required this.packagingName,
    required this.quantity,
    required this.unitValue,
    required this.totalValue,
  });
}

/// Type de Consigne
class PackagingType {
  final String id;
  final String name;
  final String description;
  final double value;
  final String? qrCodePattern;
  final bool isActive;

  const PackagingType({
    required this.id,
    required this.name,
    required this.description,
    required this.value,
    this.qrCodePattern,
    required this.isActive,
  });
}

/// Données QR Code Consigne
class PackagingQrData {
  final String packagingId;
  final String packagingName;
  final int quantity;
  final String? batchNumber;
  final DateTime? expiryDate;

  const PackagingQrData({
    required this.packagingId,
    required this.packagingName,
    required this.quantity,
    this.batchNumber,
    this.expiryDate,
  });
}

/// Élément Historique Livraison
class DeliveryHistoryItem {
  final String id;
  final String deliveryNumber;
  final String customerName;
  final DateTime deliveryDate;
  final String status;
  final String deliveryAddress;
  final int orderCount;
  final double totalAmount;
  final double? paymentCollected;
  final double? packagingDeposited;
  final double? packagingReturned;
  final bool hasProofOfDelivery;
  final String? notes;

  const DeliveryHistoryItem({
    required this.id,
    required this.deliveryNumber,
    required this.customerName,
    required this.deliveryDate,
    required this.status,
    required this.deliveryAddress,
    required this.orderCount,
    required this.totalAmount,
    this.paymentCollected,
    this.packagingDeposited,
    this.packagingReturned,
    required this.hasProofOfDelivery,
    this.notes,
  });

  // Legacy compatibility
  String get orderNumber => deliveryNumber;
  double get orderValue => totalAmount;
}

/// Gains Livreur
class DelivererEarnings {
  final String delivererId;
  final DateTime startDate;
  final DateTime endDate;
  final int deliveryCount;
  final double totalOrderValue;
  final double commissionEarned;
  final double bonusEarned;
  final double totalEarnings;
  final List<EarningsBreakdown> breakdown;

  const DelivererEarnings({
    required this.delivererId,
    required this.startDate,
    required this.endDate,
    required this.deliveryCount,
    required this.totalOrderValue,
    required this.commissionEarned,
    required this.bonusEarned,
    required this.totalEarnings,
    required this.breakdown,
  });

  // Legacy compatibility
  int get totalDeliveries => deliveryCount;
  double get totalCommissions => commissionEarned;
  double get totalBonuses => bonusEarned;
}

/// Détail des Gains
class EarningsBreakdown {
  final DateTime date;
  final int deliveries;
  final double orderValue;
  final double commissions;
  final double bonuses;
  final double total;

  const EarningsBreakdown({
    required this.date,
    required this.deliveries,
    required this.orderValue,
    required this.commissions,
    required this.bonuses,
    required this.total,
  });
}

/// Statistiques Détaillées Livreur
class DelivererDetailedStats {
  final String delivererId;
  final DateTime startDate;
  final DateTime endDate;
  final int totalDeliveries;
  final int successfulDeliveries;
  final int failedDeliveries;
  final double successRate;
  final double averageDeliveryTime;
  final double totalDistance;
  final double totalPaymentsCollected;
  final double averageRating;
  final Map<String, int> deliveriesByStatus;
  final List<DailyEarning> dailyEarnings;

  const DelivererDetailedStats({
    required this.delivererId,
    required this.startDate,
    required this.endDate,
    required this.totalDeliveries,
    required this.successfulDeliveries,
    required this.failedDeliveries,
    required this.successRate,
    required this.averageDeliveryTime,
    required this.totalDistance,
    required this.totalPaymentsCollected,
    required this.averageRating,
    required this.deliveriesByStatus,
    required this.dailyEarnings,
  });

  // Legacy compatibility
  Map<String, double> get earningsByPeriod {
    return Map.fromEntries(
      dailyEarnings.map((e) => MapEntry(e.date.toIso8601String(), e.earnings)),
    );
  }
}

/// Gains quotidiens
class DailyEarning {
  final DateTime date;
  final double earnings;
  final int deliveries;

  const DailyEarning({
    required this.date,
    required this.earnings,
    required this.deliveries,
  });
}

/// Résultat de Synchronisation
class SyncResult {
  final int proofsUploaded;
  final int paymentsUploaded;
  final int transactionsUploaded;
  final List<String> errors;
  final DateTime syncedAt;

  const SyncResult({
    required this.proofsUploaded,
    required this.paymentsUploaded,
    required this.transactionsUploaded,
    required this.errors,
    required this.syncedAt,
  });

  bool get hasErrors => errors.isNotEmpty;
  int get totalUploaded => proofsUploaded + paymentsUploaded + transactionsUploaded;
}

/// Statut de Synchronisation
class SyncStatus {
  final int pendingProofs;
  final int pendingPayments;
  final int pendingTransactions;
  final DateTime? lastSyncAt;
  final bool isSyncing;

  const SyncStatus({
    required this.pendingProofs,
    required this.pendingPayments,
    required this.pendingTransactions,
    this.lastSyncAt,
    required this.isSyncing,
  });

  int get totalPending => pendingProofs + pendingPayments + pendingTransactions;
  bool get hasPendingData => totalPending > 0;
}