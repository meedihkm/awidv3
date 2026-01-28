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

      // Validation complète de la réponse
      final responseData = response.data;
      if (responseData == null) {
        throw Exception('Réponse vide du serveur');
      }

      if (responseData is! Map<String, dynamic>) {
        throw Exception('Format de réponse invalide: attendu Map<String, dynamic>, reçu ${responseData.runtimeType}');
      }

      // Vérification du flag de succès
      final success = responseData['success'];
      if (success == null) {
        throw Exception('Champ "success" manquant dans la réponse');
      }

      if (success is! bool) {
        throw Exception('Champ "success" invalide: attendu bool, reçu ${success.runtimeType}');
      }

      if (!success) {
        final error = responseData['error'];
        final code = responseData['code'];
        final statusCode = responseData['statusCode'];
        
        String errorMessage = 'Échec de connexion';
        if (error != null && error is String && error.isNotEmpty) {
          errorMessage = error;
        }
        
        if (code == 'UNAUTHORIZED' || statusCode == 401) {
          throw Exception('Email ou mot de passe incorrect');
        }
        
        throw Exception(errorMessage);
      }

      // Extraction des données
      final data = responseData['data'];
      if (data == null) {
        throw Exception('Champ "data" manquant dans la réponse');
      }

      if (data is! Map<String, dynamic>) {
        throw Exception('Champ "data" invalide: attendu Map<String, dynamic>, reçu ${data.runtimeType}');
      }

      // Validation des données utilisateur
      final userData = data['user'];
      if (userData == null) {
        throw Exception('Données utilisateur manquantes');
      }

      if (userData is! Map<String, dynamic>) {
        throw Exception('Données utilisateur invalides: attendu Map<String, dynamic>, reçu ${userData.runtimeType}');
      }

      // Validation des champs utilisateur requis
      final requiredUserFields = ['id', 'email', 'firstName', 'lastName', 'role', 'organizationId'];
      for (final field in requiredUserFields) {
        if (!userData.containsKey(field) || userData[field] == null) {
          throw Exception('Champ utilisateur requis manquant: $field');
        }
      }

      // Validation des tokens
      final tokensData = data['tokens'];
      if (tokensData == null) {
        throw Exception('Tokens manquants');
      }

      if (tokensData is! Map<String, dynamic>) {
        throw Exception('Tokens invalides: attendu Map<String, dynamic>, reçu ${tokensData.runtimeType}');
      }

      final accessToken = tokensData['accessToken'];
      final refreshToken = tokensData['refreshToken'];

      if (accessToken == null || accessToken is! String || accessToken.isEmpty) {
        throw Exception('Access token invalide ou manquant');
      }

      if (refreshToken == null || refreshToken is! String || refreshToken.isEmpty) {
        throw Exception('Refresh token invalide ou manquant');
      }

      // Validation de la structure des tokens JWT (basique)
      if (!_isValidJwtStructure(accessToken)) {
        throw Exception('Access token: format JWT invalide');
      }

      if (!_isValidJwtStructure(refreshToken)) {
        throw Exception('Refresh token: format JWT invalide');
      }

      // Construction de la structure pour AuthResponseModel
      final authResponseData = <String, dynamic>{
        'user': userData,
        'accessToken': accessToken,
        'refreshToken': refreshToken,
      };

      // Validation finale avant création du modèle
      try {
        return AuthResponseModel.fromJson(authResponseData);
      } catch (e) {
        throw Exception('Erreur de désérialisation du modèle: ${e.toString()}');
      }

    } on Exception {
      // Re-throw les exceptions métier
      rethrow;
    } on Error catch (e) {
      // Capture les erreurs système (null pointer, etc.)
      throw Exception('Erreur système lors de la connexion: ${e.toString()}');
    } catch (e) {
      // Capture toute autre erreur inattendue
      throw Exception('Erreur inattendue lors de la connexion: ${e.toString()}');
    }
  }

  /// Validation basique de la structure JWT (3 parties séparées par des points)
  bool _isValidJwtStructure(String token) {
    if (token.isEmpty) return false;
    final parts = token.split('.');
    return parts.length == 3 && parts.every((part) => part.isNotEmpty);
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
