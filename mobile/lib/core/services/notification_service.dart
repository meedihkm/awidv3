import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:flutter/material.dart';

/// Model for in-app notifications (separate from push notifications)
class AppNotification {
  final String id;
  final String title;
  final String message;
  final IconData icon;
  final Color color;
  final DateTime createdAt;
  bool isRead;

  AppNotification({
    required this.id,
    required this.title,
    required this.message,
    this.icon = Icons.notifications,
    this.color = Colors.blue,
    DateTime? createdAt,
    this.isRead = false,
  }) : createdAt = createdAt ?? DateTime.now();
}

class NotificationService {
  static const String appId = "YOUR_ONESIGNAL_APP_ID"; // À remplacer par la vraie valeur ou config

  // In-app notifications list
  final List<AppNotification> _notifications = [];
  List<AppNotification> get notifications => _notifications;
  
  int get unreadCount => _notifications.where((n) => !n.isRead).length;

  void addNotification(AppNotification notification) {
    _notifications.insert(0, notification);
  }

  void markAsRead(String id) {
    final index = _notifications.indexWhere((n) => n.id == id);
    if (index != -1) {
      _notifications[index].isRead = true;
    }
  }

  void markAllAsRead() {
    for (var n in _notifications) {
      n.isRead = true;
    }
  }

  void clearAll() {
    _notifications.clear();
  }

  static Future<void> init() async {
    // Verbose logging set to help debug issues, remove in production
    OneSignal.Debug.setLogLevel(OSLogLevel.verbose);

    // Initialize OneSignal
    // NOTE: Replace with your App ID from settings > Keys & IDs
    // Idéalement via dotenv mais hardcodable dans le code source si nécessaire pour démo
    OneSignal.initialize(appId);

    // Request permission
    await OneSignal.Notifications.requestPermission(true);
  }

  static Future<void> login(String userId) async {
    await OneSignal.login(userId);
  }

  static Future<void> logout() async {
    await OneSignal.logout();
  }

  static void setNotificationHandler(GlobalKey<NavigatorState> navigatorKey) {
    OneSignal.Notifications.addClickListener((event) {
      final data = event.notification.additionalData;
      if (data != null && data['type'] != null) {
        _handleDeepLink(data, navigatorKey);
      }
    });
  }

  static void _handleDeepLink(Map<String, dynamic> data, GlobalKey<NavigatorState> navigatorKey) {
    final type = data['type'];
    final id = data['id'];

    if (type == 'order' && id != null) {
      // Naviguer via le navigatorKey
      // navigatorKey.currentState?.pushNamed('/order_details', arguments: id);
      print('Deep link to Order $id'); // Placeholder until routes are defined
    }
  }
}

