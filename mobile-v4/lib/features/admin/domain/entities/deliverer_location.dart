import 'package:freezed_annotation/freezed_annotation.dart';

part 'deliverer_location.freezed.dart';

/// Deliverer Location Entity
/// Position d'un livreur
@freezed
class DelivererLocation with _$DelivererLocation {
  const factory DelivererLocation({
    required String id,
    required String name,
    required double latitude,
    required double longitude,
    required String status,
    required int activeDeliveries,
    required DateTime lastUpdate,
  }) = _DelivererLocation;

  const DelivererLocation._();

  /// Check if deliverer is available
  bool get isAvailable => status == 'available';

  /// Check if deliverer is busy
  bool get isBusy => status == 'busy';

  /// Check if deliverer is offline
  bool get isOffline => status == 'offline';
}
