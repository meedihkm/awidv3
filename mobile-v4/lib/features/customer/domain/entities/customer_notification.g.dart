// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CustomerNotification _$CustomerNotificationFromJson(
        Map<String, dynamic> json) =>
    _CustomerNotification(
      id: json['id'] as String,
      customerId: json['customer_id'] as String,
      type: $enumDecode(_$NotificationTypeEnumMap, json['type']),
      title: json['title'] as String,
      message: json['message'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      isRead: json['is_read'] as bool? ?? false,
      readAt: json['read_at'] == null
          ? null
          : DateTime.parse(json['read_at'] as String),
      priority:
          $enumDecodeNullable(_$NotificationPriorityEnumMap, json['priority']),
      actionUrl: json['action_url'] as String?,
      actionLabel: json['action_label'] as String?,
      data: json['data'] as Map<String, dynamic>?,
      relatedOrderId: json['related_order_id'] as String?,
      relatedDeliveryId: json['related_delivery_id'] as String?,
      imageUrl: json['image_url'] as String?,
    );

Map<String, dynamic> _$CustomerNotificationToJson(
        _CustomerNotification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customer_id': instance.customerId,
      'type': _$NotificationTypeEnumMap[instance.type]!,
      'title': instance.title,
      'message': instance.message,
      'created_at': instance.createdAt.toIso8601String(),
      'is_read': instance.isRead,
      'read_at': instance.readAt?.toIso8601String(),
      'priority': _$NotificationPriorityEnumMap[instance.priority],
      'action_url': instance.actionUrl,
      'action_label': instance.actionLabel,
      'data': instance.data,
      'related_order_id': instance.relatedOrderId,
      'related_delivery_id': instance.relatedDeliveryId,
      'image_url': instance.imageUrl,
    };

const _$NotificationTypeEnumMap = {
  NotificationType.orderConfirmed: 'order_confirmed',
  NotificationType.orderPreparing: 'order_preparing',
  NotificationType.orderReady: 'order_ready',
  NotificationType.deliveryAssigned: 'delivery_assigned',
  NotificationType.deliveryStarted: 'delivery_started',
  NotificationType.deliveryNearby: 'delivery_nearby',
  NotificationType.deliveryArrived: 'delivery_arrived',
  NotificationType.deliveryCompleted: 'delivery_completed',
  NotificationType.paymentReceived: 'payment_received',
  NotificationType.paymentReminder: 'payment_reminder',
  NotificationType.creditLimitWarning: 'credit_limit_warning',
  NotificationType.creditExceeded: 'credit_exceeded',
  NotificationType.packagingReminder: 'packaging_reminder',
  NotificationType.promotion: 'promotion',
  NotificationType.system: 'system',
  NotificationType.other: 'other',
};

const _$NotificationPriorityEnumMap = {
  NotificationPriority.low: 'low',
  NotificationPriority.normal: 'normal',
  NotificationPriority.high: 'high',
  NotificationPriority.urgent: 'urgent',
};
