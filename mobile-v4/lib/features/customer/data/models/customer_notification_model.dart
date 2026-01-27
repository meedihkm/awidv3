import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/customer_notification.dart';

part 'customer_notification_model.freezed.dart';
part 'customer_notification_model.g.dart';

/// Model de Notification Client
@freezed
class CustomerNotificationModel with _$CustomerNotificationModel {
  const factory CustomerNotificationModel({
    required String id,
    required String customerId,
    required String type,
    required String title,
    required String message,
    required DateTime createdAt,
    @Default(false) bool isRead,
    DateTime? readAt,
    String? priority,
    String? actionUrl,
    String? actionLabel,
    Map<String, dynamic>? data,
    String? relatedOrderId,
    String? relatedDeliveryId,
    String? imageUrl,
  }) = _CustomerNotificationModel;

  factory CustomerNotificationModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerNotificationModelFromJson(json);
}

extension CustomerNotificationModelX on CustomerNotificationModel {
  CustomerNotification toEntity() {
    return CustomerNotification(
      id: id,
      customerId: customerId,
      type: _parseNotificationType(type),
      title: title,
      message: message,
      createdAt: createdAt,
      isRead: isRead,
      readAt: readAt,
      priority: priority != null ? _parseNotificationPriority(priority!) : null,
      actionUrl: actionUrl,
      actionLabel: actionLabel,
      data: data,
      relatedOrderId: relatedOrderId,
      relatedDeliveryId: relatedDeliveryId,
      imageUrl: imageUrl,
    );
  }

  NotificationType _parseNotificationType(String type) {
    switch (type.toLowerCase()) {
      case 'order_confirmed':
        return NotificationType.orderConfirmed;
      case 'order_preparing':
        return NotificationType.orderPreparing;
      case 'order_ready':
        return NotificationType.orderReady;
      case 'delivery_assigned':
        return NotificationType.deliveryAssigned;
      case 'delivery_started':
        return NotificationType.deliveryStarted;
      case 'delivery_nearby':
        return NotificationType.deliveryNearby;
      case 'delivery_arrived':
        return NotificationType.deliveryArrived;
      case 'delivery_completed':
        return NotificationType.deliveryCompleted;
      case 'payment_received':
        return NotificationType.paymentReceived;
      case 'payment_reminder':
        return NotificationType.paymentReminder;
      case 'credit_limit_warning':
        return NotificationType.creditLimitWarning;
      case 'credit_exceeded':
        return NotificationType.creditExceeded;
      case 'packaging_reminder':
        return NotificationType.packagingReminder;
      case 'promotion':
        return NotificationType.promotion;
      case 'system':
        return NotificationType.system;
      default:
        return NotificationType.other;
    }
  }

  NotificationPriority _parseNotificationPriority(String priority) {
    switch (priority.toLowerCase()) {
      case 'low':
        return NotificationPriority.low;
      case 'normal':
        return NotificationPriority.normal;
      case 'high':
        return NotificationPriority.high;
      case 'urgent':
        return NotificationPriority.urgent;
      default:
        return NotificationPriority.normal;
    }
  }
}

extension CustomerNotificationEntityX on CustomerNotification {
  CustomerNotificationModel toModel() {
    return CustomerNotificationModel(
      id: id,
      customerId: customerId,
      type: _serializeNotificationType(type),
      title: title,
      message: message,
      createdAt: createdAt,
      isRead: isRead,
      readAt: readAt,
      priority: priority != null ? _serializeNotificationPriority(priority!) : null,
      actionUrl: actionUrl,
      actionLabel: actionLabel,
      data: data,
      relatedOrderId: relatedOrderId,
      relatedDeliveryId: relatedDeliveryId,
      imageUrl: imageUrl,
    );
  }

  String _serializeNotificationType(NotificationType type) {
    switch (type) {
      case NotificationType.orderConfirmed:
        return 'order_confirmed';
      case NotificationType.orderPreparing:
        return 'order_preparing';
      case NotificationType.orderReady:
        return 'order_ready';
      case NotificationType.deliveryAssigned:
        return 'delivery_assigned';
      case NotificationType.deliveryStarted:
        return 'delivery_started';
      case NotificationType.deliveryNearby:
        return 'delivery_nearby';
      case NotificationType.deliveryArrived:
        return 'delivery_arrived';
      case NotificationType.deliveryCompleted:
        return 'delivery_completed';
      case NotificationType.paymentReceived:
        return 'payment_received';
      case NotificationType.paymentReminder:
        return 'payment_reminder';
      case NotificationType.creditLimitWarning:
        return 'credit_limit_warning';
      case NotificationType.creditExceeded:
        return 'credit_exceeded';
      case NotificationType.packagingReminder:
        return 'packaging_reminder';
      case NotificationType.promotion:
        return 'promotion';
      case NotificationType.system:
        return 'system';
      case NotificationType.other:
        return 'other';
    }
  }

  String _serializeNotificationPriority(NotificationPriority priority) {
    switch (priority) {
      case NotificationPriority.low:
        return 'low';
      case NotificationPriority.normal:
        return 'normal';
      case NotificationPriority.high:
        return 'high';
      case NotificationPriority.urgent:
        return 'urgent';
    }
  }
}
