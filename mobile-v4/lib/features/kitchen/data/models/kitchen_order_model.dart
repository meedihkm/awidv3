import 'package:awid_mobile/features/kitchen/domain/entities/kitchen_order.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'kitchen_order_model.freezed.dart';
part 'kitchen_order_model.g.dart';

/// Model pour KitchenOrder
@freezed
class KitchenOrderModel with _$KitchenOrderModel {
  const factory KitchenOrderModel({
    required String id,
    required String orderNumber,
    required String customerId,
    required String customerName,
    required String status,
    required String priority,
    required List<KitchenOrderItemModel> items,
    required String orderTime,
    String? startTime,
    String? readyTime,
    String? completedTime,
    String? assignedStation,
    String? assignedStaff,
    String? notes,
    String? specialInstructions,
    int? estimatedMinutes,
    @Default(false) bool isUrgent,
    @Default(false) bool isDelayed,
  }) = _KitchenOrderModel;

  const KitchenOrderModel._();

  factory KitchenOrderModel.fromJson(Map<String, dynamic> json) =>
      _$KitchenOrderModelFromJson(json);

  /// Convertir vers entité
  KitchenOrder toEntity() {
    return KitchenOrder(
      id: id,
      orderNumber: orderNumber,
      customerId: customerId,
      customerName: customerName,
      status: _parseStatus(status),
      priority: _parsePriority(priority),
      items: items.map((i) => i.toEntity()).toList(),
      orderTime: DateTime.parse(orderTime),
      startTime: startTime != null ? DateTime.parse(startTime!) : null,
      readyTime: readyTime != null ? DateTime.parse(readyTime!) : null,
      completedTime: completedTime != null ? DateTime.parse(completedTime!) : null,
      assignedStation: assignedStation,
      assignedStaff: assignedStaff,
      notes: notes,
      specialInstructions: specialInstructions,
      estimatedMinutes: estimatedMinutes,
      isUrgent: isUrgent,
      isDelayed: isDelayed,
    );
  }

  /// Créer depuis entité
  factory KitchenOrderModel.fromEntity(KitchenOrder entity) {
    return KitchenOrderModel(
      id: entity.id,
      orderNumber: entity.orderNumber,
      customerId: entity.customerId,
      customerName: entity.customerName,
      status: _statusToString(entity.status),
      priority: _priorityToString(entity.priority),
      items: entity.items.map((i) => KitchenOrderItemModel.fromEntity(i)).toList(),
      orderTime: entity.orderTime.toIso8601String(),
      startTime: entity.startTime?.toIso8601String(),
      readyTime: entity.readyTime?.toIso8601String(),
      completedTime: entity.completedTime?.toIso8601String(),
      assignedStation: entity.assignedStation,
      assignedStaff: entity.assignedStaff,
      notes: entity.notes,
      specialInstructions: entity.specialInstructions,
      estimatedMinutes: entity.estimatedMinutes,
      isUrgent: entity.isUrgent,
      isDelayed: entity.isDelayed,
    );
  }

  static KitchenOrderStatus _parseStatus(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return KitchenOrderStatus.pending;
      case 'preparing':
        return KitchenOrderStatus.preparing;
      case 'ready':
        return KitchenOrderStatus.ready;
      case 'completed':
        return KitchenOrderStatus.completed;
      case 'cancelled':
        return KitchenOrderStatus.cancelled;
      default:
        return KitchenOrderStatus.pending;
    }
  }

  static String _statusToString(KitchenOrderStatus status) {
    return status.name;
  }

  static OrderPriority _parsePriority(String priority) {
    switch (priority.toLowerCase()) {
      case 'low':
        return OrderPriority.low;
      case 'normal':
        return OrderPriority.normal;
      case 'high':
        return OrderPriority.high;
      case 'urgent':
        return OrderPriority.urgent;
      default:
        return OrderPriority.normal;
    }
  }

  static String _priorityToString(OrderPriority priority) {
    return priority.name;
  }
}

/// Model pour KitchenOrderItem
@freezed
class KitchenOrderItemModel with _$KitchenOrderItemModel {
  const factory KitchenOrderItemModel({
    required String id,
    required String productId,
    required String productName,
    required int quantity,
    String? unit,
    String? notes,
    String? imageUrl,
    @Default(false) bool isPrepared,
    @Default(false) bool requiresSpecialPreparation,
  }) = _KitchenOrderItemModel;

  const KitchenOrderItemModel._();

  factory KitchenOrderItemModel.fromJson(Map<String, dynamic> json) =>
      _$KitchenOrderItemModelFromJson(json);

  /// Convertir vers entité
  KitchenOrderItem toEntity() {
    return KitchenOrderItem(
      id: id,
      productId: productId,
      productName: productName,
      quantity: quantity,
      unit: unit,
      notes: notes,
      imageUrl: imageUrl,
      isPrepared: isPrepared,
      requiresSpecialPreparation: requiresSpecialPreparation,
    );
  }

  /// Créer depuis entité
  factory KitchenOrderItemModel.fromEntity(KitchenOrderItem entity) {
    return KitchenOrderItemModel(
      id: entity.id,
      productId: entity.productId,
      productName: entity.productName,
      quantity: entity.quantity,
      unit: entity.unit,
      notes: entity.notes,
      imageUrl: entity.imageUrl,
      isPrepared: entity.isPrepared,
      requiresSpecialPreparation: entity.requiresSpecialPreparation,
    );
  }
}
