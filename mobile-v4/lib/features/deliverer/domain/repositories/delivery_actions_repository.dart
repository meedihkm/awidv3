import '../entities/proof_of_delivery.dart';
import '../entities/payment_collection.dart';
import '../entities/packaging_transaction.dart';
import '../entities/unpaid_order.dart';
import '../entities/packaging_type.dart';
import '../entities/delivery_history_item.dart';
import '../entities/deliverer_earnings.dart';

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