import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:flutter/material.dart';
import '../models/notification_model.dart';

/// Model for in-app notifications (separate from push notifications)
// AppNotification model moved to core/models/notification_model.dart

class NotificationService {
  static const String appId = "YOUR_ONESIGNAL_APP_ID"; // À remplacer par la vraie valeur ou config

  // In-app notifications list
  final List<AppNotification> _notifications = [];
  List<AppNotification> get notifications => _notifications;
  
  int get unreadCount => _notifications.where((n) => !n.isRead).length;

  void addNotification(AppNotification notification) {
    _notifications.insert(0, notification);
  }

  Future<void> markAsRead(String id) async {
    final index = _notifications.indexWhere((n) => n.id == id);
    if (index != -1) {
      final old = _notifications[index];
      _notifications[index] = AppNotification(
        id: old.id,
        type: old.type,
        title: old.title,
        message: old.message,
        data: old.data,
        isRead: true,
        priority: old.priority,
        actionUrl: old.actionUrl,
        createdAt: old.createdAt,
        readAt: DateTime.now(),
      );
    }

  Future<Map<String, dynamic>> getNotifications({bool unreadOnly = false}) async {
    // Mock API call
    await Future.delayed(Duration(milliseconds: 300));
    final list = unreadOnly ? _notifications.where((n) => !n.isRead).toList() : _notifications;
    return {
      'success': true,
      'data': list.map((n) => {
        'id': n.id,
        'type': n.type,
        'title': n.title,
        'message': n.message,
        'icon': n.icon.codePoint, // Warning: this logic in model might need update
        'color': n.color.value,
        'createdAt': n.createdAt.toIso8601String(),
        'isRead': n.isRead,
      }).toList()
    };
  }

  Future<Map<String, dynamic>> markAllAsRead() async {
    for (var n in _notifications) {
      n.isRead = true;
    }
    return {'success': true, 'message': 'Tout marqué comme lu'};
  }

  void clearAll() {
    _notifications.clear();
  }

  void deleteNotification(String id) {
    _notifications.removeWhere((n) => n.id == id);
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

  // Preferences methods for SettingsPage
  Future<Map<String, dynamic>> getPreferences() async {
    // Mock implementation using SharedPreferences or defaults
    // In a real app, this might fetch from API
    await Future.delayed(Duration(milliseconds: 500));
    return {
      'success': true,
      'data': {
        'paymentNotifications': true,
        'debtNotifications': true,
        'favoriteNotifications': true,
        'debtRemindersEnabled': false,
        'debtReminderFrequency': 7
      }
    };
  }

  Future<Map<String, dynamic>> updatePreferences({
    bool? paymentNotifications,
    bool? debtNotifications,
    bool? favoriteNotifications,
    bool? debtRemindersEnabled,
    int? debtReminderFrequency,
  }) async {
    await Future.delayed(Duration(milliseconds: 500));
    // In real app, save to API
    return {'success': true};
  }
}

