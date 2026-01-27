import '../../entities/user_detail.dart';
import '../../repositories/users_repository.dart';

/// Get Users Use Case
/// Récupère la liste des utilisateurs avec filtres optionnels
class GetUsersUseCase {
  const GetUsersUseCase(this._repository);

  final UsersRepository _repository;

  Future<List<UserDetail>> call({int? page, int? limit, String? role, bool? isActive, String? search}) async {
    return _repository.getUsers(page: page, limit: limit, role: role, isActive: isActive, search: search);
  }
}
