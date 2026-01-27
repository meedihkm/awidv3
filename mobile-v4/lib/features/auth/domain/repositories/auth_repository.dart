import '../entities/user.dart';

/// Auth Repository Interface
/// Interface du repository d'authentification
abstract class AuthRepository {
  /// Login with email and password
  Future<AuthResult> login({required String email, required String password});

  /// Register new user
  Future<AuthResult> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String phone,
    required String organizationId,
  });

  /// Logout current user
  Future<void> logout();

  /// Refresh access token
  Future<String> refreshToken(String refreshToken);

  /// Get current user
  Future<User?> getCurrentUser();

  /// Check if user is logged in
  Future<bool> isLoggedIn();

  /// Change password
  Future<void> changePassword({required String oldPassword, required String newPassword});
}

/// Auth Result
/// Résultat de l'authentification
class AuthResult {
  AuthResult({required this.user, required this.accessToken, required this.refreshToken});
  final User user;
  final String accessToken;
  final String refreshToken;
}
