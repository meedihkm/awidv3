import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

/// Logging Interceptor
/// Log les requêtes et réponses HTTP (dev uniquement)
class LoggingInterceptor extends Interceptor {
  final Logger _logger = Logger(
    printer: PrettyPrinter(methodCount: 0, errorMethodCount: 5, lineLength: 75, colors: true, printEmojis: true),
  );

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _logger.i(
      '🌐 REQUEST\n'
      'Method: ${options.method}\n'
      'URL: ${options.uri}\n'
      'Headers: ${options.headers}\n'
      'Data: ${options.data}',
    );
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _logger.i(
      '✅ RESPONSE\n'
      'Status: ${response.statusCode}\n'
      'URL: ${response.requestOptions.uri}\n'
      'Data: ${response.data}',
    );
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _logger.e(
      '❌ ERROR\n'
      'Type: ${err.type}\n'
      'URL: ${err.requestOptions.uri}\n'
      'Status: ${err.response?.statusCode}\n'
      'Message: ${err.message}\n'
      'Data: ${err.response?.data}',
    );
    return handler.next(err);
  }
}
