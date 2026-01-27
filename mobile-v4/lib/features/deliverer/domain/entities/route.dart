import 'package:freezed_annotation/freezed_annotation.dart';

part 'route.freezed.dart';

/// Waypoint Entity
/// Représente un point sur la route
@freezed
class Waypoint with _$Waypoint {
  const factory Waypoint({
    required double latitude,
    required double longitude,
    int? order,
  }) = _Waypoint;
}

/// Route Entity
/// Représente un itinéraire de livraison
@freezed
class DeliveryRoute with _$DeliveryRoute {
  const factory DeliveryRoute({
    required String id,
    required double startLatitude,
    required double startLongitude,
    required double endLatitude,
    required double endLongitude,
    required List<Waypoint> waypoints,
    required double distanceKm,
    required int durationMinutes,
    String? instructions,
    DateTime? createdAt,
  }) = _DeliveryRoute;

  const DeliveryRoute._();

  /// Get distance formatted
  String get distanceFormatted {
    if (distanceKm < 1) {
      return '${(distanceKm * 1000).round()} m';
    }
    return '${distanceKm.toStringAsFixed(1)} km';
  }

  /// Get duration formatted
  String get durationFormatted {
    if (durationMinutes < 60) {
      return '$durationMinutes min';
    }
    final hours = durationMinutes ~/ 60;
    final minutes = durationMinutes % 60;
    return '${hours}h ${minutes}min';
  }

  /// Get estimated arrival time
  DateTime get estimatedArrival {
    return DateTime.now().add(Duration(minutes: durationMinutes));
  }

  /// Check if route is short (< 5km)
  bool get isShortRoute => distanceKm < 5;

  /// Check if route is long (> 20km)
  bool get isLongRoute => distanceKm > 20;

  /// Get route complexity level
  String get complexityLevel {
    if (waypoints.length > 10) return 'Complexe';
    if (waypoints.length > 5) return 'Moyen';
    return 'Simple';
  }
}
