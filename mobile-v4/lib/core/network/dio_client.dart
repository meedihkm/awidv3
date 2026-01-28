import 'package:dio/dio.dart';

import '../config/api_config.dart';
import '../config/app_config.dart';
import 'interceptors/auth_interceptor.dart';
import 'interceptors/error_interceptor.dart';
import 'interceptors/logging_interceptor.dart';

/// Dio HTTP Client
/// Client HTTP configuré avec interceptors
class DioClient {
  DioClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConfig.baseUrl,
        connectTimeout: AppConfig.connectionTimeout,
        receiveTimeout: AppConfig.receiveTimeout,
        sendTimeout: AppConfig.sendTimeout,
        headers: {'Content-Type': 'application/json', 'Accept': 'application/json'},
      ),
    );

    // Add interceptors
    _dio.interceptors.addAll([
      AuthInterceptor(_dio),
      ErrorInterceptor(),
      if (AppConfig.enableLogging) LoggingInterceptor(),
    ]);
  }
  late final Dio _dio;

  Dio get dio => _dio;

  // GET request
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    return _dio.get<T>(path, queryParameters: queryParameters, options: options, cancelToken: cancelToken);
  }

  // POST request
  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.post<T>(
        path, 
        data: data, 
        queryParameters: queryParameters, 
        options: options, 
        cancelToken: cancelToken
      );

      // Validation de la réponse
      if (response.statusCode == null) {
        throw DioException(
          requestOptions: RequestOptions(path: path),
          error: 'Status code manquant dans la réponse',
          type: DioExceptionType.badResponse,
        );
      }

      if (response.statusCode! < 200 || response.statusCode! >= 300) {
        throw DioException(
          requestOptions: RequestOptions(path: path),
          response: response,
          error: 'Status code invalide: ${response.statusCode}',
          type: DioExceptionType.badResponse,
        );
      }

      return response;
    } on DioException {
      // Re-throw les exceptions Dio (gérées par ErrorInterceptor)
      rethrow;
    } on Error catch (e) {
      // Erreurs système (null pointer, etc.)
      throw DioException(
        requestOptions: RequestOptions(path: path),
        error: 'Erreur système: ${e.toString()}',
        type: DioExceptionType.unknown,
      );
    } catch (e) {
      // Autres erreurs inattendues
      throw DioException(
        requestOptions: RequestOptions(path: path),
        error: 'Erreur réseau inattendue: ${e.toString()}',
        type: DioExceptionType.unknown,
      );
    }
  }

  // PUT request
  Future<Response<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    return _dio.put<T>(path, data: data, queryParameters: queryParameters, options: options, cancelToken: cancelToken);
  }

  // PATCH request
  Future<Response<T>> patch<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    return _dio.patch<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
  }

  // DELETE request
  Future<Response<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    return _dio.delete<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
  }

  // Upload file
  Future<Response<T>> upload<T>(
    String path,
    FormData formData, {
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
  }) async {
    return _dio.post<T>(
      path,
      data: formData,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
    );
  }
}
