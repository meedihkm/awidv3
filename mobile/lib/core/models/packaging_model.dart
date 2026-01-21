// =====================================================
// MODELS : Gestion des consignes (emballages)
// =====================================================

class PackagingType {
  final String id;
  final String? organizationId;
  final String name;
  final String? description;
  final double depositValue;
  final bool active;
  final DateTime? createdAt;

  PackagingType({
    required this.id,
    this.organizationId,
    required this.name,
    this.description,
    required this.depositValue,
    this.active = true,
    this.createdAt,
  });

  factory PackagingType.fromJson(Map<String, dynamic> json) => PackagingType(
    id: json['id'],
    organizationId: json['organizationId'],
    name: json['name'] ?? '',
    description: json['description'],
    depositValue: (json['depositValue'] as num?)?.toDouble() ?? 0,
    active: json['active'] ?? true,
    createdAt: json['createdAt'] != null 
      ? DateTime.tryParse(json['createdAt'].toString()) 
      : null,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'organizationId': organizationId,
    'name': name,
    'description': description,
    'depositValue': depositValue,
    'active': active,
  };
}

class PackagingBalance {
  final String packagingTypeId;
  final String typeName;
  final double depositValue;
  final int totalGiven;
  final int totalReturned;
  final int outstanding;

  PackagingBalance({
    required this.packagingTypeId,
    required this.typeName,
    required this.depositValue,
    required this.totalGiven,
    required this.totalReturned,
    required this.outstanding,
  });

  factory PackagingBalance.fromJson(Map<String, dynamic> json) => PackagingBalance(
    packagingTypeId: json['packagingTypeId'],
    typeName: json['typeName'] ?? '',
    depositValue: (json['depositValue'] as num?)?.toDouble() ?? 0,
    totalGiven: json['totalGiven'] ?? 0,
    totalReturned: json['totalReturned'] ?? 0,
    outstanding: json['outstanding'] ?? 0,
  );

  double get outstandingValue => outstanding * depositValue;
}

class PackagingTransaction {
  final String id;
  final String? organizationId;
  final String customerId;
  final String packagingTypeId;
  final String? typeName;
  final String? deliveryId;
  final int quantity;  // Positive = given, Negative = returned
  final String? recordedBy;
  final String? recordedByName;
  final String? note;
  final DateTime createdAt;

  PackagingTransaction({
    required this.id,
    this.organizationId,
    required this.customerId,
    required this.packagingTypeId,
    this.typeName,
    this.deliveryId,
    required this.quantity,
    this.recordedBy,
    this.recordedByName,
    this.note,
    required this.createdAt,
  });

  factory PackagingTransaction.fromJson(Map<String, dynamic> json) => PackagingTransaction(
    id: json['id'],
    organizationId: json['organizationId'],
    customerId: json['customerId'],
    packagingTypeId: json['packagingTypeId'],
    typeName: json['typeName'],
    deliveryId: json['deliveryId'],
    quantity: json['quantity'] ?? 0,
    recordedBy: json['recordedBy'],
    recordedByName: json['recordedByName'],
    note: json['note'],
    createdAt: DateTime.parse(json['createdAt']),
  );

  bool get isGiven => quantity > 0;
  bool get isReturned => quantity < 0;
  int get absoluteQuantity => quantity.abs();
}
