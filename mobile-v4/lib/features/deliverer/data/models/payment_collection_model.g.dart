// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_collection_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentCollectionModelImpl _$$PaymentCollectionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PaymentCollectionModelImpl(
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

Map<String, dynamic> _$$PaymentCollectionModelImplToJson(
        _$PaymentCollectionModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'deliverer_id': instance.delivererId,
      'customer_id': instance.customerId,
      'customer_name': instance.customerName,
      'amount': instance.amount,
      'mode': _$PaymentModeEnumMap[instance.mode]!,
      'collected_at': instance.collectedAt.toIso8601String(),
      'allocations': instance.allocations,
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

_$PaymentAllocationModelImpl _$$PaymentAllocationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PaymentAllocationModelImpl(
      orderId: json['order_id'] as String,
      orderNumber: json['order_number'] as String,
      allocatedAmount: (json['allocated_amount'] as num).toDouble(),
      orderDate: DateTime.parse(json['order_date'] as String),
      isFullyPaid: json['is_fully_paid'] as bool? ?? false,
    );

Map<String, dynamic> _$$PaymentAllocationModelImplToJson(
        _$PaymentAllocationModelImpl instance) =>
    <String, dynamic>{
      'order_id': instance.orderId,
      'order_number': instance.orderNumber,
      'allocated_amount': instance.allocatedAmount,
      'order_date': instance.orderDate.toIso8601String(),
      'is_fully_paid': instance.isFullyPaid,
    };

_$UploadPaymentRequestImpl _$$UploadPaymentRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$UploadPaymentRequestImpl(
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

Map<String, dynamic> _$$UploadPaymentRequestImplToJson(
        _$UploadPaymentRequestImpl instance) =>
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

_$UploadPaymentResponseImpl _$$UploadPaymentResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$UploadPaymentResponseImpl(
      id: json['id'] as String,
      status: json['status'] as String,
      message: json['message'] as String,
      uploadedAt: DateTime.parse(json['uploaded_at'] as String),
      receiptUrl: json['receipt_url'] as String?,
      updatedOrders: (json['updated_orders'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$UploadPaymentResponseImplToJson(
        _$UploadPaymentResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'message': instance.message,
      'uploaded_at': instance.uploadedAt.toIso8601String(),
      'receipt_url': instance.receiptUrl,
      'updated_orders': instance.updatedOrders,
    };

_$UnpaidOrderModelImpl _$$UnpaidOrderModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UnpaidOrderModelImpl(
      id: json['id'] as String,
      orderNumber: json['order_number'] as String,
      orderDate: DateTime.parse(json['order_date'] as String),
      totalAmount: (json['total_amount'] as num).toDouble(),
      paidAmount: (json['paid_amount'] as num).toDouble(),
      remainingAmount: (json['remaining_amount'] as num).toDouble(),
      daysSinceOrder: (json['days_since_order'] as num).toInt(),
    );

Map<String, dynamic> _$$UnpaidOrderModelImplToJson(
        _$UnpaidOrderModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_number': instance.orderNumber,
      'order_date': instance.orderDate.toIso8601String(),
      'total_amount': instance.totalAmount,
      'paid_amount': instance.paidAmount,
      'remaining_amount': instance.remainingAmount,
      'days_since_order': instance.daysSinceOrder,
    };
