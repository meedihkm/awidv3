// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductModel _$ProductModelFromJson(Map<String, dynamic> json) =>
    _ProductModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      category: json['category'] as String,
      unit: json['unit'] as String,
      isAvailable: json['is_available'] as bool,
      organizationId: json['organization_id'] as String,
      imageUrl: json['image_url'] as String?,
      cost: (json['cost'] as num?)?.toDouble(),
      stockQuantity: (json['stock_quantity'] as num?)?.toInt(),
      minStockLevel: (json['min_stock_level'] as num?)?.toInt(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$ProductModelToJson(_ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'category': instance.category,
      'unit': instance.unit,
      'is_available': instance.isAvailable,
      'organization_id': instance.organizationId,
      'image_url': instance.imageUrl,
      'cost': instance.cost,
      'stock_quantity': instance.stockQuantity,
      'min_stock_level': instance.minStockLevel,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
