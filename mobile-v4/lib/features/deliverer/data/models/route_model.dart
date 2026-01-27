import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/route.dart';

part 'route_model.freezed.dart';
part 'route_model.g.dart';

/// Waypoint Model
@freezed
class WaypointModel with _$WaypointModel {
  const factory WaypointModel({
    required double latitude,
    required double longitude,
    int? order,
  }) = _WaypointModel;

  factory WaypointModel.fromEntity(Waypoint entity) {
    return WaypointModel(
      latitude: entity.latitude,
      longitude: entity.longitude,
      order: entity.order,
    );
  }

  const WaypointModel._();

  factory WaypointModel.fromJson(Map<String, dynamic> json) => _$WaypointModelFromJson(json);

  Waypoint toEntity() {
    return Waypoint(
      latitude: latitude,
      longitude: longitude,
      order: order,
    );
  }
}

/// Route Model
/// Model pour la sérialisation JSON de l'itinéraire
@freezed
class DeliveryRouteModel with _$DeliveryRouteModel {
  const factory DeliveryRouteModel({
    required String id,
    @JsonKey(name: 'start_latitude') required double startLatitude,
    @JsonKey(name: 'start_longitude') required double startLongitude,
    @JsonKey(name: 'end_latitude') required double endLatitude,
    @JsonKey(name: 'end_longitude') required double endLongitude,
    required List<WaypointModel> waypoints,
    @JsonKey(name: 'distance_km') required double distanceKm,
    @JsonKey(name: 'duration_minutes') required int durationMinutes,
    String? instructions,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _DeliveryRouteModel;

  /// From Entity
  factory DeliveryRouteModel.fromEntity(DeliveryRoute entity) {
    return DeliveryRouteModel(
      id: entity.id,
      startLatitude: entity.startLatitude,
      startLongitude: entity.startLongitude,
      endLatitude: entity.endLatitude,
      endLongitude: entity.endLongitude,
      waypoints: entity.waypoints.map((w) => WaypointModel.fromEntity(w)).toList(),
      distanceKm: entity.distanceKm,
      durationMinutes: entity.durationMinutes,
      instructions: entity.instructions,
      createdAt: entity.createdAt,
    );
  }

  const DeliveryRouteModel._();

  /// From JSON
  factory DeliveryRouteModel.fromJson(Map<String, dynamic> json) => _$DeliveryRouteModelFromJson(json);

  /// To Entity
  DeliveryRoute toEntity() {
    return DeliveryRoute(
      id: id,
      startLatitude: startLatitude,
      startLongitude: startLongitude,
      endLatitude: endLatitude,
      endLongitude: endLongitude,
      waypoints: waypoints.map((w) => w.toEntity()).toList(),
      distanceKm: distanceKm,
      durationMinutes: durationMinutes,
      instructions: instructions,
      createdAt: createdAt,
    );
  }
}
