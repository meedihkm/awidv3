import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

/// Widget carte interactive
/// TODO: Intégrer flutter_map ou google_maps_flutter
class MapWidget extends StatelessWidget {
  final Position? currentPosition;
  final double? destinationLat;
  final double? destinationLng;
  final VoidCallback? onCenterPosition;

  const MapWidget({
    super.key,
    this.currentPosition,
    this.destinationLat,
    this.destinationLng,
    this.onCenterPosition,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          // Placeholder carte
          Center(
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
                  'Carte Interactive',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
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
                if (currentPosition != null) ...[
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.my_location,
                              color: Colors.blue[700],
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Position actuelle',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[700],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Lat: ${currentPosition!.latitude.toStringAsFixed(6)}',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                        Text(
                          'Lng: ${currentPosition!.longitude.toStringAsFixed(6)}',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                if (destinationLat != null && destinationLng != null) ...[
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Colors.red[700],
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Destination',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[700],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Lat: ${destinationLat!.toStringAsFixed(6)}',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                        Text(
                          'Lng: ${destinationLng!.toStringAsFixed(6)}',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),

          // Bouton centrer position
          if (onCenterPosition != null)
            Positioned(
              right: 16,
              bottom: 16,
              child: FloatingActionButton.small(
                onPressed: onCenterPosition,
                tooltip: 'Centrer sur ma position',
                child: const Icon(Icons.my_location),
              ),
            ),
        ],
      ),
    );
  }
}
