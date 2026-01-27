/// Événements WebSocket typés

/// Événement de mise à jour de commande
class OrderUpdateEvent {
  final String orderId;
  final String status;
  final DateTime timestamp;
  final Map<String, dynamic>? data;

  OrderUpdateEvent({
    required this.orderId,
    required this.status,
    required this.timestamp,
    this.data,
  });

  factory OrderUpdateEvent.fromJson(Map<String, dynamic> json) {
    return OrderUpdateEvent(
      orderId: json['orderId'] as String,
      status: json['status'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      data: json['data'] as Map<String, dynamic>?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'orderId': orderId,
      'status': status,
      'timestamp': timestamp.toIso8601String(),
      if (data != null) 'data': data,
    };
  }
}

/// Événement de mise à jour de livraison
class DeliveryUpdateEvent {
  final String deliveryId;
  final String status;
  final double? latitude;
  final double? longitude;
  final DateTime timestamp;
  final Map<String, dynamic>? data;

  DeliveryUpdateEvent({
    required this.deliveryId,
    required this.status,
    this.latitude,
    this.longitude,
    required this.timestamp,
    this.data,
  });

  factory DeliveryUpdateEvent.fromJson(Map<String, dynamic> json) {
    return DeliveryUpdateEvent(
      deliveryId: json['deliveryId'] as String,
      status: json['status'] as String,
      latitude: json['latitude'] as double?,
      longitude: json['longitude'] as double?,
      timestamp: DateTime.parse(json['timestamp'] as String),
      data: json['data'] as Map<String, dynamic>?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'deliveryId': deliveryId,
      'status': status,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      'timestamp': timestamp.toIso8601String(),
      if (data != null) 'data': data,
    };
  }
}

/// Événement d'alerte de stock
class StockAlertEvent {
  final String stockItemId;
  final String productName;
  final String alertType;
  final String severity;
  final double currentQuantity;
  final DateTime timestamp;

  StockAlertEvent({
    required this.stockItemId,
    required this.productName,
    required this.alertType,
    required this.severity,
    required this.currentQuantity,
    required this.timestamp,
  });

  factory StockAlertEvent.fromJson(Map<String, dynamic> json) {
    return StockAlertEvent(
      stockItemId: json['stockItemId'] as String,
      productName: json['productName'] as String,
      alertType: json['alertType'] as String,
      severity: json['severity'] as String,
      currentQuantity: (json['currentQuantity'] as num).toDouble(),
      timestamp: DateTime.parse(json['timestamp'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'stockItemId': stockItemId,
      'productName': productName,
      'alertType': alertType,
      'severity': severity,
      'currentQuantity': currentQuantity,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}

/// Événement de notification
class NotificationEvent {
  final String id;
  final String type;
  final String title;
  final String message;
  final DateTime timestamp;
  final Map<String, dynamic>? data;

  NotificationEvent({
    required this.id,
    required this.type,
    required this.title,
    required this.message,
    required this.timestamp,
    this.data,
  });

  factory NotificationEvent.fromJson(Map<String, dynamic> json) {
    return NotificationEvent(
      id: json['id'] as String,
      type: json['type'] as String,
      title: json['title'] as String,
      message: json['message'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      data: json['data'] as Map<String, dynamic>?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'title': title,
      'message': message,
      'timestamp': timestamp.toIso8601String(),
      if (data != null) 'data': data,
    };
  }
}

/// Événement de statut de connexion
class ConnectionStatusEvent {
  final bool isConnected;
  final DateTime timestamp;
  final String? reason;

  ConnectionStatusEvent({
    required this.isConnected,
    required this.timestamp,
    this.reason,
  });
}
