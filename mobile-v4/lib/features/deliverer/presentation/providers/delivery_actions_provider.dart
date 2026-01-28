import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/providers/common_providers.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../core/storage/local_storage.dart';
import '../../data/datasources/delivery_actions_remote_datasource.dart';
import '../../data/datasources/deliverer_remote_datasource.dart';
import '../../data/repositories/delivery_actions_repository_impl.dart';
import '../../data/repositories/deliverer_repository_impl.dart';
import '../../domain/entities/proof_of_delivery.dart';
import '../../domain/entities/payment_collection.dart';
import '../../domain/entities/packaging_transaction.dart';
import '../../domain/repositories/delivery_actions_repository.dart';
import '../../domain/repositories/deliverer_repository.dart';
import '../../domain/usecases/complete_delivery_usecase.dart';
import '../../domain/usecases/collect_payment_usecase.dart';
import '../../domain/usecases/manage_packaging_usecase.dart';

// ==================== PROVIDERS DE DÉPENDANCES ====================

/// Provider pour le datasource remote
final deliveryActionsRemoteDatasourceProvider = Provider<DeliveryActionsRemoteDatasource>((ref) {
  final dioClient = ref.watch(dioClientProvider);
  return DeliveryActionsRemoteDatasource(dioClient);
});

/// Provider pour le repository des actions de livraison
final deliveryActionsRepositoryProvider = Provider<DeliveryActionsRepository>((ref) {
  final remoteDatasource = ref.watch(deliveryActionsRemoteDatasourceProvider);
  final localStorage = ref.watch(localStorageProvider);
  return DeliveryActionsRepositoryImpl(remoteDatasource, localStorage);
});

/// Provider pour le datasource remote du livreur
final delivererRemoteDatasourceProvider = Provider<DelivererRemoteDatasource>((ref) {
  final dioClient = ref.watch(dioClientProvider);
  return DelivererRemoteDatasource(dioClient);
});

/// Provider pour le repository du livreur
final delivererRepositoryProvider = Provider<DelivererRepository>((ref) {
  final remoteDatasource = ref.watch(delivererRemoteDatasourceProvider);
  return DelivererRepositoryImpl(remoteDatasource);
});

/// Provider pour le use case de finalisation de livraison
final completeDeliveryUseCaseProvider = Provider<CompleteDeliveryUseCase>((ref) {
  final actionsRepository = ref.watch(deliveryActionsRepositoryProvider);
  final delivererRepository = ref.watch(delivererRepositoryProvider);
  return CompleteDeliveryUseCase(actionsRepository, delivererRepository);
});

/// Provider pour le use case d'encaissement
final collectPaymentUseCaseProvider = Provider<CollectPaymentUseCase>((ref) {
  final repository = ref.watch(deliveryActionsRepositoryProvider);
  return CollectPaymentUseCase(repository);
});

/// Provider pour le use case de gestion des consignes
final managePackagingUseCaseProvider = Provider<ManagePackagingUseCase>((ref) {
  final repository = ref.watch(deliveryActionsRepositoryProvider);
  return ManagePackagingUseCase(repository);
});

// ==================== PROVIDERS D'ÉTAT ====================

/// Provider pour les preuves de livraison
final proofsOfDeliveryProvider = StateNotifierProvider.family<
    ProofsOfDeliveryNotifier, AsyncValue<List<ProofOfDelivery>>, String>(
  (ref, delivererId) {
    final repository = ref.watch(deliveryActionsRepositoryProvider);
    return ProofsOfDeliveryNotifier(repository, delivererId);
  },
);

/// Provider pour les paiements
final paymentCollectionsProvider = StateNotifierProvider.family<
    PaymentCollectionsNotifier, AsyncValue<List<PaymentCollection>>, String>(
  (ref, delivererId) {
    final repository = ref.watch(deliveryActionsRepositoryProvider);
    return PaymentCollectionsNotifier(repository, delivererId);
  },
);

/// Provider pour les transactions de consignes
final packagingTransactionsProvider = StateNotifierProvider.family<
    PackagingTransactionsNotifier, AsyncValue<List<PackagingTransaction>>, String>(
  (ref, delivererId) {
    final repository = ref.watch(deliveryActionsRepositoryProvider);
    return PackagingTransactionsNotifier(repository, delivererId);
  },
);

/// Provider pour les actions de livraison
final deliveryActionsProvider = StateNotifierProvider<
    DeliveryActionsNotifier, DeliveryActionsState>(
  (ref) {
    final completeUseCase = ref.watch(completeDeliveryUseCaseProvider);
    final paymentUseCase = ref.watch(collectPaymentUseCaseProvider);
    final packagingUseCase = ref.watch(managePackagingUseCaseProvider);
    return DeliveryActionsNotifier(completeUseCase, paymentUseCase, packagingUseCase);
  },
);

/// Provider pour les commandes impayées
final unpaidOrdersProvider = FutureProvider.family<List<UnpaidOrder>, String>(
  (ref, customerId) async {
    final repository = ref.watch(deliveryActionsRepositoryProvider);
    return await repository.getUnpaidOrders(customerId);
  },
);

/// Provider pour les types de consignes
final packagingTypesProvider = FutureProvider<List<PackagingType>>(
  (ref) async {
    final repository = ref.watch(deliveryActionsRepositoryProvider);
    return await repository.getPackagingTypes();
  },
);

/// Provider pour le solde consignes d'un client
final packagingBalanceProvider = FutureProvider.family<PackagingBalance, String>(
  (ref, customerId) async {
    final repository = ref.watch(deliveryActionsRepositoryProvider);
    return await repository.getPackagingBalance(customerId);
  },
);

/// Provider pour l'historique des livraisons
final deliveryHistoryProvider = FutureProvider.family<List<DeliveryHistoryItem>, DeliveryHistoryParams>(
  (ref, params) async {
    final repository = ref.watch(deliveryActionsRepositoryProvider);
    return await repository.getDeliveryHistory(
      delivererId: params.delivererId,
      startDate: params.startDate,
      endDate: params.endDate,
      status: params.status,
      customerId: params.customerId,
      limit: params.limit,
      offset: params.offset,
    );
  },
);

/// Provider pour les gains du livreur
final delivererEarningsProvider = FutureProvider.family<DelivererEarnings, EarningsParams>(
  (ref, params) async {
    final repository = ref.watch(deliveryActionsRepositoryProvider);
    return await repository.getDelivererEarnings(
      delivererId: params.delivererId,
      startDate: params.startDate,
      endDate: params.endDate,
    );
  },
);

/// Provider pour les statistiques détaillées
final detailedStatsProvider = FutureProvider.family<DelivererDetailedStats, StatsParams>(
  (ref, params) async {
    final repository = ref.watch(deliveryActionsRepositoryProvider);
    return await repository.getDetailedStats(
      delivererId: params.delivererId,
      startDate: params.startDate,
      endDate: params.endDate,
    );
  },
);

/// Provider pour le statut de synchronisation
final syncStatusProvider = FutureProvider.family<SyncStatus, String>(
  (ref, delivererId) async {
    final repository = ref.watch(deliveryActionsRepositoryProvider);
    return await repository.getSyncStatus(delivererId);
  },
);

// ==================== STATE NOTIFIERS ====================

/// Notifier pour les preuves de livraison
class ProofsOfDeliveryNotifier extends StateNotifier<AsyncValue<List<ProofOfDelivery>>> {
  final DeliveryActionsRepository _repository;
  final String _delivererId;

  ProofsOfDeliveryNotifier(this._repository, this._delivererId) 
      : super(const AsyncValue.loading()) {
    loadProofs();
  }

  /// Charge les preuves de livraison
  Future<void> loadProofs({
    DateTime? startDate,
    DateTime? endDate,
    bool? isUploaded,
  }) async {
    try {
      state = const AsyncValue.loading();
      final proofs = await _repository.getProofsOfDelivery(
        delivererId: _delivererId,
        startDate: startDate,
        endDate: endDate,
        isUploaded: isUploaded,
      );
      state = AsyncValue.data(proofs);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  /// Rafraîchit les preuves
  Future<void> refresh() async {
    await loadProofs();
  }
}

/// Notifier pour les paiements
class PaymentCollectionsNotifier extends StateNotifier<AsyncValue<List<PaymentCollection>>> {
  final DeliveryActionsRepository _repository;
  final String _delivererId;

  PaymentCollectionsNotifier(this._repository, this._delivererId) 
      : super(const AsyncValue.loading()) {
    loadPayments();
  }

  /// Charge les paiements
  Future<void> loadPayments({
    DateTime? startDate,
    DateTime? endDate,
    PaymentMode? mode,
    bool? isUploaded,
  }) async {
    try {
      state = const AsyncValue.loading();
      final payments = await _repository.getPaymentCollections(
        delivererId: _delivererId,
        startDate: startDate,
        endDate: endDate,
        mode: mode,
        isUploaded: isUploaded,
      );
      state = AsyncValue.data(payments);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  /// Rafraîchit les paiements
  Future<void> refresh() async {
    await loadPayments();
  }
}

/// Notifier pour les transactions de consignes
class PackagingTransactionsNotifier extends StateNotifier<AsyncValue<List<PackagingTransaction>>> {
  final DeliveryActionsRepository _repository;
  final String _delivererId;

  PackagingTransactionsNotifier(this._repository, this._delivererId) 
      : super(const AsyncValue.loading()) {
    loadTransactions();
  }

  /// Charge les transactions
  Future<void> loadTransactions({
    DateTime? startDate,
    DateTime? endDate,
    PackagingTransactionType? type,
    bool? isUploaded,
  }) async {
    try {
      state = const AsyncValue.loading();
      final transactions = await _repository.getPackagingTransactions(
        delivererId: _delivererId,
        startDate: startDate,
        endDate: endDate,
        type: type,
        isUploaded: isUploaded,
      );
      state = AsyncValue.data(transactions);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  /// Rafraîchit les transactions
  Future<void> refresh() async {
    await loadTransactions();
  }
}

/// Notifier pour les actions de livraison
class DeliveryActionsNotifier extends StateNotifier<DeliveryActionsState> {
  final CompleteDeliveryUseCase _completeUseCase;
  final CollectPaymentUseCase _paymentUseCase;
  final ManagePackagingUseCase _packagingUseCase;

  DeliveryActionsNotifier(
    this._completeUseCase,
    this._paymentUseCase,
    this._packagingUseCase,
  ) : super(const DeliveryActionsState.idle());

  /// Finalise une livraison
  Future<void> completeDelivery(CompleteDeliveryParams params) async {
    state = const DeliveryActionsState.loading();
    
    try {
      final result = await _completeUseCase.execute(params);
      
      if (result.isSuccess) {
        final success = result as CompleteDeliverySuccess;
        state = DeliveryActionsState.deliveryCompleted(
          proofId: success.proofId,
          deliveryId: success.deliveryId,
          completedAt: success.completedAt,
        );
      } else {
        final failure = result as CompleteDeliveryFailure;
        state = DeliveryActionsState.error(failure.error);
      }
    } catch (error) {
      state = DeliveryActionsState.error(error.toString());
    }
  }

  /// Encaisse un paiement avec allocation automatique
  Future<void> collectPaymentAuto(CollectPaymentAutoParams params) async {
    state = const DeliveryActionsState.loading();
    
    try {
      final result = await _paymentUseCase.executeAutoAllocation(params);
      
      if (result.isSuccess) {
        final success = result as CollectPaymentSuccess;
        state = DeliveryActionsState.paymentCollected(
          paymentId: success.paymentId,
          customerId: success.customerId,
          amount: success.amount,
          allocations: success.allocations,
          collectedAt: success.collectedAt,
        );
      } else {
        final failure = result as CollectPaymentFailure;
        state = DeliveryActionsState.error(failure.error);
      }
    } catch (error) {
      state = DeliveryActionsState.error(error.toString());
    }
  }

  /// Encaisse un paiement avec allocation manuelle
  Future<void> collectPaymentManual(CollectPaymentManualParams params) async {
    state = const DeliveryActionsState.loading();
    
    try {
      final result = await _paymentUseCase.executeManualAllocation(params);
      
      if (result.isSuccess) {
        final success = result as CollectPaymentSuccess;
        state = DeliveryActionsState.paymentCollected(
          paymentId: success.paymentId,
          customerId: success.customerId,
          amount: success.amount,
          allocations: success.allocations,
          collectedAt: success.collectedAt,
        );
      } else {
        final failure = result as CollectPaymentFailure;
        state = DeliveryActionsState.error(failure.error);
      }
    } catch (error) {
      state = DeliveryActionsState.error(error.toString());
    }
  }

  /// Enregistre un dépôt de consignes
  Future<void> recordPackagingDeposit(PackagingDepositParams params) async {
    state = const DeliveryActionsState.loading();
    
    try {
      final result = await _packagingUseCase.recordDeposit(params);
      
      if (result.isSuccess) {
        final success = result as ManagePackagingSuccess;
        state = DeliveryActionsState.packagingTransactionRecorded(
          transactionId: success.transactionId,
          customerId: success.customerId,
          type: success.type,
          totalValue: success.totalValue,
          newBalance: success.newBalance,
          transactionDate: success.transactionDate,
        );
      } else {
        final failure = result as ManagePackagingFailure;
        state = DeliveryActionsState.error(failure.error);
      }
    } catch (error) {
      state = DeliveryActionsState.error(error.toString());
    }
  }

  /// Enregistre un retour de consignes
  Future<void> recordPackagingReturn(PackagingReturnParams params) async {
    state = const DeliveryActionsState.loading();
    
    try {
      final result = await _packagingUseCase.recordReturn(params);
      
      if (result.isSuccess) {
        final success = result as ManagePackagingSuccess;
        state = DeliveryActionsState.packagingTransactionRecorded(
          transactionId: success.transactionId,
          customerId: success.customerId,
          type: success.type,
          totalValue: success.totalValue,
          newBalance: success.newBalance,
          transactionDate: success.transactionDate,
        );
      } else {
        final failure = result as ManagePackagingFailure;
        state = DeliveryActionsState.error(failure.error);
      }
    } catch (error) {
      state = DeliveryActionsState.error(error.toString());
    }
  }

  /// Scan un QR code de consigne
  Future<void> scanPackagingQrCode(String qrData) async {
    state = const DeliveryActionsState.loading();
    
    try {
      final result = await _packagingUseCase.scanQrCode(qrData);
      
      if (result.isSuccess) {
        final success = result as PackagingQrSuccess;
        state = DeliveryActionsState.qrCodeScanned(success.data);
      } else {
        final failure = result as PackagingQrFailure;
        state = DeliveryActionsState.error(failure.error);
      }
    } catch (error) {
      state = DeliveryActionsState.error(error.toString());
    }
  }

  /// Remet l'état à idle
  void resetState() {
    state = const DeliveryActionsState.idle();
  }
}

// ==================== ÉTATS ====================

/// État des actions de livraison
sealed class DeliveryActionsState {
  const DeliveryActionsState();

  const factory DeliveryActionsState.idle() = Idle;
  const factory DeliveryActionsState.loading() = Loading;
  const factory DeliveryActionsState.error(String message) = Error;
  
  const factory DeliveryActionsState.deliveryCompleted({
    required String proofId,
    required String deliveryId,
    required DateTime completedAt,
  }) = DeliveryCompleted;
  
  const factory DeliveryActionsState.paymentCollected({
    required String paymentId,
    required String customerId,
    required double amount,
    required List<PaymentAllocation> allocations,
    required DateTime collectedAt,
  }) = PaymentCollected;
  
  const factory DeliveryActionsState.packagingTransactionRecorded({
    required String transactionId,
    required String customerId,
    required PackagingTransactionType type,
    required double totalValue,
    required PackagingBalance newBalance,
    required DateTime transactionDate,
  }) = PackagingTransactionRecorded;
  
  const factory DeliveryActionsState.qrCodeScanned(PackagingQrData data) = QrCodeScanned;
}

class Idle extends DeliveryActionsState {
  const Idle();
}

class Loading extends DeliveryActionsState {
  const Loading();
}

class Error extends DeliveryActionsState {
  final String message;
  const Error(this.message);
}

class DeliveryCompleted extends DeliveryActionsState {
  final String proofId;
  final String deliveryId;
  final DateTime completedAt;
  
  const DeliveryCompleted({
    required this.proofId,
    required this.deliveryId,
    required this.completedAt,
  });
}

class PaymentCollected extends DeliveryActionsState {
  final String paymentId;
  final String customerId;
  final double amount;
  final List<PaymentAllocation> allocations;
  final DateTime collectedAt;
  
  const PaymentCollected({
    required this.paymentId,
    required this.customerId,
    required this.amount,
    required this.allocations,
    required this.collectedAt,
  });
}

class PackagingTransactionRecorded extends DeliveryActionsState {
  final String transactionId;
  final String customerId;
  final PackagingTransactionType type;
  final double totalValue;
  final PackagingBalance newBalance;
  final DateTime transactionDate;
  
  const PackagingTransactionRecorded({
    required this.transactionId,
    required this.customerId,
    required this.type,
    required this.totalValue,
    required this.newBalance,
    required this.transactionDate,
  });
}

class QrCodeScanned extends DeliveryActionsState {
  final PackagingQrData data;
  const QrCodeScanned(this.data);
}

// ==================== CLASSES AUXILIAIRES ====================

/// Paramètres pour l'historique des livraisons
class DeliveryHistoryParams {
  final String delivererId;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? status;
  final String? customerId;
  final int? limit;
  final int? offset;

  const DeliveryHistoryParams({
    required this.delivererId,
    this.startDate,
    this.endDate,
    this.status,
    this.customerId,
    this.limit,
    this.offset,
  });
}

/// Paramètres pour les gains
class EarningsParams {
  final String delivererId;
  final DateTime? startDate;
  final DateTime? endDate;

  const EarningsParams({
    required this.delivererId,
    this.startDate,
    this.endDate,
  });
}

/// Paramètres pour les statistiques
class StatsParams {
  final String delivererId;
  final DateTime? startDate;
  final DateTime? endDate;

  const StatsParams({
    required this.delivererId,
    this.startDate,
    this.endDate,
  });
}