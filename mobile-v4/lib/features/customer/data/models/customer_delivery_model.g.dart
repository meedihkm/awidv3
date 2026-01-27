// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_delivery_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomerDeliveryModelImpl _$$CustomerDeliveryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomerDeliveryModelImpl(
      id: json['id'] as String,
      deliveryNumber: json['deliveryNumber'] as String,
      customerId: json['customerId'] as String,
      customerName: json['customerName'] as String,
      delivererId: json['delivererId'] as String,
      delivererName: json['delivererName'] as String,
      delivererPhone: json['delivererPhone'] as String?,
      delivererPhoto: json['delivererPhoto'] as String?,
      orderIds:
          (json['orderIds'] as List<dynamic>).map((e) => e as String).toList(),
      ordersCount: (json['ordersCount'] as num).toInt(),
      totalAmount: (json['totalAmount'] as num).toDouble(),
      status: json['status'] as String,
      scheduledDate: DateTime.parse(json['scheduledDate'] as String),
      startedAt: json['startedAt'] == null
          ? null
          : DateTime.parse(json['startedAt'] as String),
      estimatedArrival: json['estimatedArrival'] == null
          ? null
          : DateTime.parse(json['estimatedArrival'] as String),
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
      deliveryAddress: json['deliveryAddress'] as String,
      deliveryLatitude: (json['deliveryLatitude'] as num?)?.toDouble(),
      deliveryLongitude: (json['deliveryLongitude'] as num?)?.toDouble(),
      currentLatitude: (json['currentLatitude'] as num?)?.toDouble(),
      currentLongitude: (json['currentLongitude'] as num?)?.toDouble(),
      distanceRemaining: (json['distanceRemaining'] as num?)?.toDouble(),
      trackingPoints: (json['trackingPoints'] as List<dynamic>?)
          ?.map((e) =>
              DeliveryTrackingPointModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      notes: json['notes'] as String?,
      proofOfDeliveryId: json['proofOfDeliveryId'] as String?,
      hasProofOfDelivery: json['hasProofOfDelivery'] as bool? ?? false,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$CustomerDeliveryModelImplToJson(
        _$CustomerDeliveryModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'deliveryNumber': instance.deliveryNumber,
      'customerId': instance.customerId,
      'customerName': instance.customerName,
      'delivererId': instance.delivererId,
      'delivererName': instance.delivererName,
      'delivererPhone': instance.delivererPhone,
      'delivererPhoto': instance.delivererPhoto,
      'orderIds': instance.orderIds,
      'ordersCount': instance.ordersCount,
      'totalAmount': instance.totalAmount,
      'status': instance.status,
      'scheduledDate': instance.scheduledDate.toIso8601String(),
      'startedAt': instance.startedAt?.toIso8601String(),
      'estimatedArrival': instance.estimatedArrival?.toIso8601String(),
      'completedAt': instance.completedAt?.toIso8601String(),
      'deliveryAddress': instance.deliveryAddress,
      'deliveryLatitude': instance.deliveryLatitude,
      'deliveryLongitude': instance.deliveryLongitude,
      'currentLatitude': instance.currentLatitude,
      'currentLongitude': instance.currentLongitude,
      'distanceRemaining': instance.distanceRemaining,
      'trackingPoints': instance.trackingPoints,
      'notes': instance.notes,
      'proofOfDeliveryId': instance.proofOfDeliveryId,
      'hasProofOfDelivery': instance.hasProofOfDelivery,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$DeliveryTrackingPointModelImpl _$$DeliveryTrackingPointModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DeliveryTrackingPointModelImpl(
      id: json['id'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      timestamp: DateTime.parse(json['timestamp'] as String),
      speed: (json['speed'] as num?)?.toDouble(),
      accuracy: (json['accuracy'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$DeliveryTrackingPointModelImplToJson(
        _$DeliveryTrackingPointModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'timestamp': instance.timestamp.toIso8601String(),
      'speed': instance.speed,
      'accuracy': instance.accuracy,
    };
