import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/proof_of_delivery.dart';
import '../../domain/repositories/delivery_actions_repository.dart';

part 'proof_of_delivery_model.freezed.dart';
part 'proof_of_delivery_model.g.dart';

/// Model: Preuve de Livraison
/// Model pour la sérialisation JSON de la preuve de livraison
@freezed
class ProofOfDeliveryModel with _$ProofOfDeliveryModel {
  const factory ProofOfDeliveryModel({
    required String id,
    @JsonKey(name: 'delivery_id') required String deliveryId,
    @JsonKey(name: 'deliverer_id') required String delivererId,
    @JsonKey(name: 'customer_id') required String customerId,
    required DateTime timestamp,
    required double latitude,
    required double longitude,
    @JsonKey(name: 'signatory_name') required String signatoryName,
    @JsonKey(name: 'signature_image_path') required String signatureImagePath,
    @JsonKey(name: 'photos_paths') required List<String> photosPaths,
    String? notes,
    @JsonKey(name: 'customer_feedback') String? customerFeedback,
    @JsonKey(name: 'is_uploaded') @Default(false) bool isUploaded,
    @JsonKey(name: 'uploaded_at') DateTime? uploadedAt,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _ProofOfDeliveryModel;

  factory ProofOfDeliveryModel.fromJson(Map<String, dynamic> json) =>
      _$ProofOfDeliveryModelFromJson(json);
}

extension ProofOfDeliveryModelX on ProofOfDeliveryModel {
  /// Convertit le model en entité domain
  ProofOfDelivery toEntity() {
    return ProofOfDelivery(
      id: id,
      deliveryId: deliveryId,
      delivererId: delivererId,
      customerId: customerId,
      timestamp: timestamp,
      latitude: latitude,
      longitude: longitude,
      signatoryName: signatoryName,
      signatureImagePath: signatureImagePath,
      photosPaths: photosPaths,
      notes: notes,
      customerFeedback: customerFeedback,
      isUploaded: isUploaded,
      uploadedAt: uploadedAt,
      createdAt: createdAt,
    );
  }

  /// Crée un model pour l'upload vers l'API
  Map<String, dynamic> toUploadJson() {
    return {
      'delivery_id': deliveryId,
      'deliverer_id': delivererId,
      'customer_id': customerId,
      'timestamp': timestamp.toIso8601String(),
      'latitude': latitude,
      'longitude': longitude,
      'signatory_name': signatoryName,
      'signature_image_path': signatureImagePath,
      'photos_paths': photosPaths,
      if (notes?.isNotEmpty == true) 'notes': notes,
      if (customerFeedback?.isNotEmpty == true) 'customer_feedback': customerFeedback,
    };
  }
}

/// Crée un ProofOfDeliveryModel à partir d'une entité domain
ProofOfDeliveryModel proofOfDeliveryModelFromEntity(ProofOfDelivery entity) {
  return ProofOfDeliveryModel(
    id: entity.id,
    deliveryId: entity.deliveryId,
    delivererId: entity.delivererId,
    customerId: entity.customerId,
    timestamp: entity.timestamp,
    latitude: entity.latitude,
    longitude: entity.longitude,
    signatoryName: entity.signatoryName,
    signatureImagePath: entity.signatureImagePath,
    photosPaths: entity.photosPaths,
    notes: entity.notes,
    customerFeedback: entity.customerFeedback,
    isUploaded: entity.isUploaded,
    uploadedAt: entity.uploadedAt,
    createdAt: entity.createdAt,
  );
}

/// Crée un ProofOfDeliveryModel à partir de la réponse API
ProofOfDeliveryModel proofOfDeliveryModelFromApiResponse(Map<String, dynamic> json) {
  return ProofOfDeliveryModel(
    id: json['id'] as String,
    deliveryId: json['delivery_id'] as String,
    delivererId: json['deliverer_id'] as String,
    customerId: json['customer_id'] as String,
    timestamp: DateTime.parse(json['timestamp'] as String),
    latitude: (json['latitude'] as num).toDouble(),
    longitude: (json['longitude'] as num).toDouble(),
    signatoryName: json['signatory_name'] as String,
    signatureImagePath: json['signature_image_path'] as String,
    photosPaths: List<String>.from(json['photos_paths'] as List),
    notes: json['notes'] as String?,
    customerFeedback: json['customer_feedback'] as String?,
    isUploaded: json['is_uploaded'] as bool? ?? true,
    uploadedAt: json['uploaded_at'] != null 
        ? DateTime.parse(json['uploaded_at'] as String)
        : null,
    createdAt: json['created_at'] != null 
        ? DateTime.parse(json['created_at'] as String)
        : null,
  );
}

/// Model pour la requête d'upload de preuve
@freezed
class UploadProofRequest with _$UploadProofRequest {
  const factory UploadProofRequest({
    @JsonKey(name: 'delivery_id') required String deliveryId,
    @JsonKey(name: 'deliverer_id') required String delivererId,
    @JsonKey(name: 'customer_id') required String customerId,
    required DateTime timestamp,
    required double latitude,
    required double longitude,
    @JsonKey(name: 'signatory_name') required String signatoryName,
    @JsonKey(name: 'signature_image') required String signatureImageBase64,
    @JsonKey(name: 'photos') required List<String> photosBase64,
    String? notes,
    @JsonKey(name: 'customer_feedback') String? customerFeedback,
  }) = _UploadProofRequest;

  factory UploadProofRequest.fromJson(Map<String, dynamic> json) =>
      _$UploadProofRequestFromJson(json);
}

/// Model pour la réponse d'upload de preuve
@freezed
class UploadProofResponse with _$UploadProofResponse {
  const factory UploadProofResponse({
    required String id,
    required String status,
    required String message,
    @JsonKey(name: 'uploaded_at') required DateTime uploadedAt,
    @JsonKey(name: 'signature_url') String? signatureUrl,
    @JsonKey(name: 'photos_urls') List<String>? photosUrls,
  }) = _UploadProofResponse;

  factory UploadProofResponse.fromJson(Map<String, dynamic> json) =>
      _$UploadProofResponseFromJson(json);
}

extension UploadProofResponseX on UploadProofResponse {
  /// Vérifie si l'upload a réussi
  bool get isSuccess => status == 'success' || status == 'uploaded';

  /// Vérifie si l'upload a échoué
  bool get isFailure => status == 'error' || status == 'failed';

  /// Retourne le nombre de photos uploadées
  int get photosCount => photosUrls?.length ?? 0;

  /// Vérifie si toutes les URLs sont présentes
  bool get hasAllUrls => signatureUrl?.isNotEmpty == true && photosCount > 0;
}