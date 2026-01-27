import '../../domain/entities/user_detail.dart';
import '../../domain/repositories/users_repository.dart';
import '../datasources/users_remote_datasource.dart';

/// Users Repository Implementation
/// Implémente le repository des utilisateurs
class UsersRepositoryImpl implements UsersRepository {
  const UsersRepositoryImpl(this._remoteDatasource);

  final UsersRemoteDatasource _remoteDatasource;

  @override
  Future<List<UserDetail>> getUsers({int? page, int? limit, String? role, bool? isActive, String? search}) async {
    try {
      final models = await _remoteDatasource.getUsers(
        page: page,
        limit: limit,
        role: role,
        isActive: isActive,
        search: search,
      );

      return models.map((model) => model.toEntity()).toList();
    } catch (e) {
      throw Exception('Erreur lors de la récupération des utilisateurs: $e');
    }
  }

  @override
  Future<UserDetail> getUserById(String id) async {
    try {
      final model = await _remoteDatasource.getUserById(id);
      return model.toEntity();
    } catch (e) {
      throw Exception('Erreur lors de la récupération de l\'utilisateur: $e');
    }
  }

  @override
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
  }) async {
    try {
      final data = {
        'email': email,
        'password': password,
        'first_name': firstName,
        'last_name': lastName,
        'phone': phone,
        'role': role,
        'organization_id': organizationId,
        if (address != null) 'address': address,
        if (creditLimit != null) 'credit_limit': creditLimit,
      };

      final model = await _remoteDatasource.createUser(data);
      return model.toEntity();
    } catch (e) {
      throw Exception('Erreur lors de la création de l\'utilisateur: $e');
    }
  }

  @override
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
  }) async {
    try {
      final data = <String, dynamic>{};

      if (email != null) data['email'] = email;
      if (firstName != null) data['first_name'] = firstName;
      if (lastName != null) data['last_name'] = lastName;
      if (phone != null) data['phone'] = phone;
      if (role != null) data['role'] = role;
      if (address != null) data['address'] = address;
      if (creditLimit != null) data['credit_limit'] = creditLimit;
      if (isActive != null) data['is_active'] = isActive;

      final model = await _remoteDatasource.updateUser(id, data);
      return model.toEntity();
    } catch (e) {
      throw Exception('Erreur lors de la mise à jour de l\'utilisateur: $e');
    }
  }

  @override
  Future<void> deleteUser(String id) async {
    try {
      await _remoteDatasource.deleteUser(id);
    } catch (e) {
      throw Exception('Erreur lors de la suppression de l\'utilisateur: $e');
    }
  }

  @override
  Future<UserDetail> toggleActiveStatus(String id) async {
    try {
      final model = await _remoteDatasource.toggleActiveStatus(id);
      return model.toEntity();
    } catch (e) {
      throw Exception('Erreur lors du changement de statut de l\'utilisateur: $e');
    }
  }

  @override
  Future<UserDetail> updateCreditLimit({required String id, required double creditLimit}) async {
    try {
      final model = await _remoteDatasource.updateCreditLimit(id, creditLimit);
      return model.toEntity();
    } catch (e) {
      throw Exception('Erreur lors de la mise à jour de la limite de crédit: $e');
    }
  }

  @override
  Future<void> resetPassword({required String id, required String newPassword}) async {
    try {
      await _remoteDatasource.resetPassword(id, newPassword);
    } catch (e) {
      throw Exception('Erreur lors de la réinitialisation du mot de passe: $e');
    }
  }

  @override
  Future<List<UserDetail>> getUsersByRole(String role) async {
    try {
      final models = await _remoteDatasource.getUsersByRole(role);
      return models.map((model) => model.toEntity()).toList();
    } catch (e) {
      throw Exception('Erreur lors de la récupération des utilisateurs par rôle: $e');
    }
  }
}
