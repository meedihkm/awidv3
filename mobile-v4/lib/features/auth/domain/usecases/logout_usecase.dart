import '../repositories/auth_repository.dart';

/// Logout Use Case
/// Cas d'utilisation pour la déconnexion
class LogoutUseCase {
  LogoutUseCase(this._repository);
  final AuthRepository _repository;

  Future<void> call() async {
    await _repository.logout();
  }
}
