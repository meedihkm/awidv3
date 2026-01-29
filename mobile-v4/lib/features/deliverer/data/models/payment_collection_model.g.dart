// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_collection_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaymentCollectionModel _$PaymentCollectionModelFromJson(
        Map<String, dynamic> json) =>
    _PaymentCollectionModel(
      id: json['id'] as String,
      delivererId: json['deliverer_id'] as String,
      customerId: json['customer_id'] as String,
      customerName: json['customer_name'] as String,
      amount: (json['amount'] as num).toDouble(),
      mode: $enumDecode(_$PaymentModeEnumMap, json['mode']),
      collectedAt: DateTime.parse(json['collected_at'] as String),
      allocations: (json['allocations'] as List<dynamic>)
          .map(
              (e) => PaymentAllocationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      reference: json['reference'] as String?,
      notes: json['notes'] as String?,
      receiptImagePath: json['receipt_image_path'] as String?,
      isUploaded: json['is_uploaded'] as bool? ?? false,
      uploadedAt: json['uploaded_at'] == null
          ? null
          : DateTime.parse(json['uploaded_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$PaymentCollectionModelToJson(
        _PaymentCollectionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'deliverer_id': instance.delivererId,
      'customer_id': instance.customerId,
      'customer_name': instance.customerName,
      'amount': instance.amount,
      'mode': _$PaymentModeEnumMap[instance.mode]!,
      'collected_at': instance.collectedAt.toIso8601String(),
      'allocations': instance.allocations.map((e) => e.toJson()).toList(),
      'reference': instance.reference,
      'notes': instance.notes,
      'receipt_image_path': instance.receiptImagePath,
      'is_uploaded': instance.isUploaded,
      'uploaded_at': instance.uploadedAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
    };

const _$PaymentModeEnumMap = {
  PaymentMode.cash: 'cash',
  PaymentMode.check: 'check',
  PaymentMode.transfer: 'transfer',
  PaymentMode.card: 'card',
};

_PaymentAllocationModel _$PaymentAllocationModelFromJson(
        Map<String, dynamic> json) =>
    _PaymentAllocationModel(
      orderId: json['order_id'] as String,
      orderNumber: json['order_number'] as String,
      allocatedAmount: (json['allocated_amount'] as num).toDouble(),
      orderDate: DateTime.parse(json['order_date'] as String),
      isFullyPaid: json['is_fully_paid'] as bool? ?? false,
    );

Map<String, dynamic> _$PaymentAllocationModelToJson(
        _PaymentAllocationModel instance) =>
    <String, dynamic>{
      'order_id': instance.orderId,
      'order_number': instance.orderNumber,
      'allocated_amount': instance.allocatedAmount,
      'order_date': instance.orderDate.toIso8601String(),
      'is_fully_paid': instance.isFullyPaid,
    };

_UploadPaymentRequest _$UploadPaymentRequestFromJson(
        Map<String, dynamic> json) =>
    _UploadPaymentRequest(
      delivererId: json['deliverer_id'] as String,
      customerId: json['customer_id'] as String,
      customerName: json['customer_name'] as String,
      amount: (json['amount'] as num).toDouble(),
      mode: json['mode'] as String,
      collectedAt: DateTime.parse(json['collected_at'] as String),
      allocations: (json['allocations'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      reference: json['reference'] as String?,
      notes: json['notes'] as String?,
      receiptImageBase64: json['receipt_image'] as String?,
    );

Map<String, dynamic> _$UploadPaymentRequestToJson(
        _UploadPaymentRequest instance) =>
    <String, dynamic>{
      'deliverer_id': instance.delivererId,
      'customer_id': instance.customerId,
      'customer_name': instance.customerName,
      'amount': instance.amount,
      'mode': instance.mode,
      'collected_at': instance.collectedAt.toIso8601String(),
      'allocations': instance.allocations,
      'reference': instance.reference,
      'notes': instance.notes,
      'receipt_image': instance.receiptImageBase64,
    };

_UploadPaymentResponse _$UploadPaymentResponseFromJson(
        Map<String, dynamic> json) =>
    _UploadPaymentResponse(
      id: json['id'] as String,
      status: json['status'] as String,
      message: json['message'] as String,
      uploadedAt: DateTime.parse(json['uploaded_at'] as String),
      receiptUrl: json['receipt_url'] as String?,
      updatedOrders: (json['updated_orders'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$UploadPaymentResponseToJson(
        _UploadPaymentResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'message': instance.message,
      'uploaded_at': instance.uploadedAt.toIso8601String(),
      'receipt_url': instance.receiptUrl,
      'updated_orders': instance.updatedOrders,
    };

_UnpaidOrderModel _$UnpaidOrderModelFromJson(Map<String, dynamic> json) =>
    _UnpaidOrderModel(
      id: json['id'] as String,
      orderNumber: json['order_number'] as String,
      orderDate: DateTime.parse(json['order_date'] as String),
      totalAmount: (json['total_amount'] as num).toDouble(),
      paidAmount: (json['paid_amount'] as num).toDouble(),
      remainingAmount: (json['remaining_amount'] as num).toDouble(),
      daysSinceOrder: (json['days_since_order'] as num).toInt(),
    );

Map<String, dynamic> _$UnpaidOrderModelToJson(_UnpaidOrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_number': instance.orderNumber,
      'order_date': instance.orderDate.toIso8601String(),
      'total_amount': instance.totalAmount,
      'paid_amount': instance.paidAmount,
      'remaining_amount': instance.remainingAmount,
      'days_since_order': instance.daysSinceOrder,
    };
