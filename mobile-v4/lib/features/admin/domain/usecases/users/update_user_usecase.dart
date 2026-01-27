import '../../entities/user_detail.dart';
import '../../repositories/users_repository.dart';

/// Update User Use Case
/// Met à jour un utilisateur existant
class UpdateUserUseCase {
  const UpdateUserUseCase(this._repository);

  final UsersRepository _repository;

  Future<UserDetail> call({
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
    // Validation
    if (email != null && (email.trim().isEmpty || !_isValidEmail(email))) {
      throw Exception('Email invalide');
    }

    if (firstName != null && firstName.trim().isEmpty) {
      throw Exception('Le prénom ne peut pas être vide');
    }

    if (lastName != null && lastName.trim().isEmpty) {
      throw Exception('Le nom ne peut pas être vide');
    }

    if (phone != null && phone.trim().isEmpty) {
      throw Exception('Le téléphone ne peut pas être vide');
    }

    if (role != null && !['admin', 'customer', 'deliverer', 'kitchen'].contains(role)) {
      throw Exception('Rôle invalide');
    }

    if (creditLimit != null && creditLimit < 0) {
      throw Exception('La limite de crédit ne peut pas être négative');
    }

    return _repository.updateUser(
      id: id,
      email: email,
      firstName: firstName,
      lastName: lastName,
      phone: phone,
      role: role,
      address: address,
      creditLimit: creditLimit,
      isActive: isActive,
    );
  }

  bool _isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }
}
