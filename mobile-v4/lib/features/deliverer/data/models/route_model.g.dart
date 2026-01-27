// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WaypointModelImpl _$$WaypointModelImplFromJson(Map<String, dynamic> json) =>
    _$WaypointModelImpl(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      order: (json['order'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$WaypointModelImplToJson(_$WaypointModelImpl instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'order': instance.order,
    };

_$DeliveryRouteModelImpl _$$DeliveryRouteModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DeliveryRouteModelImpl(
      id: json['id'] as String,
      startLatitude: (json['start_latitude'] as num).toDouble(),
      startLongitude: (json['start_longitude'] as num).toDouble(),
      endLatitude: (json['end_latitude'] as num).toDouble(),
      endLongitude: (json['end_longitude'] as num).toDouble(),
      waypoints: (json['waypoints'] as List<dynamic>)
          .map((e) => WaypointModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      distanceKm: (json['distance_km'] as num).toDouble(),
      durationMinutes: (json['duration_minutes'] as num).toInt(),
      instructions: json['instructions'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$DeliveryRouteModelImplToJson(
        _$DeliveryRouteModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'start_latitude': instance.startLatitude,
      'start_longitude': instance.startLongitude,
      'end_latitude': instance.endLatitude,
      'end_longitude': instance.endLongitude,
      'waypoints': instance.waypoints,
      'distance_km': instance.distanceKm,
      'duration_minutes': instance.durationMinutes,
      'instructions': instance.instructions,
      'created_at': instance.createdAt?.toIso8601String(),
    };
