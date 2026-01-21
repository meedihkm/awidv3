import 'package:flutter/material.dart';
import '../services/notification_service.dart';
import '../models/notification_model.dart';

class NotificationsPage extends StatefulWidget {
  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final NotificationService _notificationService = NotificationService();
  List<AppNotification> _notifications = [];
  bool _isLoading = true;
  bool _showUnreadOnly = false;

  @override
  void initState() {
    super.initState();
    _loadNotifications();
  }

  Future<void> _loadNotifications() async {
    setState(() => _isLoading = true);
    try {
      final response = await _notificationService.getNotifications(
        unreadOnly: _showUnreadOnly,
      );
      
      if (response['success']) {
        setState(() {
          _notifications = (response['data'] as List)
              .map((json) => AppNotification.fromJson(json))
              .toList();
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() => _isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur: ${e.toString()}')),
      );
    }
  }

  Future<void> _markAsRead(AppNotification notification) async {
    if (notification.isRead) return;
    
    try {
      await _notificationService.markAsRead(notification.id);
      _loadNotifications();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur: ${e.toString()}')),
      );
    }
  }

  Future<void> _markAllAsRead() async {
    try {
      final response = await _notificationService.markAllAsRead();
      if (response['success']) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(response['message']),
            backgroundColor: Colors.green,
          ),
        );
        _loadNotifications();
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur: ${e.toString()}')),
      );
    }
  }

  Future<void> _deleteNotification(String notificationId) async {
    try {
      _notificationService.deleteNotification(notificationId);
      _loadNotifications();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Notification supprimée'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur: ${e.toString()}')),
      );
    }
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);
    
    if (difference.inMinutes < 1) {
      return 'À l\'instant';
    } else if (difference.inHours < 1) {
      return 'Il y a ${difference.inMinutes} min';
    } else if (difference.inDays < 1) {
      return 'Il y a ${difference.inHours}h';
    } else if (difference.inDays < 7) {
      return 'Il y a ${difference.inDays}j';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }

  @override
  Widget build(BuildContext context) {
    final unreadCount = _notifications.where((n) => !n.isRead).length;
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        backgroundColor: Colors.green.shade700,
        actions: [
          if (unreadCount > 0)
            IconButton(
              onPressed: _markAllAsRead,
              icon: Icon(Icons.done_all),
              tooltip: 'Tout marquer comme lu',
            ),
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'filter') {
                setState(() {
                  _showUnreadOnly = !_showUnreadOnly;
                  _loadNotifications();
                });
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'filter',
                child: Row(
                  children: [
                    Icon(
                      _showUnreadOnly ? Icons.filter_alt : Icons.filter_alt_outlined,
                      size: 20,
                    ),
                    SizedBox(width: 8),
                    Text(_showUnreadOnly ? 'Toutes' : 'Non lues uniquement'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator(color: Colors.green))
          : _notifications.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.notifications_none,
                        size: 80,
                        color: Colors.grey[400],
                      ),
                      SizedBox(height: 16),
                      Text(
                        _showUnreadOnly
                            ? 'Aucune notification non lue'
                            : 'Aucune notification',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                )
              : RefreshIndicator(
                  onRefresh: _loadNotifications,
                  color: Colors.green,
                  child: ListView.builder(
                    padding: EdgeInsets.all(12),
                    itemCount: _notifications.length,
                    itemBuilder: (context, index) {
                      final notification = _notifications[index];
                      return Dismissible(
                        key: Key(notification.id),
                        direction: DismissDirection.endToStart,
                        background: Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(right: 20),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(Icons.delete, color: Colors.white),
                        ),
                        onDismissed: (_) => _deleteNotification(notification.id),
                        child: Card(
                          margin: EdgeInsets.only(bottom: 8),
                          elevation: notification.isRead ? 1 : 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: notification.isRead
                                ? BorderSide.none
                                : BorderSide(
                                    color: notification.color.withOpacity(0.3),
                                    width: 2,
                                  ),
                          ),
                          child: InkWell(
                            onTap: () => _markAsRead(notification),
                            borderRadius: BorderRadius.circular(12),
                            child: Padding(
                              padding: EdgeInsets.all(16),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Icône
                                  Container(
                                    width: 48,
                                    height: 48,
                                    decoration: BoxDecoration(
                                      color: notification.color.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Center(
                                      child: Text(
                                        notification.icon,
                                        style: TextStyle(fontSize: 24),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  
                                  // Contenu
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                notification.title,
                                                style: TextStyle(
                                                  fontWeight: notification.isRead
                                                      ? FontWeight.w500
                                                      : FontWeight.bold,
                                                  fontSize: 15,
                                                ),
                                              ),
                                            ),
                                            if (!notification.isRead)
                                              Container(
                                                width: 8,
                                                height: 8,
                                                decoration: BoxDecoration(
                                                  color: notification.color,
                                                  shape: BoxShape.circle,
                                                ),
                                              ),
                                          ],
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          notification.message,
                                          style: TextStyle(
                                            color: Colors.grey[700],
                                            fontSize: 14,
                                          ),
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                          _formatDate(notification.createdAt),
                                          style: TextStyle(
                                            color: Colors.grey[500],
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
    );
  }
}
