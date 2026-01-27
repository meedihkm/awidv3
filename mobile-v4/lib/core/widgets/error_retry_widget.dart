import 'package:flutter/material.dart';

/// Widget d'erreur avec bouton retry
class ErrorRetryWidget extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;
  final IconData icon;
  final String? retryButtonText;

  const ErrorRetryWidget({
    super.key,
    required this.message,
    required this.onRetry,
    this.icon = Icons.error_outline,
    this.retryButtonText,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 64,
              color: Colors.red[300],
            ),
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh),
              label: Text(retryButtonText ?? 'Réessayer'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Widget d'erreur réseau
class NetworkErrorWidget extends StatelessWidget {
  final VoidCallback onRetry;

  const NetworkErrorWidget({
    super.key,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return ErrorRetryWidget(
      message: 'Erreur de connexion\nVérifiez votre connexion internet',
      icon: Icons.wifi_off,
      onRetry: onRetry,
    );
  }
}

/// Widget d'erreur serveur
class ServerErrorWidget extends StatelessWidget {
  final VoidCallback onRetry;
  final String? message;

  const ServerErrorWidget({
    super.key,
    required this.onRetry,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    return ErrorRetryWidget(
      message: message ?? 'Erreur serveur\nVeuillez réessayer plus tard',
      icon: Icons.cloud_off,
      onRetry: onRetry,
    );
  }
}

/// Widget d'erreur générique
class GenericErrorWidget extends StatelessWidget {
  final String? message;
  final VoidCallback? onRetry;

  const GenericErrorWidget({
    super.key,
    this.message,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    if (onRetry != null) {
      return ErrorRetryWidget(
        message: message ?? 'Une erreur est survenue',
        onRetry: onRetry!,
      );
    }

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: Colors.red[300],
            ),
            const SizedBox(height: 16),
            Text(
              message ?? 'Une erreur est survenue',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
