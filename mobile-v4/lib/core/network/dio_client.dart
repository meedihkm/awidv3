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
    return _dio.post<T>(path, data: data, queryParameters: queryParameters, options: options, cancelToken: cancelToken);
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
