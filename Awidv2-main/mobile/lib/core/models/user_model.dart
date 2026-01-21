class User {
  final String id;
  final String email;
  final String name;
  final String role;
  final String organizationId;
  final Organization organization;
  final String? phone;

  User({
    required this.id,
    required this.email,
    required this.name,
    required this.role,
    required this.organizationId,
    required this.organization,
    this.phone,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id']?.toString() ?? '',
      email: json['email'] ?? '',
      name: json['name'] ?? '',
      role: json['role'] ?? '',
      organizationId: json['organizationId']?.toString() ?? '',
      organization: Organization.fromJson(json['organization'] ?? {}),
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'role': role,
      'organizationId': organizationId,
      'organization': organization.toJson(),
      'phone': phone,
    };
  }

  bool get isAdmin => role == 'admin';
  bool get isCafeteria => role == 'cafeteria';
  bool get isDeliverer => role == 'deliverer';
}

class Organization {
  final String id;
  final String name;
  final String type;

  Organization({
    required this.id,
    required this.name,
    required this.type,
  });

  factory Organization.fromJson(Map<String, dynamic> json) {
    return Organization(
      id: json['id']?.toString() ?? '',
      name: json['name'] ?? '',
      type: json['type'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type': type,
    };
  }
}
