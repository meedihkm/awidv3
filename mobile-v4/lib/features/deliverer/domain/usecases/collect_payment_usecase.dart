import '../entities/payment_collection.dart';
import '../repositories/delivery_actions_repository.dart';

/// Use Case: Encaisser un Paiement
/// Gère le processus complet d'encaissement avec allocation automatique/manuelle
class CollectPaymentUseCase {
  final DeliveryActionsRepository _repository;

  const CollectPaymentUseCase(this._repository);

  /// Encaisse un paiement avec allocation automatique
  Future<CollectPaymentResult> executeAutoAllocation(
    CollectPaymentAutoParams params,
  ) async {
    try {
      // 1. Valider les paramètres
      _validateAutoParams(params);

      // 2. Calculer l'allocation automatique
      final allocations = await _repository.calculateAutoAllocation(
        customerId: params.customerId,
        amount: params.amount,
      );

      if (allocations.isEmpty) {
        return CollectPaymentResult.failure(
          error: 'Aucune commande impayée trouvée pour ce client',
          customerId: params.customerId,
        );
      }

      // 3. Créer le paiement
      final payment = PaymentCollection(
        id: _generatePaymentId(),
        delivererId: params.delivererId,
        customerId: params.customerId,
        customerName: params.customerName,
        amount: params.amount,
        mode: params.mode,
        collectedAt: params.collectedAt ?? DateTime.now(),
        allocations: allocations,
        reference: params.reference,
        notes: params.notes,
        isUploaded: false,
        createdAt: DateTime.now(),
      );

      // 4. Sauvegarder le paiement
      await _repository.savePaymentCollection(payment);

      // 5. Tenter l'upload immédiat
      try {
        await _repository.uploadPaymentCollection(payment.id);
      } catch (uploadError) {
        // L'upload échouera silencieusement, sera retenté plus tard
      }

      return CollectPaymentResult.success(
        paymentId: payment.id,
        customerId: params.customerId,
        amount: params.amount,
        allocations: allocations,
        collectedAt: payment.collectedAt,
      );
    } catch (error) {
      return CollectPaymentResult.failure(
        error: error.toString(),
        customerId: params.customerId,
      );
    }
  }

  /// Encaisse un paiement avec allocation manuelle
  Future<CollectPaymentResult> executeManualAllocation(
    CollectPaymentManualParams params,
  ) async {
    try {
      // 1. Valider les paramètres
      _validateManualParams(params);

      // 2. Vérifier que l'allocation est cohérente
      final totalAllocated = params.allocations
          .fold(0.0, (sum, allocation) => sum + allocation.allocatedAmount);

      if ((params.amount - totalAllocated).abs() > 0.01) {
        return CollectPaymentResult.failure(
          error: 'Le montant alloué (${totalAllocated.toStringAsFixed(2)} DZD) '
              'ne correspond pas au montant reçu (${params.amount.toStringAsFixed(2)} DZD)',
          customerId: params.customerId,
        );
      }

      // 3. Créer le paiement
      final payment = PaymentCollection(
        id: _generatePaymentId(),
        delivererId: params.delivererId,
        customerId: params.customerId,
        customerName: params.customerName,
        amount: params.amount,
        mode: params.mode,
        collectedAt: params.collectedAt ?? DateTime.now(),
        allocations: params.allocations,
        reference: params.reference,
        notes: params.notes,
        isUploaded: false,
        createdAt: DateTime.now(),
      );

      // 4. Sauvegarder le paiement
      await _repository.savePaymentCollection(payment);

      // 5. Tenter l'upload immédiat
      try {
        await _repository.uploadPaymentCollection(payment.id);
      } catch (uploadError) {
        // L'upload échouera silencieusement, sera retenté plus tard
      }

      return CollectPaymentResult.success(
        paymentId: payment.id,
        customerId: params.customerId,
        amount: params.amount,
        allocations: params.allocations,
        collectedAt: payment.collectedAt,
      );
    } catch (error) {
      return CollectPaymentResult.failure(
        error: error.toString(),
        customerId: params.customerId,
      );
    }
  }

  /// Récupère les commandes impayées d'un client
  Future<List<UnpaidOrder>> getUnpaidOrders(String customerId) async {
    if (customerId.isEmpty) {
      throw ArgumentError('L\'ID du client est requis');
    }

    return await _repository.getUnpaidOrders(customerId);
  }

  /// Calcule une proposition d'allocation automatique
  Future<List<PaymentAllocation>> calculateAllocationProposal({
    required String customerId,
    required double amount,
  }) async {
    if (customerId.isEmpty) {
      throw ArgumentError('L\'ID du client est requis');
    }

    if (amount <= 0) {
      throw ArgumentError('Le montant doit être positif');
    }

    return await _repository.calculateAutoAllocation(
      customerId: customerId,
      amount: amount,
    );
  }

  /// Valide les paramètres d'allocation automatique
  void _validateAutoParams(CollectPaymentAutoParams params) {
    if (params.delivererId.isEmpty) {
      throw ArgumentError('L\'ID du livreur est requis');
    }

    if (params.customerId.isEmpty) {
      throw ArgumentError('L\'ID du client est requis');
    }

    if (params.customerName.trim().isEmpty) {
      throw ArgumentError('Le nom du client est requis');
    }

    if (params.amount <= 0) {
      throw ArgumentError('Le montant doit être positif');
    }

    if (params.mode.requiresReference && 
        (params.reference?.trim().isEmpty ?? true)) {
      throw ArgumentError('Une référence est requise pour ce mode de paiement');
    }
  }

  /// Valide les paramètres d'allocation manuelle
  void _validateManualParams(CollectPaymentManualParams params) {
    if (params.delivererId.isEmpty) {
      throw ArgumentError('L\'ID du livreur est requis');
    }

    if (params.customerId.isEmpty) {
      throw ArgumentError('L\'ID du client est requis');
    }

    if (params.customerName.trim().isEmpty) {
      throw ArgumentError('Le nom du client est requis');
    }

    if (params.amount <= 0) {
      throw ArgumentError('Le montant doit être positif');
    }

    if (params.allocations.isEmpty) {
      throw ArgumentError('Au moins une allocation est requise');
    }

    if (params.mode.requiresReference && 
        (params.reference?.trim().isEmpty ?? true)) {
      throw ArgumentError('Une référence est requise pour ce mode de paiement');
    }

    // Vérifier que toutes les allocations sont positives
    for (final allocation in params.allocations) {
      if (allocation.allocatedAmount <= 0) {
        throw ArgumentError('Tous les montants alloués doivent être positifs');
      }
    }
  }

  /// Génère un ID unique pour le paiement
  String _generatePaymentId() {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final random = (timestamp % 10000).toString().padLeft(4, '0');
    return 'payment_${timestamp}_$random';
  }
}

/// Paramètres pour encaissement avec allocation automatique
class CollectPaymentAutoParams {
  final String delivererId;
  final String customerId;
  final String customerName;
  final double amount;
  final PaymentMode mode;
  final DateTime? collectedAt;  // Optionnel: pour les tests, sinon DateTime.now()
  final String? reference;
  final String? notes;

  const CollectPaymentAutoParams({
    required this.delivererId,
    required this.customerId,
    required this.customerName,
    required this.amount,
    required this.mode,
    this.collectedAt,  // Optionnel
    this.reference,
    this.notes,
  });

  /// Vérifie si les paramètres sont valides
  bool get isValid {
    return delivererId.isNotEmpty &&
        customerId.isNotEmpty &&
        customerName.trim().isNotEmpty &&
        amount > 0 &&
        (!mode.requiresReference || (reference?.trim().isNotEmpty ?? false));
  }
}

/// Paramètres pour encaissement avec allocation manuelle
class CollectPaymentManualParams {
  final String delivererId;
  final String customerId;
  final String customerName;
  final double amount;
  final PaymentMode mode;
  final DateTime? collectedAt;  // Optionnel: pour les tests, sinon DateTime.now()
  final List<PaymentAllocation> allocations;
  final String? reference;
  final String? notes;

  const CollectPaymentManualParams({
    required this.delivererId,
    required this.customerId,
    required this.customerName,
    required this.amount,
    required this.mode,
    this.collectedAt,  // Optionnel
    required this.allocations,
    this.reference,
    this.notes,
  });

  /// Vérifie si les paramètres sont valides
  bool get isValid {
    return delivererId.isNotEmpty &&
        customerId.isNotEmpty &&
        customerName.trim().isNotEmpty &&
        amount > 0 &&
        allocations.isNotEmpty &&
        (!mode.requiresReference || (reference?.trim().isNotEmpty ?? false));
  }

  /// Retourne le montant total alloué
  double get totalAllocated {
    return allocations.fold(0.0, (sum, allocation) => sum + allocation.allocatedAmount);
  }

  /// Vérifie si l'allocation est équilibrée
  bool get isBalanced {
    return (amount - totalAllocated).abs() <= 0.01;
  }
}

/// Résultat de l'encaissement
abstract class CollectPaymentResult {
  const CollectPaymentResult();

  /// Résultat de succès
  factory CollectPaymentResult.success({
    required String paymentId,
    required String customerId,
    required double amount,
    required List<PaymentAllocation> allocations,
    required DateTime collectedAt,
  }) = CollectPaymentSuccess;

  /// Résultat d'échec
  factory CollectPaymentResult.failure({
    required String error,
    required String customerId,
  }) = CollectPaymentFailure;

  /// Vérifie si l'opération a réussi
  bool get isSuccess => this is CollectPaymentSuccess;

  /// Vérifie si l'opération a échoué
  bool get isFailure => this is CollectPaymentFailure;
}

/// Résultat de succès
class CollectPaymentSuccess extends CollectPaymentResult {
  final String paymentId;
  final String customerId;
  final double amount;
  final List<PaymentAllocation> allocations;
  final DateTime collectedAt;

  const CollectPaymentSuccess({
    required this.paymentId,
    required this.customerId,
    required this.amount,
    required this.allocations,
    required this.collectedAt,
  });

  /// Retourne le montant formaté
  String get amountFormatted {
    return '${amount.toStringAsFixed(0).replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]} ',
        )} DZD';
  }

  /// Retourne le nombre de commandes payées
  int get ordersCount => allocations.length;

  /// Retourne la date formatée
  String get collectedAtFormatted {
    return '${collectedAt.day.toString().padLeft(2, '0')}/'
        '${collectedAt.month.toString().padLeft(2, '0')}/'
        '${collectedAt.year} à '
        '${collectedAt.hour.toString().padLeft(2, '0')}:'
        '${collectedAt.minute.toString().padLeft(2, '0')}';
  }
}

/// Résultat d'échec
class CollectPaymentFailure extends CollectPaymentResult {
  final String error;
  final String customerId;

  const CollectPaymentFailure({
    required this.error,
    required this.customerId,
  });

  /// Vérifie si l'erreur est liée à la validation
  bool get isValidationError {
    return error.contains('requis') || 
           error.contains('positif') || 
           error.contains('correspond pas');
  }

  /// Vérifie si l'erreur est liée aux données
  bool get isDataError {
    return error.contains('Aucune commande') || 
           error.contains('trouvée');
  }
}


/// Allocation manuelle pour le widget
class ManualAllocation {
  final String orderId;
  final double amount;

  const ManualAllocation({
    required this.orderId,
    required this.amount,
  });
}
