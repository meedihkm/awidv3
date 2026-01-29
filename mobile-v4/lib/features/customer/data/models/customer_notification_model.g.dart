// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CustomerNotificationModel _$CustomerNotificationModelFromJson(
        Map<String, dynamic> json) =>
    _CustomerNotificationModel(
      id: json['id'] as String,
      customerId: json['customer_id'] as String,
      type: json['type'] as String,
      title: json['title'] as String,
      message: json['message'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      isRead: json['is_read'] as bool? ?? false,
      readAt: json['read_at'] == null
          ? null
          : DateTime.parse(json['read_at'] as String),
      priority: json['priority'] as String?,
      actionUrl: json['action_url'] as String?,
      actionLabel: json['action_label'] as String?,
      data: json['data'] as Map<String, dynamic>?,
      relatedOrderId: json['related_order_id'] as String?,
      relatedDeliveryId: json['related_delivery_id'] as String?,
      imageUrl: json['image_url'] as String?,
    );

Map<String, dynamic> _$CustomerNotificationModelToJson(
        _CustomerNotificationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customer_id': instance.customerId,
      'type': instance.type,
      'title': instance.title,
      'message': instance.message,
      'created_at': instance.createdAt.toIso8601String(),
      'is_read': instance.isRead,
      'read_at': instance.readAt?.toIso8601String(),
      'priority': instance.priority,
      'action_url': instance.actionUrl,
      'action_label': instance.actionLabel,
      'data': instance.data,
      'related_order_id': instance.relatedOrderId,
      'related_delivery_id': instance.relatedDeliveryId,
      'image_url': instance.imageUrl,
    };
