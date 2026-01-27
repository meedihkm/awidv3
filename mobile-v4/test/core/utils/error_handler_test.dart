import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:awid_mobile/core/utils/error_handler.dart';

void main() {
  late ErrorHandler errorHandler;

  setUp(() {
    errorHandler = ErrorHandler();
  });

  group('ErrorHandler - DioException Handling', () {
    test('should handle connection timeout error', () {
      // Arrange
      final error = DioException(
        requestOptions: RequestOptions(path: '/test'),
        type: DioExceptionType.connectionTimeout,
      );

      // Act
      final message = errorHandler.handleError(error);

      // Assert
      expect(message, equals('Délai de connexion dépassé'));
    });

    test('should handle send timeout error', () {
      // Arrange
      final error = DioException(
        requestOptions: RequestOptions(path: '/test'),
        type: DioExceptionType.sendTimeout,
      );

      // Act
      final message = errorHandler.handleError(error);

      // Assert
      expect(message, equals('Délai d\'envoi dépassé'));
    });

    test('should handle receive timeout error', () {
      // Arrange
      final error = DioException(
        requestOptions: RequestOptions(path: '/test'),
        type: DioExceptionType.receiveTimeout,
      );

      // Act
      final message = errorHandler.handleError(error);

      // Assert
      expect(message, equals('Délai de réception dépassé'));
    });

    test('should handle bad certificate error', () {
      // Arrange
      final error = DioException(
        requestOptions: RequestOptions(path: '/test'),
        type: DioExceptionType.badCertificate,
      );

      // Act
      final message = errorHandler.handleError(error);

      // Assert
      expect(message, equals('Certificat SSL invalide'));
    });

    test('should handle cancel error', () {
      // Arrange
      final error = DioException(
        requestOptions: RequestOptions(path: '/test'),
        type: DioExceptionType.cancel,
      );

      // Act
      final message = errorHandler.handleError(error);

      // Assert
      expect(message, equals('Requête annulée'));
    });

    test('should handle connection error', () {
      // Arrange
      final error = DioException(
        requestOptions: RequestOptions(path: '/test'),
        type: DioExceptionType.connectionError,
      );

      // Act
      final message = errorHandler.handleError(error);

      // Assert
      expect(message, contains('Erreur de connexion'));
    });

    test('should handle unknown error', () {
      // Arrange
      final error = DioException(
        requestOptions: RequestOptions(path: '/test'),
        type: DioExceptionType.unknown,
      );

      // Act
      final message = errorHandler.handleError(error);

      // Assert
      expect(message, equals('Erreur de connexion inconnue'));
    });
  });

  group('ErrorHandler - HTTP Status Codes', () {
    test('should handle 400 Bad Request', () {
      // Arrange
      final error = DioException(
        requestOptions: RequestOptions(path: '/test'),
        type: DioExceptionType.badResponse,
        response: Response(
          requestOptions: RequestOptions(path: '/test'),
          statusCode: 400,
        ),
      );

      // Act
      final message = errorHandler.handleError(error);

      // Assert
      expect(message, equals('Requête invalide'));
    });

    test('should handle 401 Unauthorized', () {
      // Arrange
      final error = DioException(
        requestOptions: RequestOptions(path: '/test'),
        type: DioExceptionType.badResponse,
        response: Response(
          requestOptions: RequestOptions(path: '/test'),
          statusCode: 401,
        ),
      );

      // Act
      final message = errorHandler.handleError(error);

      // Assert
      expect(message, contains('Non autorisé'));
    });

    test('should handle 403 Forbidden', () {
      // Arrange
      final error = DioException(
        requestOptions: RequestOptions(path: '/test'),
        type: DioExceptionType.badResponse,
        response: Response(
          requestOptions: RequestOptions(path: '/test'),
          statusCode: 403,
        ),
      );

      // Act
      final message = errorHandler.handleError(error);

      // Assert
      expect(message, equals('Accès interdit'));
    });

    test('should handle 404 Not Found', () {
      // Arrange
      final error = DioException(
        requestOptions: RequestOptions(path: '/test'),
        type: DioExceptionType.badResponse,
        response: Response(
          requestOptions: RequestOptions(path: '/test'),
          statusCode: 404,
        ),
      );

      // Act
      final message = errorHandler.handleError(error);

      // Assert
      expect(message, equals('Ressource non trouvée'));
    });

    test('should handle 409 Conflict', () {
      // Arrange
      final error = DioException(
        requestOptions: RequestOptions(path: '/test'),
        type: DioExceptionType.badResponse,
        response: Response(
          requestOptions: RequestOptions(path: '/test'),
          statusCode: 409,
        ),
      );

      // Act
      final message = errorHandler.handleError(error);

      // Assert
      expect(message, equals('Conflit de données'));
    });

    test('should handle 422 Unprocessable Entity', () {
      // Arrange
      final error = DioException(
        requestOptions: RequestOptions(path: '/test'),
        type: DioExceptionType.badResponse,
        response: Response(
          requestOptions: RequestOptions(path: '/test'),
          statusCode: 422,
        ),
      );

      // Act
      final message = errorHandler.handleError(error);

      // Assert
      expect(message, equals('Données invalides'));
    });

    test('should handle 429 Too Many Requests', () {
      // Arrange
      final error = DioException(
        requestOptions: RequestOptions(path: '/test'),
        type: DioExceptionType.badResponse,
        response: Response(
          requestOptions: RequestOptions(path: '/test'),
          statusCode: 429,
        ),
      );

      // Act
      final message = errorHandler.handleError(error);

      // Assert
      expect(message, contains('Trop de requêtes'));
    });

    test('should handle 500 Internal Server Error', () {
      // Arrange
      final error = DioException(
        requestOptions: RequestOptions(path: '/test'),
        type: DioExceptionType.badResponse,
        response: Response(
          requestOptions: RequestOptions(path: '/test'),
          statusCode: 500,
        ),
      );

      // Act
      final message = errorHandler.handleError(error);

      // Assert
      expect(message, equals('Erreur serveur interne'));
    });

    test('should handle 502 Bad Gateway', () {
      // Arrange
      final error = DioException(
        requestOptions: RequestOptions(path: '/test'),
        type: DioExceptionType.badResponse,
        response: Response(
          requestOptions: RequestOptions(path: '/test'),
          statusCode: 502,
        ),
      );

      // Act
      final message = errorHandler.handleError(error);

      // Assert
      expect(message, equals('Passerelle incorrecte'));
    });

    test('should handle 503 Service Unavailable', () {
      // Arrange
      final error = DioException(
        requestOptions: RequestOptions(path: '/test'),
        type: DioExceptionType.badResponse,
        response: Response(
          requestOptions: RequestOptions(path: '/test'),
          statusCode: 503,
        ),
      );

      // Act
      final message = errorHandler.handleError(error);

      // Assert
      expect(message, equals('Service temporairement indisponible'));
    });

    test('should handle 504 Gateway Timeout', () {
      // Arrange
      final error = DioException(
        requestOptions: RequestOptions(path: '/test'),
        type: DioExceptionType.badResponse,
        response: Response(
          requestOptions: RequestOptions(path: '/test'),
          statusCode: 504,
        ),
      );

      // Act
      final message = errorHandler.handleError(error);

      // Assert
      expect(message, contains('Délai d\'attente'));
    });

    test('should handle unknown status code', () {
      // Arrange
      final error = DioException(
        requestOptions: RequestOptions(path: '/test'),
        type: DioExceptionType.badResponse,
        response: Response(
          requestOptions: RequestOptions(path: '/test'),
          statusCode: 418,
        ),
      );

      // Act
      final message = errorHandler.handleError(error);

      // Assert
      expect(message, contains('Erreur serveur'));
    });
  });

  group('ErrorHandler - Server Error Messages', () {
    test('should extract message from response data', () {
      // Arrange
      final error = DioException(
        requestOptions: RequestOptions(path: '/test'),
        type: DioExceptionType.badResponse,
        response: Response(
          requestOptions: RequestOptions(path: '/test'),
          statusCode: 400,
          data: {'message': 'Custom error message'},
        ),
      );

      // Act
      final message = errorHandler.handleError(error);

      // Assert
      expect(message, equals('Custom error message'));
    });

    test('should extract error from response data', () {
      // Arrange
      final error = DioException(
        requestOptions: RequestOptions(path: '/test'),
        type: DioExceptionType.badResponse,
        response: Response(
          requestOptions: RequestOptions(path: '/test'),
          statusCode: 400,
          data: {'error': 'Custom error'},
        ),
      );

      // Act
      final message = errorHandler.handleError(error);

      // Assert
      expect(message, equals('Custom error'));
    });

    test('should extract detail from response data', () {
      // Arrange
      final error = DioException(
        requestOptions: RequestOptions(path: '/test'),
        type: DioExceptionType.badResponse,
        response: Response(
          requestOptions: RequestOptions(path: '/test'),
          statusCode: 400,
          data: {'detail': 'Custom detail'},
        ),
      );

      // Act
      final message = errorHandler.handleError(error);

      // Assert
      expect(message, equals('Custom detail'));
    });

    test('should use default message if no server message', () {
      // Arrange
      final error = DioException(
        requestOptions: RequestOptions(path: '/test'),
        type: DioExceptionType.badResponse,
        response: Response(
          requestOptions: RequestOptions(path: '/test'),
          statusCode: 400,
          data: {},
        ),
      );

      // Act
      final message = errorHandler.handleError(error);

      // Assert
      expect(message, equals('Requête invalide'));
    });
  });

  group('ErrorHandler - AppException Handling', () {
    test('should handle ValidationException', () {
      // Arrange
      final error = ValidationException('Validation failed');

      // Act
      final message = errorHandler.handleError(error);

      // Assert
      expect(message, equals('Validation failed'));
    });

    test('should handle UnauthorizedException', () {
      // Arrange
      final error = UnauthorizedException();

      // Act
      final message = errorHandler.handleError(error);

      // Assert
      expect(message, contains('Non autorisé'));
    });

    test('should handle NotFoundException', () {
      // Arrange
      final error = NotFoundException();

      // Act
      final message = errorHandler.handleError(error);

      // Assert
      expect(message, equals('Ressource non trouvée'));
    });

    test('should handle ConflictException', () {
      // Arrange
      final error = ConflictException();

      // Act
      final message = errorHandler.handleError(error);

      // Assert
      expect(message, equals('Conflit de données'));
    });

    test('should handle ServerException', () {
      // Arrange
      final error = ServerException();

      // Act
      final message = errorHandler.handleError(error);

      // Assert
      expect(message, equals('Erreur serveur'));
    });

    test('should handle ConnectionException', () {
      // Arrange
      final error = ConnectionException();

      // Act
      final message = errorHandler.handleError(error);

      // Assert
      expect(message, equals('Erreur de connexion'));
    });

    test('should handle TimeoutException', () {
      // Arrange
      final error = TimeoutException();

      // Act
      final message = errorHandler.handleError(error);

      // Assert
      expect(message, contains('Délai'));
    });

    test('should handle BusinessException', () {
      // Arrange
      final error = BusinessException('Business rule violated');

      // Act
      final message = errorHandler.handleError(error);

      // Assert
      expect(message, equals('Business rule violated'));
    });
  });

  group('ErrorHandler - Other Exceptions', () {
    test('should handle FormatException', () {
      // Arrange
      final error = FormatException('Invalid format');

      // Act
      final message = errorHandler.handleError(error);

      // Assert
      expect(message, equals('Format de données invalide'));
    });

    test('should handle TypeError', () {
      // Arrange
      final error = TypeError();

      // Act
      final message = errorHandler.handleError(error);

      // Assert
      expect(message, equals('Erreur de type de données'));
    });

    test('should handle generic exception', () {
      // Arrange
      final error = Exception('Generic error');

      // Act
      final message = errorHandler.handleError(error);

      // Assert
      expect(message, equals('Une erreur inattendue s\'est produite'));
    });
  });

  group('ErrorHandler - Error Type Checks', () {
    test('should identify connection error', () {
      // Arrange
      final error = DioException(
        requestOptions: RequestOptions(path: '/test'),
        type: DioExceptionType.connectionError,
      );

      // Act
      final isConnectionError = errorHandler.isConnectionError(error);

      // Assert
      expect(isConnectionError, isTrue);
    });

    test('should identify auth error from status code', () {
      // Arrange
      final error = DioException(
        requestOptions: RequestOptions(path: '/test'),
        type: DioExceptionType.badResponse,
        response: Response(
          requestOptions: RequestOptions(path: '/test'),
          statusCode: 401,
        ),
      );

      // Act
      final isAuthError = errorHandler.isAuthError(error);

      // Assert
      expect(isAuthError, isTrue);
    });

    test('should identify auth error from exception type', () {
      // Arrange
      final error = UnauthorizedException();

      // Act
      final isAuthError = errorHandler.isAuthError(error);

      // Assert
      expect(isAuthError, isTrue);
    });

    test('should identify validation error from status code', () {
      // Arrange
      final error = DioException(
        requestOptions: RequestOptions(path: '/test'),
        type: DioExceptionType.badResponse,
        response: Response(
          requestOptions: RequestOptions(path: '/test'),
          statusCode: 422,
        ),
      );

      // Act
      final isValidationError = errorHandler.isValidationError(error);

      // Assert
      expect(isValidationError, isTrue);
    });

    test('should identify validation error from exception type', () {
      // Arrange
      final error = ValidationException('Validation failed');

      // Act
      final isValidationError = errorHandler.isValidationError(error);

      // Assert
      expect(isValidationError, isTrue);
    });
  });

  group('ErrorHandler - Validation Errors Extraction', () {
    test('should extract validation errors from response', () {
      // Arrange
      final error = DioException(
        requestOptions: RequestOptions(path: '/test'),
        type: DioExceptionType.badResponse,
        response: Response(
          requestOptions: RequestOptions(path: '/test'),
          statusCode: 422,
          data: {
            'errors': {
              'email': ['Email is required'],
              'password': ['Password is too short'],
            },
          },
        ),
      );

      // Act
      final validationErrors = errorHandler.extractValidationErrors(error);

      // Assert
      expect(validationErrors, isNotNull);
      expect(validationErrors!['email'], equals('Email is required'));
      expect(validationErrors['password'], equals('Password is too short'));
    });

    test('should handle string validation errors', () {
      // Arrange
      final error = DioException(
        requestOptions: RequestOptions(path: '/test'),
        type: DioExceptionType.badResponse,
        response: Response(
          requestOptions: RequestOptions(path: '/test'),
          statusCode: 422,
          data: {
            'errors': {
              'email': 'Email is required',
            },
          },
        ),
      );

      // Act
      final validationErrors = errorHandler.extractValidationErrors(error);

      // Assert
      expect(validationErrors, isNotNull);
      expect(validationErrors!['email'], equals('Email is required'));
    });

    test('should return null if no validation errors', () {
      // Arrange
      final error = DioException(
        requestOptions: RequestOptions(path: '/test'),
        type: DioExceptionType.badResponse,
        response: Response(
          requestOptions: RequestOptions(path: '/test'),
          statusCode: 422,
          data: {},
        ),
      );

      // Act
      final validationErrors = errorHandler.extractValidationErrors(error);

      // Assert
      expect(validationErrors, isNull);
    });

    test('should return null for non-DioException', () {
      // Arrange
      final error = Exception('Generic error');

      // Act
      final validationErrors = errorHandler.extractValidationErrors(error);

      // Assert
      expect(validationErrors, isNull);
    });
  });

  group('ErrorHandler - Logging', () {
    test('should log error with context', () {
      // Arrange
      final error = Exception('Test error');

      // Act & Assert
      expect(
        () => errorHandler.logError(error, context: 'Test context'),
        returnsNormally,
      );
    });

    test('should log error with stack trace', () {
      // Arrange
      final error = Exception('Test error');
      final stackTrace = StackTrace.current;

      // Act & Assert
      expect(
        () => errorHandler.logError(error, stackTrace: stackTrace),
        returnsNormally,
      );
    });

    test('should log error without context', () {
      // Arrange
      final error = Exception('Test error');

      // Act & Assert
      expect(
        () => errorHandler.logError(error),
        returnsNormally,
      );
    });
  });

  group('ErrorHandler - Result', () {
    test('should create success result', () {
      // Act
      final result = Result.success(42);

      // Assert
      expect(result.isSuccess, isTrue);
      expect(result.isFailure, isFalse);
      expect(result.data, equals(42));
    });

    test('should create failure result', () {
      // Arrange
      final error = BusinessException('Test error');

      // Act
      final result = Result<int>.failure(error);

      // Assert
      expect(result.isSuccess, isFalse);
      expect(result.isFailure, isTrue);
      expect(result.error, equals(error));
    });

    test('should map success result', () {
      // Arrange
      final result = Result.success(42);

      // Act
      final mapped = result.map((value) => value * 2);

      // Assert
      expect(mapped.isSuccess, isTrue);
      expect(mapped.data, equals(84));
    });

    test('should map failure result', () {
      // Arrange
      final error = BusinessException('Test error');
      final result = Result<int>.failure(error);

      // Act
      final mapped = result.map((value) => value * 2);

      // Assert
      expect(mapped.isFailure, isTrue);
      expect(mapped.error, equals(error));
    });

    test('should execute when with success', () {
      // Arrange
      final result = Result.success(42);

      // Act
      final value = result.when(
        success: (data) => 'Success: $data',
        failure: (error) => 'Failure: ${error.message}',
      );

      // Assert
      expect(value, equals('Success: 42'));
    });

    test('should execute when with failure', () {
      // Arrange
      final error = BusinessException('Test error');
      final result = Result<int>.failure(error);

      // Act
      final value = result.when(
        success: (data) => 'Success: $data',
        failure: (error) => 'Failure: ${error.message}',
      );

      // Assert
      expect(value, equals('Failure: Test error'));
    });

    test('should get or throw success', () {
      // Arrange
      final result = Result.success(42);

      // Act
      final value = result.getOrThrow();

      // Assert
      expect(value, equals(42));
    });

    test('should get or throw failure', () {
      // Arrange
      final error = BusinessException('Test error');
      final result = Result<int>.failure(error);

      // Act & Assert
      expect(() => result.getOrThrow(), throwsA(error));
    });

    test('should get or else with success', () {
      // Arrange
      final result = Result.success(42);

      // Act
      final value = result.getOrElse(0);

      // Assert
      expect(value, equals(42));
    });

    test('should get or else with failure', () {
      // Arrange
      final error = BusinessException('Test error');
      final result = Result<int>.failure(error);

      // Act
      final value = result.getOrElse(0);

      // Assert
      expect(value, equals(0));
    });

    test('should get or null with success', () {
      // Arrange
      final result = Result.success(42);

      // Act
      final value = result.getOrNull();

      // Assert
      expect(value, equals(42));
    });

    test('should get or null with failure', () {
      // Arrange
      final error = BusinessException('Test error');
      final result = Result<int>.failure(error);

      // Act
      final value = result.getOrNull();

      // Assert
      expect(value, isNull);
    });
  });
}
