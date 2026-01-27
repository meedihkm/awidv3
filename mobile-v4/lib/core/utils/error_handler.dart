import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// Gestionnaire d'erreurs centralisé
class ErrorHandler {
  static final ErrorHandler _instance = ErrorHandler._internal();
  factory ErrorHandler() => _instance;
  ErrorHandler._internal();

  /// Gérer une erreur et retourner un message utilisateur
  String handleError(dynamic error, {String? context}) {
    if (kDebugMode) {
      print('❌ Error in $context: $error');
    }

    if (error is DioException) {
      return _handleDioError(error);
    }

    if (error is AppException) {
      return error.message;
    }

    if (error is FormatException) {
      return 'Format de données invalide';
    }

    if (error is TypeError) {
      return 'Erreur de type de données';
    }

    return 'Une erreur inattendue s\'est produite';
  }

  /// Gérer les erreurs Dio (HTTP)
  String _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return 'Délai de connexion dépassé';
      
      case DioExceptionType.sendTimeout:
        return 'Délai d\'envoi dépassé';
      
      case DioExceptionType.receiveTimeout:
        return 'Délai de réception dépassé';
      
      case DioExceptionType.badCertificate:
        return 'Certificat SSL invalide';
      
      case DioExceptionType.badResponse:
        return _handleBadResponse(error);
      
      case DioExceptionType.cancel:
        return 'Requête annulée';
      
      case DioExceptionType.connectionError:
        return 'Erreur de connexion. Vérifiez votre connexion internet.';
      
      case DioExceptionType.unknown:
        return 'Erreur de connexion inconnue';
    }
  }

  /// Gérer les réponses HTTP avec erreur
  String _handleBadResponse(DioException error) {
    final statusCode = error.response?.statusCode;
    final data = error.response?.data;

    // Essayer d'extraire le message d'erreur du serveur
    String? serverMessage;
    if (data is Map<String, dynamic>) {
      serverMessage = data['message'] as String? ??
          data['error'] as String? ??
          data['detail'] as String?;
    }

    if (serverMessage != null && serverMessage.isNotEmpty) {
      return serverMessage;
    }

    // Messages par défaut selon le code HTTP
    switch (statusCode) {
      case 400:
        return 'Requête invalide';
      case 401:
        return 'Non autorisé. Veuillez vous reconnecter.';
      case 403:
        return 'Accès interdit';
      case 404:
        return 'Ressource non trouvée';
      case 409:
        return 'Conflit de données';
      case 422:
        return 'Données invalides';
      case 429:
        return 'Trop de requêtes. Veuillez réessayer plus tard.';
      case 500:
        return 'Erreur serveur interne';
      case 502:
        return 'Passerelle incorrecte';
      case 503:
        return 'Service temporairement indisponible';
      case 504:
        return 'Délai d\'attente de la passerelle dépassé';
      default:
        return 'Erreur serveur (code $statusCode)';
    }
  }

  /// Vérifier si l'erreur est liée à la connexion
  bool isConnectionError(dynamic error) {
    if (error is DioException) {
      return error.type == DioExceptionType.connectionError ||
          error.type == DioExceptionType.connectionTimeout ||
          error.type == DioExceptionType.unknown;
    }
    return false;
  }

  /// Vérifier si l'erreur est une erreur d'authentification
  bool isAuthError(dynamic error) {
    if (error is DioException) {
      return error.response?.statusCode == 401;
    }
    if (error is UnauthorizedException) {
      return true;
    }
    return false;
  }

  /// Vérifier si l'erreur est une erreur de validation
  bool isValidationError(dynamic error) {
    if (error is DioException) {
      return error.response?.statusCode == 422 ||
          error.response?.statusCode == 400;
    }
    if (error is ValidationException) {
      return true;
    }
    return false;
  }

  /// Logger une erreur
  void logError(dynamic error, {StackTrace? stackTrace, String? context}) {
    if (kDebugMode) {
      print('═══════════════════════════════════════');
      print('❌ ERROR ${context != null ? 'in $context' : ''}');
      print('───────────────────────────────────────');
      print('Error: $error');
      if (stackTrace != null) {
        print('Stack trace:');
        print(stackTrace);
      }
      print('═══════════════════════════════════════');
    }

    // TODO: Envoyer à un service de logging (Sentry, Firebase Crashlytics, etc.)
  }

  /// Extraire les erreurs de validation d'une réponse
  Map<String, String>? extractValidationErrors(dynamic error) {
    if (error is! DioException) return null;

    final data = error.response?.data;
    if (data is! Map<String, dynamic>) return null;

    final errors = data['errors'] as Map<String, dynamic>?;
    if (errors == null) return null;

    final validationErrors = <String, String>{};
    errors.forEach((key, value) {
      if (value is List && value.isNotEmpty) {
        validationErrors[key] = value.first.toString();
      } else if (value is String) {
        validationErrors[key] = value;
      }
    });

    return validationErrors.isNotEmpty ? validationErrors : null;
  }
}

/// Exception de base de l'application
abstract class AppException implements Exception {
  final String message;
  final String? code;
  final dynamic details;

  AppException(this.message, {this.code, this.details});

  @override
  String toString() => message;
}

/// Exception de validation
class ValidationException extends AppException {
  final Map<String, String>? fieldErrors;

  ValidationException(
    super.message, {
    super.code,
    this.fieldErrors,
  });
}

/// Exception d'authentification
class UnauthorizedException extends AppException {
  UnauthorizedException([String? message])
      : super(message ?? 'Non autorisé. Veuillez vous reconnecter.');
}

/// Exception de ressource non trouvée
class NotFoundException extends AppException {
  NotFoundException([String? message])
      : super(message ?? 'Ressource non trouvée');
}

/// Exception de conflit
class ConflictException extends AppException {
  ConflictException([String? message])
      : super(message ?? 'Conflit de données');
}

/// Exception serveur
class ServerException extends AppException {
  ServerException([String? message])
      : super(message ?? 'Erreur serveur');
}

/// Exception de connexion
class ConnectionException extends AppException {
  ConnectionException([String? message])
      : super(message ?? 'Erreur de connexion');
}

/// Exception de timeout
class TimeoutException extends AppException {
  TimeoutException([String? message])
      : super(message ?? 'Délai d\'attente dépassé');
}

/// Exception métier
class BusinessException extends AppException {
  BusinessException(super.message, {super.code, super.details});
}

/// Résultat d'une opération avec gestion d'erreur
class Result<T> {
  final T? data;
  final AppException? error;

  Result.success(this.data) : error = null;
  Result.failure(this.error) : data = null;

  bool get isSuccess => error == null;
  bool get isFailure => error != null;

  /// Transformer le résultat
  Result<R> map<R>(R Function(T data) transform) {
    if (isSuccess) {
      return Result.success(transform(data as T));
    }
    return Result.failure(error!);
  }

  /// Exécuter une action selon le résultat
  R when<R>({
    required R Function(T data) success,
    required R Function(AppException error) failure,
  }) {
    if (isSuccess) {
      return success(data as T);
    }
    return failure(error!);
  }

  /// Obtenir la donnée ou lancer l'erreur
  T getOrThrow() {
    if (isSuccess) {
      return data as T;
    }
    throw error!;
  }

  /// Obtenir la donnée ou une valeur par défaut
  T getOrElse(T defaultValue) {
    return data ?? defaultValue;
  }

  /// Obtenir la donnée ou null
  T? getOrNull() {
    return data;
  }
}

/// Extension pour faciliter la gestion d'erreur
extension FutureErrorHandling<T> on Future<T> {
  /// Convertir en Result
  Future<Result<T>> toResult() async {
    try {
      final data = await this;
      return Result.success(data);
    } on AppException catch (e) {
      return Result.failure(e);
    } catch (e) {
      final message = ErrorHandler().handleError(e);
      return Result.failure(BusinessException(message));
    }
  }

  /// Gérer les erreurs avec un callback
  Future<T> catchError(String Function(dynamic error) handler) {
    return catchError((error) {
      final message = handler(error);
      throw BusinessException(message);
    });
  }
}
