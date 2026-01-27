import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/deliverer_location.dart';

part 'deliverer_location_model.freezed.dart';
part 'deliverer_location_model.g.dart';

/// Deliverer Location Model
/// Modèle de données pour la position du livreur
@freezed
class DelivererLocationModel with _$DelivererLocationModel {
  const factory DelivererLocationModel({
    required String id,
    required String name,
    required double latitude,
    required double longitude,
    required String status,
    required int activeDeliveries,
    required DateTime lastUpdate,
  }) = _DelivererLocationModel;

  const DelivererLocationModel._();

  factory DelivererLocationModel.fromJson(Map<String, dynamic> json) => _$DelivererLocationModelFromJson(json);

  /// Convert to domain entity
  DelivererLocation toEntity() {
    return DelivererLocation(
      id: id,
      name: name,
      latitude: latitude,
      longitude: longitude,
      status: status,
      activeDeliveries: activeDeliveries,
      lastUpdate: lastUpdate,
    );
  }
}
