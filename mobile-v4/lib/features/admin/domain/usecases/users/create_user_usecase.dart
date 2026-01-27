import '../../entities/user_detail.dart';
import '../../repositories/users_repository.dart';

/// Create User Use Case
/// Crée un nouvel utilisateur
class CreateUserUseCase {
  const CreateUserUseCase(this._repository);

  final UsersRepository _repository;

  Future<UserDetail> call({
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
    // Validation
    if (email.trim().isEmpty || !_isValidEmail(email)) {
      throw Exception('Email invalide');
    }

    if (password.length < 6) {
      throw Exception('Le mot de passe doit contenir au moins 6 caractères');
    }

    if (firstName.trim().isEmpty) {
      throw Exception('Le prénom est requis');
    }

    if (lastName.trim().isEmpty) {
      throw Exception('Le nom est requis');
    }

    if (phone.trim().isEmpty) {
      throw Exception('Le téléphone est requis');
    }

    if (!['admin', 'customer', 'deliverer', 'kitchen'].contains(role)) {
      throw Exception('Rôle invalide');
    }

    if (creditLimit != null && creditLimit < 0) {
      throw Exception('La limite de crédit ne peut pas être négative');
    }

    return _repository.createUser(
      email: email,
      password: password,
      firstName: firstName,
      lastName: lastName,
      phone: phone,
      role: role,
      organizationId: organizationId,
      address: address,
      creditLimit: creditLimit,
    );
  }

  bool _isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }
}
