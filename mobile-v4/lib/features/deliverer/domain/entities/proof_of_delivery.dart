import 'package:freezed_annotation/freezed_annotation.dart';

part 'proof_of_delivery.freezed.dart';
part 'proof_of_delivery.g.dart';

/// Preuve de Livraison
/// Entité représentant une preuve de livraison complète
@freezed
class ProofOfDelivery with _$ProofOfDelivery {
  const factory ProofOfDelivery({
    required String id,
    required String deliveryId,
    required String delivererId,
    required String customerId,
    required DateTime timestamp,
    required double latitude,
    required double longitude,
    required String signatoryName,
    required String signatureImagePath,
    required List<String> photosPaths,
    String? notes,
    String? customerFeedback,
    @Default(false) bool isUploaded,
    DateTime? uploadedAt,
    DateTime? createdAt,
  }) = _ProofOfDelivery;

  factory ProofOfDelivery.fromJson(Map<String, dynamic> json) =>
      _$ProofOfDeliveryFromJson(json);
}

extension ProofOfDeliveryX on ProofOfDelivery {
  /// Vérifie si la preuve est complète
  bool get isComplete {
    return signatoryName.isNotEmpty &&
        signatureImagePath.isNotEmpty &&
        photosPaths.isNotEmpty;
  }

  /// Vérifie si la preuve est valide (dans les 24h)
  bool get isValid {
    final now = DateTime.now();
    final difference = now.difference(timestamp);
    return difference.inHours <= 24;
  }

  /// Retourne le statut d'upload
  String get uploadStatus {
    if (isUploaded) return 'Synchronisé';
    if (!isComplete) return 'Incomplet';
    return 'En attente';
  }

  /// Retourne l'icône de statut
  String get statusIcon {
    if (isUploaded) return '✅';
    if (!isComplete) return '⚠️';
    return '⏳';
  }

  /// Retourne la couleur de statut
  String get statusColor {
    if (isUploaded) return 'green';
    if (!isComplete) return 'orange';
    return 'blue';
  }

  /// Retourne l'adresse formatée
  String get locationFormatted {
    return '${latitude.toStringAsFixed(6)}, ${longitude.toStringAsFixed(6)}';
  }

  /// Retourne le timestamp formaté
  String get timestampFormatted {
    return '${timestamp.day.toString().padLeft(2, '0')}/'
        '${timestamp.month.toString().padLeft(2, '0')}/'
        '${timestamp.year} à '
        '${timestamp.hour.toString().padLeft(2, '0')}:'
        '${timestamp.minute.toString().padLeft(2, '0')}';
  }

  /// Retourne le nombre de photos
  int get photosCount => photosPaths.length;

  /// Vérifie si toutes les photos sont présentes
  bool get hasAllPhotos => photosPaths.length >= 2; // Minimum 2 photos

  /// Retourne la taille estimée en MB
  double get estimatedSizeMB {
    // Estimation: signature ~100KB + photos ~2MB chacune
    return 0.1 + (photosPaths.length * 2.0);
  }

  /// Vérifie si la preuve peut être uploadée
  bool get canBeUploaded {
    return isComplete && !isUploaded && isValid;
  }

  /// Retourne un résumé de la preuve
  String get summary {
    return 'Signé par $signatoryName le $timestampFormatted'
        '${notes?.isNotEmpty == true ? ' - $notes' : ''}';
  }
}