import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/dio_client.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../data/datasources/users_remote_datasource.dart';
import '../../data/repositories/users_repository_impl.dart';
import '../../domain/entities/user_detail.dart';
import '../../domain/repositories/users_repository.dart';
import '../../domain/usecases/users/create_user_usecase.dart';
import '../../domain/usecases/users/delete_user_usecase.dart';
import '../../domain/usecases/users/get_users_usecase.dart';
import '../../domain/usecases/users/update_user_usecase.dart';

// Datasource Provider
final usersRemoteDatasourceProvider = Provider<UsersRemoteDatasource>((ref) {
  return UsersRemoteDatasource(ref.watch(dioClientProvider));
});

// Repository Provider
final usersRepositoryProvider = Provider<UsersRepository>((ref) {
  return UsersRepositoryImpl(ref.watch(usersRemoteDatasourceProvider));
});

// Use Cases Providers
final getUsersUseCaseProvider = Provider<GetUsersUseCase>((ref) {
  return GetUsersUseCase(ref.watch(usersRepositoryProvider));
});

final createUserUseCaseProvider = Provider<CreateUserUseCase>((ref) {
  return CreateUserUseCase(ref.watch(usersRepositoryProvider));
});

final updateUserUseCaseProvider = Provider<UpdateUserUseCase>((ref) {
  return UpdateUserUseCase(ref.watch(usersRepositoryProvider));
});

final deleteUserUseCaseProvider = Provider<DeleteUserUseCase>((ref) {
  return DeleteUserUseCase(ref.watch(usersRepositoryProvider));
});

// Users State Notifier
class UsersNotifier extends StateNotifier<AsyncValue<List<UserDetail>>> {
  UsersNotifier(this._getUsersUseCase) : super(const AsyncValue.loading());

  final GetUsersUseCase _getUsersUseCase;

  String? _currentRole;
  bool? _currentIsActive;
  String? _currentSearch;

  /// Load users with filters
  Future<void> loadUsers({String? role, bool? isActive, String? search}) async {
    _currentRole = role;
    _currentIsActive = isActive;
    _currentSearch = search;

    state = const AsyncValue.loading();

    try {
      final users = await _getUsersUseCase.call(role: role, isActive: isActive, search: search);

      state = AsyncValue.data(users);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  /// Refresh users with current filters
  Future<void> refresh() async {
    await loadUsers(role: _currentRole, isActive: _currentIsActive, search: _currentSearch);
  }

  /// Clear filters
  Future<void> clearFilters() async {
    await loadUsers();
  }
}

// Users Provider
final usersProvider = StateNotifierProvider<UsersNotifier, AsyncValue<List<UserDetail>>>((ref) {
  return UsersNotifier(ref.watch(getUsersUseCaseProvider));
});

// User Form State
class UserFormState {
  UserFormState({this.isLoading = false, this.error, this.success = false});
  final bool isLoading;
  final String? error;
  final bool success;

  UserFormState copyWith({bool? isLoading, String? error, bool? success}) {
    return UserFormState(isLoading: isLoading ?? this.isLoading, error: error, success: success ?? this.success);
  }
}

// User Form Notifier
class UserFormNotifier extends StateNotifier<UserFormState> {
  UserFormNotifier(this._createUseCase, this._updateUseCase, this._deleteUseCase) : super(UserFormState());

  final CreateUserUseCase _createUseCase;
  final UpdateUserUseCase _updateUseCase;
  final DeleteUserUseCase _deleteUseCase;

  /// Create user
  Future<void> createUser({
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
    state = state.copyWith(isLoading: true, error: null, success: false);

    try {
      await _createUseCase.call(
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

      state = state.copyWith(isLoading: false, success: true);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  /// Update user
  Future<void> updateUser({
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
    state = state.copyWith(isLoading: true, error: null, success: false);

    try {
      await _updateUseCase.call(
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

      state = state.copyWith(isLoading: false, success: true);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  /// Delete user
  Future<void> deleteUser(String id) async {
    state = state.copyWith(isLoading: true, error: null, success: false);

    try {
      await _deleteUseCase.call(id);

      state = state.copyWith(isLoading: false, success: true);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  /// Reset state
  void reset() {
    state = UserFormState();
  }
}

// User Form Provider
final userFormProvider = StateNotifierProvider<UserFormNotifier, UserFormState>((ref) {
  return UserFormNotifier(
    ref.watch(createUserUseCaseProvider),
    ref.watch(updateUserUseCaseProvider),
    ref.watch(deleteUserUseCaseProvider),
  );
});

// Deliverers Provider (for order assignment)
final deliverersProvider = FutureProvider<List<UserDetail>>((ref) async {
  final repository = ref.watch(usersRepositoryProvider);
  return repository.getUsersByRole('deliverer');
});
