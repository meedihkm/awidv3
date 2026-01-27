import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/order_summary.dart';

part 'order_summary_model.freezed.dart';
part 'order_summary_model.g.dart';

/// Order Summary Model
/// Modèle de données pour le résumé de commande
@freezed
class OrderSummaryModel with _$OrderSummaryModel {
  const factory OrderSummaryModel({
    required String id,
    required String customerName,
    required String customerOrganization,
    required String status,
    required double totalAmount,
    required int itemsCount,
    required DateTime createdAt,
    String? delivererName,
    DateTime? deliveryTime,
  }) = _OrderSummaryModel;

  const OrderSummaryModel._();

  factory OrderSummaryModel.fromJson(Map<String, dynamic> json) => _$OrderSummaryModelFromJson(json);

  /// Convert to domain entity
  OrderSummary toEntity() {
    return OrderSummary(
      id: id,
      customerName: customerName,
      customerOrganization: customerOrganization,
      status: status,
      totalAmount: totalAmount,
      itemsCount: itemsCount,
      createdAt: createdAt,
      delivererName: delivererName,
      deliveryTime: deliveryTime,
    );
  }
}
