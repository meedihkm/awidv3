import '../../../../core/config/api_config.dart';
import '../../../../core/network/dio_client.dart';
import '../models/auth_response_model.dart';
import '../models/login_request_model.dart';
import '../models/register_request_model.dart';
import '../models/user_model.dart';

/// Auth Remote Datasource
/// Source de données distante pour l'authentification
class AuthRemoteDatasource {
  AuthRemoteDatasource(this._dioClient);
  final DioClient _dioClient;

  /// Login
  Future<AuthResponseModel> login(LoginRequestModel request) async {
    try {
      final response = await _dioClient.post(ApiConfig.login, data: request.toJson());

      return AuthResponseModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Erreur de connexion: ${e.toString()}');
    }
  }

  /// Register
  Future<AuthResponseModel> register(RegisterRequestModel request) async {
    try {
      final response = await _dioClient.post(ApiConfig.register, data: request.toJson());

      return AuthResponseModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Erreur d\'inscription: ${e.toString()}');
    }
  }

  /// Logout
  Future<void> logout() async {
    try {
      await _dioClient.post(ApiConfig.logout);
    } catch (e) {
      throw Exception('Erreur de déconnexion: ${e.toString()}');
    }
  }

  /// Refresh Token
  Future<String> refreshToken(String refreshToken) async {
    try {
      final response = await _dioClient.post(ApiConfig.refresh, data: {'refreshToken': refreshToken});

      return response.data['accessToken'] as String;
    } catch (e) {
      throw Exception('Erreur de rafraîchissement: ${e.toString()}');
    }
  }

  /// Get Current User
  Future<UserModel> getCurrentUser() async {
    try {
      final response = await _dioClient.get('/users/me');
      return UserModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Erreur de récupération utilisateur: ${e.toString()}');
    }
  }
}
