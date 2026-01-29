// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kitchen_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_KitchenOrderModel _$KitchenOrderModelFromJson(Map<String, dynamic> json) =>
    _KitchenOrderModel(
      id: json['id'] as String,
      orderNumber: json['order_number'] as String,
      customerId: json['customer_id'] as String,
      customerName: json['customer_name'] as String,
      status: json['status'] as String,
      priority: json['priority'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => KitchenOrderItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      orderTime: json['order_time'] as String,
      startTime: json['start_time'] as String?,
      readyTime: json['ready_time'] as String?,
      completedTime: json['completed_time'] as String?,
      assignedStation: json['assigned_station'] as String?,
      assignedStaff: json['assigned_staff'] as String?,
      notes: json['notes'] as String?,
      specialInstructions: json['special_instructions'] as String?,
      estimatedMinutes: (json['estimated_minutes'] as num?)?.toInt(),
      isUrgent: json['is_urgent'] as bool? ?? false,
      isDelayed: json['is_delayed'] as bool? ?? false,
    );

Map<String, dynamic> _$KitchenOrderModelToJson(_KitchenOrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_number': instance.orderNumber,
      'customer_id': instance.customerId,
      'customer_name': instance.customerName,
      'status': instance.status,
      'priority': instance.priority,
      'items': instance.items.map((e) => e.toJson()).toList(),
      'order_time': instance.orderTime,
      'start_time': instance.startTime,
      'ready_time': instance.readyTime,
      'completed_time': instance.completedTime,
      'assigned_station': instance.assignedStation,
      'assigned_staff': instance.assignedStaff,
      'notes': instance.notes,
      'special_instructions': instance.specialInstructions,
      'estimated_minutes': instance.estimatedMinutes,
      'is_urgent': instance.isUrgent,
      'is_delayed': instance.isDelayed,
    };

_KitchenOrderItemModel _$KitchenOrderItemModelFromJson(
        Map<String, dynamic> json) =>
    _KitchenOrderItemModel(
      id: json['id'] as String,
      productId: json['product_id'] as String,
      productName: json['product_name'] as String,
      quantity: (json['quantity'] as num).toInt(),
      unit: json['unit'] as String?,
      notes: json['notes'] as String?,
      imageUrl: json['image_url'] as String?,
      isPrepared: json['is_prepared'] as bool? ?? false,
      requiresSpecialPreparation:
          json['requires_special_preparation'] as bool? ?? false,
    );

Map<String, dynamic> _$KitchenOrderItemModelToJson(
        _KitchenOrderItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product_id': instance.productId,
      'product_name': instance.productName,
      'quantity': instance.quantity,
      'unit': instance.unit,
      'notes': instance.notes,
      'image_url': instance.imageUrl,
      'is_prepared': instance.isPrepared,
      'requires_special_preparation': instance.requiresSpecialPreparation,
    };
