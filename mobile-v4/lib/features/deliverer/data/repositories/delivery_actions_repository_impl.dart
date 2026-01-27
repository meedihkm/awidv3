import '../../../../core/storage/local_storage.dart';
import '../../domain/entities/proof_of_delivery.dart';
import '../../domain/entities/payment_collection.dart';
import '../../domain/entities/packaging_transaction.dart';
import '../../domain/repositories/delivery_actions_repository.dart';
import '../datasources/delivery_actions_remote_datasource.dart';
import '../models/proof_of_delivery_model.dart';
import '../models/payment_collection_model.dart';
import '../models/packaging_transaction_model.dart';

// Import des classes auxiliaires du repository
// Ces classes sont définies dans delivery_actions_repository.dart
export '../../domain/repositories/delivery_actions_repository.dart' show
    UnpaidOrder,
    PackagingBalance,
    PackagingBalanceItem,
    PackagingType,
    PackagingQrData,
    DeliveryHistoryItem,
    DelivererEarnings,
    DelivererDetailedStats,
    SyncResult,
    SyncStatus;

/// Implémentation du Repository: Actions de Livraison
/// Gère la persistance locale et la synchronisation avec l'API
class DeliveryActionsRepositoryImpl implements DeliveryActionsRepository {
  final DeliveryActionsRemoteDatasource _remoteDatasource;
  final LocalStorage _localStorage;

  // Clés de stockage local
  static const String _proofsKey = 'proofs_of_delivery';
  static const String _paymentsKey = 'payment_collections';
  static const String _packagingKey = 'packaging_transactions';
  static const String _packagingTypesKey = 'packaging_types';

  const DeliveryActionsRepositoryImpl(
    this._remoteDatasource,
    this._localStorage,
  );

  // ==================== PREUVE DE LIVRAISON ====================

  @override
  Future<void> saveProofOfDelivery(ProofOfDelivery proof) async {
    try {
      final proofs = await _getLocalProofs();
      final model = proofOfDeliveryModelFromEntity(proof);
      
      // Remplacer si existe, sinon ajouter
      final index = proofs.indexWhere((p) => p.id == proof.id);
      if (index >= 0) {
        proofs[index] = model;
      } else {
        proofs.add(model);
      }

      await _localStorage.setList(_proofsKey, proofs.map((p) => p.toJson()).toList());
    } catch (error) {
      throw Exception('Erreur lors de la sauvegarde de la preuve: $error');
    }
  }

  @override
  Future<void> uploadProofOfDelivery(String proofId) async {
    try {
      final proofs = await _getLocalProofs();
      final proofModel = proofs.firstWhere(
        (p) => p.id == proofId,
        orElse: () => throw Exception('Preuve non trouvée: $proofId'),
      );

      if (proofModel.isUploaded) {
        return; // Déjà uploadée
      }

      // Upload vers l'API
      final response = await _remoteDatasource.uploadProofOfDelivery(
        deliveryId: proofModel.deliveryId,
        delivererId: proofModel.delivererId,
        customerId: proofModel.customerId,
        timestamp: proofModel.timestamp,
        latitude: proofModel.latitude,
        longitude: proofModel.longitude,
        signatoryName: proofModel.signatoryName,
        signatureImagePath: proofModel.signatureImagePath,
        photosPaths: proofModel.photosPaths,
        notes: proofModel.notes,
        customerFeedback: proofModel.customerFeedback,
      );

      if (response.isSuccess) {
        // Marquer comme uploadée
        final updatedProof = proofModel.copyWith(
          isUploaded: true,
          uploadedAt: response.uploadedAt,
        );

        final index = proofs.indexWhere((p) => p.id == proofId);
        proofs[index] = updatedProof;

        await _localStorage.setList(_proofsKey, proofs.map((p) => p.toJson()).toList());
      } else {
        throw Exception('Échec de l\'upload: ${response.message}');
      }
    } catch (error) {
      throw Exception('Erreur lors de l\'upload de la preuve: $error');
    }
  }

  @override
  Future<List<ProofOfDelivery>> getProofsOfDelivery({
    required String delivererId,
    DateTime? startDate,
    DateTime? endDate,
    bool? isUploaded,
  }) async {
    try {
      final localProofs = await _getLocalProofs();
      
      // Filtrer les preuves locales
      var filteredProofs = localProofs.where((p) => p.delivererId == delivererId);

      if (startDate != null) {
        filteredProofs = filteredProofs.where((p) => 
          p.timestamp.isAfter(startDate) || p.timestamp.isAtSameMomentAs(startDate));
      }

      if (endDate != null) {
        filteredProofs = filteredProofs.where((p) => 
          p.timestamp.isBefore(endDate) || p.timestamp.isAtSameMomentAs(endDate));
      }

      if (isUploaded != null) {
        filteredProofs = filteredProofs.where((p) => p.isUploaded == isUploaded);
      }

      // Trier par date décroissante
      final sortedProofs = filteredProofs.toList()
        ..sort((a, b) => b.timestamp.compareTo(a.timestamp));

      return sortedProofs.map((p) => p.toEntity()).toList();
    } catch (error) {
      throw Exception('Erreur lors de la récupération des preuves: $error');
    }
  }

  @override
  Future<ProofOfDelivery?> getProofOfDelivery(String proofId) async {
    try {
      final proofs = await _getLocalProofs();
      final proofModel = proofs.where((p) => p.id == proofId).firstOrNull;
      return proofModel?.toEntity();
    } catch (error) {
      throw Exception('Erreur lors de la récupération de la preuve: $error');
    }
  }

  @override
  Future<void> deleteProofOfDelivery(String proofId) async {
    try {
      final proofs = await _getLocalProofs();
      proofs.removeWhere((p) => p.id == proofId);
      await _localStorage.setList(_proofsKey, proofs.map((p) => p.toJson()).toList());
    } catch (error) {
      throw Exception('Erreur lors de la suppression de la preuve: $error');
    }
  }

  @override
  Future<void> uploadPendingProofs(String delivererId) async {
    try {
      final proofs = await _getLocalProofs();
      final pendingProofs = proofs.where((p) => 
        p.delivererId == delivererId && !p.isUploaded).toList();

      for (final proof in pendingProofs) {
        try {
          await uploadProofOfDelivery(proof.id);
        } catch (error) {
          // Continuer avec les autres preuves même si une échoue
          print('Erreur upload preuve ${proof.id}: $error');
        }
      }
    } catch (error) {
      throw Exception('Erreur lors de l\'upload des preuves en attente: $error');
    }
  }

  // ==================== PAIEMENTS ====================

  @override
  Future<void> savePaymentCollection(PaymentCollection payment) async {
    try {
      final payments = await _getLocalPayments();
      final model = paymentCollectionModelFromEntity(payment);
      
      // Remplacer si existe, sinon ajouter
      final index = payments.indexWhere((p) => p.id == payment.id);
      if (index >= 0) {
        payments[index] = model;
      } else {
        payments.add(model);
      }

      await _localStorage.setList(_paymentsKey, payments.map((p) => p.toJson()).toList());
    } catch (error) {
      throw Exception('Erreur lors de la sauvegarde du paiement: $error');
    }
  }

  @override
  Future<void> uploadPaymentCollection(String paymentId) async {
    try {
      final payments = await _getLocalPayments();
      final paymentModel = payments.firstWhere(
        (p) => p.id == paymentId,
        orElse: () => throw Exception('Paiement non trouvé: $paymentId'),
      );

      if (paymentModel.isUploaded) {
        return; // Déjà uploadé
      }

      // Upload vers l'API
      final response = await _remoteDatasource.uploadPaymentCollection(
        delivererId: paymentModel.delivererId,
        customerId: paymentModel.customerId,
        customerName: paymentModel.customerName,
        amount: paymentModel.amount,
        mode: paymentModel.mode.name,
        collectedAt: paymentModel.collectedAt,
        allocations: paymentModel.allocations.map((a) => a.toUploadJson()).toList(),
        reference: paymentModel.reference,
        notes: paymentModel.notes,
        receiptImagePath: paymentModel.receiptImagePath,
      );

      if (response.isSuccess) {
        // Marquer comme uploadé
        final updatedPayment = paymentModel.copyWith(
          isUploaded: true,
          uploadedAt: response.uploadedAt,
        );

        final index = payments.indexWhere((p) => p.id == paymentId);
        payments[index] = updatedPayment;

        await _localStorage.setList(_paymentsKey, payments.map((p) => p.toJson()).toList());
      } else {
        throw Exception('Échec de l\'upload: ${response.message}');
      }
    } catch (error) {
      throw Exception('Erreur lors de l\'upload du paiement: $error');
    }
  }

  @override
  Future<List<PaymentCollection>> getPaymentCollections({
    required String delivererId,
    DateTime? startDate,
    DateTime? endDate,
    PaymentMode? mode,
    bool? isUploaded,
  }) async {
    try {
      final localPayments = await _getLocalPayments();
      
      // Filtrer les paiements locaux
      var filteredPayments = localPayments.where((p) => p.delivererId == delivererId);

      if (startDate != null) {
        filteredPayments = filteredPayments.where((p) => 
          p.collectedAt.isAfter(startDate) || p.collectedAt.isAtSameMomentAs(startDate));
      }

      if (endDate != null) {
        filteredPayments = filteredPayments.where((p) => 
          p.collectedAt.isBefore(endDate) || p.collectedAt.isAtSameMomentAs(endDate));
      }

      if (mode != null) {
        filteredPayments = filteredPayments.where((p) => p.mode == mode);
      }

      if (isUploaded != null) {
        filteredPayments = filteredPayments.where((p) => p.isUploaded == isUploaded);
      }

      // Trier par date décroissante
      final sortedPayments = filteredPayments.toList()
        ..sort((a, b) => b.collectedAt.compareTo(a.collectedAt));

      return sortedPayments.map((p) => p.toEntity()).toList();
    } catch (error) {
      throw Exception('Erreur lors de la récupération des paiements: $error');
    }
  }

  @override
  Future<PaymentCollection?> getPaymentCollection(String paymentId) async {
    try {
      final payments = await _getLocalPayments();
      final paymentModel = payments.where((p) => p.id == paymentId).firstOrNull;
      return paymentModel?.toEntity();
    } catch (error) {
      throw Exception('Erreur lors de la récupération du paiement: $error');
    }
  }

  @override
  Future<void> deletePaymentCollection(String paymentId) async {
    try {
      final payments = await _getLocalPayments();
      payments.removeWhere((p) => p.id == paymentId);
      await _localStorage.setList(_paymentsKey, payments.map((p) => p.toJson()).toList());
    } catch (error) {
      throw Exception('Erreur lors de la suppression du paiement: $error');
    }
  }

  @override
  Future<void> uploadPendingPayments(String delivererId) async {
    try {
      final payments = await _getLocalPayments();
      final pendingPayments = payments.where((p) => 
        p.delivererId == delivererId && !p.isUploaded).toList();

      for (final payment in pendingPayments) {
        try {
          await uploadPaymentCollection(payment.id);
        } catch (error) {
          // Continuer avec les autres paiements même si un échoue
          print('Erreur upload paiement ${payment.id}: $error');
        }
      }
    } catch (error) {
      throw Exception('Erreur lors de l\'upload des paiements en attente: $error');
    }
  }

  @override
  Future<List<UnpaidOrder>> getUnpaidOrders(String customerId) async {
    try {
      final models = await _remoteDatasource.getUnpaidOrders(customerId);
      return models.map((m) => m.toUnpaidOrder()).toList();
    } catch (error) {
      throw Exception('Erreur lors de la récupération des commandes impayées: $error');
    }
  }

  @override
  Future<List<PaymentAllocation>> calculateAutoAllocation({
    required String customerId,
    required double amount,
  }) async {
    try {
      final models = await _remoteDatasource.calculateAutoAllocation(
        customerId: customerId,
        amount: amount,
      );
      return models.map((m) => m.toEntity()).toList();
    } catch (error) {
      throw Exception('Erreur lors du calcul de l\'allocation: $error');
    }
  }

  // ==================== CONSIGNES ====================

  @override
  Future<void> savePackagingTransaction(PackagingTransaction transaction) async {
    try {
      final transactions = await _getLocalPackagingTransactions();
      final model = packagingTransactionModelFromEntity(transaction);
      
      // Remplacer si existe, sinon ajouter
      final index = transactions.indexWhere((t) => t.id == transaction.id);
      if (index >= 0) {
        transactions[index] = model;
      } else {
        transactions.add(model);
      }

      await _localStorage.setList(_packagingKey, transactions.map((t) => t.toJson()).toList());
    } catch (error) {
      throw Exception('Erreur lors de la sauvegarde de la transaction: $error');
    }
  }

  @override
  Future<void> uploadPackagingTransaction(String transactionId) async {
    try {
      final transactions = await _getLocalPackagingTransactions();
      final transactionModel = transactions.firstWhere(
        (t) => t.id == transactionId,
        orElse: () => throw Exception('Transaction non trouvée: $transactionId'),
      );

      if (transactionModel.isUploaded) {
        return; // Déjà uploadée
      }

      // Upload vers l'API
      final response = await _remoteDatasource.uploadPackagingTransaction(
        delivererId: transactionModel.delivererId,
        customerId: transactionModel.customerId,
        customerName: transactionModel.customerName,
        type: transactionModel.type.name,
        items: transactionModel.items.map((i) => i.toUploadJson()).toList(),
        transactionDate: transactionModel.transactionDate,
        notes: transactionModel.notes,
        qrCodeData: transactionModel.qrCodeData,
      );

      if (response.isSuccess) {
        // Marquer comme uploadée
        final updatedTransaction = transactionModel.copyWith(
          isUploaded: true,
          uploadedAt: response.uploadedAt,
        );

        final index = transactions.indexWhere((t) => t.id == transactionId);
        transactions[index] = updatedTransaction;

        await _localStorage.setList(_packagingKey, transactions.map((t) => t.toJson()).toList());
      } else {
        throw Exception('Échec de l\'upload: ${response.message}');
      }
    } catch (error) {
      throw Exception('Erreur lors de l\'upload de la transaction: $error');
    }
  }

  @override
  Future<List<PackagingTransaction>> getPackagingTransactions({
    required String delivererId,
    DateTime? startDate,
    DateTime? endDate,
    PackagingTransactionType? type,
    bool? isUploaded,
  }) async {
    try {
      final localTransactions = await _getLocalPackagingTransactions();
      
      // Filtrer les transactions locales
      var filteredTransactions = localTransactions.where((t) => t.delivererId == delivererId);

      if (startDate != null) {
        filteredTransactions = filteredTransactions.where((t) => 
          t.transactionDate.isAfter(startDate) || t.transactionDate.isAtSameMomentAs(startDate));
      }

      if (endDate != null) {
        filteredTransactions = filteredTransactions.where((t) => 
          t.transactionDate.isBefore(endDate) || t.transactionDate.isAtSameMomentAs(endDate));
      }

      if (type != null) {
        filteredTransactions = filteredTransactions.where((t) => t.type == type);
      }

      if (isUploaded != null) {
        filteredTransactions = filteredTransactions.where((t) => t.isUploaded == isUploaded);
      }

      // Trier par date décroissante
      final sortedTransactions = filteredTransactions.toList()
        ..sort((a, b) => b.transactionDate.compareTo(a.transactionDate));

      return sortedTransactions.map((t) => t.toEntity()).toList();
    } catch (error) {
      throw Exception('Erreur lors de la récupération des transactions: $error');
    }
  }

  @override
  Future<PackagingTransaction?> getPackagingTransaction(String transactionId) async {
    try {
      final transactions = await _getLocalPackagingTransactions();
      final transactionModel = transactions.where((t) => t.id == transactionId).firstOrNull;
      return transactionModel?.toEntity();
    } catch (error) {
      throw Exception('Erreur lors de la récupération de la transaction: $error');
    }
  }

  @override
  Future<void> deletePackagingTransaction(String transactionId) async {
    try {
      final transactions = await _getLocalPackagingTransactions();
      transactions.removeWhere((t) => t.id == transactionId);
      await _localStorage.setList(_packagingKey, transactions.map((t) => t.toJson()).toList());
    } catch (error) {
      throw Exception('Erreur lors de la suppression de la transaction: $error');
    }
  }

  @override
  Future<void> uploadPendingTransactions(String delivererId) async {
    try {
      final transactions = await _getLocalPackagingTransactions();
      final pendingTransactions = transactions.where((t) => 
        t.delivererId == delivererId && !t.isUploaded).toList();

      for (final transaction in pendingTransactions) {
        try {
          await uploadPackagingTransaction(transaction.id);
        } catch (error) {
          // Continuer avec les autres transactions même si une échoue
          print('Erreur upload transaction ${transaction.id}: $error');
        }
      }
    } catch (error) {
      throw Exception('Erreur lors de l\'upload des transactions en attente: $error');
    }
  }

  @override
  Future<PackagingBalance> getPackagingBalance(String customerId) async {
    try {
      final model = await _remoteDatasource.getPackagingBalance(customerId);
      return model.toPackagingBalance();
    } catch (error) {
      throw Exception('Erreur lors de la récupération du solde: $error');
    }
  }

  @override
  Future<List<PackagingType>> getPackagingTypes() async {
    try {
      // Essayer de récupérer depuis le cache local d'abord
      final cachedTypes = await _getLocalPackagingTypes();
      if (cachedTypes.isNotEmpty) {
        return cachedTypes.map((t) => t.toPackagingType()).toList();
      }

      // Sinon récupérer depuis l'API
      final models = await _remoteDatasource.getPackagingTypes();
      
      // Mettre en cache
      await _localStorage.setList(_packagingTypesKey, models.map((t) => t.toJson()).toList());
      
      return models.map((t) => t.toPackagingType()).toList();
    } catch (error) {
      throw Exception('Erreur lors de la récupération des types de consignes: $error');
    }
  }

  @override
  Future<PackagingQrData?> scanPackagingQrCode(String qrData) async {
    try {
      final model = await _remoteDatasource.scanPackagingQrCode(qrData);
      return model?.toPackagingQrData();
    } catch (error) {
      throw Exception('Erreur lors du scan du QR code: $error');
    }
  }

  // ==================== HISTORIQUE & STATISTIQUES ====================

  @override
  Future<List<DeliveryHistoryItem>> getDeliveryHistory({
    required String delivererId,
    DateTime? startDate,
    DateTime? endDate,
    String? status,
    String? customerId,
    int? limit,
    int? offset,
  }) async {
    try {
      final data = await _remoteDatasource.getDeliveryHistory(
        delivererId: delivererId,
        startDate: startDate,
        endDate: endDate,
        status: status,
        customerId: customerId,
        limit: limit,
        offset: offset,
      );

      return data.map((json) => DeliveryHistoryItem(
        id: json['id'] as String,
        deliveryNumber: json['order_number'] as String,
        customerName: json['customer_name'] as String,
        deliveryDate: DateTime.parse(json['delivery_date'] as String),
        status: json['status'] as String,
        deliveryAddress: json['delivery_address'] as String? ?? '',
        orderCount: json['order_count'] as int? ?? 1,
        totalAmount: (json['order_value'] as num).toDouble(),
        paymentCollected: json['payment_collected'] != null 
            ? (json['payment_collected'] as num).toDouble()
            : null,
        hasProofOfDelivery: json['has_proof_of_delivery'] as bool,
        notes: json['notes'] as String?,
      )).toList();
    } catch (error) {
      throw Exception('Erreur lors de la récupération de l\'historique: $error');
    }
  }

  @override
  Future<DelivererEarnings> getDelivererEarnings({
    required String delivererId,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    try {
      final data = await _remoteDatasource.getDelivererEarnings(
        delivererId: delivererId,
        startDate: startDate,
        endDate: endDate,
      );

      return DelivererEarnings(
        delivererId: data['deliverer_id'] as String,
        startDate: DateTime.parse(data['start_date'] as String),
        endDate: DateTime.parse(data['end_date'] as String),
        deliveryCount: data['total_deliveries'] as int,
        totalOrderValue: (data['total_order_value'] as num).toDouble(),
        commissionEarned: (data['total_commissions'] as num).toDouble(),
        bonusEarned: (data['total_bonuses'] as num).toDouble(),
        totalEarnings: (data['total_earnings'] as num).toDouble(),
        breakdown: (data['breakdown'] as List).map((b) => EarningsBreakdown(
          date: DateTime.parse(b['date'] as String),
          deliveries: b['deliveries'] as int,
          orderValue: (b['order_value'] as num).toDouble(),
          commissions: (b['commissions'] as num).toDouble(),
          bonuses: (b['bonuses'] as num).toDouble(),
          total: (b['total'] as num).toDouble(),
        )).toList(),
      );
    } catch (error) {
      throw Exception('Erreur lors de la récupération des gains: $error');
    }
  }

  @override
  Future<DelivererDetailedStats> getDetailedStats({
    required String delivererId,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    try {
      final data = await _remoteDatasource.getDetailedStats(
        delivererId: delivererId,
        startDate: startDate,
        endDate: endDate,
      );

      return DelivererDetailedStats(
        delivererId: data['deliverer_id'] as String,
        startDate: DateTime.parse(data['start_date'] as String),
        endDate: DateTime.parse(data['end_date'] as String),
        totalDeliveries: data['total_deliveries'] as int,
        successfulDeliveries: data['successful_deliveries'] as int,
        failedDeliveries: data['failed_deliveries'] as int,
        successRate: (data['success_rate'] as num).toDouble(),
        averageDeliveryTime: (data['average_delivery_time'] as num).toDouble(),
        totalDistance: (data['total_distance'] as num).toDouble(),
        totalPaymentsCollected: (data['total_payments_collected'] as num?)?.toDouble() ?? 0.0,
        averageRating: (data['average_rating'] as num).toDouble(),
        deliveriesByStatus: Map<String, int>.from(data['deliveries_by_status']),
        dailyEarnings: (data['daily_earnings'] as List?)?.map((e) => DailyEarning(
          date: DateTime.parse(e['date'] as String),
          earnings: (e['earnings'] as num).toDouble(),
          deliveries: e['deliveries'] as int,
        )).toList() ?? [],
      );
    } catch (error) {
      throw Exception('Erreur lors de la récupération des statistiques: $error');
    }
  }

  // ==================== SYNCHRONISATION ====================

  @override
  Future<SyncResult> syncAllPendingData(String delivererId) async {
    try {
      final data = await _remoteDatasource.syncAllPendingData(delivererId);

      return SyncResult(
        proofsUploaded: data['proofs_uploaded'] as int,
        paymentsUploaded: data['payments_uploaded'] as int,
        transactionsUploaded: data['transactions_uploaded'] as int,
        errors: List<String>.from(data['errors'] ?? []),
        syncedAt: DateTime.parse(data['synced_at'] as String),
      );
    } catch (error) {
      throw Exception('Erreur lors de la synchronisation: $error');
    }
  }

  @override
  Future<SyncStatus> getSyncStatus(String delivererId) async {
    try {
      final data = await _remoteDatasource.getSyncStatus(delivererId);

      return SyncStatus(
        pendingProofs: data['pending_proofs'] as int,
        pendingPayments: data['pending_payments'] as int,
        pendingTransactions: data['pending_transactions'] as int,
        lastSyncAt: data['last_sync_at'] != null 
            ? DateTime.parse(data['last_sync_at'] as String)
            : null,
        isSyncing: data['is_syncing'] as bool,
      );
    } catch (error) {
      throw Exception('Erreur lors de la vérification du statut: $error');
    }
  }

  @override
  Future<void> forceSyncAll(String delivererId) async {
    try {
      await uploadPendingProofs(delivererId);
      await uploadPendingPayments(delivererId);
      await uploadPendingTransactions(delivererId);
    } catch (error) {
      throw Exception('Erreur lors de la synchronisation forcée: $error');
    }
  }

  // ==================== MÉTHODES UTILITAIRES PRIVÉES ====================

  /// Récupère les preuves de livraison locales
  Future<List<ProofOfDeliveryModel>> _getLocalProofs() async {
    try {
      final data = await _localStorage.getList(_proofsKey);
      return data?.map((json) => ProofOfDeliveryModel.fromJson(json)).toList() ?? [];
    } catch (error) {
      return [];
    }
  }

  /// Récupère les paiements locaux
  Future<List<PaymentCollectionModel>> _getLocalPayments() async {
    try {
      final data = await _localStorage.getList(_paymentsKey);
      return data?.map((json) => PaymentCollectionModel.fromJson(json)).toList() ?? [];
    } catch (error) {
      return [];
    }
  }

  /// Récupère les transactions de consignes locales
  Future<List<PackagingTransactionModel>> _getLocalPackagingTransactions() async {
    try {
      final data = await _localStorage.getList(_packagingKey);
      return data?.map((json) => PackagingTransactionModel.fromJson(json)).toList() ?? [];
    } catch (error) {
      return [];
    }
  }

  /// Récupère les types de consignes locaux
  Future<List<PackagingTypeModel>> _getLocalPackagingTypes() async {
    try {
      final data = await _localStorage.getList(_packagingTypesKey);
      return data?.map((json) => PackagingTypeModel.fromJson(json)).toList() ?? [];
    } catch (error) {
      return [];
    }
  }
}