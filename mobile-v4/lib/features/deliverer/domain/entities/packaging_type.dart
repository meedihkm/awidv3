import 'package:freezed_annotation/freezed_annotation.dart';

part 'packaging_type.freezed.dart';
part 'packaging_type.g.dart';

/// Packaging Type
/// Représente un type de consigne disponible
@freezed
class PackagingType with _$PackagingType {
  const factory PackagingType({
    required String id,
    required String name,
    required double unitValue,
    String? description,
    String? imageUrl,
    @Default(true) bool isActive,
  }) = _PackagingType;

  factory PackagingType.fromJson(Map<String, dynamic> json) =>
      _$PackagingTypeFromJson(json);

  const PackagingType._();

  /// Get formatted unit value
  String get unitValueFormatted {
    return '${unitValue.toStringAsFixed(0).replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]} ',
        )} DZD';
  }

  /// Legacy compatibility - alias for unitValue
  double get value => unitValue;
}

/// Packaging Balance
/// Représente le solde de consignes d'un client
@freezed
class PackagingBalance with _$PackagingBalance {
  const factory PackagingBalance({
    required String customerId,
    required List<PackagingBalanceItem> items,
    required double totalValue,
    DateTime? lastUpdated,
  }) = _PackagingBalance;

  factory PackagingBalance.fromJson(Map<String, dynamic> json) =>
      _$PackagingBalanceFromJson(json);

  const PackagingBalance._();

  /// Get formatted total value
  String get totalValueFormatted {
    return '${totalValue.toStringAsFixed(0).replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]} ',
        )} DZD';
  }

  /// Check if has balance
  bool get hasBalance => totalValue > 0;

  /// Get total quantity
  int get totalQuantity {
    return items.fold(0, (sum, item) => sum + item.quantity);
  }
}

/// Packaging Balance Item
/// Représente un article dans le solde de consignes
@freezed
class PackagingBalanceItem with _$PackagingBalanceItem {
  const factory PackagingBalanceItem({
    required String packagingId,
    required String packagingName,
    required int quantity,
    required double unitValue,
    required double totalValue,
  }) = _PackagingBalanceItem;

  factory PackagingBalanceItem.fromJson(Map<String, dynamic> json) =>
      _$PackagingBalanceItemFromJson(json);

  const PackagingBalanceItem._();

  /// Get formatted total value
  String get totalValueFormatted {
    return '${totalValue.toStringAsFixed(0).replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]} ',
        )} DZD';
  }
}
