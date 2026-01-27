import 'package:flutter/material.dart';
import 'package:awid_mobile/core/services/connectivity_service.dart';
import 'package:awid_mobile/core/services/offline_sync_service.dart';

/// Indicateur de mode offline avec statut de synchronisation
class OfflineModeIndicator extends StatefulWidget {
  const OfflineModeIndicator({super.key});

  @override
  State<OfflineModeIndicator> createState() => _OfflineModeIndicatorState();
}

class _OfflineModeIndicatorState extends State<OfflineModeIndicator> {
  final ConnectivityService _connectivityService = ConnectivityService();
  final OfflineSyncService _syncService = OfflineSyncService();

  bool _isOnline = true;
  int _pendingCount = 0;
  bool _isSyncing = false;

  @override
  void initState() {
    super.initState();
    _isOnline = _connectivityService.isOnline;
    _pendingCount = _syncService.pendingOperationsCount;

    // Écouter les changements de connectivité
    _connectivityService.statusStream.listen((status) {
      if (mounted) {
        setState(() {
          _isOnline = status == ConnectivityStatus.online;
        });
      }
    });

    // Écouter les changements de synchronisation
    _syncService.syncStatus.listen((status) {
      if (mounted) {
        setState(() {
          _pendingCount = status.pendingCount;
          _isSyncing = status.isSyncing;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isOnline && _pendingCount == 0) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: _isOnline ? Colors.blue : Colors.orange,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (_isSyncing)
            const SizedBox(
              width: 14,
              height: 14,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          else
            Icon(
              _isOnline ? Icons.cloud_upload : Icons.cloud_off,
              color: Colors.white,
              size: 16,
            ),
          const SizedBox(width: 6),
          Text(
            _isSyncing
                ? 'Synchronisation...'
                : _isOnline
                    ? '$_pendingCount en attente'
                    : 'Mode hors ligne',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

/// Bannière de mode offline avec détails
class OfflineModeBanner extends StatefulWidget {
  const OfflineModeBanner({super.key});

  @override
  State<OfflineModeBanner> createState() => _OfflineModeBannerState();
}

class _OfflineModeBannerState extends State<OfflineModeBanner> {
  final ConnectivityService _connectivityService = ConnectivityService();
  final OfflineSyncService _syncService = OfflineSyncService();

  bool _isOnline = true;
  int _pendingCount = 0;

  @override
  void initState() {
    super.initState();
    _isOnline = _connectivityService.isOnline;
    _pendingCount = _syncService.pendingOperationsCount;

    _connectivityService.statusStream.listen((status) {
      if (mounted) {
        setState(() {
          _isOnline = status == ConnectivityStatus.online;
        });
      }
    });

    _syncService.syncStatus.listen((status) {
      if (mounted) {
        setState(() {
          _pendingCount = status.pendingCount;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isOnline && _pendingCount == 0) {
      return const SizedBox.shrink();
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      color: _isOnline ? Colors.blue[100] : Colors.orange[100],
      child: Row(
        children: [
          Icon(
            _isOnline ? Icons.cloud_upload : Icons.cloud_off,
            color: _isOnline ? Colors.blue : Colors.orange,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _isOnline ? 'Synchronisation en attente' : 'Mode hors ligne',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: _isOnline ? Colors.blue[900] : Colors.orange[900],
                  ),
                ),
                if (_pendingCount > 0)
                  Text(
                    '$_pendingCount opération(s) seront synchronisées',
                    style: TextStyle(
                      fontSize: 12,
                      color: _isOnline ? Colors.blue[700] : Colors.orange[700],
                    ),
                  ),
              ],
            ),
          ),
          if (_isOnline && _pendingCount > 0)
            TextButton(
              onPressed: () {
                _syncService.syncPendingOperations();
              },
              child: const Text('Synchroniser'),
            ),
        ],
      ),
    );
  }
}
