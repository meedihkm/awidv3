import '../entities/packaging_transaction.dart';
import '../entities/packaging_type.dart';
import '../repositories/delivery_actions_repository.dart';

/// Use Case: Gérer les Consignes
/// Gère les transactions de consignes (dépôt/retour) avec scan QR et calcul de solde
class ManagePackagingUseCase {
  final DeliveryActionsRepository _repository;

  const ManagePackagingUseCase(this._repository);

  /// Enregistre un dépôt de consignes
  Future<ManagePackagingResult> recordDeposit(
    PackagingDepositParams params,
  ) async {
    try {
      // 1. Valider les paramètres
      _validateDepositParams(params);

      // 2. Créer la transaction
      final transaction = PackagingTransaction(
        id: _generateTransactionId(),
        delivererId: params.delivererId,
        customerId: params.customerId,
        customerName: params.customerName,
        type: PackagingTransactionType.deposit,
        items: params.items.map((item) => PackagingItem(
          packagingId: item.packagingTypeId,
          packagingName: item.packagingName,
          quantity: item.quantity,
          unitValue: item.unitValue,
        )).toList(),
        transactionDate: DateTime.now(),
        notes: params.notes,
        qrCodeData: params.qrCodeData,
        isUploaded: false,
        createdAt: DateTime.now(),
      );

      // 3. Sauvegarder la transaction
      await _repository.savePackagingTransaction(transaction);

      // 4. Tenter l'upload immédiat
      try {
        await _repository.uploadPackagingTransaction(transaction.id);
      } catch (uploadError) {
        // L'upload échouera silencieusement, sera retenté plus tard
      }

      // 5. Récupérer le nouveau solde
      final newBalance = await _repository.getPackagingBalance(params.customerId);

      return ManagePackagingResult.success(
        transactionId: transaction.id,
        customerId: params.customerId,
        type: PackagingTransactionType.deposit,
        totalValue: transaction.totalValue,
        newBalance: newBalance,
        transactionDate: transaction.transactionDate,
      );
    } catch (error) {
      return ManagePackagingResult.failure(
        error: error.toString(),
        customerId: params.customerId,
        type: PackagingTransactionType.deposit,
      );
    }
  }

  /// Enregistre un retour de consignes
  Future<ManagePackagingResult> recordReturn(
    PackagingReturnParams params,
  ) async {
    try {
      // 1. Valider les paramètres
      _validateReturnParams(params);

      // 2. Vérifier le solde disponible
      final currentBalance = await _repository.getPackagingBalance(params.customerId);
      final returnValue = params.items.fold(
        0.0,
        (sum, item) => sum + (item.quantity * item.unitValue),
      );

      if (currentBalance.totalValue < returnValue) {
        return ManagePackagingResult.failure(
          error: 'Solde consignes insuffisant. '
              'Disponible: ${currentBalance.totalValue.toStringAsFixed(0)} DZD, '
              'Demandé: ${returnValue.toStringAsFixed(0)} DZD',
          customerId: params.customerId,
          type: PackagingTransactionType.return_,
        );
      }

      // 3. Créer la transaction
      final transaction = PackagingTransaction(
        id: _generateTransactionId(),
        delivererId: params.delivererId,
        customerId: params.customerId,
        customerName: params.customerName,
        type: PackagingTransactionType.return_,
        items: params.items.map((item) => PackagingItem(
          packagingId: item.packagingTypeId,
          packagingName: item.packagingName,
          quantity: item.quantity,
          unitValue: item.unitValue,
        )).toList(),
        transactionDate: DateTime.now(),
        notes: params.notes,
        qrCodeData: params.qrCodeData,
        isUploaded: false,
        createdAt: DateTime.now(),
      );

      // 4. Sauvegarder la transaction
      await _repository.savePackagingTransaction(transaction);

      // 5. Tenter l'upload immédiat
      try {
        await _repository.uploadPackagingTransaction(transaction.id);
      } catch (uploadError) {
        // L'upload échouera silencieusement, sera retenté plus tard
      }

      // 6. Récupérer le nouveau solde
      final newBalance = await _repository.getPackagingBalance(params.customerId);

      return ManagePackagingResult.success(
        transactionId: transaction.id,
        customerId: params.customerId,
        type: PackagingTransactionType.return_,
        totalValue: transaction.totalValue,
        newBalance: newBalance,
        transactionDate: transaction.transactionDate,
      );
    } catch (error) {
      return ManagePackagingResult.failure(
        error: error.toString(),
        customerId: params.customerId,
        type: PackagingTransactionType.return_,
      );
    }
  }

  /// Scan un QR code de consigne
  Future<PackagingQrResult> scanQrCode(String qrData) async {
    try {
      if (qrData.trim().isEmpty) {
        return PackagingQrResult.failure('QR code vide');
      }

      final qrInfo = await _repository.scanPackagingQrCode(qrData);
      
      if (qrInfo == null) {
        return PackagingQrResult.failure('QR code invalide ou non reconnu');
      }

      return PackagingQrResult.success(qrInfo);
    } catch (error) {
      return PackagingQrResult.failure(error.toString());
    }
  }

  /// Récupère le solde consignes d'un client
  Future<PackagingBalance> getPackagingBalance(String customerId) async {
    if (customerId.isEmpty) {
      throw ArgumentError('L\'ID du client est requis');
    }

    return await _repository.getPackagingBalance(customerId);
  }

  /// Récupère les types de consignes disponibles
  Future<List<PackagingType>> getPackagingTypes() async {
    return await _repository.getPackagingTypes();
  }

  /// Récupère l'historique des transactions de consignes
  Future<List<PackagingTransaction>> getTransactionHistory({
    required String delivererId,
    String? customerId,
    DateTime? startDate,
    DateTime? endDate,
    PackagingTransactionType? type,
  }) async {
    if (delivererId.isEmpty) {
      throw ArgumentError('L\'ID du livreur est requis');
    }

    return await _repository.getPackagingTransactions(
      delivererId: delivererId,
      startDate: startDate,
      endDate: endDate,
      type: type,
    );
  }

  /// Valide les paramètres de dépôt
  void _validateDepositParams(PackagingDepositParams params) {
    if (params.delivererId.isEmpty) {
      throw ArgumentError('L\'ID du livreur est requis');
    }

    if (params.customerId.isEmpty) {
      throw ArgumentError('L\'ID du client est requis');
    }

    if (params.customerName.trim().isEmpty) {
      throw ArgumentError('Le nom du client est requis');
    }

    if (params.items.isEmpty) {
      throw ArgumentError('Au moins un article de consigne est requis');
    }

    for (final item in params.items) {
      if (item.quantity <= 0) {
        throw ArgumentError('La quantité doit être positive pour ${item.packagingName}');
      }
      if (item.unitValue <= 0) {
        throw ArgumentError('La valeur unitaire doit être positive pour ${item.packagingName}');
      }
    }
  }

  /// Valide les paramètres de retour
  void _validateReturnParams(PackagingReturnParams params) {
    if (params.delivererId.isEmpty) {
      throw ArgumentError('L\'ID du livreur est requis');
    }

    if (params.customerId.isEmpty) {
      throw ArgumentError('L\'ID du client est requis');
    }

    if (params.customerName.trim().isEmpty) {
      throw ArgumentError('Le nom du client est requis');
    }

    if (params.items.isEmpty) {
      throw ArgumentError('Au moins un article de consigne est requis');
    }

    for (final item in params.items) {
      if (item.quantity <= 0) {
        throw ArgumentError('La quantité doit être positive pour ${item.packagingName}');
      }
      if (item.unitValue <= 0) {
        throw ArgumentError('La valeur unitaire doit être positive pour ${item.packagingName}');
      }
    }
  }

  /// Génère un ID unique pour la transaction
  String _generateTransactionId() {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final random = (timestamp % 10000).toString().padLeft(4, '0');
    return 'packaging_${timestamp}_$random';
  }
}

/// Paramètres pour dépôt de consignes
class PackagingDepositParams {
  final String delivererId;
  final String customerId;
  final String customerName;
  final List<PackagingItem> items;
  final String? notes;
  final String? qrCodeData;

  const PackagingDepositParams({
    required this.delivererId,
    required this.customerId,
    required this.customerName,
    required this.items,
    this.notes,
    this.qrCodeData,
  });

  /// Vérifie si les paramètres sont valides
  bool get isValid {
    return delivererId.isNotEmpty &&
        customerId.isNotEmpty &&
        customerName.trim().isNotEmpty &&
        items.isNotEmpty &&
        items.every((item) => item.quantity > 0 && item.unitValue > 0);
  }

  /// Retourne la valeur totale
  double get totalValue {
    return items.fold(0.0, (sum, item) => sum + (item.quantity * item.unitValue));
  }

  /// Retourne le nombre total d'articles
  int get totalItems {
    return items.fold(0, (sum, item) => sum + item.quantity);
  }
}

/// Paramètres pour retour de consignes
class PackagingReturnParams {
  final String delivererId;
  final String customerId;
  final String customerName;
  final List<PackagingItem> items;
  final String? notes;
  final String? qrCodeData;

  const PackagingReturnParams({
    required this.delivererId,
    required this.customerId,
    required this.customerName,
    required this.items,
    this.notes,
    this.qrCodeData,
  });

  /// Vérifie si les paramètres sont valides
  bool get isValid {
    return delivererId.isNotEmpty &&
        customerId.isNotEmpty &&
        customerName.trim().isNotEmpty &&
        items.isNotEmpty &&
        items.every((item) => item.quantity > 0 && item.unitValue > 0);
  }

  /// Retourne la valeur totale
  double get totalValue {
    return items.fold(0.0, (sum, item) => sum + (item.quantity * item.unitValue));
  }

  /// Retourne le nombre total d'articles
  int get totalItems {
    return items.fold(0, (sum, item) => sum + item.quantity);
  }
}

/// Résultat de gestion des consignes
abstract class ManagePackagingResult {
  const ManagePackagingResult();

  /// Résultat de succès
  factory ManagePackagingResult.success({
    required String transactionId,
    required String customerId,
    required PackagingTransactionType type,
    required double totalValue,
    required PackagingBalance newBalance,
    required DateTime transactionDate,
  }) = ManagePackagingSuccess;

  /// Résultat d'échec
  factory ManagePackagingResult.failure({
    required String error,
    required String customerId,
    required PackagingTransactionType type,
  }) = ManagePackagingFailure;

  /// Vérifie si l'opération a réussi
  bool get isSuccess => this is ManagePackagingSuccess;

  /// Vérifie si l'opération a échoué
  bool get isFailure => this is ManagePackagingFailure;
}

/// Résultat de succès
class ManagePackagingSuccess extends ManagePackagingResult {
  final String transactionId;
  final String customerId;
  final PackagingTransactionType type;
  final double totalValue;
  final PackagingBalance newBalance;
  final DateTime transactionDate;

  const ManagePackagingSuccess({
    required this.transactionId,
    required this.customerId,
    required this.type,
    required this.totalValue,
    required this.newBalance,
    required this.transactionDate,
  });

  /// Retourne la valeur formatée
  String get totalValueFormatted {
    return '${totalValue.toStringAsFixed(0).replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]} ',
        )} DZD';
  }

  /// Retourne le nouveau solde formaté
  String get newBalanceFormatted {
    return '${newBalance.totalValue.toStringAsFixed(0).replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]} ',
        )} DZD';
  }
}

/// Résultat d'échec
class ManagePackagingFailure extends ManagePackagingResult {
  final String error;
  final String customerId;
  final PackagingTransactionType type;

  const ManagePackagingFailure({
    required this.error,
    required this.customerId,
    required this.type,
  });

  /// Vérifie si l'erreur est liée au solde
  bool get isBalanceError {
    return error.contains('Solde') || error.contains('insuffisant');
  }

  /// Vérifie si l'erreur est liée à la validation
  bool get isValidationError {
    return error.contains('requis') || error.contains('positive');
  }
}

/// Résultat du scan QR
abstract class PackagingQrResult {
  const PackagingQrResult();

  /// Résultat de succès
  factory PackagingQrResult.success(PackagingQrData data) = PackagingQrSuccess;

  /// Résultat d'échec
  factory PackagingQrResult.failure(String error) = PackagingQrFailure;

  /// Vérifie si le scan a réussi
  bool get isSuccess => this is PackagingQrSuccess;

  /// Vérifie si le scan a échoué
  bool get isFailure => this is PackagingQrFailure;
}

/// Résultat de succès du scan QR
class PackagingQrSuccess extends PackagingQrResult {
  final PackagingQrData data;

  const PackagingQrSuccess(this.data);
}

/// Résultat d'échec du scan QR
class PackagingQrFailure extends PackagingQrResult {
  final String error;

  const PackagingQrFailure(this.error);
}


