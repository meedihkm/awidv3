import 'dart:async';
import 'dart:collection';
import 'package:awid_mobile/core/services/connectivity_service.dart';

/// Service de synchronisation offline
class OfflineSyncService {
  static final OfflineSyncService _instance = OfflineSyncService._internal();
  factory OfflineSyncService() => _instance;
  OfflineSyncService._internal();

  final ConnectivityService _connectivityService = ConnectivityService();
  final Queue<SyncOperation> _syncQueue = Queue();
  
  bool _isSyncing = false;
  StreamSubscription<ConnectivityStatus>? _connectivitySubscription;

  final _syncStatusController = StreamController<SyncStatus>.broadcast();
  Stream<SyncStatus> get syncStatus => _syncStatusController.stream;

  /// Initialiser le service
  void initialize() {
    // Écouter les changements de connectivité
    _connectivitySubscription = _connectivityService.statusStream.listen((status) {
      if (status == ConnectivityStatus.online && _syncQueue.isNotEmpty) {
        syncPendingOperations();
      }
    });
  }

  /// Ajouter une opération à la queue
  void addOperation(SyncOperation operation) {
    _syncQueue.add(operation);
    if (!_syncStatusController.isClosed) {
      _syncStatusController.add(SyncStatus(
        pendingCount: _syncQueue.length,
        isSyncing: _isSyncing,
      ));
    }

    // Essayer de synchroniser si en ligne
    if (_connectivityService.isOnline && !_isSyncing) {
      syncPendingOperations();
    }
  }

  /// Synchroniser les opérations en attente
  Future<void> syncPendingOperations() async {
    if (_isSyncing || _syncQueue.isEmpty) {
      return;
    }

    if (!_connectivityService.isOnline) {
      print('⚠️ Impossible de synchroniser: hors ligne');
      return;
    }

    _isSyncing = true;
    if (!_syncStatusController.isClosed) {
      _syncStatusController.add(SyncStatus(
        pendingCount: _syncQueue.length,
        isSyncing: true,
      ));
    }

    print('🔄 Début de la synchronisation (${_syncQueue.length} opérations)');

    final failedOperations = <SyncOperation>[];

    while (_syncQueue.isNotEmpty) {
      final operation = _syncQueue.removeFirst();

      try {
        await _executeOperation(operation);
        print('✅ Opération synchronisée: ${operation.type}');
      } catch (e) {
        print('❌ Échec de synchronisation: ${operation.type} - $e');
        failedOperations.add(operation);
      }

      if (!_syncStatusController.isClosed) {
        _syncStatusController.add(SyncStatus(
          pendingCount: _syncQueue.length,
          isSyncing: true,
        ));
      }
    }

    // Remettre les opérations échouées dans la queue
    for (final operation in failedOperations) {
      _syncQueue.add(operation);
    }

    _isSyncing = false;
    if (!_syncStatusController.isClosed) {
      _syncStatusController.add(SyncStatus(
        pendingCount: _syncQueue.length,
        isSyncing: false,
      ));
    }

    if (failedOperations.isEmpty) {
      print('✅ Synchronisation terminée avec succès');
    } else {
      print('⚠️ Synchronisation terminée avec ${failedOperations.length} échecs');
    }
  }

  /// Exécuter une opération
  Future<void> _executeOperation(SyncOperation operation) async {
    // Simuler l'exécution
    await Future.delayed(const Duration(milliseconds: 500));

    // TODO: Implémenter l'exécution réelle selon le type d'opération
    switch (operation.type) {
      case OperationType.createOrder:
        // Créer la commande via l'API
        break;
      case OperationType.updateOrder:
        // Mettre à jour la commande
        break;
      case OperationType.updateStock:
        // Mettre à jour le stock
        break;
      case OperationType.uploadImage:
        // Upload l'image
        break;
      case OperationType.createPayment:
        // Créer le paiement via l'API
        break;
      case OperationType.updateDelivery:
        // Mettre à jour la livraison
        break;
    }
  }

  /// Obtenir le nombre d'opérations en attente
  int get pendingOperationsCount => _syncQueue.length;

  /// Vider la queue
  void clearQueue() {
    _syncQueue.clear();
    if (!_syncStatusController.isClosed) {
      _syncStatusController.add(SyncStatus(
        pendingCount: 0,
        isSyncing: false,
      ));
    }
  }

  /// Nettoyer les ressources
  void dispose() {
    _connectivitySubscription?.cancel();
    _syncStatusController.close();
  }
}

/// Opération de synchronisation
class SyncOperation {
  final String id;
  final OperationType type;
  final Map<String, dynamic> data;
  final DateTime createdAt;
  final int retryCount;

  SyncOperation({
    required this.id,
    required this.type,
    required this.data,
    DateTime? createdAt,
    this.retryCount = 0,
  }) : createdAt = createdAt ?? DateTime.now();

  SyncOperation copyWith({
    int? retryCount,
  }) {
    return SyncOperation(
      id: id,
      type: type,
      data: data,
      createdAt: createdAt,
      retryCount: retryCount ?? this.retryCount,
    );
  }
}

/// Type d'opération
enum OperationType {
  createOrder,
  updateOrder,
  updateStock,
  uploadImage,
  createPayment,
  updateDelivery,
}

/// Statut de synchronisation
class SyncStatus {
  final int pendingCount;
  final bool isSyncing;

  SyncStatus({
    required this.pendingCount,
    required this.isSyncing,
  });

  bool get hasPendingOperations => pendingCount > 0;
}
