import 'package:dio/dio.dart';

import '../../config/api_config.dart';
import '../../constants/api_constants.dart';
import '../../constants/storage_keys.dart';
import '../../storage/secure_storage.dart';

/// Auth Interceptor
/// Ajoute le token JWT aux requêtes et gère le refresh automatique
class AuthInterceptor extends Interceptor {
  final Dio _dio;
  final SecureStorage _secureStorage = SecureStorage();

  AuthInterceptor(this._dio);

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // Skip auth for login/register endpoints
    if (options.path.contains(ApiConfig.login) || options.path.contains(ApiConfig.register)) {
      return handler.next(options);
    }

    // Get access token
    final accessToken = await _secureStorage.read(StorageKeys.accessToken);

    if (accessToken != null) {
      options.headers[ApiConstants.headerAuthorization] = '${ApiConstants.bearerPrefix} $accessToken';
    }

    return handler.next(options);
  }

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    // Handle 401 Unauthorized - Token expired
    if (err.response?.statusCode == 401) {
      try {
        // Try to refresh token
        final newAccessToken = await _refreshToken();

        if (newAccessToken != null) {
          // Retry original request with new token
          final options = err.requestOptions;
          options.headers[ApiConstants.headerAuthorization] = '${ApiConstants.bearerPrefix} $newAccessToken';

          final response = await _dio.fetch(options);
          return handler.resolve(response);
        }
      } catch (e) {
        // Refresh failed - logout user
        await _secureStorage.deleteAll();
        return handler.reject(err);
      }
    }

    return handler.next(err);
  }

  Future<String?> _refreshToken() async {
    try {
      final refreshToken = await _secureStorage.read(StorageKeys.refreshToken);

      if (refreshToken == null) {
        return null;
      }

      final response = await _dio.post(ApiConfig.refresh, data: {'refreshToken': refreshToken});

      if (response.statusCode == 200) {
        final newAccessToken = response.data['accessToken'] as String;
        final newRefreshToken = response.data['refreshToken'] as String;

        // Save new tokens
        await _secureStorage.write(StorageKeys.accessToken, newAccessToken);
        await _secureStorage.write(StorageKeys.refreshToken, newRefreshToken);

        return newAccessToken;
      }

      return null;
    } catch (e) {
      return null;
    }
  }
}
