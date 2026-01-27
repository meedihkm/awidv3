import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/payment_collection.dart';
import '../../domain/repositories/delivery_actions_repository.dart';

part 'payment_collection_model.freezed.dart';
part 'payment_collection_model.g.dart';

/// Model: Encaissement de Paiement
/// Model pour la sérialisation JSON de l'encaissement
@freezed
class PaymentCollectionModel with _$PaymentCollectionModel {
  const factory PaymentCollectionModel({
    required String id,
    @JsonKey(name: 'deliverer_id') required String delivererId,
    @JsonKey(name: 'customer_id') required String customerId,
    @JsonKey(name: 'customer_name') required String customerName,
    required double amount,
    required PaymentMode mode,
    @JsonKey(name: 'collected_at') required DateTime collectedAt,
    required List<PaymentAllocationModel> allocations,
    String? reference,
    String? notes,
    @JsonKey(name: 'receipt_image_path') String? receiptImagePath,
    @JsonKey(name: 'is_uploaded') @Default(false) bool isUploaded,
    @JsonKey(name: 'uploaded_at') DateTime? uploadedAt,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _PaymentCollectionModel;

  factory PaymentCollectionModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentCollectionModelFromJson(json);
}

/// Model: Allocation de Paiement
@freezed
class PaymentAllocationModel with _$PaymentAllocationModel {
  const factory PaymentAllocationModel({
    @JsonKey(name: 'order_id') required String orderId,
    @JsonKey(name: 'order_number') required String orderNumber,
    @JsonKey(name: 'allocated_amount') required double allocatedAmount,
    @JsonKey(name: 'order_date') required DateTime orderDate,
    @JsonKey(name: 'is_fully_paid') @Default(false) bool isFullyPaid,
  }) = _PaymentAllocationModel;

  factory PaymentAllocationModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentAllocationModelFromJson(json);
}

extension PaymentCollectionModelX on PaymentCollectionModel {
  /// Convertit le model en entité domain
  PaymentCollection toEntity() {
    return PaymentCollection(
      id: id,
      delivererId: delivererId,
      customerId: customerId,
      customerName: customerName,
      amount: amount,
      mode: mode,
      collectedAt: collectedAt,
      allocations: allocations.map((a) => a.toEntity()).toList(),
      reference: reference,
      notes: notes,
      receiptImagePath: receiptImagePath,
      isUploaded: isUploaded,
      uploadedAt: uploadedAt,
      createdAt: createdAt,
    );
  }

  /// Crée un model pour l'upload vers l'API
  Map<String, dynamic> toUploadJson() {
    return {
      'deliverer_id': delivererId,
      'customer_id': customerId,
      'customer_name': customerName,
      'amount': amount,
      'mode': mode.name,
      'collected_at': collectedAt.toIso8601String(),
      'allocations': allocations.map((a) => a.toUploadJson()).toList(),
      if (reference?.isNotEmpty == true) 'reference': reference,
      if (notes?.isNotEmpty == true) 'notes': notes,
      if (receiptImagePath?.isNotEmpty == true) 'receipt_image_path': receiptImagePath,
    };
  }
}

/// Crée un PaymentCollectionModel à partir d'une entité domain
PaymentCollectionModel paymentCollectionModelFromEntity(PaymentCollection entity) {
  return PaymentCollectionModel(
    id: entity.id,
    delivererId: entity.delivererId,
    customerId: entity.customerId,
    customerName: entity.customerName,
    amount: entity.amount,
    mode: entity.mode,
    collectedAt: entity.collectedAt,
    allocations: entity.allocations
        .map((a) => paymentAllocationModelFromEntity(a))
        .toList(),
    reference: entity.reference,
    notes: entity.notes,
    receiptImagePath: entity.receiptImagePath,
    isUploaded: entity.isUploaded,
    uploadedAt: entity.uploadedAt,
    createdAt: entity.createdAt,
  );
}

/// Crée un PaymentCollectionModel à partir de la réponse API
PaymentCollectionModel paymentCollectionModelFromApiResponse(Map<String, dynamic> json) {
  return PaymentCollectionModel(
    id: json['id'] as String,
    delivererId: json['deliverer_id'] as String,
    customerId: json['customer_id'] as String,
    customerName: json['customer_name'] as String,
    amount: (json['amount'] as num).toDouble(),
    mode: PaymentMode.values.firstWhere(
      (m) => m.name == json['mode'],
      orElse: () => PaymentMode.cash,
    ),
    collectedAt: DateTime.parse(json['collected_at'] as String),
    allocations: (json['allocations'] as List)
        .map((a) => paymentAllocationModelFromApiResponse(a))
        .toList(),
    reference: json['reference'] as String?,
    notes: json['notes'] as String?,
    receiptImagePath: json['receipt_image_path'] as String?,
    isUploaded: json['is_uploaded'] as bool? ?? true,
    uploadedAt: json['uploaded_at'] != null 
        ? DateTime.parse(json['uploaded_at'] as String)
        : null,
    createdAt: json['created_at'] != null 
        ? DateTime.parse(json['created_at'] as String)
        : null,
  );
}

extension PaymentAllocationModelX on PaymentAllocationModel {
  /// Convertit le model en entité domain
  PaymentAllocation toEntity() {
    return PaymentAllocation(
      orderId: orderId,
      orderNumber: orderNumber,
      allocatedAmount: allocatedAmount,
      orderDate: orderDate,
      isFullyPaid: isFullyPaid,
    );
  }

  /// Crée un model pour l'upload vers l'API
  Map<String, dynamic> toUploadJson() {
    return {
      'order_id': orderId,
      'order_number': orderNumber,
      'allocated_amount': allocatedAmount,
      'order_date': orderDate.toIso8601String(),
      'is_fully_paid': isFullyPaid,
    };
  }
}

/// Crée un PaymentAllocationModel à partir d'une entité domain
PaymentAllocationModel paymentAllocationModelFromEntity(PaymentAllocation entity) {
  return PaymentAllocationModel(
    orderId: entity.orderId,
    orderNumber: entity.orderNumber,
    allocatedAmount: entity.allocatedAmount,
    orderDate: entity.orderDate,
    isFullyPaid: entity.isFullyPaid,
  );
}

/// Crée un PaymentAllocationModel à partir de la réponse API
PaymentAllocationModel paymentAllocationModelFromApiResponse(Map<String, dynamic> json) {
  return PaymentAllocationModel(
    orderId: json['order_id'] as String,
    orderNumber: json['order_number'] as String,
    allocatedAmount: (json['allocated_amount'] as num).toDouble(),
    orderDate: DateTime.parse(json['order_date'] as String),
    isFullyPaid: json['is_fully_paid'] as bool? ?? false,
  );
}

/// Model pour la requête d'upload de paiement
@freezed
class UploadPaymentRequest with _$UploadPaymentRequest {
  const factory UploadPaymentRequest({
    @JsonKey(name: 'deliverer_id') required String delivererId,
    @JsonKey(name: 'customer_id') required String customerId,
    @JsonKey(name: 'customer_name') required String customerName,
    required double amount,
    required String mode,
    @JsonKey(name: 'collected_at') required DateTime collectedAt,
    required List<Map<String, dynamic>> allocations,
    String? reference,
    String? notes,
    @JsonKey(name: 'receipt_image') String? receiptImageBase64,
  }) = _UploadPaymentRequest;

  factory UploadPaymentRequest.fromJson(Map<String, dynamic> json) =>
      _$UploadPaymentRequestFromJson(json);
}

/// Model pour la réponse d'upload de paiement
@freezed
class UploadPaymentResponse with _$UploadPaymentResponse {
  const factory UploadPaymentResponse({
    required String id,
    required String status,
    required String message,
    @JsonKey(name: 'uploaded_at') required DateTime uploadedAt,
    @JsonKey(name: 'receipt_url') String? receiptUrl,
    @JsonKey(name: 'updated_orders') List<String>? updatedOrders,
  }) = _UploadPaymentResponse;

  factory UploadPaymentResponse.fromJson(Map<String, dynamic> json) =>
      _$UploadPaymentResponseFromJson(json);
}

extension UploadPaymentResponseX on UploadPaymentResponse {
  /// Vérifie si l'upload a réussi
  bool get isSuccess => status == 'success' || status == 'uploaded';

  /// Vérifie si l'upload a échoué
  bool get isFailure => status == 'error' || status == 'failed';

  /// Retourne le nombre de commandes mises à jour
  int get updatedOrdersCount => updatedOrders?.length ?? 0;
}

/// Model pour les commandes impayées
@freezed
class UnpaidOrderModel with _$UnpaidOrderModel {
  const factory UnpaidOrderModel({
    required String id,
    @JsonKey(name: 'order_number') required String orderNumber,
    @JsonKey(name: 'order_date') required DateTime orderDate,
    @JsonKey(name: 'total_amount') required double totalAmount,
    @JsonKey(name: 'paid_amount') required double paidAmount,
    @JsonKey(name: 'remaining_amount') required double remainingAmount,
    @JsonKey(name: 'days_since_order') required int daysSinceOrder,
  }) = _UnpaidOrderModel;

  factory UnpaidOrderModel.fromJson(Map<String, dynamic> json) =>
      _$UnpaidOrderModelFromJson(json);
}

extension UnpaidOrderModelX on UnpaidOrderModel {
  /// Convertit le model en classe auxiliaire
  UnpaidOrder toUnpaidOrder() {
    return UnpaidOrder(
      id: id,
      orderNumber: orderNumber,
      orderDate: orderDate,
      totalAmount: totalAmount,
      paidAmount: paidAmount,
      remainingAmount: remainingAmount,
      daysSinceOrder: daysSinceOrder,
    );
  }
}

/// Crée un UnpaidOrderModel à partir de la réponse API
UnpaidOrderModel unpaidOrderModelFromApiResponse(Map<String, dynamic> json) {
  return UnpaidOrderModel(
    id: json['id'] as String,
    orderNumber: json['order_number'] as String,
    orderDate: DateTime.parse(json['order_date'] as String),
    totalAmount: (json['total_amount'] as num).toDouble(),
    paidAmount: (json['paid_amount'] as num).toDouble(),
    remainingAmount: (json['remaining_amount'] as num).toDouble(),
    daysSinceOrder: json['days_since_order'] as int,
  );
}