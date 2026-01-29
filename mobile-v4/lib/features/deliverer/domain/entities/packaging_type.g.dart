// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'packaging_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PackagingType _$PackagingTypeFromJson(Map<String, dynamic> json) =>
    _PackagingType(
      id: json['id'] as String,
      name: json['name'] as String,
      unitValue: (json['unit_value'] as num).toDouble(),
      description: json['description'] as String?,
      imageUrl: json['image_url'] as String?,
      isActive: json['is_active'] as bool? ?? true,
    );

Map<String, dynamic> _$PackagingTypeToJson(_PackagingType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'unit_value': instance.unitValue,
      'description': instance.description,
      'image_url': instance.imageUrl,
      'is_active': instance.isActive,
    };

_PackagingBalance _$PackagingBalanceFromJson(Map<String, dynamic> json) =>
    _PackagingBalance(
      customerId: json['customer_id'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => PackagingBalanceItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalValue: (json['total_value'] as num).toDouble(),
      lastUpdated: json['last_updated'] == null
          ? null
          : DateTime.parse(json['last_updated'] as String),
    );

Map<String, dynamic> _$PackagingBalanceToJson(_PackagingBalance instance) =>
    <String, dynamic>{
      'customer_id': instance.customerId,
      'items': instance.items.map((e) => e.toJson()).toList(),
      'total_value': instance.totalValue,
      'last_updated': instance.lastUpdated?.toIso8601String(),
    };

_PackagingBalanceItem _$PackagingBalanceItemFromJson(
        Map<String, dynamic> json) =>
    _PackagingBalanceItem(
      packagingId: json['packaging_id'] as String,
      packagingName: json['packaging_name'] as String,
      quantity: (json['quantity'] as num).toInt(),
      unitValue: (json['unit_value'] as num).toDouble(),
      totalValue: (json['total_value'] as num).toDouble(),
    );

Map<String, dynamic> _$PackagingBalanceItemToJson(
        _PackagingBalanceItem instance) =>
    <String, dynamic>{
      'packaging_id': instance.packagingId,
      'packaging_name': instance.packagingName,
      'quantity': instance.quantity,
      'unit_value': instance.unitValue,
      'total_value': instance.totalValue,
    };
