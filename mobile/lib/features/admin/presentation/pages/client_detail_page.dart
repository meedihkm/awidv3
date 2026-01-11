import 'package:flutter/material.dart';
import '../../../../core/services/api_service.dart';
import '../../../../core/services/settings_service.dart';

class ClientDetailPage extends StatefulWidget {
  final Map<String, dynamic> client;
  const ClientDetailPage({required this.client});

  @override
  _ClientDetailPageState createState() => _ClientDetailPageState();
}

class _ClientDetailPageState extends State<ClientDetailPage> {
  final ApiService _apiService = ApiService();
  final SettingsService _settings = SettingsService();
  List<dynamic> _orders = [];
  bool _isLoading = true;
  final _notesController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _notesController.text = widget.client['notes'] ?? '';
    _loadData();
  }

  Future<void> _loadData() async {
    await _settings.loadSettings();
    await _loadClientOrders();
  }

  Future<void> _loadClientOrders() async {
    try {
      final response = await _apiService.getOrders();
      if (response['success']) {
        final allOrders = response['data'] as List;
        setState(() {
          _orders = allOrders.where((o) => o['cafeteriaId'] == widget.client['id']).toList();
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() => _isLoading = false);
    }
  }

  double get _totalDebt {
    double debt = 0;
    for (var o in _orders) {
      final total = _parseDouble(o['total']);
      final paid = _parseDouble(o['amountPaid']);
      debt += (total - paid);
    }
    return debt;
  }

  double get _totalOrders {
    return _orders.fold(0.0, (sum, o) => sum + _parseDouble(o['total']));
  }

  double _parseDouble(dynamic v) {
    if (v == null) return 0;
    if (v is double) return v;
    if (v is int) return v.toDouble();
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final client = widget.client;
    final isBlocked = client['active'] == false;

    return Scaffold(
      appBar: AppBar(
        title: Text('Fiche client'),
        backgroundColor: Colors.blue.shade600,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(isBlocked ? Icons.lock : Icons.lock_open),
            tooltip: isBlocked ? 'Débloquer' : 'Bloquer',
            onPressed: () => _toggleBlock(client),
          ),
        ],
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header client
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: isBlocked ? [Colors.red.shade400, Colors.red.shade600] : [Colors.blue.shade400, Colors.blue.shade600],
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white.withOpacity(0.2),
                          child: Text(
                            (client['name'] ?? 'C')[0].toUpperCase(),
                            style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      client['name'] ?? 'Client',
                                      style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  if (isBlocked)
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                                      child: Text('BLOQUÉ', style: TextStyle(color: Colors.red, fontSize: 10, fontWeight: FontWeight.bold)),
                                    ),
                                ],
                              ),
                              if (client['email'] != null)
                                Text(client['email'], style: TextStyle(color: Colors.white70)),
                              if (client['phone'] != null)
                                Text(client['phone'], style: TextStyle(color: Colors.white70)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),

                  // Stats
                  Row(
                    children: [
                      _buildStatCard('Commandes', '${_orders.length}', Icons.shopping_bag, Colors.blue),
                      SizedBox(width: 12),
                      _buildStatCard('Total', '${_totalOrders.toStringAsFixed(0)} DA', Icons.trending_up, Colors.green),
                      SizedBox(width: 12),
                      _buildStatCard('Dette', '${_totalDebt.toStringAsFixed(0)} DA', Icons.warning, _totalDebt > 0 ? Colors.red : Colors.grey),
                    ],
                  ),
                  SizedBox(height: 20),

                  // Alerte dette
                  if (_totalDebt > _settings.debtAlertThreshold) ...[
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.red.shade50,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.red.shade200),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.warning, color: Colors.red),
                          SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Alerte dette élevée', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
                                Text('Ce client a une dette de ${_totalDebt.toStringAsFixed(0)} DA', style: TextStyle(color: Colors.red.shade700, fontSize: 13)),
                              ],
                            ),
                          ),
                          if (!isBlocked)
                            TextButton(
                              onPressed: () => _toggleBlock(client),
                              child: Text('Bloquer', style: TextStyle(color: Colors.red)),
                            ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                  ],

                  // Notes
                  Text('Notes', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  SizedBox(height: 8),
                  TextField(
                    controller: _notesController,
                    maxLines: 3,
                    decoration: InputDecoration(
                      hintText: 'Ajouter des notes sur ce client...',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Historique commandes
                  Text('Historique commandes', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  SizedBox(height: 12),
                  if (_orders.isEmpty)
                    Center(child: Text('Aucune commande', style: TextStyle(color: Colors.grey)))
                  else
                    ..._orders.take(10).map((order) => _buildOrderCard(order)),
                ],
              ),
            ),
    );
  }

  Widget _buildStatCard(String label, String value, IconData icon, Color color) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 24),
            SizedBox(height: 6),
            Text(value, style: TextStyle(fontWeight: FontWeight.bold, color: color)),
            Text(label, style: TextStyle(fontSize: 11, color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderCard(Map<String, dynamic> order) {
    final date = DateTime.tryParse(order['createdAt'] ?? '');
    final total = _parseDouble(order['total']);
    final paid = _parseDouble(order['amountPaid']);
    final remaining = total - paid;

    return Card(
      margin: EdgeInsets.only(bottom: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _getStatusColor(order['status']).withOpacity(0.2),
          child: Icon(_getStatusIcon(order['status']), color: _getStatusColor(order['status']), size: 20),
        ),
        title: Text('${total.toStringAsFixed(0)} DA'),
        subtitle: Text(date != null ? '${date.day}/${date.month}/${date.year}' : ''),
        trailing: remaining > 0
            ? Text('-${remaining.toStringAsFixed(0)} DA', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold))
            : Icon(Icons.check_circle, color: Colors.green, size: 20),
      ),
    );
  }

  Color _getStatusColor(String? status) {
    switch (status) {
      case 'pending': return Colors.orange;
      case 'delivered': return Colors.green;
      default: return Colors.blue;
    }
  }

  IconData _getStatusIcon(String? status) {
    switch (status) {
      case 'pending': return Icons.hourglass_empty;
      case 'delivered': return Icons.check;
      default: return Icons.shopping_bag;
    }
  }

  Future<void> _toggleBlock(Map<String, dynamic> client) async {
    final isBlocked = client['active'] == false;
    final action = isBlocked ? 'débloquer' : 'bloquer';
    
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('${isBlocked ? 'Débloquer' : 'Bloquer'} ce client?'),
        content: Text(isBlocked 
          ? 'Ce client pourra à nouveau passer des commandes.'
          : 'Ce client ne pourra plus passer de commandes.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: Text('Annuler')),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(backgroundColor: isBlocked ? Colors.green : Colors.red),
            child: Text(action.toUpperCase(), style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );

    if (confirm == true) {
      try {
        await _apiService.toggleUser(client['id']);
        Navigator.pop(context, true); // Retourner avec refresh
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Client ${isBlocked ? 'débloqué' : 'bloqué'}'), backgroundColor: isBlocked ? Colors.green : Colors.orange),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Erreur: $e')));
      }
    }
  }
}
