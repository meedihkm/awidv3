import '../entities/user.dart';
import '../repositories/auth_repository.dart';

/// Get Current User Use Case
/// Cas d'utilisation pour récupérer l'utilisateur courant
class GetCurrentUserUseCase {
  GetCurrentUserUseCase(this._repository);
  final AuthRepository _repository;

  Future<User?> call() async {
    return _repository.getCurrentUser();
  }
}
