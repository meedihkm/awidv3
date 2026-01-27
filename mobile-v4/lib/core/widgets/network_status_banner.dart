import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

/// Bannière de statut réseau
class NetworkStatusBanner extends StatefulWidget {
  final Widget child;

  const NetworkStatusBanner({
    super.key,
    required this.child,
  });

  @override
  State<NetworkStatusBanner> createState() => _NetworkStatusBannerState();
}

class _NetworkStatusBannerState extends State<NetworkStatusBanner> {
  bool _isOnline = true;
  bool _showBanner = false;

  @override
  void initState() {
    super.initState();
    _checkConnectivity();
    _listenToConnectivity();
  }

  Future<void> _checkConnectivity() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    setState(() {
      _isOnline = connectivityResult != ConnectivityResult.none;
      _showBanner = !_isOnline;
    });
  }

  void _listenToConnectivity() {
    Connectivity().onConnectivityChanged.listen((result) {
      final wasOnline = _isOnline;
      final isNowOnline = result != ConnectivityResult.none;

      setState(() {
        _isOnline = isNowOnline;
        
        if (!isNowOnline) {
          // Perte de connexion
          _showBanner = true;
        } else if (wasOnline != isNowOnline) {
          // Retour de connexion
          _showBanner = true;
          // Cacher la bannière après 3 secondes
          Future.delayed(const Duration(seconds: 3), () {
            if (mounted) {
              setState(() {
                _showBanner = false;
              });
            }
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: _showBanner ? 40 : 0,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: _showBanner ? 1.0 : 0.0,
            child: Container(
              color: _isOnline ? Colors.green : Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    _isOnline ? Icons.wifi : Icons.wifi_off,
                    color: Colors.white,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    _isOnline
                        ? 'Connexion rétablie'
                        : 'Pas de connexion internet',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(child: widget.child),
      ],
    );
  }
}

/// Widget indicateur de statut réseau simple
class NetworkStatusIndicator extends StatefulWidget {
  const NetworkStatusIndicator({super.key});

  @override
  State<NetworkStatusIndicator> createState() => _NetworkStatusIndicatorState();
}

class _NetworkStatusIndicatorState extends State<NetworkStatusIndicator> {
  bool _isOnline = true;

  @override
  void initState() {
    super.initState();
    _checkConnectivity();
    _listenToConnectivity();
  }

  Future<void> _checkConnectivity() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    setState(() {
      _isOnline = connectivityResult != ConnectivityResult.none;
    });
  }

  void _listenToConnectivity() {
    Connectivity().onConnectivityChanged.listen((result) {
      setState(() {
        _isOnline = result != ConnectivityResult.none;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isOnline) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.wifi_off, color: Colors.white, size: 16),
          SizedBox(width: 4),
          Text(
            'Hors ligne',
            style: TextStyle(
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
