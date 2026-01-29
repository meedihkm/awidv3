// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deliverer_location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DelivererLocationModel _$DelivererLocationModelFromJson(
        Map<String, dynamic> json) =>
    _DelivererLocationModel(
      id: json['id'] as String,
      name: json['name'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      status: json['status'] as String,
      activeDeliveries: (json['active_deliveries'] as num).toInt(),
      lastUpdate: DateTime.parse(json['last_update'] as String),
    );

Map<String, dynamic> _$DelivererLocationModelToJson(
        _DelivererLocationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'status': instance.status,
      'active_deliveries': instance.activeDeliveries,
      'last_update': instance.lastUpdate.toIso8601String(),
    };
