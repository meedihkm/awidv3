import '../entities/customer_notification.dart';
import '../repositories/customer_repository.dart';

/// Use Case: Gérer les Notifications Client
/// Gère la récupération, le marquage et la suppression des notifications
class ManageNotificationsUseCase {
  final CustomerRepository _repository;

  const ManageNotificationsUseCase(this._repository);

  /// Récupère toutes les notifications du client
  Future<GetNotificationsResult> execute(GetNotificationsParams params) async {
    try {
      // 1. Valider les paramètres
      _validateParams(params);

      // 2. Récupérer les notifications
      final notifications = await _repository.getNotifications(
        customerId: params.customerId,
        type: params.type,
        isRead: params.isRead,
        priority: params.priority,
        startDate: params.startDate,
        endDate: params.endDate,
        limit: params.limit,
        offset: params.offset,
      );

      // 3. Filtrer par catégorie si nécessaire
      var filteredNotifications = notifications;

      if (params.category != null) {
        filteredNotifications = filteredNotifications.where((notif) {
          return notif.category == params.category;
        }).toList();
      }

      // 4. Trier les notifications
      if (params.sortBy != null) {
        filteredNotifications =
            _sortNotifications(filteredNotifications, params.sortBy!);
      }

      return GetNotificationsResult.success(
        notifications: filteredNotifications,
        totalCount: filteredNotifications.length,
        unreadCount: filteredNotifications.where((n) => !n.isRead).length,
        hasMore: notifications.length >= (params.limit ?? 50),
      );
    } catch (error) {
      return GetNotificationsResult.failure(
        error: error.toString(),
        customerId: params.customerId,
      );
    }
  }

  /// Récupère les notifications non lues
  Future<GetNotificationsResult> getUnreadNotifications(
      String customerId) async {
    return execute(GetNotificationsParams(
      customerId: customerId,
      isRead: false,
      sortBy: NotificationSortBy.dateDesc,
    ));
  }

  /// Récupère les notifications importantes
  Future<GetNotificationsResult> getImportantNotifications(
      String customerId) async {
    return execute(GetNotificationsParams(
      customerId: customerId,
      priority: NotificationPriority.high,
      sortBy: NotificationSortBy.dateDesc,
    ));
  }

  /// Récupère les notifications par type
  Future<GetNotificationsResult> getNotificationsByType(
    String customerId,
    NotificationType type,
  ) async {
    return execute(GetNotificationsParams(
      customerId: customerId,
      type: type,
      sortBy: NotificationSortBy.dateDesc,
    ));
  }

  /// Marque une notification comme lue
  Future<MarkAsReadResult> markAsRead(
    String customerId,
    String notificationId,
  ) async {
    try {
      if (customerId.isEmpty) {
        throw ArgumentError('L\'ID du client est requis');
      }

      if (notificationId.isEmpty) {
        throw ArgumentError('L\'ID de notification est requis');
      }

      await _repository.markNotificationAsRead(customerId, notificationId);

      return MarkAsReadResult.success(notificationId: notificationId);
    } catch (error) {
      return MarkAsReadResult.failure(
        error: error.toString(),
        notificationId: notificationId,
      );
    }
  }

  /// Marque toutes les notifications comme lues
  Future<MarkAllAsReadResult> markAllAsRead(String customerId) async {
    try {
      if (customerId.isEmpty) {
        throw ArgumentError('L\'ID du client est requis');
      }

      final count = await _repository.markAllNotificationsAsRead(customerId);

      return MarkAllAsReadResult.success(count: count);
    } catch (error) {
      return MarkAllAsReadResult.failure(
        error: error.toString(),
        customerId: customerId,
      );
    }
  }

  /// Supprime une notification
  Future<DeleteNotificationResult> deleteNotification(
    String customerId,
    String notificationId,
  ) async {
    try {
      if (customerId.isEmpty) {
        throw ArgumentError('L\'ID du client est requis');
      }

      if (notificationId.isEmpty) {
        throw ArgumentError('L\'ID de notification est requis');
      }

      await _repository.deleteNotification(customerId, notificationId);

      return DeleteNotificationResult.success(notificationId: notificationId);
    } catch (error) {
      return DeleteNotificationResult.failure(
        error: error.toString(),
        notificationId: notificationId,
      );
    }
  }

  /// Supprime toutes les notifications lues
  Future<DeleteReadNotificationsResult> deleteReadNotifications(
      String customerId) async {
    try {
      if (customerId.isEmpty) {
        throw ArgumentError('L\'ID du client est requis');
      }

      final count = await _repository.deleteReadNotifications(customerId);

      return DeleteReadNotificationsResult.success(count: count);
    } catch (error) {
      return DeleteReadNotificationsResult.failure(
        error: error.toString(),
        customerId: customerId,
      );
    }
  }

  /// Récupère le nombre de notifications non lues
  Future<int> getUnreadCount(String customerId) async {
    if (customerId.isEmpty) {
      throw ArgumentError('L\'ID du client est requis');
    }

    return await _repository.getUnreadNotificationsCount(customerId);
  }

  /// Valide les paramètres
  void _validateParams(GetNotificationsParams params) {
    if (params.customerId.isEmpty) {
      throw ArgumentError('L\'ID du client est requis');
    }

    if (params.startDate != null &&
        params.endDate != null &&
        params.startDate!.isAfter(params.endDate!)) {
      throw ArgumentError('La date de début doit être avant la date de fin');
    }
  }

  /// Trie les notifications
  List<CustomerNotification> _sortNotifications(
    List<CustomerNotification> notifications,
    NotificationSortBy sortBy,
  ) {
    final sortedNotifications = List<CustomerNotification>.from(notifications);

    switch (sortBy) {
      case NotificationSortBy.dateAsc:
        sortedNotifications.sort((a, b) => a.createdAt.compareTo(b.createdAt));
        break;
      case NotificationSortBy.dateDesc:
        sortedNotifications.sort((a, b) => b.createdAt.compareTo(a.createdAt));
        break;
      case NotificationSortBy.priorityDesc:
        sortedNotifications.sort((a, b) =>
            b.effectivePriority.index.compareTo(a.effectivePriority.index));
        break;
      case NotificationSortBy.typeAsc:
        sortedNotifications.sort((a, b) => a.type.index.compareTo(b.type.index));
        break;
      case NotificationSortBy.unreadFirst:
        sortedNotifications.sort((a, b) {
          if (a.isRead == b.isRead) {
            return b.createdAt.compareTo(a.createdAt);
          }
          return a.isRead ? 1 : -1;
        });
        break;
    }

    return sortedNotifications;
  }
}

/// Paramètres pour récupérer les notifications
class GetNotificationsParams {
  final String customerId;
  final NotificationType? type;
  final bool? isRead;
  final NotificationPriority? priority;
  final String? category;
  final DateTime? startDate;
  final DateTime? endDate;
  final NotificationSortBy? sortBy;
  final int? limit;
  final int? offset;

  const GetNotificationsParams({
    required this.customerId,
    this.type,
    this.isRead,
    this.priority,
    this.category,
    this.startDate,
    this.endDate,
    this.sortBy,
    this.limit,
    this.offset,
  });

  /// Vérifie si les paramètres sont valides
  bool get isValid {
    return customerId.isNotEmpty &&
        (startDate == null ||
            endDate == null ||
            !startDate!.isAfter(endDate!));
  }

  /// Vérifie si des filtres sont appliqués
  bool get hasFilters {
    return type != null ||
        isRead != null ||
        priority != null ||
        category != null ||
        startDate != null ||
        endDate != null;
  }
}

/// Tri des notifications
enum NotificationSortBy {
  dateAsc,
  dateDesc,
  priorityDesc,
  typeAsc,
  unreadFirst,
}

/// Résultat de récupération des notifications
abstract class GetNotificationsResult {
  const GetNotificationsResult();

  factory GetNotificationsResult.success({
    required List<CustomerNotification> notifications,
    required int totalCount,
    required int unreadCount,
    required bool hasMore,
  }) = GetNotificationsSuccess;

  factory GetNotificationsResult.failure({
    required String error,
    required String customerId,
  }) = GetNotificationsFailure;

  bool get isSuccess => this is GetNotificationsSuccess;
  bool get isFailure => this is GetNotificationsFailure;
}

class GetNotificationsSuccess extends GetNotificationsResult {
  final List<CustomerNotification> notifications;
  final int totalCount;
  final int unreadCount;
  final bool hasMore;

  const GetNotificationsSuccess({
    required this.notifications,
    required this.totalCount,
    required this.unreadCount,
    required this.hasMore,
  });

  bool get isEmpty => notifications.isEmpty;
  bool get isNotEmpty => notifications.isNotEmpty;
  bool get hasUnread => unreadCount > 0;
}

class GetNotificationsFailure extends GetNotificationsResult {
  final String error;
  final String customerId;

  const GetNotificationsFailure({
    required this.error,
    required this.customerId,
  });
}

/// Résultat de marquage comme lu
abstract class MarkAsReadResult {
  const MarkAsReadResult();

  factory MarkAsReadResult.success({
    required String notificationId,
  }) = MarkAsReadSuccess;

  factory MarkAsReadResult.failure({
    required String error,
    required String notificationId,
  }) = MarkAsReadFailure;

  bool get isSuccess => this is MarkAsReadSuccess;
  bool get isFailure => this is MarkAsReadFailure;
}

class MarkAsReadSuccess extends MarkAsReadResult {
  final String notificationId;

  const MarkAsReadSuccess({required this.notificationId});
}

class MarkAsReadFailure extends MarkAsReadResult {
  final String error;
  final String notificationId;

  const MarkAsReadFailure({
    required this.error,
    required this.notificationId,
  });
}

/// Résultat de marquage de toutes comme lues
abstract class MarkAllAsReadResult {
  const MarkAllAsReadResult();

  factory MarkAllAsReadResult.success({
    required int count,
  }) = MarkAllAsReadSuccess;

  factory MarkAllAsReadResult.failure({
    required String error,
    required String customerId,
  }) = MarkAllAsReadFailure;

  bool get isSuccess => this is MarkAllAsReadSuccess;
  bool get isFailure => this is MarkAllAsReadFailure;
}

class MarkAllAsReadSuccess extends MarkAllAsReadResult {
  final int count;

  const MarkAllAsReadSuccess({required this.count});
}

class MarkAllAsReadFailure extends MarkAllAsReadResult {
  final String error;
  final String customerId;

  const MarkAllAsReadFailure({
    required this.error,
    required this.customerId,
  });
}

/// Résultat de suppression de notification
abstract class DeleteNotificationResult {
  const DeleteNotificationResult();

  factory DeleteNotificationResult.success({
    required String notificationId,
  }) = DeleteNotificationSuccess;

  factory DeleteNotificationResult.failure({
    required String error,
    required String notificationId,
  }) = DeleteNotificationFailure;

  bool get isSuccess => this is DeleteNotificationSuccess;
  bool get isFailure => this is DeleteNotificationFailure;
}

class DeleteNotificationSuccess extends DeleteNotificationResult {
  final String notificationId;

  const DeleteNotificationSuccess({required this.notificationId});
}

class DeleteNotificationFailure extends DeleteNotificationResult {
  final String error;
  final String notificationId;

  const DeleteNotificationFailure({
    required this.error,
    required this.notificationId,
  });
}

/// Résultat de suppression des notifications lues
abstract class DeleteReadNotificationsResult {
  const DeleteReadNotificationsResult();

  factory DeleteReadNotificationsResult.success({
    required int count,
  }) = DeleteReadNotificationsSuccess;

  factory DeleteReadNotificationsResult.failure({
    required String error,
    required String customerId,
  }) = DeleteReadNotificationsFailure;

  bool get isSuccess => this is DeleteReadNotificationsSuccess;
  bool get isFailure => this is DeleteReadNotificationsFailure;
}

class DeleteReadNotificationsSuccess extends DeleteReadNotificationsResult {
  final int count;

  const DeleteReadNotificationsSuccess({required this.count});
}

class DeleteReadNotificationsFailure extends DeleteReadNotificationsResult {
  final String error;
  final String customerId;

  const DeleteReadNotificationsFailure({
    required this.error,
    required this.customerId,
  });
}
