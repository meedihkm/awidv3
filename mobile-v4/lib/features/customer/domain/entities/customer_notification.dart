import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_notification.freezed.dart';
part 'customer_notification.g.dart';

/// Notification Client
/// Entité représentant une notification pour le client
@freezed
class CustomerNotification with _$CustomerNotification {
  const factory CustomerNotification({
    required String id,
    required String customerId,
    required NotificationType type,
    required String title,
    required String message,
    required DateTime createdAt,
    @Default(false) bool isRead,
    DateTime? readAt,
    NotificationPriority? priority,
    String? actionUrl,
    String? actionLabel,
    Map<String, dynamic>? data,
    String? relatedOrderId,
    String? relatedDeliveryId,
    String? imageUrl,
  }) = _CustomerNotification;

  factory CustomerNotification.fromJson(Map<String, dynamic> json) =>
      _$CustomerNotificationFromJson(json);
}

/// Type de Notification
enum NotificationType {
  @JsonValue('order_confirmed')
  orderConfirmed,
  @JsonValue('order_preparing')
  orderPreparing,
  @JsonValue('order_ready')
  orderReady,
  @JsonValue('delivery_assigned')
  deliveryAssigned,
  @JsonValue('delivery_started')
  deliveryStarted,
  @JsonValue('delivery_nearby')
  deliveryNearby,
  @JsonValue('delivery_arrived')
  deliveryArrived,
  @JsonValue('delivery_completed')
  deliveryCompleted,
  @JsonValue('payment_received')
  paymentReceived,
  @JsonValue('payment_reminder')
  paymentReminder,
  @JsonValue('credit_limit_warning')
  creditLimitWarning,
  @JsonValue('credit_exceeded')
  creditExceeded,
  @JsonValue('packaging_reminder')
  packagingReminder,
  @JsonValue('promotion')
  promotion,
  @JsonValue('system')
  system,
  @JsonValue('other')
  other,
}

/// Priorité de Notification
enum NotificationPriority {
  @JsonValue('low')
  low,
  @JsonValue('normal')
  normal,
  @JsonValue('high')
  high,
  @JsonValue('urgent')
  urgent,
}

extension NotificationTypeX on NotificationType {
  /// Retourne le label d'affichage
  String get displayName {
    switch (this) {
      case NotificationType.orderConfirmed:
        return 'Commande confirmée';
      case NotificationType.orderPreparing:
        return 'Commande en préparation';
      case NotificationType.orderReady:
        return 'Commande prête';
      case NotificationType.deliveryAssigned:
        return 'Livreur assigné';
      case NotificationType.deliveryStarted:
        return 'Livraison démarrée';
      case NotificationType.deliveryNearby:
        return 'Livreur proche';
      case NotificationType.deliveryArrived:
        return 'Livreur arrivé';
      case NotificationType.deliveryCompleted:
        return 'Livraison terminée';
      case NotificationType.paymentReceived:
        return 'Paiement reçu';
      case NotificationType.paymentReminder:
        return 'Rappel de paiement';
      case NotificationType.creditLimitWarning:
        return 'Alerte crédit';
      case NotificationType.creditExceeded:
        return 'Crédit dépassé';
      case NotificationType.packagingReminder:
        return 'Rappel consignes';
      case NotificationType.promotion:
        return 'Promotion';
      case NotificationType.system:
        return 'Système';
      case NotificationType.other:
        return 'Autre';
    }
  }

  /// Retourne l'icône du type
  String get icon {
    switch (this) {
      case NotificationType.orderConfirmed:
        return '✅';
      case NotificationType.orderPreparing:
        return '👨‍🍳';
      case NotificationType.orderReady:
        return '📦';
      case NotificationType.deliveryAssigned:
        return '👤';
      case NotificationType.deliveryStarted:
        return '🚚';
      case NotificationType.deliveryNearby:
        return '📍';
      case NotificationType.deliveryArrived:
        return '🏁';
      case NotificationType.deliveryCompleted:
        return '✅';
      case NotificationType.paymentReceived:
        return '💰';
      case NotificationType.paymentReminder:
        return '⏰';
      case NotificationType.creditLimitWarning:
        return '⚠️';
      case NotificationType.creditExceeded:
        return '🚫';
      case NotificationType.packagingReminder:
        return '📦';
      case NotificationType.promotion:
        return '🎁';
      case NotificationType.system:
        return 'ℹ️';
      case NotificationType.other:
        return '📬';
    }
  }

  /// Retourne la couleur du type
  String get color {
    switch (this) {
      case NotificationType.orderConfirmed:
      case NotificationType.deliveryCompleted:
      case NotificationType.paymentReceived:
        return 'green';
      case NotificationType.orderPreparing:
      case NotificationType.orderReady:
      case NotificationType.deliveryAssigned:
        return 'blue';
      case NotificationType.deliveryStarted:
      case NotificationType.deliveryNearby:
      case NotificationType.deliveryArrived:
        return 'orange';
      case NotificationType.paymentReminder:
      case NotificationType.creditLimitWarning:
      case NotificationType.packagingReminder:
        return 'amber';
      case NotificationType.creditExceeded:
        return 'red';
      case NotificationType.promotion:
        return 'purple';
      case NotificationType.system:
      case NotificationType.other:
        return 'grey';
    }
  }

  /// Vérifie si c'est une notification de livraison
  bool get isDeliveryRelated {
    return this == NotificationType.deliveryAssigned ||
        this == NotificationType.deliveryStarted ||
        this == NotificationType.deliveryNearby ||
        this == NotificationType.deliveryArrived ||
        this == NotificationType.deliveryCompleted;
  }

  /// Vérifie si c'est une notification de commande
  bool get isOrderRelated {
    return this == NotificationType.orderConfirmed ||
        this == NotificationType.orderPreparing ||
        this == NotificationType.orderReady;
  }

  /// Vérifie si c'est une notification de paiement
  bool get isPaymentRelated {
    return this == NotificationType.paymentReceived ||
        this == NotificationType.paymentReminder ||
        this == NotificationType.creditLimitWarning ||
        this == NotificationType.creditExceeded;
  }

  /// Vérifie si c'est une notification importante
  bool get isImportant {
    return this == NotificationType.creditExceeded ||
        this == NotificationType.deliveryArrived ||
        this == NotificationType.paymentReminder;
  }
}

extension NotificationPriorityX on NotificationPriority {
  /// Retourne le label d'affichage
  String get displayName {
    switch (this) {
      case NotificationPriority.low:
        return 'Basse';
      case NotificationPriority.normal:
        return 'Normale';
      case NotificationPriority.high:
        return 'Haute';
      case NotificationPriority.urgent:
        return 'Urgente';
    }
  }

  /// Retourne la couleur de la priorité
  String get color {
    switch (this) {
      case NotificationPriority.low:
        return 'grey';
      case NotificationPriority.normal:
        return 'blue';
      case NotificationPriority.high:
        return 'orange';
      case NotificationPriority.urgent:
        return 'red';
    }
  }

  /// Retourne l'icône de la priorité
  String get icon {
    switch (this) {
      case NotificationPriority.low:
        return '⬇️';
      case NotificationPriority.normal:
        return '➡️';
      case NotificationPriority.high:
        return '⬆️';
      case NotificationPriority.urgent:
        return '🔴';
    }
  }
}

extension CustomerNotificationX on CustomerNotification {
  /// Retourne la date formatée
  String get createdAtFormatted {
    final now = DateTime.now();
    final difference = now.difference(createdAt);

    if (difference.inMinutes < 1) {
      return 'À l\'instant';
    } else if (difference.inMinutes < 60) {
      return 'Il y a ${difference.inMinutes} min';
    } else if (difference.inHours < 24) {
      return 'Il y a ${difference.inHours}h';
    } else if (difference.inDays < 7) {
      return 'Il y a ${difference.inDays}j';
    } else {
      return '${createdAt.day.toString().padLeft(2, '0')}/'
          '${createdAt.month.toString().padLeft(2, '0')}/'
          '${createdAt.year}';
    }
  }

  /// Retourne la date complète formatée
  String get fullDateFormatted {
    return '${createdAt.day.toString().padLeft(2, '0')}/'
        '${createdAt.month.toString().padLeft(2, '0')}/'
        '${createdAt.year} à '
        '${createdAt.hour.toString().padLeft(2, '0')}:'
        '${createdAt.minute.toString().padLeft(2, '0')}';
  }

  /// Vérifie si la notification est récente (moins de 24h)
  bool get isRecent {
    final now = DateTime.now();
    final difference = now.difference(createdAt);
    return difference.inHours < 24;
  }

  /// Vérifie si la notification est ancienne (plus de 7 jours)
  bool get isOld {
    final now = DateTime.now();
    final difference = now.difference(createdAt);
    return difference.inDays > 7;
  }

  /// Vérifie si la notification a une action
  bool get hasAction {
    return actionUrl != null && actionLabel != null;
  }

  /// Vérifie si la notification est liée à une commande
  bool get hasRelatedOrder {
    return relatedOrderId != null;
  }

  /// Vérifie si la notification est liée à une livraison
  bool get hasRelatedDelivery {
    return relatedDeliveryId != null;
  }

  /// Vérifie si la notification a une image
  bool get hasImage {
    return imageUrl != null;
  }

  /// Retourne la priorité effective
  NotificationPriority get effectivePriority {
    if (priority != null) return priority!;
    if (type.isImportant) return NotificationPriority.high;
    return NotificationPriority.normal;
  }

  /// Vérifie si la notification est importante
  bool get isImportant {
    return effectivePriority == NotificationPriority.high ||
        effectivePriority == NotificationPriority.urgent ||
        type.isImportant;
  }

  /// Retourne un résumé de la notification
  String get summary {
    return '$title - ${createdAtFormatted}';
  }

  /// Retourne la catégorie de la notification
  String get category {
    if (type.isDeliveryRelated) return 'Livraison';
    if (type.isOrderRelated) return 'Commande';
    if (type.isPaymentRelated) return 'Paiement';
    if (type == NotificationType.promotion) return 'Promotion';
    return 'Général';
  }
}
