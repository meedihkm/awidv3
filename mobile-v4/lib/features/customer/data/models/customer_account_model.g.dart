// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomerAccountModelImpl _$$CustomerAccountModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomerAccountModelImpl(
      id: json['id'] as String,
      organizationId: json['organizationId'] as String,
      organizationName: json['organizationName'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      creditInfo: CustomerCreditInfoModel.fromJson(
          json['creditInfo'] as Map<String, dynamic>),
      packagingInfo: CustomerPackagingInfoModel.fromJson(
          json['packagingInfo'] as Map<String, dynamic>),
      stats: CustomerStatsModel.fromJson(json['stats'] as Map<String, dynamic>),
      contacts: (json['contacts'] as List<dynamic>?)
          ?.map((e) => CustomerContactModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      settings: json['settings'] == null
          ? null
          : CustomerSettingsModel.fromJson(
              json['settings'] as Map<String, dynamic>),
      isActive: json['isActive'] as bool? ?? true,
      lastOrderDate: json['lastOrderDate'] == null
          ? null
          : DateTime.parse(json['lastOrderDate'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$CustomerAccountModelImplToJson(
        _$CustomerAccountModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'organizationId': instance.organizationId,
      'organizationName': instance.organizationName,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'creditInfo': instance.creditInfo,
      'packagingInfo': instance.packagingInfo,
      'stats': instance.stats,
      'contacts': instance.contacts,
      'settings': instance.settings,
      'isActive': instance.isActive,
      'lastOrderDate': instance.lastOrderDate?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$CustomerCreditInfoModelImpl _$$CustomerCreditInfoModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomerCreditInfoModelImpl(
      creditLimit: (json['creditLimit'] as num).toDouble(),
      currentBalance: (json['currentBalance'] as num).toDouble(),
      availableCredit: (json['availableCredit'] as num).toDouble(),
      daysOverdue: (json['daysOverdue'] as num).toInt(),
      lastPaymentDate: json['lastPaymentDate'] == null
          ? null
          : DateTime.parse(json['lastPaymentDate'] as String),
      lastPaymentAmount: (json['lastPaymentAmount'] as num).toDouble(),
      isCreditBlocked: json['isCreditBlocked'] as bool? ?? false,
      blockReason: json['blockReason'] as String?,
    );

Map<String, dynamic> _$$CustomerCreditInfoModelImplToJson(
        _$CustomerCreditInfoModelImpl instance) =>
    <String, dynamic>{
      'creditLimit': instance.creditLimit,
      'currentBalance': instance.currentBalance,
      'availableCredit': instance.availableCredit,
      'daysOverdue': instance.daysOverdue,
      'lastPaymentDate': instance.lastPaymentDate?.toIso8601String(),
      'lastPaymentAmount': instance.lastPaymentAmount,
      'isCreditBlocked': instance.isCreditBlocked,
      'blockReason': instance.blockReason,
    };

_$CustomerPackagingInfoModelImpl _$$CustomerPackagingInfoModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomerPackagingInfoModelImpl(
      totalValue: (json['totalValue'] as num).toDouble(),
      totalQuantity: (json['totalQuantity'] as num).toInt(),
      items: (json['items'] as List<dynamic>)
          .map((e) =>
              CustomerPackagingItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastTransactionDate: json['lastTransactionDate'] == null
          ? null
          : DateTime.parse(json['lastTransactionDate'] as String),
    );

Map<String, dynamic> _$$CustomerPackagingInfoModelImplToJson(
        _$CustomerPackagingInfoModelImpl instance) =>
    <String, dynamic>{
      'totalValue': instance.totalValue,
      'totalQuantity': instance.totalQuantity,
      'items': instance.items,
      'lastTransactionDate': instance.lastTransactionDate?.toIso8601String(),
    };

_$CustomerPackagingItemModelImpl _$$CustomerPackagingItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomerPackagingItemModelImpl(
      packagingId: json['packagingId'] as String,
      packagingName: json['packagingName'] as String,
      quantity: (json['quantity'] as num).toInt(),
      unitValue: (json['unitValue'] as num).toDouble(),
      totalValue: (json['totalValue'] as num).toDouble(),
    );

Map<String, dynamic> _$$CustomerPackagingItemModelImplToJson(
        _$CustomerPackagingItemModelImpl instance) =>
    <String, dynamic>{
      'packagingId': instance.packagingId,
      'packagingName': instance.packagingName,
      'quantity': instance.quantity,
      'unitValue': instance.unitValue,
      'totalValue': instance.totalValue,
    };

_$CustomerStatsModelImpl _$$CustomerStatsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomerStatsModelImpl(
      totalOrders: (json['totalOrders'] as num).toInt(),
      completedOrders: (json['completedOrders'] as num).toInt(),
      cancelledOrders: (json['cancelledOrders'] as num).toInt(),
      totalSpent: (json['totalSpent'] as num).toDouble(),
      averageOrderValue: (json['averageOrderValue'] as num).toDouble(),
      daysAsCustomer: (json['daysAsCustomer'] as num).toInt(),
      averageRating: (json['averageRating'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$CustomerStatsModelImplToJson(
        _$CustomerStatsModelImpl instance) =>
    <String, dynamic>{
      'totalOrders': instance.totalOrders,
      'completedOrders': instance.completedOrders,
      'cancelledOrders': instance.cancelledOrders,
      'totalSpent': instance.totalSpent,
      'averageOrderValue': instance.averageOrderValue,
      'daysAsCustomer': instance.daysAsCustomer,
      'averageRating': instance.averageRating,
    };

_$CustomerContactModelImpl _$$CustomerContactModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomerContactModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      role: json['role'] as String,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      isPrimary: json['isPrimary'] as bool? ?? true,
    );

Map<String, dynamic> _$$CustomerContactModelImplToJson(
        _$CustomerContactModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'role': instance.role,
      'phone': instance.phone,
      'email': instance.email,
      'isPrimary': instance.isPrimary,
    };

_$CustomerSettingsModelImpl _$$CustomerSettingsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomerSettingsModelImpl(
      emailNotifications: json['emailNotifications'] as bool? ?? true,
      smsNotifications: json['smsNotifications'] as bool? ?? true,
      pushNotifications: json['pushNotifications'] as bool? ?? true,
      orderConfirmations: json['orderConfirmations'] as bool? ?? true,
      deliveryUpdates: json['deliveryUpdates'] as bool? ?? true,
      paymentReminders: json['paymentReminders'] as bool? ?? true,
      promotionalOffers: json['promotionalOffers'] as bool? ?? true,
      preferredLanguage: json['preferredLanguage'] as String?,
      preferredCurrency: json['preferredCurrency'] as String?,
    );

Map<String, dynamic> _$$CustomerSettingsModelImplToJson(
        _$CustomerSettingsModelImpl instance) =>
    <String, dynamic>{
      'emailNotifications': instance.emailNotifications,
      'smsNotifications': instance.smsNotifications,
      'pushNotifications': instance.pushNotifications,
      'orderConfirmations': instance.orderConfirmations,
      'deliveryUpdates': instance.deliveryUpdates,
      'paymentReminders': instance.paymentReminders,
      'promotionalOffers': instance.promotionalOffers,
      'preferredLanguage': instance.preferredLanguage,
      'preferredCurrency': instance.preferredCurrency,
    };
