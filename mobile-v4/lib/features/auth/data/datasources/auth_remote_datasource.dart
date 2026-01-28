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
      final response = await _dioClient.post<Map<String, dynamic>>(
        ApiConfig.login, 
        data: request.toJson()
      );

      // Safe null check for response data
      final responseData = response.data;
      if (responseData == null) {
        throw Exception('Réponse vide du serveur');
      }

      // Validate response structure
      if (responseData is! Map<String, dynamic>) {
        throw Exception('Format de réponse invalide: type ${responseData.runtimeType}');
      }

      // Check success flag
      final success = responseData['success'];
      if (success != true) {
        final error = responseData['error'] ?? 'Erreur inconnue';
        throw Exception('Échec de connexion: $error');
      }

      // Extract data safely
      final data = responseData['data'];
      if (data == null || data is! Map<String, dynamic>) {
        throw Exception('Données manquantes dans la réponse');
      }

      // Extract user data safely
      final userData = data['user'];
      if (userData == null || userData is! Map<String, dynamic>) {
        throw Exception('Données utilisateur manquantes');
      }

      // Extract tokens safely
      final tokensData = data['tokens'];
      if (tokensData == null || tokensData is! Map<String, dynamic>) {
        throw Exception('Tokens manquants');
      }

      final accessToken = tokensData['accessToken'];
      final refreshToken = tokensData['refreshToken'];
      
      if (accessToken == null || accessToken is! String || accessToken.isEmpty) {
        throw Exception('Access token invalide');
      }
      
      if (refreshToken == null || refreshToken is! String || refreshToken.isEmpty) {
        throw Exception('Refresh token invalide');
      }

      // Create safe structure for AuthResponseModel
      final authData = <String, dynamic>{
        'user': userData,
        'accessToken': accessToken,
        'refreshToken': refreshToken,
      };

      return AuthResponseModel.fromJson(authData);
    } on Exception {
      rethrow;
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
