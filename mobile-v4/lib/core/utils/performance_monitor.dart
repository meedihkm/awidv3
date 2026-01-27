import 'dart:async';
import 'package:flutter/foundation.dart';

/// Moniteur de performance de l'application
class PerformanceMonitor {
  static final PerformanceMonitor _instance = PerformanceMonitor._internal();
  factory PerformanceMonitor() => _instance;
  PerformanceMonitor._internal();

  final Map<String, DateTime> _startTimes = {};
  final Map<String, List<Duration>> _metrics = {};
  final Map<String, int> _counters = {};

  /// Démarrer le monitoring d'une opération
  void startOperation(String operationName) {
    _startTimes[operationName] = DateTime.now();
  }

  /// Terminer le monitoring d'une opération
  void endOperation(String operationName) {
    final startTime = _startTimes[operationName];
    if (startTime != null) {
      final duration = DateTime.now().difference(startTime);
      _metrics.putIfAbsent(operationName, () => []).add(duration);
      _startTimes.remove(operationName);

      if (kDebugMode) {
        print('⏱️ $operationName: ${duration.inMilliseconds}ms');
      }

      // Alerter si l'opération est trop lente
      if (duration.inMilliseconds > 1000) {
        if (kDebugMode) {
          print('⚠️ Slow operation detected: $operationName (${duration.inMilliseconds}ms)');
        }
      }
    }
  }

  /// Mesurer une opération async
  Future<T> measureAsync<T>(
    String operationName,
    Future<T> Function() operation,
  ) async {
    startOperation(operationName);
    try {
      final result = await operation();
      endOperation(operationName);
      return result;
    } catch (e) {
      endOperation(operationName);
      rethrow;
    }
  }

  /// Mesurer une opération sync
  T measure<T>(String operationName, T Function() operation) {
    startOperation(operationName);
    try {
      final result = operation();
      endOperation(operationName);
      return result;
    } catch (e) {
      endOperation(operationName);
      rethrow;
    }
  }

  /// Incrémenter un compteur
  void incrementCounter(String counterName) {
    _counters[counterName] = (_counters[counterName] ?? 0) + 1;
  }

  /// Obtenir les statistiques d'une opération
  OperationStats? getStats(String operationName) {
    final durations = _metrics[operationName];
    if (durations == null || durations.isEmpty) {
      return null;
    }

    final totalMs = durations.fold<int>(
      0,
      (sum, duration) => sum + duration.inMilliseconds,
    );
    final avgMs = totalMs / durations.length;
    final minMs = durations.map((d) => d.inMilliseconds).reduce((a, b) => a < b ? a : b);
    final maxMs = durations.map((d) => d.inMilliseconds).reduce((a, b) => a > b ? a : b);

    return OperationStats(
      operationName: operationName,
      count: durations.length,
      averageMs: avgMs,
      minMs: minMs,
      maxMs: maxMs,
      totalMs: totalMs,
    );
  }

  /// Obtenir toutes les statistiques
  Map<String, OperationStats> getAllStats() {
    final stats = <String, OperationStats>{};
    for (final operationName in _metrics.keys) {
      final operationStats = getStats(operationName);
      if (operationStats != null) {
        stats[operationName] = operationStats;
      }
    }
    return stats;
  }

  /// Obtenir les compteurs
  Map<String, int> getCounters() {
    return Map.from(_counters);
  }

  /// Afficher un rapport de performance
  void printReport() {
    if (!kDebugMode) return;

    print('\n📊 Performance Report');
    print('=' * 50);

    final stats = getAllStats();
    if (stats.isEmpty) {
      print('No operations recorded');
      return;
    }

    for (final entry in stats.entries) {
      final stat = entry.value;
      print('\n${stat.operationName}:');
      print('  Count: ${stat.count}');
      print('  Average: ${stat.averageMs.toStringAsFixed(2)}ms');
      print('  Min: ${stat.minMs}ms');
      print('  Max: ${stat.maxMs}ms');
      print('  Total: ${stat.totalMs}ms');
    }

    if (_counters.isNotEmpty) {
      print('\n📈 Counters:');
      for (final entry in _counters.entries) {
        print('  ${entry.key}: ${entry.value}');
      }
    }

    print('=' * 50);
  }

  /// Réinitialiser les métriques
  void reset() {
    _startTimes.clear();
    _metrics.clear();
    _counters.clear();
  }
}

/// Statistiques d'une opération
class OperationStats {
  final String operationName;
  final int count;
  final double averageMs;
  final int minMs;
  final int maxMs;
  final int totalMs;

  OperationStats({
    required this.operationName,
    required this.count,
    required this.averageMs,
    required this.minMs,
    required this.maxMs,
    required this.totalMs,
  });
}
