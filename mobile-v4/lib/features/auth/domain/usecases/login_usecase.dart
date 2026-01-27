import '../repositories/auth_repository.dart';

/// Login Use Case
/// Cas d'utilisation pour la connexion
class LoginUseCase {
  LoginUseCase(this._repository);
  final AuthRepository _repository;

  Future<AuthResult> call({required String email, required String password}) async {
    // Validate inputs
    if (email.isEmpty) {
      throw Exception('Email requis');
    }

    if (password.isEmpty) {
      throw Exception('Mot de passe requis');
    }

    // Call repository
    return _repository.login(email: email, password: password);
  }
}
