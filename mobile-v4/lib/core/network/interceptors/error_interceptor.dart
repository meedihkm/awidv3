import 'package:dio/dio.dart';

import '../../constants/api_constants.dart';

/// Error Interceptor
/// Gère les erreurs HTTP et les transforme en exceptions métier
class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    String errorMessage;
    String errorCode;

    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        errorMessage = 'Délai de connexion dépassé';
        errorCode = ApiConstants.errorTimeout;
        break;

      case DioExceptionType.badResponse:
        errorMessage = _handleStatusCode(err.response?.statusCode);
        errorCode = _getErrorCode(err.response?.statusCode);
        break;

      case DioExceptionType.cancel:
        errorMessage = 'Requête annulée';
        errorCode = ApiConstants.errorNetwork;
        break;

      default:
        errorMessage = 'Erreur de connexion au serveur';
        errorCode = ApiConstants.errorNetwork;
    }

    // Try to get error message from response
    if (err.response?.data != null) {
      try {
        final data = err.response!.data;
        if (data is Map<String, dynamic>) {
          errorMessage = data['message'] ?? errorMessage;
          errorCode = data['code'] ?? errorCode;
        }
      } catch (_) {
        // Use default error message
      }
    }

    // Create custom error
    final customError = DioException(
      requestOptions: err.requestOptions,
      response: err.response,
      type: err.type,
      error: {'message': errorMessage, 'code': errorCode},
    );

    return handler.next(customError);
  }

  String _handleStatusCode(int? statusCode) {
    switch (statusCode) {
      case 400:
        return 'Requête invalide';
      case 401:
        return 'Non autorisé';
      case 403:
        return 'Accès interdit';
      case 404:
        return 'Ressource non trouvée';
      case 409:
        return 'Conflit de données';
      case 422:
        return 'Données invalides';
      case 500:
        return 'Erreur serveur';
      case 502:
        return 'Serveur indisponible';
      case 503:
        return 'Service temporairement indisponible';
      default:
        return 'Une erreur est survenue';
    }
  }

  String _getErrorCode(int? statusCode) {
    switch (statusCode) {
      case 400:
      case 422:
        return ApiConstants.errorValidation;
      case 401:
        return ApiConstants.errorUnauthorized;
      case 403:
        return ApiConstants.errorForbidden;
      case 404:
        return ApiConstants.errorNotFound;
      case 500:
      case 502:
      case 503:
        return ApiConstants.errorServer;
      default:
        return ApiConstants.errorNetwork;
    }
  }
}
