// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deliverer_location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DelivererLocationModelImpl _$$DelivererLocationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DelivererLocationModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      status: json['status'] as String,
      activeDeliveries: (json['activeDeliveries'] as num).toInt(),
      lastUpdate: DateTime.parse(json['lastUpdate'] as String),
    );

Map<String, dynamic> _$$DelivererLocationModelImplToJson(
        _$DelivererLocationModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'status': instance.status,
      'activeDeliveries': instance.activeDeliveries,
      'lastUpdate': instance.lastUpdate.toIso8601String(),
    };
