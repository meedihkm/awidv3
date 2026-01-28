import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/customer_delivery.dart';
import '../../domain/usecases/track_delivery_usecase.dart';
import 'customer_orders_provider.dart';

// ==================== PROVIDERS DE USE CASES ====================

/// Provider pour le use case de suivi
final trackDeliveryUseCaseProvider = Provider<TrackDeliveryUseCase>((ref) {
  final repository = ref.watch(customerRepositoryProvider);
  return TrackDeliveryUseCase(repository);
});

// ==================== PROVIDERS D'ÉTAT ====================

/// Provider pour le suivi d'une livraison
final deliveryTrackingProvider = StateNotifierProvider.family<
    DeliveryTrackingNotifier, AsyncValue<CustomerDelivery>, String>(
  (ref, deliveryId) {
    final useCase = ref.watch(trackDeliveryUseCaseProvider);
    return DeliveryTrackingNotifier(useCase, deliveryId);
  },
);

/// Provider pour les livraisons actives
final activeDeliveriesProvider = FutureProvider.family<List<CustomerDelivery>, String>(
  (ref, customerId) async {
    final useCase = ref.watch(trackDeliveryUseCaseProvider);
    final result = await useCase.getActiveDeliveries(customerId);
    
    if (result is GetActiveDeliveriesSuccess) {
      return result.deliveries;
    } else if (result is GetActiveDeliveriesFailure) {
      throw Exception(result.error);
    }
    return [];
  },
);

/// Provider pour l'historique des livraisons
final deliveriesHistoryProvider = FutureProvider.family<List<CustomerDelivery>, DeliveryHistoryParams>(
  (ref, params) async {
    final useCase = ref.watch(trackDeliveryUseCaseProvider);
    final result = await useCase.getDeliveriesHistory(
      params.customerId,
      startDate: params.startDate,
      endDate: params.endDate,
      limit: params.limit,
    );
    
    if (result is GetDeliveriesHistorySuccess) {
      return result.deliveries;
    } else if (result is GetDeliveriesHistoryFailure) {
      throw Exception(result.error);
    }
    return [];
  },
);

// ==================== STATE NOTIFIER ====================

/// Notifier pour le suivi de livraison
class DeliveryTrackingNotifier extends StateNotifier<AsyncValue<CustomerDelivery>> {
  final TrackDeliveryUseCase _useCase;
  final String _deliveryId;

  DeliveryTrackingNotifier(this._useCase, this._deliveryId) 
      : super(const AsyncValue.loading()) {
    loadDelivery();
  }

  /// Charge les informations de livraison
  Future<void> loadDelivery() async {
    try {
      state = const AsyncValue.loading();
      
      final result = await _useCase.execute(_deliveryId);

      if (result is TrackDeliverySuccess) {
        state = AsyncValue.data(result.delivery);
      } else if (result is TrackDeliveryNotTrackable) {
        state = AsyncValue.error(
          'Livraison non suivable: ${result.reason}',
          StackTrace.current,
        );
      } else if (result is TrackDeliveryFailure) {
        state = AsyncValue.error(result.error, StackTrace.current);
      }
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  /// Rafraîchit les informations de livraison
  Future<void> refresh() async {
    await loadDelivery();
  }

  /// Calcule la distance restante
  double? calculateDistance(double currentLat, double currentLon) {
    return state.when(
      data: (delivery) {
        if (delivery.deliveryLatitude == null || delivery.deliveryLongitude == null) {
          return null;
        }

        return _useCase.calculateDistance(
          lat1: currentLat,
          lon1: currentLon,
          lat2: delivery.deliveryLatitude!,
          lon2: delivery.deliveryLongitude!,
        );
      },
      loading: () => null,
      error: (_, __) => null,
    );
  }

  /// Estime l'heure d'arrivée
  DateTime? estimateArrival(double distanceKm) {
    return _useCase.estimateArrival(distanceKm: distanceKm);
  }
}

// ==================== CLASSES AUXILIAIRES ====================

/// Paramètres pour l'historique des livraisons
class DeliveryHistoryParams {
  final String customerId;
  final DateTime? startDate;
  final DateTime? endDate;
  final int? limit;

  const DeliveryHistoryParams({
    required this.customerId,
    this.startDate,
    this.endDate,
    this.limit,
  });
}
