import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/services/api_service.dart';

class RealtimeMapPage extends StatefulWidget {
  @override
  _RealtimeMapPageState createState() => _RealtimeMapPageState();
}

class _RealtimeMapPageState extends State<RealtimeMapPage> {
  final ApiService _apiService = ApiService();
  final MapController _mapController = MapController();
  
  List<Map<String, dynamic>> _deliveries = [];
  bool _isLoading = true;
  Timer? _refreshTimer;
  String _selectedFilter = 'all'; // 'all', 'assigned', 'in_progress'

  // Centre par défaut (Algérie - Tizi Ouzou)
  final LatLng _defaultCenter = LatLng(36.7167, 4.0500);

  @override
  void initState() {
    super.initState();
    _loadDeliveriesMap();
    // Rafraîchir toutes les 10 secondes pour temps réel
    _refreshTimer = Timer.periodic(Duration(seconds: 10), (_) => _loadDeliveriesMap());
  }

  @override
  void dispose() {
    _refreshTimer?.cancel();
    super.dispose();
  }

  Future<void> _loadDeliveriesMap() async {
    try {
      final response = await _apiService.getDeliveriesMap();
      if (response['success'] && mounted) {
        setState(() {
          _deliveries = List<Map<String, dynamic>>.from(response['data']);
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  List<Map<String, dynamic>> get _filteredDeliveries {
    if (_selectedFilter == 'all') return _deliveries;
    return _deliveries.where((d) => d['deliveryStatus'] == _selectedFilter).toList();
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

  Color _getStatusColor(String status) {
    switch (status) {
      case 'assigned': return Colors.blue;
      case 'in_progress': return Colors.orange;
      default: return Colors.grey;
    }
  }

  String _getStatusLabel(String status) {
    switch (status) {
      case 'assigned': return 'Assignée';
      case 'in_progress': return 'En cours';
      default: return status;
    }
  }

  void _callPhone(String phone) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phone);
    try {
      if (await canLaunchUrl(phoneUri)) {
        await launchUrl(phoneUri);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Impossible d\'appeler'))
      );
    }
  }

  void _navigateToLocation(double lat, double lng, String name) async {
    final Uri googleMapsUri = Uri.parse('https://www.google.com/maps/dir/?api=1&destination=$lat,$lng');
    try {
      await launchUrl(googleMapsUri, mode: LaunchMode.externalApplication);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Impossible d\'ouvrir la navigation'))
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carte Temps Réel'),
        backgroundColor: Color(0xFF2E7D32),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _loadDeliveriesMap,
          ),
        ],
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator(color: Color(0xFF2E7D32)))
          : Column(
              children: [
                // Filtres
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  color: Colors.white,
                  child: Row(
                    children: [
                      _FilterChip(
                        label: 'Toutes (${_deliveries.length})',
                        selected: _selectedFilter == 'all',
                        onTap: () => setState(() => _selectedFilter = 'all'),
                      ),
                      SizedBox(width: 8),
                      _FilterChip(
                        label: 'Assignées',
                        selected: _selectedFilter == 'assigned',
                        color: Colors.blue,
                        onTap: () => setState(() => _selectedFilter = 'assigned'),
                      ),
                      SizedBox(width: 8),
                      _FilterChip(
                        label: 'En cours',
                        selected: _selectedFilter == 'in_progress',
                        color: Colors.orange,
                        onTap: () => setState(() => _selectedFilter = 'in_progress'),
                      ),
                    ],
                  ),
                ),
                // Carte
                Expanded(
                  child: Stack(
                    children: [
                      FlutterMap(
                        mapController: _mapController,
                        options: MapOptions(
                          initialCenter: _filteredDeliveries.isNotEmpty &&
                                  _filteredDeliveries.first['client']['hasLocation']
                              ? LatLng(
                                  _filteredDeliveries.first['client']['latitude'],
                                  _filteredDeliveries.first['client']['longitude'],
                                )
                              : _defaultCenter,
                          initialZoom: 12,
                          minZoom: 5,
                          maxZoom: 18,
                        ),
                        children: [
                          TileLayer(
                            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                            userAgentPackageName: 'com.awid.delivery',
                          ),
                          // Markers des clients
                          MarkerLayer(
                            markers: _filteredDeliveries
                                .where((d) => d['client']['hasLocation'])
                                .map((delivery) {
                              final client = delivery['client'];
                              return Marker(
                                point: LatLng(client['latitude'], client['longitude']),
                                width: 100,
                                height: 100,
                                child: GestureDetector(
                                  onTap: () => _showDeliveryInfo(delivery),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                        decoration: BoxDecoration(
                                          color: _getStatusColor(delivery['deliveryStatus']),
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        child: Text(
                                          client['name'],
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                      ),
                                      Icon(
                                        Icons.location_on,
                                        color: _getStatusColor(delivery['deliveryStatus']),
                                        size: 40,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                          // Markers des livreurs
                          MarkerLayer(
                            markers: _filteredDeliveries
                                .where((d) => 
                                    d['deliverer'] != null && 
                                    d['deliverer']['hasLocation'])
                                .map((delivery) {
                              final deliverer = delivery['deliverer'];
                              return Marker(
                                point: LatLng(
                                  deliverer['latitude'],
                                  deliverer['longitude'],
                                ),
                                width: 80,
                                height: 80,
                                child: GestureDetector(
                                  onTap: () => _showDelivererInfo(deliverer),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          shape: BoxShape.circle,
                                          border: Border.all(color: Colors.white, width: 3),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black26,
                                              blurRadius: 4,
                                              offset: Offset(0, 2),
                                            ),
                                          ],
                                        ),
                                        child: Icon(
                                          Icons.delivery_dining,
                                          color: Colors.white,
                                          size: 24,
                                        ),
                                      ),
                                      SizedBox(height: 2),
                                      Container(
                                        padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: Text(
                                          deliverer['name'],
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 9,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                      // Légende
                      Positioned(
                        top: 16,
                        right: 16,
                        child: Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 8,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.location_on, color: Colors.blue, size: 20),
                                  SizedBox(width: 4),
                                  Text('Client', style: TextStyle(fontSize: 12)),
                                ],
                              ),
                              SizedBox(height: 4),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.delivery_dining, color: Colors.green, size: 20),
                                  SizedBox(width: 4),
                                  Text('Livreur', style: TextStyle(fontSize: 12)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Liste des livraisons en bas
                Container(
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        offset: Offset(0, -2),
                      ),
                    ],
                  ),
                  child: _filteredDeliveries.isEmpty
                      ? Center(
                          child: Text(
                            'Aucune livraison en cours',
                            style: TextStyle(color: Colors.grey),
                          ),
                        )
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.all(12),
                          itemCount: _filteredDeliveries.length,
                          itemBuilder: (context, index) {
                            final delivery = _filteredDeliveries[index];
                            final client = delivery['client'];
                            final deliverer = delivery['deliverer'];
                            final order = delivery['order'];
                            
                            return GestureDetector(
                              onTap: () {
                                if (client['hasLocation']) {
                                  _mapController.move(
                                    LatLng(client['latitude'], client['longitude']),
                                    15,
                                  );
                                }
                              },
                              child: Container(
                                width: 200,
                                margin: EdgeInsets.only(right: 12),
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      _getStatusColor(delivery['deliveryStatus']),
                                      _getStatusColor(delivery['deliveryStatus']).withOpacity(0.7),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 4,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                          decoration: BoxDecoration(
                                            color: Colors.white.withOpacity(0.3),
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          child: Text(
                                            _getStatusLabel(delivery['deliveryStatus']),
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Spacer(),
                                        Text(
                                          '${order['total'].toStringAsFixed(0)} DA',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      client['name'],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    if (deliverer != null) ...[
                                      SizedBox(height: 4),
                                      Row(
                                        children: [
                                          Icon(Icons.delivery_dining, color: Colors.white70, size: 14),
                                          SizedBox(width: 4),
                                          Expanded(
                                            child: Text(
                                              deliverer['name'],
                                              style: TextStyle(
                                                color: Colors.white70,
                                                fontSize: 12,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                    Spacer(),
                                    Row(
                                      children: [
                                        if (!client['hasLocation'])
                                          Icon(Icons.location_off, color: Colors.white70, size: 14),
                                        if (client['hasLocation'])
                                          Icon(Icons.location_on, color: Colors.white, size: 14),
                                        SizedBox(width: 4),
                                        Expanded(
                                          child: Text(
                                            client['hasLocation'] ? 'GPS OK' : 'Pas de GPS',
                                            style: TextStyle(
                                              color: Colors.white70,
                                              fontSize: 11,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
    );
  }

  void _showDeliveryInfo(Map<String, dynamic> delivery) {
    final client = delivery['client'];
    final deliverer = delivery['deliverer'];
    final order = delivery['order'];
    
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: _getStatusColor(delivery['deliveryStatus']).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.local_shipping,
                    color: _getStatusColor(delivery['deliveryStatus']),
                    size: 28,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        client['name'],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        _getStatusLabel(delivery['deliveryStatus']),
                        style: TextStyle(
                          color: _getStatusColor(delivery['deliveryStatus']),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  '${order['total'].toStringAsFixed(0)} DA',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2E7D32),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            if (client['address'] != null) ...[
              Row(
                children: [
                  Icon(Icons.location_on, size: 18, color: Colors.grey[600]),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      client['address'],
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
            ],
            if (deliverer != null) ...[
              Row(
                children: [
                  Icon(Icons.delivery_dining, size: 18, color: Colors.grey[600]),
                  SizedBox(width: 8),
                  Text(
                    'Livreur: ${deliverer['name']}',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              if (deliverer['locationUpdatedAt'] != null) ...[
                SizedBox(height: 4),
                Text(
                  'Position: ${_getTimeAgo(deliverer['locationUpdatedAt'])}',
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                ),
              ],
              SizedBox(height: 16),
            ],
            Row(
              children: [
                if (client['phone'] != null)
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () => _callPhone(client['phone']),
                      icon: Icon(Icons.phone),
                      label: Text('Appeler'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),
                if (client['phone'] != null && client['hasLocation']) SizedBox(width: 12),
                if (client['hasLocation'])
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                        _navigateToLocation(
                          client['latitude'],
                          client['longitude'],
                          client['name'],
                        );
                      },
                      icon: Icon(Icons.navigation),
                      label: Text('Naviguer'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF2E7D32),
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showDelivererInfo(Map<String, dynamic> deliverer) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.green,
              child: Icon(Icons.delivery_dining, color: Colors.white, size: 30),
            ),
            SizedBox(height: 12),
            Text(
              deliverer['name'],
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.access_time, size: 14, color: Colors.grey),
                SizedBox(width: 4),
                Text(
                  'Position: ${_getTimeAgo(deliverer['locationUpdatedAt'])}',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool selected;
  final Color? color;
  final VoidCallback onTap;

  const _FilterChip({
    required this.label,
    required this.selected,
    this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final chipColor = color ?? Color(0xFF2E7D32);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? chipColor : Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? Colors.white : Colors.grey[700],
            fontWeight: selected ? FontWeight.bold : FontWeight.normal,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}
