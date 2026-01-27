import '../../repositories/users_repository.dart';

/// Delete User Use Case
/// Supprime un utilisateur
class DeleteUserUseCase {
  const DeleteUserUseCase(this._repository);

  final UsersRepository _repository;

  Future<void> call(String id) async {
    if (id.trim().isEmpty) {
      throw Exception('ID utilisateur invalide');
    }

    return _repository.deleteUser(id);
  }
}
