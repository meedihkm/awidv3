import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:flutter/material.dart';
import '../models/notification_model.dart';

/// Model for in-app notifications (separate from push notifications)
// AppNotification model moved to core/models/notification_model.dart

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

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
        'icon': 0xe57f, // Fixed: codePoint not available on String, using dummy int or fetch from mapping
        'color': n.color.value,
        'createdAt': n.createdAt.toIso8601String(),
        'isRead': n.isRead,
      }).toList()
    };
  }

  Future<Map<String, dynamic>> markAllAsRead() async {
    for (int i = 0; i < _notifications.length; i++) {
       final old = _notifications[i];
       if (!old.isRead) {
         _notifications[i] = AppNotification(
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
    }
    return {'success': true, 'message': 'Tout marqué comme lu'};
  }

  void clearAll() {
    _notifications.clear();
  }

  void deleteNotification(String id) {
    _notifications.removeWhere((n) => n.id == id);
  }

  Future<void> init() async {
    OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
    OneSignal.initialize(appId);
    await OneSignal.Notifications.requestPermission(true);
  }

  Future<void> login(String userId) async {
    await OneSignal.login(userId);
  }

  Future<void> logout() async {
    await OneSignal.logout();
  }

  void setNotificationHandler(GlobalKey<NavigatorState> navigatorKey) {
    OneSignal.Notifications.addClickListener((event) {
      final data = event.notification.additionalData;
      if (data != null && data['type'] != null) {
        _handleDeepLink(data, navigatorKey);
      }
    });
  }

  void _handleDeepLink(Map<String, dynamic> data, GlobalKey<NavigatorState> navigatorKey) {
    final type = data['type'];
    final id = data['id'];

    if (type == 'order' && id != null) {
      print('Deep link to Order $id'); 
    }
  }

  // Preferences methods for SettingsPage
  Future<Map<String, dynamic>> getPreferences() async {
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
    return {'success': true};
  }
}
