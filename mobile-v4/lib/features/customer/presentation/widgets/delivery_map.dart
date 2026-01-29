import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../../domain/entities/customer_delivery.dart';

/// Widget Carte de Livraison
/// Affiche la carte avec la position du livreur et la destination
class DeliveryMapWidget extends StatefulWidget {
  final CustomerDelivery delivery;
  final Function(LatLng)? onMapTap;

  const DeliveryMapWidget({
    super.key,
    required this.delivery,
    this.onMapTap,
  });

  @override
  State<DeliveryMapWidget> createState() => _DeliveryMapWidgetState();
}

class _DeliveryMapWidgetState extends State<DeliveryMapWidget> {
  late MapController _mapController;

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
  }

  @override
  Widget build(BuildContext context) {
    // Vérifier si les coordonnées sont disponibles
    if (!widget.delivery.hasDeliveryLocation) {
      return Container(
        height: 300,
        color: Colors.grey.shade200,
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.location_off, size: 64, color: Colors.grey),
              SizedBox(height: 16),
              Text(
                'Position non disponible',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      );
    }

    final deliveryLocation = LatLng(
      widget.delivery.deliveryLatitude!,
      widget.delivery.deliveryLongitude!,
    );

    final currentLocation = widget.delivery.hasCurrentLocation
        ? LatLng(
            widget.delivery.currentLatitude!,
            widget.delivery.currentLongitude!,
          )
        : null;

    // Calculer le centre et le zoom pour afficher les deux points
    final center = currentLocation ?? deliveryLocation;
    final zoom = currentLocation != null ? 14.0 : 15.0;

    return SizedBox(
      height: 300,
      child: FlutterMap(
        mapController: _mapController,
        options: MapOptions(
          initialCenter: center,
          initialZoom: zoom,
          onTap: (tapPosition, point) {
            if (widget.onMapTap != null) {
              widget.onMapTap!(point);
            }
          },
        ),
        children: [
          // Tile Layer (OpenStreetMap)
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.awid.mobile',
          ),

          // Polyline entre livreur et destination
          if (currentLocation != null)
            PolylineLayer(
              polylines: [
                Polyline(
                  points: [currentLocation, deliveryLocation],
                  strokeWidth: 3,
                  color: Colors.blue,
                ),
              ],
            ),

          // Tracking Points (historique du trajet)
          if (widget.delivery.trackingPoints != null &&
              widget.delivery.trackingPoints!.isNotEmpty)
            PolylineLayer(
              polylines: [
                Polyline(
                  points: widget.delivery.trackingPoints!
                      .map((p) => LatLng(p.latitude, p.longitude))
                      .toList(),
                  strokeWidth: 2,
                  color: Colors.blue.withOpacity(0.5),
                ),
              ],
            ),

          // Markers Layer
          MarkerLayer(
            markers: [
              // Destination Marker
              Marker(
                point: deliveryLocation,
                width: 80,
                height: 80,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.location_on,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: const Text(
                        'Destination',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Current Location Marker (Deliverer)
              if (currentLocation != null)
                Marker(
                  point: currentLocation,
                  width: 80,
                  height: 80,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 6,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.local_shipping,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                        child: Text(
                          widget.delivery.delivererName,
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),

          // Attribution Layer
          const RichAttributionWidget(
            attributions: [
              TextSourceAttribution(
                'OpenStreetMap contributors',
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }
}
