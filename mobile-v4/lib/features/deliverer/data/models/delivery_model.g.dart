// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeliveryModelImpl _$$DeliveryModelImplFromJson(Map<String, dynamic> json) =>
    _$DeliveryModelImpl(
      id: json['id'] as String,
      orderId: json['order_id'] as String,
      orderNumber: json['order_number'] as String,
      status: json['status'] as String,
      customerName: json['customer_name'] as String,
      customerPhone: json['customer_phone'] as String,
      deliveryAddress: json['delivery_address'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      totalAmount: (json['total_amount'] as num).toDouble(),
      scheduledFor: DateTime.parse(json['scheduled_for'] as String),
      deliveryInstructions: json['delivery_instructions'] as String?,
      customerOrganization: json['customer_organization'] as String?,
      itemsCount: (json['items_count'] as num?)?.toInt(),
      pickedUpAt: json['picked_up_at'] == null
          ? null
          : DateTime.parse(json['picked_up_at'] as String),
      deliveredAt: json['delivered_at'] == null
          ? null
          : DateTime.parse(json['delivered_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$DeliveryModelImplToJson(_$DeliveryModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_id': instance.orderId,
      'order_number': instance.orderNumber,
      'status': instance.status,
      'customer_name': instance.customerName,
      'customer_phone': instance.customerPhone,
      'delivery_address': instance.deliveryAddress,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'total_amount': instance.totalAmount,
      'scheduled_for': instance.scheduledFor.toIso8601String(),
      'delivery_instructions': instance.deliveryInstructions,
      'customer_organization': instance.customerOrganization,
      'items_count': instance.itemsCount,
      'picked_up_at': instance.pickedUpAt?.toIso8601String(),
      'delivered_at': instance.deliveredAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
    };
