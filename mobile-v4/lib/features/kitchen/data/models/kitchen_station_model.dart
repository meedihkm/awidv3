import 'package:awid_mobile/features/kitchen/domain/entities/kitchen_station.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'kitchen_station_model.freezed.dart';
part 'kitchen_station_model.g.dart';

/// Model pour KitchenStation
@freezed
class KitchenStationModel with _$KitchenStationModel {
  const factory KitchenStationModel({
    required String id,
    required String name,
    required String type,
    required String status,
    String? assignedStaffId,
    String? assignedStaffName,
    List<String>? currentOrderIds,
    int? capacity,
    int? activeOrders,
    String? lastActivityTime,
    String? notes,
  }) = _KitchenStationModel;

  const KitchenStationModel._();

  factory KitchenStationModel.fromJson(Map<String, dynamic> json) =>
      _$KitchenStationModelFromJson(json);

  /// Convertir vers entité
  KitchenStation toEntity() {
    return KitchenStation(
      id: id,
      name: name,
      type: _parseType(type),
      status: _parseStatus(status),
      assignedStaffId: assignedStaffId,
      assignedStaffName: assignedStaffName,
      currentOrderIds: currentOrderIds,
      capacity: capacity,
      activeOrders: activeOrders,
      lastActivityTime: lastActivityTime != null 
          ? DateTime.parse(lastActivityTime!) 
          : null,
      notes: notes,
    );
  }

  /// Créer depuis entité
  factory KitchenStationModel.fromEntity(KitchenStation entity) {
    return KitchenStationModel(
      id: entity.id,
      name: entity.name,
      type: _typeToString(entity.type),
      status: _statusToString(entity.status),
      assignedStaffId: entity.assignedStaffId,
      assignedStaffName: entity.assignedStaffName,
      currentOrderIds: entity.currentOrderIds,
      capacity: entity.capacity,
      activeOrders: entity.activeOrders,
      lastActivityTime: entity.lastActivityTime?.toIso8601String(),
      notes: entity.notes,
    );
  }

  static StationType _parseType(String type) {
    switch (type.toLowerCase()) {
      case 'preparation':
        return StationType.preparation;
      case 'cooking':
        return StationType.cooking;
      case 'assembly':
        return StationType.assembly;
      case 'packaging':
        return StationType.packaging;
      case 'quality':
        return StationType.quality;
      default:
        return StationType.preparation;
    }
  }

  static String _typeToString(StationType type) {
    return type.name;
  }

  static StationStatus _parseStatus(String status) {
    switch (status.toLowerCase()) {
      case 'available':
        return StationStatus.available;
      case 'busy':
        return StationStatus.busy;
      case 'maintenance':
        return StationStatus.maintenance;
      case 'offline':
        return StationStatus.offline;
      default:
        return StationStatus.available;
    }
  }

  static String _statusToString(StationStatus status) {
    return status.name;
  }
}

/// Model pour StationAssignment
@freezed
class StationAssignmentModel with _$StationAssignmentModel {
  const factory StationAssignmentModel({
    required String orderId,
    required String stationId,
    required String stationName,
    required String assignedAt,
    String? startedAt,
    String? completedAt,
    String? assignedBy,
    String? notes,
  }) = _StationAssignmentModel;

  const StationAssignmentModel._();

  factory StationAssignmentModel.fromJson(Map<String, dynamic> json) =>
      _$StationAssignmentModelFromJson(json);

  /// Convertir vers entité
  StationAssignment toEntity() {
    return StationAssignment(
      orderId: orderId,
      stationId: stationId,
      stationName: stationName,
      assignedAt: DateTime.parse(assignedAt),
      startedAt: startedAt != null ? DateTime.parse(startedAt!) : null,
      completedAt: completedAt != null ? DateTime.parse(completedAt!) : null,
      assignedBy: assignedBy,
      notes: notes,
    );
  }

  /// Créer depuis entité
  factory StationAssignmentModel.fromEntity(StationAssignment entity) {
    return StationAssignmentModel(
      orderId: entity.orderId,
      stationId: entity.stationId,
      stationName: entity.stationName,
      assignedAt: entity.assignedAt.toIso8601String(),
      startedAt: entity.startedAt?.toIso8601String(),
      completedAt: entity.completedAt?.toIso8601String(),
      assignedBy: entity.assignedBy,
      notes: entity.notes,
    );
  }
}
