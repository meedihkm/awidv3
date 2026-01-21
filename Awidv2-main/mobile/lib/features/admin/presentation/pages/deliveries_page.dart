// Deliveries Page - Admin
import 'package:flutter/material.dart';
import '../../../../core/services/api_service.dart';
import '../../../../core/models/delivery_model.dart';

class DeliveriesPage extends StatefulWidget {
  @override
  _DeliveriesPageState createState() => _DeliveriesPageState();
}

class _DeliveriesPageState extends State<DeliveriesPage> {
  final ApiService _apiService = ApiService();
  List<Delivery> _deliveries = [];
  bool _isLoading = true;
  
  // Filtres
  String _periodFilter = 'all';
  String _statusFilter = 'all';
  String? _selectedDeliverer;

  @override
  void initState() {
    super.initState();
    _loadDeliveries();
  }

  Future<void> _loadDeliveries() async {
    try {
      final response = await _apiService.getDeliveries();
      if (response['success']) {
        setState(() {
          _deliveries = (response['data'] as List).map((json) => Delivery.fromJson(json)).toList();
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() => _isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Erreur: ${e.toString()}')));
    }
  }

  List<Delivery> _getFilteredDeliveries() {
    var filtered = _deliveries;
    
    // Filtre par statut
    if (_statusFilter != 'all') {
      filtered = filtered.where((d) => d.status == _statusFilter).toList();
    }
    
    // Filtre par période
    if (_periodFilter != 'all') {
      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);
      filtered = filtered.where((d) {
        final DateTime date = d.createdAt ?? now;
        final day = DateTime(date.year, date.month, date.day);
        switch (_periodFilter) {
          case 'day': return day.isAtSameMomentAs(today);
          case 'week':
            final weekStart = today.subtract(Duration(days: today.weekday - 1));
            return day.isAfter(weekStart.subtract(Duration(days: 1)));
          case 'month': return date.year == now.year && date.month == now.month;
          default: return true;
        }
      }).toList();
    }
    
    // Filtre par livreur
    if (_selectedDeliverer != null) {
      filtered = filtered.where((d) => d.deliverer?.name == _selectedDeliverer).toList();
    }
    
    return filtered;
  }

  List<String> _getUniqueDeliverers() {
    return _deliveries.map((d) => d.deliverer?.name ?? '').where((n) => n.isNotEmpty).toSet().toList();
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'assigned': return Colors.blue;
      case 'in_progress': return Colors.orange;
      case 'delivered': return Colors.green;
      case 'failed': return Colors.red;
      case 'postponed': return Colors.purple;
      default: return Colors.grey;
    }
  }

  String _getStatusText(String status) {
    switch (status) {
      case 'assigned': return 'Assignée';
      case 'in_progress': return 'En cours';
      case 'delivered': return 'Livrée';
      case 'failed': return 'Échouée';
      case 'postponed': return 'Reportée';
      default: return status;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator(color: Colors.blue));
    }

    final filtered = _getFilteredDeliveries();

    return Column(
      children: [
        // Filtres
        Container(
          padding: EdgeInsets.all(10),
          color: Colors.grey[100],
          child: Column(
            children: [
              // Ligne 1: Période + Statut
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildPeriodChip('Tout', 'all'),
                    SizedBox(width: 6),
                    _buildPeriodChip('Jour', 'day'),
                    SizedBox(width: 6),
                    _buildPeriodChip('Semaine', 'week'),
                    SizedBox(width: 6),
                    _buildPeriodChip('Mois', 'month'),
                    SizedBox(width: 12),
                    Container(width: 1, height: 24, color: Colors.grey[400]),
                    SizedBox(width: 12),
                    _buildStatusChip('Toutes', 'all'),
                    SizedBox(width: 6),
                    _buildStatusChip('En cours', 'assigned'),
                    SizedBox(width: 6),
                    _buildStatusChip('Livrées', 'delivered'),
                    SizedBox(width: 6),
                    _buildStatusChip('Échouées', 'failed'),
                    SizedBox(width: 6),
                    _buildStatusChip('Reportées', 'postponed'),
                  ],
                ),
              ),
              // Ligne 2: Livreur
              if (_getUniqueDeliverers().isNotEmpty)
                Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          height: 40,
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String?>(
                              value: _selectedDeliverer,
                              isExpanded: true,
                              hint: Text('Tous les livreurs', style: TextStyle(fontSize: 13)),
                              style: TextStyle(fontSize: 13, color: Colors.black),
                              items: [
                                DropdownMenuItem(value: null, child: Text('Tous les livreurs')),
                                ..._getUniqueDeliverers().map((d) => DropdownMenuItem(value: d, child: Text(d))),
                              ],
                              onChanged: (v) => setState(() => _selectedDeliverer = v),
                            ),
                          ),
                        ),
                      ),
                      if (_selectedDeliverer != null || _periodFilter != 'all' || _statusFilter != 'all')
                        Padding(
                          padding: EdgeInsets.only(left: 8),
                          child: GestureDetector(
                            onTap: () => setState(() {
                              _periodFilter = 'all';
                              _statusFilter = 'all';
                              _selectedDeliverer = null;
                            }),
                            child: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(color: Colors.red.shade100, borderRadius: BorderRadius.circular(20)),
                              child: Icon(Icons.clear, size: 20, color: Colors.red),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
            ],
          ),
        ),

        // Stats rapides
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            children: [
              _buildMiniStat('Total', filtered.length.toString(), Colors.blue),
              SizedBox(width: 8),
              _buildMiniStat('Livrées', filtered.where((d) => d.status == 'delivered').length.toString(), Colors.green),
              SizedBox(width: 8),
              _buildMiniStat('Échouées', filtered.where((d) => d.status == 'failed').length.toString(), Colors.red),
              SizedBox(width: 8),
              _buildMiniStat('Reportées', filtered.where((d) => d.status == 'postponed').length.toString(), Colors.purple),
            ],
          ),
        ),

        // Liste
        Expanded(
          child: filtered.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.local_shipping_outlined, size: 64, color: Colors.grey[400]),
                      SizedBox(height: 16),
                      Text('Aucune livraison', style: TextStyle(color: Colors.grey[600])),
                    ],
                  ),
                )
              : RefreshIndicator(
                  onRefresh: _loadDeliveries,
                  child: ListView.builder(
                    padding: EdgeInsets.all(12),
                    itemCount: filtered.length,
                    itemBuilder: (context, index) => _buildDeliveryCard(filtered[index]),
                  ),
                ),
        ),
      ],
    );
  }

  Widget _buildPeriodChip(String label, String value) {
    final isSelected = _periodFilter == value;
    return GestureDetector(
      onTap: () => setState(() => _periodFilter = value),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.blue),
        ),
        child: Text(label, style: TextStyle(color: isSelected ? Colors.white : Colors.blue, fontSize: 12, fontWeight: FontWeight.w500)),
      ),
    );
  }

  Widget _buildStatusChip(String label, String value) {
    final isSelected = _statusFilter == value;
    return GestureDetector(
      onTap: () => setState(() => _statusFilter = value),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? Colors.purple : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.purple),
        ),
        child: Text(label, style: TextStyle(color: isSelected ? Colors.white : Colors.purple, fontSize: 12, fontWeight: FontWeight.w500)),
      ),
    );
  }

  Widget _buildMiniStat(String label, String value, Color color) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
        child: Column(
          children: [
            Text(value, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: color)),
            Text(label, style: TextStyle(fontSize: 11, color: color)),
          ],
        ),
      ),
    );
  }


  Widget _buildDeliveryCard(Delivery delivery) {
    final order = delivery.order;
    return Card(
      margin: EdgeInsets.only(bottom: 12),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          // Header
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: _getStatusColor(delivery.status).withOpacity(0.1),
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: _getStatusColor(delivery.status),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(Icons.local_shipping, color: Colors.white),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(order.cafeteria?.name ?? 'Client', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      Row(
                        children: [
                          Icon(Icons.person_outline, size: 14, color: Colors.grey),
                          SizedBox(width: 4),
                          Text(delivery.deliverer?.name ?? 'Non assigné', style: TextStyle(color: Colors.grey[600], fontSize: 13)),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: _getStatusColor(delivery.status),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(_getStatusText(delivery.status), style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
                ),
              ],
            ),
          ),
          
          // Détails
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                // Articles (max 3)
                ...order.items.take(3).map((item) => Padding(
                  padding: EdgeInsets.only(bottom: 4),
                  child: Row(
                    children: [
                      Text('${item.quantity}x', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
                      SizedBox(width: 8),
                      Expanded(child: Text(item.productName, overflow: TextOverflow.ellipsis)),
                      Text('${item.totalPrice.toStringAsFixed(0)} DA', style: TextStyle(color: Colors.grey[600])),
                    ],
                  ),
                )),
                if (order.items.length > 3)
                  Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: Text('+ ${order.items.length - 3} autres articles', style: TextStyle(color: Colors.grey, fontSize: 12)),
                  ),
                
                Divider(height: 20),
                
                // Totaux
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('${order.total.toStringAsFixed(0)} DA', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  ],
                ),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Collecté', style: TextStyle(color: Colors.green)),
                    Text('${delivery.amountCollected.toStringAsFixed(0)} DA', style: TextStyle(color: Colors.green, fontWeight: FontWeight.w500)),
                  ],
                ),
                
                // Commentaire
                if (delivery.comment != null && delivery.comment!.isNotEmpty) ...[
                  SizedBox(height: 12),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      children: [
                        Icon(Icons.comment, size: 16, color: Colors.grey),
                        SizedBox(width: 8),
                        Expanded(child: Text(delivery.comment!, style: TextStyle(color: Colors.grey[700], fontSize: 13))),
                      ],
                    ),
                  ),
                ],
                
                // Date livraison
                if (delivery.deliveredAt != null) ...[
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.check_circle, size: 16, color: Colors.green),
                      SizedBox(width: 4),
                      Text('Livré le ${_formatDate(delivery.deliveredAt)}', style: TextStyle(color: Colors.green, fontSize: 12)),
                    ],
                  ),
                ],
                
                // Raison d'échec
                if (delivery.isFailed && delivery.failureReason != null) ...[
                  SizedBox(height: 8),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(color: Colors.red.shade50, borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      children: [
                        Icon(Icons.error_outline, size: 16, color: Colors.red),
                        SizedBox(width: 6),
                        Expanded(child: Text(delivery.failureReasonText, style: TextStyle(color: Colors.red, fontSize: 12))),
                        if (delivery.attempts > 0)
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(10)),
                            child: Text('${delivery.attempts} tentative(s)', style: TextStyle(color: Colors.white, fontSize: 10)),
                          ),
                      ],
                    ),
                  ),
                ],
                
                // Date de report
                if (delivery.isPostponed && delivery.postponedTo != null) ...[
                  SizedBox(height: 8),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(color: Colors.purple.shade50, borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      children: [
                        Icon(Icons.schedule, size: 16, color: Colors.purple),
                        SizedBox(width: 6),
                        Text('Reportée au ${delivery.postponedTo!.day}/${delivery.postponedTo!.month}/${delivery.postponedTo!.year}', style: TextStyle(color: Colors.purple, fontSize: 12)),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime? date) {
    if (date == null) return '';
    return '${date.day}/${date.month}/${date.year} à ${date.hour}:${date.minute.toString().padLeft(2, '0')}';
  }
}
