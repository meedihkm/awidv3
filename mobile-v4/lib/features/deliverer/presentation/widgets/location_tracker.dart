import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/location_provider.dart';

/// Widget indicateur de tracking GPS actif
class LocationTracker extends ConsumerWidget {
  const LocationTracker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locationState = ref.watch(locationProvider);

    return locationState.when(
      data: (position) {
        if (position == null) {
          return IconButton(
            icon: const Icon(Icons.location_off),
            onPressed: () {
              _showLocationDialog(context, ref, false);
            },
            tooltip: 'GPS désactivé',
          );
        }

        return IconButton(
          icon: Stack(
            children: [
              const Icon(Icons.location_on),
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          onPressed: () {
            _showLocationDialog(context, ref, true);
          },
          tooltip: 'GPS actif',
        );
      },
      loading: () => const IconButton(
        icon: SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(
            strokeWidth: 2,
          ),
        ),
        onPressed: null,
        tooltip: 'Activation GPS...',
      ),
      error: (error, stack) => IconButton(
        icon: const Icon(Icons.location_disabled),
        onPressed: () {
          _showLocationDialog(context, ref, false);
        },
        tooltip: 'Erreur GPS',
      ),
    );
  }

  void _showLocationDialog(
    BuildContext context,
    WidgetRef ref,
    bool isActive,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(
              isActive ? Icons.location_on : Icons.location_off,
              color: isActive ? Colors.green : Colors.grey,
            ),
            const SizedBox(width: 8),
            Text(isActive ? 'GPS Actif' : 'GPS Désactivé'),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isActive) ...[
              const Text(
                'Votre position est partagée en temps réel.',
              ),
              const SizedBox(height: 8),
              const Text(
                'Mise à jour:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text('• Toutes les 30 secondes'),
              const Text('• Tous les 10 mètres'),
            ] else ...[
              const Text(
                'Le partage de position est désactivé.',
              ),
              const SizedBox(height: 8),
              const Text(
                'Activez le GPS pour:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text('• Recevoir des livraisons'),
              const Text('• Naviguer vers les clients'),
              const Text('• Être visible par l\'admin'),
            ],
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Fermer'),
          ),
          if (!isActive)
            ElevatedButton(
              onPressed: () {
                ref.read(locationProvider.notifier).startTracking();
                Navigator.pop(context);
              },
              child: const Text('Activer'),
            ),
        ],
      ),
    );
  }
}
