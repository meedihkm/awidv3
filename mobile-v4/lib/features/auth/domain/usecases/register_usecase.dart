import '../repositories/auth_repository.dart';

/// Register Use Case
/// Cas d'utilisation pour l'inscription
class RegisterUseCase {
  RegisterUseCase(this._repository);
  final AuthRepository _repository;

  Future<AuthResult> call({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String phone,
    required String organizationId,
  }) async {
    // Validate inputs
    if (email.isEmpty) {
      throw Exception('Email requis');
    }

    if (password.isEmpty) {
      throw Exception('Mot de passe requis');
    }

    if (firstName.isEmpty) {
      throw Exception('Prénom requis');
    }

    if (lastName.isEmpty) {
      throw Exception('Nom requis');
    }

    if (phone.isEmpty) {
      throw Exception('Téléphone requis');
    }

    if (organizationId.isEmpty) {
      throw Exception('Organisation requise');
    }

    // Call repository
    return _repository.register(
      email: email,
      password: password,
      firstName: firstName,
      lastName: lastName,
      phone: phone,
      organizationId: organizationId,
    );
  }
}
