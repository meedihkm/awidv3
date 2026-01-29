// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_delivery_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CustomerDeliveryModel _$CustomerDeliveryModelFromJson(
        Map<String, dynamic> json) =>
    _CustomerDeliveryModel(
      id: json['id'] as String,
      deliveryNumber: json['delivery_number'] as String,
      customerId: json['customer_id'] as String,
      customerName: json['customer_name'] as String,
      delivererId: json['deliverer_id'] as String,
      delivererName: json['deliverer_name'] as String,
      delivererPhone: json['deliverer_phone'] as String?,
      delivererPhoto: json['deliverer_photo'] as String?,
      orderIds:
          (json['order_ids'] as List<dynamic>).map((e) => e as String).toList(),
      ordersCount: (json['orders_count'] as num).toInt(),
      totalAmount: (json['total_amount'] as num).toDouble(),
      status: json['status'] as String,
      scheduledDate: DateTime.parse(json['scheduled_date'] as String),
      startedAt: json['started_at'] == null
          ? null
          : DateTime.parse(json['started_at'] as String),
      estimatedArrival: json['estimated_arrival'] == null
          ? null
          : DateTime.parse(json['estimated_arrival'] as String),
      completedAt: json['completed_at'] == null
          ? null
          : DateTime.parse(json['completed_at'] as String),
      deliveryAddress: json['delivery_address'] as String,
      deliveryLatitude: (json['delivery_latitude'] as num?)?.toDouble(),
      deliveryLongitude: (json['delivery_longitude'] as num?)?.toDouble(),
      currentLatitude: (json['current_latitude'] as num?)?.toDouble(),
      currentLongitude: (json['current_longitude'] as num?)?.toDouble(),
      distanceRemaining: (json['distance_remaining'] as num?)?.toDouble(),
      trackingPoints: (json['tracking_points'] as List<dynamic>?)
          ?.map((e) =>
              DeliveryTrackingPointModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      notes: json['notes'] as String?,
      proofOfDeliveryId: json['proof_of_delivery_id'] as String?,
      hasProofOfDelivery: json['has_proof_of_delivery'] as bool? ?? false,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$CustomerDeliveryModelToJson(
        _CustomerDeliveryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'delivery_number': instance.deliveryNumber,
      'customer_id': instance.customerId,
      'customer_name': instance.customerName,
      'deliverer_id': instance.delivererId,
      'deliverer_name': instance.delivererName,
      'deliverer_phone': instance.delivererPhone,
      'deliverer_photo': instance.delivererPhoto,
      'order_ids': instance.orderIds,
      'orders_count': instance.ordersCount,
      'total_amount': instance.totalAmount,
      'status': instance.status,
      'scheduled_date': instance.scheduledDate.toIso8601String(),
      'started_at': instance.startedAt?.toIso8601String(),
      'estimated_arrival': instance.estimatedArrival?.toIso8601String(),
      'completed_at': instance.completedAt?.toIso8601String(),
      'delivery_address': instance.deliveryAddress,
      'delivery_latitude': instance.deliveryLatitude,
      'delivery_longitude': instance.deliveryLongitude,
      'current_latitude': instance.currentLatitude,
      'current_longitude': instance.currentLongitude,
      'distance_remaining': instance.distanceRemaining,
      'tracking_points':
          instance.trackingPoints?.map((e) => e.toJson()).toList(),
      'notes': instance.notes,
      'proof_of_delivery_id': instance.proofOfDeliveryId,
      'has_proof_of_delivery': instance.hasProofOfDelivery,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

_DeliveryTrackingPointModel _$DeliveryTrackingPointModelFromJson(
        Map<String, dynamic> json) =>
    _DeliveryTrackingPointModel(
      id: json['id'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      timestamp: DateTime.parse(json['timestamp'] as String),
      speed: (json['speed'] as num?)?.toDouble(),
      accuracy: (json['accuracy'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$DeliveryTrackingPointModelToJson(
        _DeliveryTrackingPointModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'timestamp': instance.timestamp.toIso8601String(),
      'speed': instance.speed,
      'accuracy': instance.accuracy,
    };
