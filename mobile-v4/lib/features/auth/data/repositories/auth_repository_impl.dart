import '../../../../core/constants/storage_keys.dart';
import '../../../../core/storage/secure_storage.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';
import '../models/login_request_model.dart';
import '../models/register_request_model.dart';

/// Auth Repository Implementation
/// Implémentation du repository d'authentification
class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._remoteDatasource, this._secureStorage);
  final AuthRemoteDatasource _remoteDatasource;
  final SecureStorage _secureStorage;

  @override
  Future<AuthResult> login({required String email, required String password}) async {
    try {
      final request = LoginRequestModel(email: email, password: password);

      final response = await _remoteDatasource.login(request);

      // Save tokens
      await _secureStorage.write(StorageKeys.accessToken, response.accessToken);
      await _secureStorage.write(StorageKeys.refreshToken, response.refreshToken);

      // Save user info
      await _secureStorage.write(StorageKeys.userId, response.user.id);
      await _secureStorage.write(StorageKeys.userRole, response.user.role);
      await _secureStorage.write(StorageKeys.organizationId, response.user.organizationId);

      return AuthResult(
        user: response.user.toEntity(),
        accessToken: response.accessToken,
        refreshToken: response.refreshToken,
      );
    } catch (e) {
      throw Exception('Échec de connexion: ${e.toString()}');
    }
  }

  @override
  Future<AuthResult> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String phone,
    required String organizationId,
  }) async {
    try {
      final request = RegisterRequestModel(
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName,
        phone: phone,
        organizationId: organizationId,
      );

      final response = await _remoteDatasource.register(request);

      // Save tokens
      await _secureStorage.write(StorageKeys.accessToken, response.accessToken);
      await _secureStorage.write(StorageKeys.refreshToken, response.refreshToken);

      // Save user info
      await _secureStorage.write(StorageKeys.userId, response.user.id);
      await _secureStorage.write(StorageKeys.userRole, response.user.role);
      await _secureStorage.write(StorageKeys.organizationId, response.user.organizationId);

      return AuthResult(
        user: response.user.toEntity(),
        accessToken: response.accessToken,
        refreshToken: response.refreshToken,
      );
    } catch (e) {
      throw Exception('Échec d\'inscription: ${e.toString()}');
    }
  }

  @override
  Future<void> logout() async {
    try {
      await _remoteDatasource.logout();
    } catch (e) {
      // Continue even if remote logout fails
    } finally {
      // Clear local storage
      await _secureStorage.deleteAll();
    }
  }

  @override
  Future<String> refreshToken(String refreshToken) async {
    try {
      final newAccessToken = await _remoteDatasource.refreshToken(refreshToken);

      // Save new token
      await _secureStorage.write(StorageKeys.accessToken, newAccessToken);

      return newAccessToken;
    } catch (e) {
      throw Exception('Échec de rafraîchissement: ${e.toString()}');
    }
  }

  @override
  Future<User?> getCurrentUser() async {
    try {
      final userId = await _secureStorage.read(StorageKeys.userId);

      if (userId == null) {
        return null;
      }

      final userModel = await _remoteDatasource.getCurrentUser();
      return userModel.toEntity();
    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool> isLoggedIn() async {
    final accessToken = await _secureStorage.read(StorageKeys.accessToken);
    return accessToken != null;
  }

  @override
  Future<void> changePassword({required String oldPassword, required String newPassword}) async {
    // TODO: Implement change password
    throw UnimplementedError();
  }
}
