import 'package:awid_mobile/features/kitchen/domain/entities/stock_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'stock_item_model.freezed.dart';
part 'stock_item_model.g.dart';

/// Model pour StockItem
@freezed
class StockItemModel with _$StockItemModel {
  const factory StockItemModel({
    required String id,
    required String productId,
    required String productName,
    required double currentQuantity,
    required double minimumQuantity,
    required double maximumQuantity,
    required String unit,
    String? category,
    String? supplier,
    String? location,
    String? imageUrl,
    String? lastRestockDate,
    String? expirationDate,
    double? unitCost,
    String? barcode,
    @Default(false) bool isPerishable,
    @Default(false) bool requiresRefrigeration,
  }) = _StockItemModel;

  const StockItemModel._();

  factory StockItemModel.fromJson(Map<String, dynamic> json) =>
      _$StockItemModelFromJson(json);

  /// Convertir vers entité
  StockItem toEntity() {
    return StockItem(
      id: id,
      productId: productId,
      productName: productName,
      currentQuantity: currentQuantity,
      minimumQuantity: minimumQuantity,
      maximumQuantity: maximumQuantity,
      unit: _parseUnit(unit),
      category: category,
      supplier: supplier,
      location: location,
      imageUrl: imageUrl,
      lastRestockDate: lastRestockDate != null 
          ? DateTime.parse(lastRestockDate!) 
          : null,
      expirationDate: expirationDate != null 
          ? DateTime.parse(expirationDate!) 
          : null,
      unitCost: unitCost,
      barcode: barcode,
      isPerishable: isPerishable,
      requiresRefrigeration: requiresRefrigeration,
    );
  }

  /// Créer depuis entité
  factory StockItemModel.fromEntity(StockItem entity) {
    return StockItemModel(
      id: entity.id,
      productId: entity.productId,
      productName: entity.productName,
      currentQuantity: entity.currentQuantity,
      minimumQuantity: entity.minimumQuantity,
      maximumQuantity: entity.maximumQuantity,
      unit: _unitToString(entity.unit),
      category: entity.category,
      supplier: entity.supplier,
      location: entity.location,
      imageUrl: entity.imageUrl,
      lastRestockDate: entity.lastRestockDate?.toIso8601String(),
      expirationDate: entity.expirationDate?.toIso8601String(),
      unitCost: entity.unitCost,
      barcode: entity.barcode,
      isPerishable: entity.isPerishable,
      requiresRefrigeration: entity.requiresRefrigeration,
    );
  }

  static StockUnit _parseUnit(String unit) {
    switch (unit.toLowerCase()) {
      case 'kg':
        return StockUnit.kg;
      case 'g':
        return StockUnit.g;
      case 'l':
        return StockUnit.l;
      case 'ml':
        return StockUnit.ml;
      case 'unit':
        return StockUnit.unit;
      case 'box':
        return StockUnit.box;
      case 'pack':
        return StockUnit.pack;
      default:
        return StockUnit.unit;
    }
  }

  static String _unitToString(StockUnit unit) {
    return unit.name;
  }
}

/// Model pour StockMovement
@freezed
class StockMovementModel with _$StockMovementModel {
  const factory StockMovementModel({
    required String id,
    required String stockItemId,
    required String productName,
    required String type,
    required double quantity,
    required String unit,
    required String timestamp,
    String? orderId,
    String? userId,
    String? userName,
    String? reason,
    String? notes,
  }) = _StockMovementModel;

  const StockMovementModel._();

  factory StockMovementModel.fromJson(Map<String, dynamic> json) =>
      _$StockMovementModelFromJson(json);

  /// Convertir vers entité
  StockMovement toEntity() {
    return StockMovement(
      id: id,
      stockItemId: stockItemId,
      productName: productName,
      type: _parseType(type),
      quantity: quantity,
      unit: _parseUnit(unit),
      timestamp: DateTime.parse(timestamp),
      orderId: orderId,
      userId: userId,
      userName: userName,
      reason: reason,
      notes: notes,
    );
  }

  /// Créer depuis entité
  factory StockMovementModel.fromEntity(StockMovement entity) {
    return StockMovementModel(
      id: entity.id,
      stockItemId: entity.stockItemId,
      productName: entity.productName,
      type: _typeToString(entity.type),
      quantity: entity.quantity,
      unit: _unitToString(entity.unit),
      timestamp: entity.timestamp.toIso8601String(),
      orderId: entity.orderId,
      userId: entity.userId,
      userName: entity.userName,
      reason: entity.reason,
      notes: entity.notes,
    );
  }

  static StockMovementType _parseType(String type) {
    switch (type.toLowerCase()) {
      case 'in':
      case 'stockin':
        return StockMovementType.stockIn;
      case 'out':
      case 'stockout':
        return StockMovementType.stockOut;
      case 'adjustment':
        return StockMovementType.adjustment;
      case 'waste':
        return StockMovementType.waste;
      case 'transfer':
        return StockMovementType.transfer;
      default:
        return StockMovementType.stockOut;
    }
  }

  static String _typeToString(StockMovementType type) {
    return type.name;
  }

  static StockUnit _parseUnit(String unit) {
    return StockItemModel._parseUnit(unit);
  }

  static String _unitToString(StockUnit unit) {
    return StockItemModel._unitToString(unit);
  }
}

/// Model pour StockAlert
@freezed
class StockAlertModel with _$StockAlertModel {
  const factory StockAlertModel({
    required String id,
    required String stockItemId,
    required String productName,
    required String type,
    required String severity,
    required String createdAt,
    String? message,
    bool? isResolved,
    String? resolvedAt,
  }) = _StockAlertModel;

  const StockAlertModel._();

  factory StockAlertModel.fromJson(Map<String, dynamic> json) =>
      _$StockAlertModelFromJson(json);

  /// Convertir vers entité
  StockAlert toEntity() {
    return StockAlert(
      id: id,
      stockItemId: stockItemId,
      productName: productName,
      type: _parseType(type),
      severity: _parseSeverity(severity),
      createdAt: DateTime.parse(createdAt),
      message: message,
      isResolved: isResolved,
      resolvedAt: resolvedAt != null ? DateTime.parse(resolvedAt!) : null,
    );
  }

  /// Créer depuis entité
  factory StockAlertModel.fromEntity(StockAlert entity) {
    return StockAlertModel(
      id: entity.id,
      stockItemId: entity.stockItemId,
      productName: entity.productName,
      type: _typeToString(entity.type),
      severity: _severityToString(entity.severity),
      createdAt: entity.createdAt.toIso8601String(),
      message: entity.message,
      isResolved: entity.isResolved,
      resolvedAt: entity.resolvedAt?.toIso8601String(),
    );
  }

  static StockAlertType _parseType(String type) {
    switch (type.toLowerCase()) {
      case 'outofstock':
        return StockAlertType.outOfStock;
      case 'lowstock':
        return StockAlertType.lowStock;
      case 'criticalstock':
        return StockAlertType.criticalStock;
      case 'nearexpiration':
        return StockAlertType.nearExpiration;
      case 'expired':
        return StockAlertType.expired;
      default:
        return StockAlertType.lowStock;
    }
  }

  static String _typeToString(StockAlertType type) {
    switch (type) {
      case StockAlertType.outOfStock:
        return 'outOfStock';
      case StockAlertType.lowStock:
        return 'lowStock';
      case StockAlertType.criticalStock:
        return 'criticalStock';
      case StockAlertType.nearExpiration:
        return 'nearExpiration';
      case StockAlertType.expired:
        return 'expired';
    }
  }

  static StockAlertSeverity _parseSeverity(String severity) {
    switch (severity.toLowerCase()) {
      case 'info':
        return StockAlertSeverity.info;
      case 'warning':
        return StockAlertSeverity.warning;
      case 'critical':
        return StockAlertSeverity.critical;
      case 'urgent':
        return StockAlertSeverity.urgent;
      default:
        return StockAlertSeverity.info;
    }
  }

  static String _severityToString(StockAlertSeverity severity) {
    return severity.name;
  }
}
