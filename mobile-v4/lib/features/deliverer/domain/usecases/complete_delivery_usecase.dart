import '../entities/proof_of_delivery.dart';
import '../repositories/delivery_actions_repository.dart';
import '../repositories/deliverer_repository.dart';

/// Use Case: Finaliser une Livraison
/// Gère le processus complet de finalisation d'une livraison avec preuve
class CompleteDeliveryUseCase {
  final DeliveryActionsRepository _actionsRepository;
  final DelivererRepository _delivererRepository;

  const CompleteDeliveryUseCase(
    this._actionsRepository,
    this._delivererRepository,
  );

  /// Finalise une livraison avec preuve de livraison
  Future<CompleteDeliveryResult> execute(CompleteDeliveryParams params) async {
    try {
      // 1. Valider les paramètres
      _validateParams(params);

      // 2. Utiliser le timestamp fourni ou DateTime.now()
      final effectiveTimestamp = params.timestamp ?? DateTime.now();

      // 3. Créer la preuve de livraison
      final proof = ProofOfDelivery(
        id: _generateProofId(),
        deliveryId: params.deliveryId,
        delivererId: params.delivererId,
        customerId: params.customerId,
        timestamp: effectiveTimestamp,
        latitude: params.latitude,
        longitude: params.longitude,
        signatoryName: params.signatoryName,
        signatureImagePath: params.signatureImagePath,
        photosPaths: params.photosPaths,
        notes: params.notes,
        customerFeedback: params.customerFeedback,
        isUploaded: false,
        createdAt: effectiveTimestamp,
      );

      // 4. Sauvegarder la preuve localement
      await _actionsRepository.saveProofOfDelivery(proof);

      // 5. Mettre à jour le statut de la livraison
      await _delivererRepository.completeDelivery(
        deliveryId: params.deliveryId,
        notes: params.notes,
      );

      // 6. Tenter l'upload immédiat (si connexion disponible)
      try {
        await _actionsRepository.uploadProofOfDelivery(proof.id);
      } catch (uploadError) {
        // L'upload échouera silencieusement, sera retenté plus tard
        // La preuve reste marquée comme non uploadée
      }

      return CompleteDeliveryResult.success(
        proofId: proof.id,
        deliveryId: params.deliveryId,
        completedAt: proof.timestamp,
      );
    } catch (error) {
      return CompleteDeliveryResult.failure(
        error: error.toString(),
        deliveryId: params.deliveryId,
      );
    }
  }

  /// Valide les paramètres d'entrée
  void _validateParams(CompleteDeliveryParams params) {
    if (params.deliveryId.isEmpty) {
      throw ArgumentError('L\'ID de livraison est requis');
    }

    if (params.delivererId.isEmpty) {
      throw ArgumentError('L\'ID du livreur est requis');
    }

    if (params.customerId.isEmpty) {
      throw ArgumentError('L\'ID du client est requis');
    }

    if (params.signatoryName.trim().isEmpty) {
      throw ArgumentError('Le nom du signataire est requis');
    }

    if (params.signatureImagePath.isEmpty) {
      throw ArgumentError('La signature est requise');
    }

    if (params.photosPaths.isEmpty) {
      throw ArgumentError('Au moins une photo est requise');
    }

    if (params.latitude < -90 || params.latitude > 90) {
      throw ArgumentError('Latitude invalide');
    }

    if (params.longitude < -180 || params.longitude > 180) {
      throw ArgumentError('Longitude invalide');
    }
  }

  /// Génère un ID unique pour la preuve de livraison
  String _generateProofId() {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final random = (timestamp % 10000).toString().padLeft(4, '0');
    return 'proof_${timestamp}_$random';
  }
}

/// Paramètres pour finaliser une livraison
class CompleteDeliveryParams {
  final String deliveryId;
  final String delivererId;
  final String customerId;
  final DateTime? timestamp;  // Optionnel: pour les tests, sinon DateTime.now()
  final double latitude;
  final double longitude;
  final String signatoryName;
  final String signatureImagePath;
  final List<String> photosPaths;
  final String? notes;
  final String? customerFeedback;

  const CompleteDeliveryParams({
    required this.deliveryId,
    required this.delivererId,
    required this.customerId,
    this.timestamp,  // Optionnel
    required this.latitude,
    required this.longitude,
    required this.signatoryName,
    required this.signatureImagePath,
    required this.photosPaths,
    this.notes,
    this.customerFeedback,
  });

  /// Vérifie si les paramètres sont valides
  bool get isValid {
    return deliveryId.isNotEmpty &&
        delivererId.isNotEmpty &&
        customerId.isNotEmpty &&
        signatoryName.trim().isNotEmpty &&
        signatureImagePath.isNotEmpty &&
        photosPaths.isNotEmpty &&
        latitude >= -90 &&
        latitude <= 90 &&
        longitude >= -180 &&
        longitude <= 180;
  }

  /// Retourne le nombre de photos
  int get photosCount => photosPaths.length;

  /// Vérifie si des notes sont présentes
  bool get hasNotes => notes?.isNotEmpty == true;

  /// Vérifie si un feedback client est présent
  bool get hasCustomerFeedback => customerFeedback?.isNotEmpty == true;
}

/// Résultat de la finalisation de livraison
abstract class CompleteDeliveryResult {
  const CompleteDeliveryResult();

  /// Résultat de succès
  factory CompleteDeliveryResult.success({
    required String proofId,
    required String deliveryId,
    required DateTime completedAt,
  }) = CompleteDeliverySuccess;

  /// Résultat d'échec
  factory CompleteDeliveryResult.failure({
    required String error,
    required String deliveryId,
  }) = CompleteDeliveryFailure;

  /// Vérifie si l'opération a réussi
  bool get isSuccess => this is CompleteDeliverySuccess;

  /// Vérifie si l'opération a échoué
  bool get isFailure => this is CompleteDeliveryFailure;
}

/// Résultat de succès
class CompleteDeliverySuccess extends CompleteDeliveryResult {
  final String proofId;
  final String deliveryId;
  final DateTime completedAt;

  const CompleteDeliverySuccess({
    required this.proofId,
    required this.deliveryId,
    required this.completedAt,
  });

  /// Retourne la date formatée
  String get completedAtFormatted {
    return '${completedAt.day.toString().padLeft(2, '0')}/'
        '${completedAt.month.toString().padLeft(2, '0')}/'
        '${completedAt.year} à '
        '${completedAt.hour.toString().padLeft(2, '0')}:'
        '${completedAt.minute.toString().padLeft(2, '0')}';
  }
}

/// Résultat d'échec
class CompleteDeliveryFailure extends CompleteDeliveryResult {
  final String error;
  final String deliveryId;

  const CompleteDeliveryFailure({
    required this.error,
    required this.deliveryId,
  });

  /// Vérifie si l'erreur est liée à la validation
  bool get isValidationError {
    return error.contains('requis') || 
           error.contains('invalide') || 
           error.contains('ArgumentError');
  }

  /// Vérifie si l'erreur est liée au réseau
  bool get isNetworkError {
    return error.contains('network') || 
           error.contains('connection') || 
           error.contains('timeout');
  }

  /// Vérifie si l'erreur est liée au stockage
  bool get isStorageError {
    return error.contains('storage') || 
           error.contains('file') || 
           error.contains('permission');
  }
}