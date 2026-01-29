// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proof_of_delivery.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProofOfDelivery _$ProofOfDeliveryFromJson(Map<String, dynamic> json) =>
    _ProofOfDelivery(
      id: json['id'] as String,
      deliveryId: json['delivery_id'] as String,
      delivererId: json['deliverer_id'] as String,
      customerId: json['customer_id'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      signatoryName: json['signatory_name'] as String,
      signatureImagePath: json['signature_image_path'] as String,
      photosPaths: (json['photos_paths'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      notes: json['notes'] as String?,
      customerFeedback: json['customer_feedback'] as String?,
      isUploaded: json['is_uploaded'] as bool? ?? false,
      uploadedAt: json['uploaded_at'] == null
          ? null
          : DateTime.parse(json['uploaded_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$ProofOfDeliveryToJson(_ProofOfDelivery instance) =>
    <String, dynamic>{
      'id': instance.id,
      'delivery_id': instance.deliveryId,
      'deliverer_id': instance.delivererId,
      'customer_id': instance.customerId,
      'timestamp': instance.timestamp.toIso8601String(),
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'signatory_name': instance.signatoryName,
      'signature_image_path': instance.signatureImagePath,
      'photos_paths': instance.photosPaths,
      'notes': instance.notes,
      'customer_feedback': instance.customerFeedback,
      'is_uploaded': instance.isUploaded,
      'uploaded_at': instance.uploadedAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
    };
