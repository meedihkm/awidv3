import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/customer_account.dart';
import '../../domain/entities/customer_notification.dart';
import '../../domain/usecases/get_account_info_usecase.dart';
import '../../domain/usecases/manage_notifications_usecase.dart';
import 'customer_orders_provider.dart';

// ==================== PROVIDERS DE USE CASES ====================

/// Provider pour le use case d'informations de compte
final getAccountInfoUseCaseProvider = Provider<GetAccountInfoUseCase>((ref) {
  final repository = ref.watch(customerRepositoryProvider);
  return GetAccountInfoUseCase(repository);
});

/// Provider pour le use case de gestion des notifications
final manageNotificationsUseCaseProvider = Provider<ManageNotificationsUseCase>((ref) {
  final repository = ref.watch(customerRepositoryProvider);
  return ManageNotificationsUseCase(repository);
});

// ==================== PROVIDERS D'ÉTAT ====================

/// Provider pour les informations du compte
final customerAccountProvider = StateNotifierProvider.family<
    CustomerAccountNotifier, AsyncValue<CustomerAccount>, String>(
  (ref, customerId) {
    final useCase = ref.watch(getAccountInfoUseCaseProvider);
    return CustomerAccountNotifier(useCase, customerId);
  },
);

/// Provider pour les informations de crédit
final customerCreditInfoProvider = FutureProvider.family<CustomerCreditInfo?, String>(
  (ref, customerId) async {
    final useCase = ref.watch(getAccountInfoUseCaseProvider);
    final result = await useCase.getCreditInfo(customerId);
    
    return result.when(
      success: (creditInfo) => creditInfo,
      failure: (error, customerId) => throw Exception(error),
    );
  },
);

/// Provider pour les informations de consignes
final customerPackagingInfoProvider = FutureProvider.family<CustomerPackagingInfo?, String>(
  (ref, customerId) async {
    final useCase = ref.watch(getAccountInfoUseCaseProvider);
    final result = await useCase.getPackagingInfo(customerId);
    
    return result.when(
      success: (packagingInfo) => packagingInfo,
      failure: (error, customerId) => throw Exception(error),
    );
  },
);

/// Provider pour les notifications
final customerNotificationsProvider = StateNotifierProvider.family<
    CustomerNotificationsNotifier, AsyncValue<List<CustomerNotification>>, String>(
  (ref, customerId) {
    final useCase = ref.watch(manageNotificationsUseCaseProvider);
    return CustomerNotificationsNotifier(useCase, customerId);
  },
);

/// Provider pour le nombre de notifications non lues
final unreadNotificationsCountProvider = FutureProvider.family<int, String>(
  (ref, customerId) async {
    final useCase = ref.watch(manageNotificationsUseCaseProvider);
    return await useCase.getUnreadCount(customerId);
  },
);

// ==================== STATE NOTIFIERS ====================

/// Notifier pour le compte client
class CustomerAccountNotifier extends StateNotifier<AsyncValue<CustomerAccount>> {
  final GetAccountInfoUseCase _useCase;
  final String _customerId;

  CustomerAccountNotifier(this._useCase, this._customerId) 
      : super(const AsyncValue.loading()) {
    loadAccount();
  }

  /// Charge les informations du compte
  Future<void> loadAccount() async {
    try {
      state = const AsyncValue.loading();
      
      final result = await _useCase.execute(_customerId);

      result.when(
        success: (account) {
          state = AsyncValue.data(account);
        },
        inactive: (account, reason) {
          state = AsyncValue.error(
            'Compte inactif: $reason',
            StackTrace.current,
          );
        },
        failure: (error, customerId) {
          state = AsyncValue.error(error, StackTrace.current);
        },
      );
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  /// Rafraîchit le compte
  Future<void> refresh() async {
    await loadAccount();
  }

  /// Met à jour les paramètres
  Future<void> updateSettings(CustomerSettings settings) async {
    try {
      await _useCase.updateSettings(_customerId, settings);
      await loadAccount();
    } catch (error) {
      state = AsyncValue.error(error, StackTrace.current);
    }
  }

  /// Ajoute un contact
  Future<void> addContact(CustomerContact contact) async {
    try {
      await _useCase.addContact(_customerId, contact);
      await loadAccount();
    } catch (error) {
      state = AsyncValue.error(error, StackTrace.current);
    }
  }

  /// Met à jour un contact
  Future<void> updateContact(String contactId, CustomerContact contact) async {
    try {
      await _useCase.updateContact(_customerId, contactId, contact);
      await loadAccount();
    } catch (error) {
      state = AsyncValue.error(error, StackTrace.current);
    }
  }

  /// Supprime un contact
  Future<void> deleteContact(String contactId) async {
    try {
      await _useCase.deleteContact(_customerId, contactId);
      await loadAccount();
    } catch (error) {
      state = AsyncValue.error(error, StackTrace.current);
    }
  }
}

/// Notifier pour les notifications
class CustomerNotificationsNotifier extends StateNotifier<AsyncValue<List<CustomerNotification>>> {
  final ManageNotificationsUseCase _useCase;
  final String _customerId;

  CustomerNotificationsNotifier(this._useCase, this._customerId) 
      : super(const AsyncValue.loading()) {
    loadNotifications();
  }

  /// Charge les notifications
  Future<void> loadNotifications({
    NotificationType? type,
    bool? isRead,
    NotificationPriority? priority,
    DateTime? startDate,
    DateTime? endDate,
    int? limit,
    int? offset,
  }) async {
    try {
      state = const AsyncValue.loading();
      
      final result = await _useCase.execute(GetNotificationsParams(
        customerId: _customerId,
        type: type,
        isRead: isRead,
        priority: priority,
        startDate: startDate,
        endDate: endDate,
        limit: limit,
        offset: offset,
      ));

      result.when(
        success: (notifications, totalCount, unreadCount, hasMore) {
          state = AsyncValue.data(notifications);
        },
        failure: (error, customerId) {
          state = AsyncValue.error(error, StackTrace.current);
        },
      );
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  /// Rafraîchit les notifications
  Future<void> refresh() async {
    await loadNotifications();
  }

  /// Charge les notifications non lues
  Future<void> loadUnread() async {
    await loadNotifications(isRead: false);
  }

  /// Charge les notifications importantes
  Future<void> loadImportant() async {
    await loadNotifications(priority: NotificationPriority.high);
  }

  /// Marque une notification comme lue
  Future<void> markAsRead(String notificationId) async {
    try {
      await _useCase.markAsRead(_customerId, notificationId);
      
      // Mettre à jour l'état local
      state.whenData((notifications) {
        final updatedNotifications = notifications.map((n) {
          if (n.id == notificationId) {
            return n.copyWith(isRead: true, readAt: DateTime.now());
          }
          return n;
        }).toList();
        state = AsyncValue.data(updatedNotifications);
      });
    } catch (error) {
      // Ignorer les erreurs de marquage
    }
  }

  /// Marque toutes les notifications comme lues
  Future<void> markAllAsRead() async {
    try {
      await _useCase.markAllAsRead(_customerId);
      await loadNotifications();
    } catch (error) {
      state = AsyncValue.error(error, StackTrace.current);
    }
  }

  /// Supprime une notification
  Future<void> deleteNotification(String notificationId) async {
    try {
      await _useCase.deleteNotification(_customerId, notificationId);
      
      // Mettre à jour l'état local
      state.whenData((notifications) {
        final updatedNotifications = notifications
            .where((n) => n.id != notificationId)
            .toList();
        state = AsyncValue.data(updatedNotifications);
      });
    } catch (error) {
      state = AsyncValue.error(error, StackTrace.current);
    }
  }

  /// Supprime toutes les notifications lues
  Future<void> deleteReadNotifications() async {
    try {
      await _useCase.deleteReadNotifications(_customerId);
      await loadNotifications();
    } catch (error) {
      state = AsyncValue.error(error, StackTrace.current);
    }
  }
}
