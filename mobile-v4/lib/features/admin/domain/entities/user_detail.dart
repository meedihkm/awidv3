import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_detail.freezed.dart';

/// User Detail Entity
/// Représente les détails complets d'un utilisateur
@freezed
class UserDetail with _$UserDetail {
  const factory UserDetail({
    required String id,
    required String email,
    required String firstName,
    required String lastName,
    required String phone,
    required String role,
    required String organizationId,
    required bool isActive,
    String? organizationName,
    String? address,
    String? avatarUrl,
    double? creditLimit,
    double? currentBalance,
    int? totalOrders,
    int? completedDeliveries,
    DateTime? lastLoginAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _UserDetail;

  const UserDetail._();

  /// Get full name
  String get fullName => '$firstName $lastName';

  /// Get initials
  String get initials =>
      '${firstName.isNotEmpty ? firstName[0] : ''}${lastName.isNotEmpty ? lastName[0] : ''}'.toUpperCase();

  /// Check if user has credit issues
  bool get hasCreditIssues {
    if (creditLimit == null || currentBalance == null) return false;
    return currentBalance! > creditLimit!;
  }

  /// Get credit usage percentage
  double? get creditUsagePercentage {
    if (creditLimit == null || currentBalance == null || creditLimit == 0) {
      return null;
    }
    return (currentBalance! / creditLimit!) * 100;
  }

  /// Get role display name
  String get roleDisplayName {
    switch (role) {
      case 'admin':
        return 'Administrateur';
      case 'customer':
        return 'Client';
      case 'deliverer':
        return 'Livreur';
      case 'kitchen':
        return 'Cuisine';
      default:
        return role;
    }
  }

  /// Get role color
  String get roleColor {
    switch (role) {
      case 'admin':
        return 'purple';
      case 'customer':
        return 'blue';
      case 'deliverer':
        return 'green';
      case 'kitchen':
        return 'orange';
      default:
        return 'grey';
    }
  }

  /// Get status badge
  String get statusBadge => isActive ? 'Actif' : 'Inactif';

  /// Get status color
  String get statusColor => isActive ? 'green' : 'red';
}
