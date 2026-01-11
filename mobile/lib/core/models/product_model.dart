double parseDouble(dynamic value) {
  if (value == null) return 0.0;
  if (value is double) return value;
  if (value is int) return value.toDouble();
  if (value is String) return double.tryParse(value) ?? 0.0;
  return 0.0;
}

int parseInt(dynamic value) {
  if (value == null) return 0;
  if (value is int) return value;
  if (value is double) return value.toInt();
  if (value is String) return int.tryParse(value) ?? 0;
  return 0;
}

class Product {
  final String id;
  final String name;
  final double price;
  final String? imageUrl;
  final bool active;
  final String organizationId;
  final String? category;
  final int sortOrder;

  Product({
    required this.id,
    required this.name,
    required this.price,
    this.imageUrl,
    required this.active,
    required this.organizationId,
    this.category,
    this.sortOrder = 0,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id']?.toString() ?? '',
      name: json['name'] ?? '',
      price: parseDouble(json['price']),
      imageUrl: json['image_url'],
      active: json['active'] ?? true,
      organizationId: json['organization_id']?.toString() ?? '',
      category: json['category'],
      sortOrder: parseInt(json['sort_order']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'image_url': imageUrl,
      'active': active,
      'organization_id': organizationId,
      'category': category,
      'sort_order': sortOrder,
    };
  }

  Product copyWith({
    String? id,
    String? name,
    double? price,
    String? imageUrl,
    bool? active,
    String? organizationId,
    String? category,
    int? sortOrder,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      active: active ?? this.active,
      organizationId: organizationId ?? this.organizationId,
      category: category ?? this.category,
      sortOrder: sortOrder ?? this.sortOrder,
    );
  }
}
