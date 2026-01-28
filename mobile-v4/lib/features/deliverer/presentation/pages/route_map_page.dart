import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/location_provider.dart';

/// Page carte navigation GPS
/// TODO: Intégrer flutter_map ou google_maps_flutter
class RouteMapPage extends ConsumerWidget {
  const RouteMapPage({
    required this.deliveryId,
    super.key,
  });
  final String deliveryId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locationState = ref.watch(locationProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation'),
        actions: [
          IconButton(
            icon: const Icon(Icons.my_location),
            onPressed: () {
              // TODO: Centrer sur position actuelle
            },
            tooltip: 'Ma position',
          ),
        ],
      ),
      body: Stack(
        children: [
          // Placeholder pour la carte
          Container(
            color: Colors.grey[200],
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.map,
                    size: 64,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Carte de navigation',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'TODO: Intégrer flutter_map',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[500],
                    ),
                  ),
                  const SizedBox(height: 24),
                  locationState.when(
                    data: (position) {
                      if (position == null) {
                        return const Text('GPS désactivé');
                      }
                      return Column(
                        children: [
                          Text(
                            'Position actuelle:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[700],
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Lat: ${position.latitude.toStringAsFixed(6)}',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                          Text(
                            'Lng: ${position.longitude.toStringAsFixed(6)}',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ],
                      );
                    },
                    loading: () => const CircularProgressIndicator(),
                    error: (error, _) => Text(
                      'Erreur GPS: $error',
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Bottom sheet avec infos itinéraire
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: _RouteInfoSheet(deliveryId: deliveryId),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // TODO: Démarrer navigation externe (Google Maps, Waze)
          _showNavigationOptions(context);
        },
        icon: const Icon(Icons.navigation),
        label: const Text('Naviguer'),
      ),
    );
  }

  void _showNavigationOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.map),
              title: const Text('Google Maps'),
              onTap: () {
                // TODO: Ouvrir Google Maps
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.navigation),
              title: const Text('Waze'),
              onTap: () {
                // TODO: Ouvrir Waze
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.cancel),
              title: const Text('Annuler'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}

/// Widget bottom sheet avec infos itinéraire
class _RouteInfoSheet extends StatelessWidget {
  const _RouteInfoSheet({required this.deliveryId});
  final String deliveryId;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(16),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 16),

            // Infos itinéraire
            Row(
              children: [
                Expanded(
                  child: _InfoCard(
                    icon: Icons.straighten,
                    label: 'Distance',
                    value: '2.5 km',
                    color: theme.colorScheme.primary,
                  ),
                ),
                const SizedBox(width: 8),
                const Expanded(
                  child: _InfoCard(
                    icon: Icons.schedule,
                    label: 'Durée',
                    value: '8 min',
                    color: Colors.orange,
                  ),
                ),
                const SizedBox(width: 8),
                const Expanded(
                  child: _InfoCard(
                    icon: Icons.access_time,
                    label: 'Arrivée',
                    value: '14:30',
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Adresse destination
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: theme.colorScheme.primary,
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Destination',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '123 Rue Example, Alger',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Widget card info itinéraire
class _InfoCard extends StatelessWidget {
  const _InfoCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
