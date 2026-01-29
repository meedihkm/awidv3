// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CustomerAccount _$CustomerAccountFromJson(Map<String, dynamic> json) =>
    _CustomerAccount(
      id: json['id'] as String,
      organizationId: json['organization_id'] as String,
      organizationName: json['organization_name'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      creditInfo: CustomerCreditInfo.fromJson(
          json['credit_info'] as Map<String, dynamic>),
      packagingInfo: CustomerPackagingInfo.fromJson(
          json['packaging_info'] as Map<String, dynamic>),
      stats: CustomerStats.fromJson(json['stats'] as Map<String, dynamic>),
      contacts: (json['contacts'] as List<dynamic>?)
          ?.map((e) => CustomerContact.fromJson(e as Map<String, dynamic>))
          .toList(),
      settings: json['settings'] == null
          ? null
          : CustomerSettings.fromJson(json['settings'] as Map<String, dynamic>),
      isActive: json['is_active'] as bool? ?? true,
      lastOrderDate: json['last_order_date'] == null
          ? null
          : DateTime.parse(json['last_order_date'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$CustomerAccountToJson(_CustomerAccount instance) =>
    <String, dynamic>{
      'id': instance.id,
      'organization_id': instance.organizationId,
      'organization_name': instance.organizationName,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'credit_info': instance.creditInfo.toJson(),
      'packaging_info': instance.packagingInfo.toJson(),
      'stats': instance.stats.toJson(),
      'contacts': instance.contacts?.map((e) => e.toJson()).toList(),
      'settings': instance.settings?.toJson(),
      'is_active': instance.isActive,
      'last_order_date': instance.lastOrderDate?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

_CustomerCreditInfo _$CustomerCreditInfoFromJson(Map<String, dynamic> json) =>
    _CustomerCreditInfo(
      creditLimit: (json['credit_limit'] as num).toDouble(),
      currentBalance: (json['current_balance'] as num).toDouble(),
      availableCredit: (json['available_credit'] as num).toDouble(),
      daysOverdue: (json['days_overdue'] as num).toInt(),
      lastPaymentDate: json['last_payment_date'] == null
          ? null
          : DateTime.parse(json['last_payment_date'] as String),
      lastPaymentAmount: (json['last_payment_amount'] as num).toDouble(),
      isCreditBlocked: json['is_credit_blocked'] as bool? ?? false,
      blockReason: json['block_reason'] as String?,
    );

Map<String, dynamic> _$CustomerCreditInfoToJson(_CustomerCreditInfo instance) =>
    <String, dynamic>{
      'credit_limit': instance.creditLimit,
      'current_balance': instance.currentBalance,
      'available_credit': instance.availableCredit,
      'days_overdue': instance.daysOverdue,
      'last_payment_date': instance.lastPaymentDate?.toIso8601String(),
      'last_payment_amount': instance.lastPaymentAmount,
      'is_credit_blocked': instance.isCreditBlocked,
      'block_reason': instance.blockReason,
    };

_CustomerPackagingInfo _$CustomerPackagingInfoFromJson(
        Map<String, dynamic> json) =>
    _CustomerPackagingInfo(
      totalValue: (json['total_value'] as num).toDouble(),
      totalQuantity: (json['total_quantity'] as num).toInt(),
      items: (json['items'] as List<dynamic>)
          .map((e) => CustomerPackagingItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastTransactionDate: json['last_transaction_date'] == null
          ? null
          : DateTime.parse(json['last_transaction_date'] as String),
    );

Map<String, dynamic> _$CustomerPackagingInfoToJson(
        _CustomerPackagingInfo instance) =>
    <String, dynamic>{
      'total_value': instance.totalValue,
      'total_quantity': instance.totalQuantity,
      'items': instance.items.map((e) => e.toJson()).toList(),
      'last_transaction_date': instance.lastTransactionDate?.toIso8601String(),
    };

_CustomerPackagingItem _$CustomerPackagingItemFromJson(
        Map<String, dynamic> json) =>
    _CustomerPackagingItem(
      packagingId: json['packaging_id'] as String,
      packagingName: json['packaging_name'] as String,
      quantity: (json['quantity'] as num).toInt(),
      unitValue: (json['unit_value'] as num).toDouble(),
      totalValue: (json['total_value'] as num).toDouble(),
    );

Map<String, dynamic> _$CustomerPackagingItemToJson(
        _CustomerPackagingItem instance) =>
    <String, dynamic>{
      'packaging_id': instance.packagingId,
      'packaging_name': instance.packagingName,
      'quantity': instance.quantity,
      'unit_value': instance.unitValue,
      'total_value': instance.totalValue,
    };

_CustomerStats _$CustomerStatsFromJson(Map<String, dynamic> json) =>
    _CustomerStats(
      totalOrders: (json['total_orders'] as num).toInt(),
      completedOrders: (json['completed_orders'] as num).toInt(),
      cancelledOrders: (json['cancelled_orders'] as num).toInt(),
      totalSpent: (json['total_spent'] as num).toDouble(),
      averageOrderValue: (json['average_order_value'] as num).toDouble(),
      daysAsCustomer: (json['days_as_customer'] as num).toInt(),
      averageRating: (json['average_rating'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CustomerStatsToJson(_CustomerStats instance) =>
    <String, dynamic>{
      'total_orders': instance.totalOrders,
      'completed_orders': instance.completedOrders,
      'cancelled_orders': instance.cancelledOrders,
      'total_spent': instance.totalSpent,
      'average_order_value': instance.averageOrderValue,
      'days_as_customer': instance.daysAsCustomer,
      'average_rating': instance.averageRating,
    };

_CustomerContact _$CustomerContactFromJson(Map<String, dynamic> json) =>
    _CustomerContact(
      id: json['id'] as String,
      name: json['name'] as String,
      role: json['role'] as String,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      isPrimary: json['is_primary'] as bool? ?? true,
    );

Map<String, dynamic> _$CustomerContactToJson(_CustomerContact instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'role': instance.role,
      'phone': instance.phone,
      'email': instance.email,
      'is_primary': instance.isPrimary,
    };

_CustomerSettings _$CustomerSettingsFromJson(Map<String, dynamic> json) =>
    _CustomerSettings(
      emailNotifications: json['email_notifications'] as bool? ?? true,
      smsNotifications: json['sms_notifications'] as bool? ?? true,
      pushNotifications: json['push_notifications'] as bool? ?? true,
      orderConfirmations: json['order_confirmations'] as bool? ?? true,
      deliveryUpdates: json['delivery_updates'] as bool? ?? true,
      paymentReminders: json['payment_reminders'] as bool? ?? true,
      promotionalOffers: json['promotional_offers'] as bool? ?? true,
      preferredLanguage: json['preferred_language'] as String?,
      preferredCurrency: json['preferred_currency'] as String?,
    );

Map<String, dynamic> _$CustomerSettingsToJson(_CustomerSettings instance) =>
    <String, dynamic>{
      'email_notifications': instance.emailNotifications,
      'sms_notifications': instance.smsNotifications,
      'push_notifications': instance.pushNotifications,
      'order_confirmations': instance.orderConfirmations,
      'delivery_updates': instance.deliveryUpdates,
      'payment_reminders': instance.paymentReminders,
      'promotional_offers': instance.promotionalOffers,
      'preferred_language': instance.preferredLanguage,
      'preferred_currency': instance.preferredCurrency,
    };
