// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StockItemModel _$StockItemModelFromJson(Map<String, dynamic> json) =>
    _StockItemModel(
      id: json['id'] as String,
      productId: json['product_id'] as String,
      productName: json['product_name'] as String,
      currentQuantity: (json['current_quantity'] as num).toDouble(),
      minimumQuantity: (json['minimum_quantity'] as num).toDouble(),
      maximumQuantity: (json['maximum_quantity'] as num).toDouble(),
      unit: json['unit'] as String,
      category: json['category'] as String?,
      supplier: json['supplier'] as String?,
      location: json['location'] as String?,
      imageUrl: json['image_url'] as String?,
      lastRestockDate: json['last_restock_date'] as String?,
      expirationDate: json['expiration_date'] as String?,
      unitCost: (json['unit_cost'] as num?)?.toDouble(),
      barcode: json['barcode'] as String?,
      isPerishable: json['is_perishable'] as bool? ?? false,
      requiresRefrigeration: json['requires_refrigeration'] as bool? ?? false,
    );

Map<String, dynamic> _$StockItemModelToJson(_StockItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product_id': instance.productId,
      'product_name': instance.productName,
      'current_quantity': instance.currentQuantity,
      'minimum_quantity': instance.minimumQuantity,
      'maximum_quantity': instance.maximumQuantity,
      'unit': instance.unit,
      'category': instance.category,
      'supplier': instance.supplier,
      'location': instance.location,
      'image_url': instance.imageUrl,
      'last_restock_date': instance.lastRestockDate,
      'expiration_date': instance.expirationDate,
      'unit_cost': instance.unitCost,
      'barcode': instance.barcode,
      'is_perishable': instance.isPerishable,
      'requires_refrigeration': instance.requiresRefrigeration,
    };

_StockMovementModel _$StockMovementModelFromJson(Map<String, dynamic> json) =>
    _StockMovementModel(
      id: json['id'] as String,
      stockItemId: json['stock_item_id'] as String,
      productName: json['product_name'] as String,
      type: json['type'] as String,
      quantity: (json['quantity'] as num).toDouble(),
      unit: json['unit'] as String,
      timestamp: json['timestamp'] as String,
      orderId: json['order_id'] as String?,
      userId: json['user_id'] as String?,
      userName: json['user_name'] as String?,
      reason: json['reason'] as String?,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$StockMovementModelToJson(_StockMovementModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'stock_item_id': instance.stockItemId,
      'product_name': instance.productName,
      'type': instance.type,
      'quantity': instance.quantity,
      'unit': instance.unit,
      'timestamp': instance.timestamp,
      'order_id': instance.orderId,
      'user_id': instance.userId,
      'user_name': instance.userName,
      'reason': instance.reason,
      'notes': instance.notes,
    };

_StockAlertModel _$StockAlertModelFromJson(Map<String, dynamic> json) =>
    _StockAlertModel(
      id: json['id'] as String,
      stockItemId: json['stock_item_id'] as String,
      productName: json['product_name'] as String,
      type: json['type'] as String,
      severity: json['severity'] as String,
      createdAt: json['created_at'] as String,
      message: json['message'] as String?,
      isResolved: json['is_resolved'] as bool?,
      resolvedAt: json['resolved_at'] as String?,
    );

Map<String, dynamic> _$StockAlertModelToJson(_StockAlertModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'stock_item_id': instance.stockItemId,
      'product_name': instance.productName,
      'type': instance.type,
      'severity': instance.severity,
      'created_at': instance.createdAt,
      'message': instance.message,
      'is_resolved': instance.isResolved,
      'resolved_at': instance.resolvedAt,
    };
