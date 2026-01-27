import 'package:flutter/material.dart';

import '../config/theme_config.dart';

/// Error Widget
/// Widget d'erreur réutilisable
class ErrorDisplayWidget extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;
  final IconData icon;

  const ErrorDisplayWidget({super.key, required this.message, this.onRetry, this.icon = Icons.error_outline});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 64, color: ThemeConfig.errorColor),
            const SizedBox(height: 16),
            Text(
              message,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: ThemeConfig.textPrimaryColor),
              textAlign: TextAlign.center,
            ),
            if (onRetry != null) ...[
              const SizedBox(height: 24),
              ElevatedButton.icon(onPressed: onRetry, icon: const Icon(Icons.refresh), label: const Text('Réessayer')),
            ],
          ],
        ),
      ),
    );
  }
}
