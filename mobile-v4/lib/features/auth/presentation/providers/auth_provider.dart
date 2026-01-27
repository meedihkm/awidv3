import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/dio_client.dart';
import '../../../../core/storage/secure_storage.dart';
import '../../data/datasources/auth_remote_datasource.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecases/get_current_user_usecase.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/logout_usecase.dart';
import '../../domain/usecases/register_usecase.dart';

// Providers for dependencies
final dioClientProvider = Provider<DioClient>((ref) => DioClient());

final secureStorageProvider = Provider<SecureStorage>((ref) => SecureStorage());

final authRemoteDatasourceProvider = Provider<AuthRemoteDatasource>((ref) {
  return AuthRemoteDatasource(ref.watch(dioClientProvider));
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(ref.watch(authRemoteDatasourceProvider), ref.watch(secureStorageProvider));
});

// Use cases providers
final loginUseCaseProvider = Provider<LoginUseCase>((ref) {
  return LoginUseCase(ref.watch(authRepositoryProvider));
});

final registerUseCaseProvider = Provider<RegisterUseCase>((ref) {
  return RegisterUseCase(ref.watch(authRepositoryProvider));
});

final logoutUseCaseProvider = Provider<LogoutUseCase>((ref) {
  return LogoutUseCase(ref.watch(authRepositoryProvider));
});

final getCurrentUserUseCaseProvider = Provider<GetCurrentUserUseCase>((ref) {
  return GetCurrentUserUseCase(ref.watch(authRepositoryProvider));
});

// Auth State
class AuthState {
  AuthState({this.user, this.isLoading = false, this.error, this.isAuthenticated = false});
  final User? user;
  final bool isLoading;
  final String? error;
  final bool isAuthenticated;

  AuthState copyWith({User? user, bool? isLoading, String? error, bool? isAuthenticated}) {
    return AuthState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
    );
  }
}

// Auth Notifier
class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier(
    this._loginUseCase,
    this._registerUseCase,
    this._logoutUseCase,
    this._getCurrentUserUseCase,
    this._authRepository,
  ) : super(AuthState()) {
    _checkAuthStatus();
  }
  final LoginUseCase _loginUseCase;
  final RegisterUseCase _registerUseCase;
  final LogoutUseCase _logoutUseCase;
  final GetCurrentUserUseCase _getCurrentUserUseCase;
  final AuthRepository _authRepository;

  /// Check if user is authenticated
  Future<void> _checkAuthStatus() async {
    final isLoggedIn = await _authRepository.isLoggedIn();

    if (isLoggedIn) {
      final user = await _getCurrentUserUseCase.call();
      state = state.copyWith(user: user, isAuthenticated: user != null);
    }
  }

  /// Login
  Future<void> login({required String email, required String password}) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final result = await _loginUseCase.call(email: email, password: password);

      state = state.copyWith(user: result.user, isAuthenticated: true, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      rethrow;
    }
  }

  /// Register
  Future<void> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String phone,
    required String organizationId,
  }) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final result = await _registerUseCase.call(
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName,
        phone: phone,
        organizationId: organizationId,
      );

      state = state.copyWith(user: result.user, isAuthenticated: true, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      rethrow;
    }
  }

  /// Logout
  Future<void> logout() async {
    state = state.copyWith(isLoading: true);

    try {
      await _logoutUseCase.call();

      state = AuthState();
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  /// Clear error
  void clearError() {
    state = state.copyWith(error: null);
  }
}

// Auth Provider
final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(
    ref.watch(loginUseCaseProvider),
    ref.watch(registerUseCaseProvider),
    ref.watch(logoutUseCaseProvider),
    ref.watch(getCurrentUserUseCaseProvider),
    ref.watch(authRepositoryProvider),
  );
});
