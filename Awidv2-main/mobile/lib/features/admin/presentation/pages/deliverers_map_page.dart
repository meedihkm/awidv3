import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../../../../core/services/api_service.dart';

class DeliverersMapPage extends StatefulWidget {
  @override
  _DeliverersMapPageState createState() => _DeliverersMapPageState();
}

class _DeliverersMapPageState extends State<DeliverersMapPage> {
  final ApiService _apiService = ApiService();
  final MapController _mapController = MapController();
  List<Map<String, dynamic>> _deliverers = [];
  bool _isLoading = true;
  Timer? _refreshTimer;

  // Centre par défaut (Algérie)
  final LatLng _defaultCenter = LatLng(36.7538, 3.0588);

  @override
  void initState() {
    super.initState();
    _loadLocations();
    // Rafraîchir toutes les 30 secondes
    _refreshTimer = Timer.periodic(Duration(seconds: 30), (_) => _loadLocations());
  }

  @override
  void dispose() {
    _refreshTimer?.cancel();
    super.dispose();
  }

  Future<void> _loadLocations() async {
    try {
      final response = await _apiService.getDeliverersLocations();
      if (response['success']) {
        setState(() {
          _deliverers = List<Map<String, dynamic>>.from(response['data']);
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() => _isLoading = false);
    }
  }

  String _getTimeAgo(String? dateStr) {
    if (dateStr == null) return '';
    final date = DateTime.tryParse(dateStr);
    if (date == null) return '';
    final diff = DateTime.now().difference(date);
    if (diff.inMinutes < 1) return 'à l\'instant';
    if (diff.inMinutes < 60) return 'il y a ${diff.inMinutes} min';
    if (diff.inHours < 24) return 'il y a ${diff.inHours}h';
    return 'il y a ${diff.inDays}j';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carte des livreurs'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _loadLocations,
          ),
        ],
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator(color: Colors.orange))
          : Stack(
              children: [
                FlutterMap(
                  mapController: _mapController,
                  options: MapOptions(
                    initialCenter: _deliverers.isNotEmpty
                        ? LatLng(
                            double.parse(_deliverers.first['latitude'].toString()),
                            double.parse(_deliverers.first['longitude'].toString()),
                          )
                        : _defaultCenter,
                    initialZoom: 13,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'com.example.app_livraison',
                    ),
                    MarkerLayer(
                      markers: _deliverers.map((d) {
                        final lat = double.parse(d['latitude'].toString());
                        final lng = double.parse(d['longitude'].toString());
                        return Marker(
                          point: LatLng(lat, lng),
                          width: 80,
                          height: 80,
                          child: GestureDetector(
                            onTap: () => _showDelivererInfo(d),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: Colors.orange,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    d['name'] ?? '',
                                    style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Icon(Icons.location_on, color: Colors.orange, size: 40),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                // Liste des livreurs en bas
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
                    ),
                    child: _deliverers.isEmpty
                        ? Center(child: Text('Aucun livreur en ligne', style: TextStyle(color: Colors.grey)))
                        : ListView.builder(
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.all(10),
                            itemCount: _deliverers.length,
                            itemBuilder: (context, index) {
                              final d = _deliverers[index];
                              return GestureDetector(
                                onTap: () {
                                  final lat = double.parse(d['latitude'].toString());
                                  final lng = double.parse(d['longitude'].toString());
                                  _mapController.move(LatLng(lat, lng), 15);
                                },
                                child: Container(
                                  width: 120,
                                  margin: EdgeInsets.only(right: 10),
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.orange.shade50,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(color: Colors.orange.shade200),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(Icons.delivery_dining, color: Colors.orange, size: 20),
                                          SizedBox(width: 4),
                                          Expanded(
                                            child: Text(
                                              d['name'] ?? '',
                                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Spacer(),
                                      Text(
                                        _getTimeAgo(d['location_updated_at']),
                                        style: TextStyle(color: Colors.grey, fontSize: 10),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                ),
              ],
            ),
    );
  }

  void _showDelivererInfo(Map<String, dynamic> deliverer) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) => Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.orange,
              child: Icon(Icons.delivery_dining, color: Colors.white, size: 30),
            ),
            SizedBox(height: 12),
            Text(deliverer['name'] ?? '', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            if (deliverer['phone'] != null) ...[
              SizedBox(height: 4),
              Text(deliverer['phone'], style: TextStyle(color: Colors.grey)),
            ],
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.access_time, size: 14, color: Colors.grey),
                SizedBox(width: 4),
                Text('Dernière position: ${_getTimeAgo(deliverer['location_updated_at'])}', style: TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
