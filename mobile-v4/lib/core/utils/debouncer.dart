import 'dart:async';

/// Utilitaire de debouncing pour optimiser les recherches
class Debouncer {
  final Duration delay;
  Timer? _timer;

  Debouncer({this.delay = const Duration(milliseconds: 500)});

  /// Exécuter une fonction avec debouncing
  void run(void Function() action) {
    _timer?.cancel();
    _timer = Timer(delay, action);
  }

  /// Annuler le timer en cours
  void cancel() {
    _timer?.cancel();
  }

  /// Nettoyer les ressources
  void dispose() {
    _timer?.cancel();
  }
}

/// Throttler pour limiter la fréquence d'exécution
class Throttler {
  final Duration duration;
  Timer? _timer;
  bool _isReady = true;

  Throttler({this.duration = const Duration(milliseconds: 300)});

  /// Exécuter une fonction avec throttling
  void run(void Function() action) {
    if (_isReady) {
      action();
      _isReady = false;
      _timer = Timer(duration, () {
        _isReady = true;
      });
    }
  }

  /// Nettoyer les ressources
  void dispose() {
    _timer?.cancel();
  }
}
