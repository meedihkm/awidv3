import 'package:flutter/material.dart';

class AppNotification {
  final String id;
  final String title;
  final String message;
  final String type; // order, delivery, debt, system
  final DateTime createdAt;
  final bool isRead;
  final Map<String, dynamic>? data;

  AppNotification({
    required this.id,
    required this.title,
    required this.message,
    required this.type,
    required this.createdAt,
    this.isRead = false,
    this.data,
  });

  IconData get icon {
    switch (type) {
      case 'order': return Icons.shopping_cart;
      case 'delivery': return Icons.local_shipping;
      case 'debt': return Icons.warning;
      case 'payment': return Icons.payments;
      default: return Icons.notifications;
    }
  }

  Color get color {
    switch (type) {
      case 'order': return Colors.blue;
      case 'delivery': return Colors.orange;
      case 'debt': return Colors.red;
      case 'payment': return Colors.green;
      default: return Colors.grey;
    }
  }
}

class NotificationService extends ChangeNotifier {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  final List<AppNotification> _notifications = [];
  
  List<AppNotification> get notifications => List.unmodifiable(_notifications);
  int get unreadCount => _notifications.where((n) => !n.isRead).length;

  void addNotification(AppNotification notification) {
    _notifications.insert(0, notification);
    notifyListeners();
  }

  void markAsRead(String id) {
    final index = _notifications.indexWhere((n) => n.id == id);
    if (index != -1) {
      _notifications[index] = AppNotification(
        id: _notifications[index].id,
        title: _notifications[index].title,
        message: _notifications[index].message,
        type: _notifications[index].type,
        createdAt: _notifications[index].createdAt,
        isRead: true,
        data: _notifications[index].data,
      );
      notifyListeners();
    }
  }

  void markAllAsRead() {
    for (int i = 0; i < _notifications.length; i++) {
      if (!_notifications[i].isRead) {
        _notifications[i] = AppNotification(
          id: _notifications[i].id,
          title: _notifications[i].title,
          message: _notifications[i].message,
          type: _notifications[i].type,
          createdAt: _notifications[i].createdAt,
          isRead: true,
          data: _notifications[i].data,
        );
      }
    }
    notifyListeners();
  }

  void clearAll() {
    _notifications.clear();
    notifyListeners();
  }

  // Notifications prédéfinies
  void notifyNewOrder(String clientName, double total) {
    addNotification(AppNotification(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: 'Nouvelle commande',
      message: '$clientName - ${total.toStringAsFixed(0)} DA',
      type: 'order',
      createdAt: DateTime.now(),
    ));
  }

  void notifyDeliveryComplete(String clientName) {
    addNotification(AppNotification(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: 'Livraison effectuée',
      message: 'Commande livrée à $clientName',
      type: 'delivery',
      createdAt: DateTime.now(),
    ));
  }

  void notifyDeliveryFailed(String clientName, String reason) {
    addNotification(AppNotification(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: 'Livraison échouée',
      message: '$clientName - $reason',
      type: 'delivery',
      createdAt: DateTime.now(),
    ));
  }

  void notifyHighDebt(String clientName, double amount) {
    addNotification(AppNotification(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: 'Alerte dette',
      message: '$clientName doit ${amount.toStringAsFixed(0)} DA',
      type: 'debt',
      createdAt: DateTime.now(),
    ));
  }
}
