import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';

/// Helpers pour les tests

/// Mock Dio Client
class MockDio extends Mock implements Dio {}

/// Mock Response
class MockResponse<T> extends Mock implements Response<T> {}

/// Test Matchers personnalisés
Matcher throwsAppException(String message) {
  return throwsA(
    predicate(
      (e) => e.toString().contains(message),
      'throws exception with message: $message',
    ),
  );
}

/// Helper pour créer un Future qui réussit
Future<T> successFuture<T>(T value) async {
  return Future.value(value);
}

/// Helper pour créer un Future qui échoue
Future<T> failureFuture<T>(dynamic error) async {
  return Future.error(error);
}

/// Helper pour vérifier les appels async
Future<void> verifyAsync(Function() verification) async {
  await Future.delayed(Duration.zero);
  verification();
}

/// Mock DateTime pour tests
class MockDateTime {
  static DateTime? _mockNow;

  static DateTime get now => _mockNow ?? DateTime.now();

  static void setMockNow(DateTime dateTime) {
    _mockNow = dateTime;
  }

  static void reset() {
    _mockNow = null;
  }
}

/// Helper pour créer des dates de test
DateTime testDate({
  int year = 2026,
  int month = 1,
  int day = 27,
  int hour = 12,
  int minute = 0,
}) {
  return DateTime(year, month, day, hour, minute);
}

/// Helper pour comparer des dates (ignore les millisecondes)
bool datesEqual(DateTime? a, DateTime? b) {
  if (a == null && b == null) return true;
  if (a == null || b == null) return false;
  
  return a.year == b.year &&
      a.month == b.month &&
      a.day == b.day &&
      a.hour == b.hour &&
      a.minute == b.minute &&
      a.second == b.second;
}

/// Helper pour créer un Dio Response de succès
Response<T> successResponse<T>(T data, {int statusCode = 200}) {
  return Response<T>(
    data: data,
    statusCode: statusCode,
    requestOptions: RequestOptions(path: '/test'),
  );
}

/// Helper pour créer un Dio Response d'erreur
DioException errorResponse({
  int statusCode = 500,
  String message = 'Error',
  dynamic data,
}) {
  return DioException(
    response: Response(
      statusCode: statusCode,
      statusMessage: message,
      data: data,
      requestOptions: RequestOptions(path: '/test'),
    ),
    requestOptions: RequestOptions(path: '/test'),
    type: DioExceptionType.badResponse,
  );
}

/// Helper pour créer une erreur de connexion
DioException connectionError() {
  return DioException(
    requestOptions: RequestOptions(path: '/test'),
    type: DioExceptionType.connectionError,
    message: 'Connection error',
  );
}

/// Helper pour créer une erreur de timeout
DioException timeoutError() {
  return DioException(
    requestOptions: RequestOptions(path: '/test'),
    type: DioExceptionType.connectionTimeout,
    message: 'Connection timeout',
  );
}

/// Groupe de tests avec setup et teardown
void testGroup(
  String description,
  Function() body, {
  Function()? setUp,
  Function()? tearDown,
}) {
  group(description, () {
    if (setUp != null) {
      setUp();
    }

    body();

    if (tearDown != null) {
      tearDown();
    }
  });
}

/// Helper pour tester les streams
Future<List<T>> collectStream<T>(
  Stream<T> stream, {
  int count = 1,
  Duration timeout = const Duration(seconds: 5),
}) async {
  final items = <T>[];
  final subscription = stream.listen(items.add);

  try {
    await Future.delayed(timeout);
    return items.take(count).toList();
  } finally {
    await subscription.cancel();
  }
}

/// Helper pour vérifier qu'un stream émet des valeurs
Future<void> expectStream<T>(
  Stream<T> stream,
  List<T> expected, {
  Duration timeout = const Duration(seconds: 5),
}) async {
  final items = await collectStream(stream, count: expected.length, timeout: timeout);
  expect(items, equals(expected));
}

/// Helper pour vérifier qu'un Future se complète
Future<void> expectCompletes(
  Future<dynamic> future, {
  Duration timeout = const Duration(seconds: 5),
}) async {
  await expectLater(
    future.timeout(timeout),
    completes,
  );
}

/// Helper pour vérifier qu'un Future échoue
Future<void> expectThrows<T>(
  Future<dynamic> future,
  Matcher matcher,
) async {
  await expectLater(future, throwsA(matcher));
}

/// Mock Logger pour tests
class MockLogger {
  final List<String> logs = [];

  void log(String message) {
    logs.add(message);
  }

  void clear() {
    logs.clear();
  }

  bool contains(String message) {
    return logs.any((log) => log.contains(message));
  }
}

/// Helper pour capturer les prints
List<String> capturePrints(Function() body) {
  final prints = <String>[];

  runZoned(
    body,
    zoneSpecification: ZoneSpecification(
      print: (Zone self, ZoneDelegate parent, Zone zone, String line) {
        prints.add(line);
      },
    ),
  );

  return prints;
}

/// Helper pour les tests de performance
class PerformanceTest {
  final Stopwatch _stopwatch = Stopwatch();

  void start() {
    _stopwatch.start();
  }

  void stop() {
    _stopwatch.stop();
  }

  Duration get elapsed => _stopwatch.elapsed;

  void expectFasterThan(Duration duration) {
    expect(_stopwatch.elapsed, lessThan(duration));
  }

  void expectSlowerThan(Duration duration) {
    expect(_stopwatch.elapsed, greaterThan(duration));
  }
}

/// Helper pour mesurer le temps d'exécution
Future<Duration> measureTime(Future<void> Function() body) async {
  final stopwatch = Stopwatch()..start();
  await body();
  stopwatch.stop();
  return stopwatch.elapsed;
}
