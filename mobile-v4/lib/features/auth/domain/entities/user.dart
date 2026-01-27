import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

/// User Entity
/// Entité utilisateur du domaine
@freezed
class User with _$User {
  const factory User({
    required String id,
    required String email,
    required String firstName,
    required String lastName,
    required String role,
    required String organizationId,
    required bool isActive,
    required DateTime createdAt,
    String? phone,
    String? avatar,
    DateTime? updatedAt,
  }) = _User;

  const User._();

  /// Get full name
  String get fullName => '$firstName $lastName';

  /// Check if user is admin
  bool get isAdmin => role == 'admin';

  /// Check if user is deliverer
  bool get isDeliverer => role == 'deliverer';

  /// Check if user is customer
  bool get isCustomer => role == 'customer';

  /// Check if user is kitchen
  bool get isKitchen => role == 'kitchen';
}
