import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

/// Service de gestion de la connectivité
class ConnectivityService {
  static final ConnectivityService _instance = ConnectivityService._internal();
  factory ConnectivityService() => _instance;
  ConnectivityService._internal();

  final Connectivity _connectivity = Connectivity();
  final _statusController = StreamController<ConnectivityStatus>.broadcast();
  
  ConnectivityStatus _currentStatus = ConnectivityStatus.online;
  StreamSubscription<ConnectivityResult>? _subscription;

  Stream<ConnectivityStatus> get statusStream => _statusController.stream;
  ConnectivityStatus get currentStatus => _currentStatus;
  bool get isOnline => _currentStatus == ConnectivityStatus.online;
  bool get isOffline => _currentStatus == ConnectivityStatus.offline;

  /// Initialiser le service
  Future<void> initialize() async {
    // Vérifier le statut initial
    await _checkConnectivity();

    // Écouter les changements
    _subscription = _connectivity.onConnectivityChanged.listen((result) {
      _updateStatus(result);
    });
  }

  /// Vérifier la connectivité
  Future<void> _checkConnectivity() async {
    try {
      final result = await _connectivity.checkConnectivity();
      _updateStatus(result);
    } catch (e) {
      print('Error checking connectivity: $e');
      _updateStatus(ConnectivityResult.none);
    }
  }

  /// Mettre à jour le statut
  void _updateStatus(ConnectivityResult result) {
    final newStatus = result == ConnectivityResult.none
        ? ConnectivityStatus.offline
        : ConnectivityStatus.online;

    if (newStatus != _currentStatus) {
      final previousStatus = _currentStatus;
      _currentStatus = newStatus;
      _statusController.add(newStatus);

      // Log le changement
      if (newStatus == ConnectivityStatus.online) {
        print('📶 Connexion rétablie');
      } else {
        print('📵 Connexion perdue');
      }

      // Notifier les callbacks
      if (newStatus == ConnectivityStatus.online && 
          previousStatus == ConnectivityStatus.offline) {
        _onConnectionRestored();
      }
    }
  }

  /// Callback quand la connexion est rétablie
  void _onConnectionRestored() {
    // Déclencher la synchronisation
    print('🔄 Déclenchement de la synchronisation...');
    // TODO: Appeler le service de synchronisation
  }

  /// Forcer une vérification
  Future<bool> checkConnection() async {
    await _checkConnectivity();
    return isOnline;
  }

  /// Nettoyer les ressources
  void dispose() {
    _subscription?.cancel();
    _statusController.close();
  }
}

/// Statut de connectivité
enum ConnectivityStatus {
  online,
  offline,
}
