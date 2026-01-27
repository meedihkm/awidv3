import '../entities/user_detail.dart';

/// Users Repository Interface
/// Définit les opérations CRUD pour les utilisateurs
abstract class UsersRepository {
  /// Get all users with optional filters
  Future<List<UserDetail>> getUsers({int? page, int? limit, String? role, bool? isActive, String? search});

  /// Get user by ID
  Future<UserDetail> getUserById(String id);

  /// Create new user
  Future<UserDetail> createUser({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String phone,
    required String role,
    required String organizationId,
    String? address,
    double? creditLimit,
  });

  /// Update existing user
  Future<UserDetail> updateUser({
    required String id,
    String? email,
    String? firstName,
    String? lastName,
    String? phone,
    String? role,
    String? address,
    double? creditLimit,
    bool? isActive,
  });

  /// Delete user
  Future<void> deleteUser(String id);

  /// Toggle user active status
  Future<UserDetail> toggleActiveStatus(String id);

  /// Update user credit limit
  Future<UserDetail> updateCreditLimit({required String id, required double creditLimit});

  /// Reset user password
  Future<void> resetPassword({required String id, required String newPassword});

  /// Get users by role
  Future<List<UserDetail>> getUsersByRole(String role);
}
