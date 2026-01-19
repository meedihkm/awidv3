import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/services/api_service.dart';
import '../../../../core/services/payment_service.dart';
import '../../../../core/services/cache_service.dart';
import '../../../../core/services/settings_service.dart';
import '../widgets/record_payment_dialog.dart';

class ClientDetailPage extends StatefulWidget {
  final Map<String, dynamic> client;
  const ClientDetailPage({required this.client});

  @override
  _ClientDetailPageState createState() => _ClientDetailPageState();
}

class _ClientDetailPageState extends State<ClientDetailPage> with SingleTickerProviderStateMixin {
  final ApiService _apiService = ApiService();
  final PaymentService _paymentService = PaymentService();
  final CacheService _cacheService = CacheService();
  final SettingsService _settings = SettingsService();
  late TabController _tabController;
  
  List<dynamic> _orders = [];
  List<dynamic> _deliveries = [];
  List<dynamic> _paymentHistory = [];
  Map<String, dynamic>? _debtDetails;
  bool _isLoading = true;
  bool _isLoadingPayments = false;
  final _notesController = TextEditingController();
  final _addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this); // 3 tabs maintenant
    _notesController.text = widget.client['notes'] ?? '';
    _addressController.text = widget.client['address'] ?? '';
    _loadData();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _notesController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  Future<void> _loadData() async {
    await _settings.loadSettings();
    
    // Essayer le cache d'abord
    final cachedHistory = await _cacheService.getCachedClientHistory(widget.client['id']);
    if (cachedHistory != null) {
      setState(() {
        _orders = cachedHistory.where((o) => o['type'] == 'order').toList();
        _deliveries = cachedHistory.where((o) => o['type'] == 'delivery').toList();
      });
    }
    
    await _loadClientData();
  }

  Future<void> _loadClientData() async {
    try {
      final results = await Future.wait([
        _apiService.getOrders(),
        _apiService.getDeliveries(),
        _paymentService.getClientDebtDetails(widget.client['id']),
      ]);
      
      final allOrders = results[0]['data'] as List? ?? [];
      final allDeliveries = results[1]['data'] as List? ?? [];
      final debtData = results[2]['data'];
      
      final clientOrders = allOrders.where((o) => o['cafeteriaId'] == widget.client['id']).toList();
      final clientDeliveries = allDeliveries.where((d) {
        final orderId = d['orderId'];
        return clientOrders.any((o) => o['id'] == orderId);
      }).toList();
      
      // Mettre en cache
      final history = [
        ...clientOrders.map((o) => {...o, 'type': 'order'}),
        ...clientDeliveries.map((d) => {...d, 'type': 'delivery'}),
      ];
      await _cacheService.cacheClientHistory(widget.client['id'], history);
      
      setState(() {
        _orders = clientOrders;
        _deliveries = clientDeliveries;
        _debtDetails = debtData;
        _paymentHistory = debtData['payment_history'] ?? [];
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
    }
  }

  double get _totalDebt {
    if (_debtDetails != null) {
      return (_debtDetails!['total_debt'] ?? 0).toDouble();
    }
    // Fallback: calculer depuis les commandes
    double debt = 0;
    for (var o in _orders) {
      final total = _parseDouble(o['total']);
      final paid = _parseDouble(o['amountPaid']);
      debt += (total - paid);
    }
    return debt < 0 ? 0 : debt;
  }

  double get _totalOrders => _orders.fold(0.0, (sum, o) => sum + _parseDouble(o['total']));
  
  int get _deliveredCount => _deliveries.where((d) => d['status'] == 'delivered').length;
  int get _failedCount => _deliveries.where((d) => d['status'] == 'failed').length;

  double _parseDouble(dynamic v) {
    if (v == null) return 0;
    if (v is double) return v;
    if (v is int) return v.toDouble();
    if (v is String) return double.tryParse(v) ?? 0;
    return 0;
  }

  Future<void> _callClient() async {
    final phone = widget.client['phone'];
    if (phone != null && phone.isNotEmpty) {
      final uri = Uri.parse('tel:$phone');
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      }
    }
  }

  Future<void> _openMaps() async {
    final lat = widget.client['address_lat'];
    final lng = widget.client['address_lng'];
    if (lat != null && lng != null) {
      final uri = Uri.parse('https://www.openstreetmap.org/?mlat=$lat&mlon=$lng&zoom=17');
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    }
  }

  Future<void> _updateAddress() async {
    final newAddress = _addressController.text.trim();
    if (newAddress.isEmpty) return;
    
    try {
      await _apiService.updateUserAddress(widget.client['id'], newAddress);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Adresse mise à jour'), backgroundColor: Colors.green),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur: $e'), backgroundColor: Colors.red),
      );
    }
  }

  Future<void> _openRecordPaymentDialog() async {
    if (_debtDetails == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Chargement des données...'), backgroundColor: Colors.orange),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (context) => RecordPaymentDialog(
        client: _debtDetails!['client'],
        totalDebt: _totalDebt,
        unpaidOrders: _debtDetails!['unpaid_orders'],
        onSuccess: () {
          _loadClientData();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Paiement enregistré avec succès'),
              backgroundColor: Colors.green,
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final client = widget.client;
    final isBlocked = client['active'] == false;
    final hasLocation = client['address_lat'] != null && client['address_lng'] != null;

    return Scaffold(
      appBar: AppBar(
        title: Text('Fiche client'),
        backgroundColor: Color(0xFF2E7D32),
        foregroundColor: Colors.white,
        actions: [
          if (client['phone'] != null)
            IconButton(icon: Icon(Icons.phone), onPressed: _callClient, tooltip: 'Appeler'),
          IconButton(
            icon: Icon(isBlocked ? Icons.lock : Icons.lock_open),
            tooltip: isBlocked ? 'Débloquer' : 'Bloquer',
            onPressed: () => _toggleBlock(client),
          ),
        ],
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator(color: Color(0xFF2E7D32)))
          : RefreshIndicator(
              onRefresh: _loadClientData,
              color: Color(0xFF2E7D32),
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    // Header client
                    _buildHeader(client, isBlocked),
                    
                    // Infos détaillées
                    _buildInfoSection(client, hasLocation),
                    
                    // Stats
                    _buildStatsSection(),
                    
                    // Alerte dette
                    if (_totalDebt > _settings.debtAlertThreshold)
                      _buildDebtAlert(isBlocked),
                    
                    // Tabs historique
                    _buildHistoryTabs(),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _buildHeader(Map<String, dynamic> client, bool isBlocked) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isBlocked 
            ? [Colors.red.shade400, Colors.red.shade600] 
            : [Color(0xFF2E7D32), Color(0xFF1B5E20)],
        ),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.white.withOpacity(0.2),
            child: Text(
              (client['name'] ?? 'C')[0].toUpperCase(),
              style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                client['name'] ?? 'Client',
                style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
              ),
              if (isBlocked) ...[
                SizedBox(width: 8),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                  child: Text('BLOQUÉ', style: TextStyle(color: Colors.red, fontSize: 10, fontWeight: FontWeight.bold)),
                ),
              ],
            ],
          ),
          if (client['email'] != null)
            Padding(
              padding: EdgeInsets.only(top: 4),
              child: Text(client['email'], style: TextStyle(color: Colors.white70, fontSize: 14)),
            ),
        ],
      ),
    );
  }

  Widget _buildInfoSection(Map<String, dynamic> client, bool hasLocation) {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Informations', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          SizedBox(height: 16),
          
          // Téléphone
          _buildInfoRow(Icons.phone, 'Téléphone', client['phone'] ?? 'Non renseigné', 
            onTap: client['phone'] != null ? _callClient : null),
          Divider(height: 24),
          
          // Email
          _buildInfoRow(Icons.email, 'Email', client['email'] ?? 'Non renseigné'),
          Divider(height: 24),
          
          // Adresse
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.location_on, color: Color(0xFF2E7D32), size: 20),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Adresse', style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                    SizedBox(height: 4),
                    TextField(
                      controller: _addressController,
                      decoration: InputDecoration(
                        hintText: 'Entrer l\'adresse...',
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.save, size: 20),
                          onPressed: _updateAddress,
                        ),
                      ),
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
          
          // Bouton carte si coordonnées disponibles
          if (hasLocation) ...[
            SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: _openMaps,
                icon: Icon(Icons.map),
                label: Text('Voir sur la carte'),
                style: OutlinedButton.styleFrom(foregroundColor: Color(0xFF2E7D32)),
              ),
            ),
          ],
          
          Divider(height: 24),
          
          // Date d'inscription
          _buildInfoRow(Icons.calendar_today, 'Client depuis', 
            _formatDate(client['createdAt'] ?? client['created_at'])),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value, {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, color: Color(0xFF2E7D32), size: 20),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                Text(value, style: TextStyle(fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          if (onTap != null) Icon(Icons.chevron_right, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildStatsSection() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              _buildStatCard('Commandes', '${_orders.length}', Icons.shopping_bag, Colors.blue),
              SizedBox(width: 8),
              _buildStatCard('Total CA', '${_totalOrders.toStringAsFixed(0)} DA', Icons.trending_up, Color(0xFF2E7D32)),
              SizedBox(width: 8),
              _buildStatCard('Dette', '${_totalDebt.toStringAsFixed(0)} DA', Icons.warning, 
                _totalDebt > 0 ? Colors.red : Colors.grey),
            ],
          ),
        ),
        if (_totalDebt > 0) ...[
          SizedBox(height: 12),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _openRecordPaymentDialog,
                icon: Icon(Icons.payment, color: Colors.white),
                label: Text('Enregistrer un paiement', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF2E7D32),
                  padding: EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
          ),
        ],
      ],
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
            Text(value, style: TextStyle(fontWeight: FontWeight.bold, color: color, fontSize: 13)),
            Text(label, style: TextStyle(fontSize: 10, color: Colors.grey[600])),
          ],
        ),
      ),
    );
  }

  Widget _buildDebtAlert(bool isBlocked) {
    return Container(
      margin: EdgeInsets.all(16),
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
                Text('Dette de ${_totalDebt.toStringAsFixed(0)} DA', style: TextStyle(color: Colors.red.shade700, fontSize: 13)),
              ],
            ),
          ),
          if (!isBlocked)
            TextButton(
              onPressed: () => _toggleBlock(widget.client),
              child: Text('Bloquer', style: TextStyle(color: Colors.red)),
            ),
        ],
      ),
    );
  }

  Widget _buildHistoryTabs() {
    return Container(
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
      ),
      child: Column(
        children: [
          TabBar(
            controller: _tabController,
            labelColor: Color(0xFF2E7D32),
            unselectedLabelColor: Colors.grey,
            indicatorColor: Color(0xFF2E7D32),
            tabs: [
              Tab(text: 'Commandes (${_orders.length})'),
              Tab(text: 'Livraisons (${_deliveries.length})'),
              Tab(text: 'Paiements (${_paymentHistory.length})'),
            ],
          ),
          SizedBox(
            height: 400,
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildOrdersList(),
                _buildDeliveriesList(),
                _buildPaymentsList(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrdersList() {
    if (_orders.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shopping_bag_outlined, size: 48, color: Colors.grey[400]),
            SizedBox(height: 8),
            Text('Aucune commande', style: TextStyle(color: Colors.grey[600])),
          ],
        ),
      );
    }

    // Trier par date décroissante
    final sortedOrders = List.from(_orders)
      ..sort((a, b) => (b['createdAt'] ?? '').compareTo(a['createdAt'] ?? ''));

    return ListView.builder(
      padding: EdgeInsets.all(8),
      itemCount: sortedOrders.length,
      itemBuilder: (context, index) {
        final order = sortedOrders[index];
        return _buildOrderCard(order, index + 1);
      },
    );
  }

  Widget _buildOrderCard(Map<String, dynamic> order, int index) {
    final date = DateTime.tryParse(order['createdAt'] ?? '');
    final total = _parseDouble(order['total']);
    final paid = _parseDouble(order['amountPaid']);
    final remaining = total - paid;
    final status = order['status'] ?? 'pending';
    final orderNumber = order['orderNumber'] ?? order['order_number'];

    return Card(
      margin: EdgeInsets.only(bottom: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ExpansionTile(
        leading: CircleAvatar(
          backgroundColor: _getStatusColor(status).withOpacity(0.2),
          child: Text(
            orderNumber != null ? '#$orderNumber' : '#$index',
            style: TextStyle(color: _getStatusColor(status), fontWeight: FontWeight.bold, fontSize: 12),
          ),
        ),
        title: Row(
          children: [
            Text('${total.toStringAsFixed(0)} DA', style: TextStyle(fontWeight: FontWeight.bold)),
            Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: _getStatusColor(status),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(_getStatusLabel(status), 
                style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w500)),
            ),
          ],
        ),
        subtitle: Row(
          children: [
            Icon(Icons.calendar_today, size: 12, color: Colors.grey),
            SizedBox(width: 4),
            Text(date != null ? '${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute.toString().padLeft(2, '0')}' : '', 
              style: TextStyle(fontSize: 12)),
            if (remaining > 0) ...[
              Spacer(),
              Text('Reste: ${remaining.toStringAsFixed(0)} DA', 
                style: TextStyle(color: Colors.red, fontSize: 12, fontWeight: FontWeight.w500)),
            ],
          ],
        ),
        children: [
          // Détails des produits
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Produits', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                SizedBox(height: 8),
                ...(order['items'] as List? ?? []).map((item) => Padding(
                  padding: EdgeInsets.only(bottom: 4),
                  child: Row(
                    children: [
                      Text('${item['quantity']}x ', style: TextStyle(fontWeight: FontWeight.w500)),
                      Expanded(child: Text(item['productName'] ?? 'Produit')),
                      Text('${_parseDouble(item['unitPrice']).toStringAsFixed(0)} DA', 
                        style: TextStyle(color: Colors.grey[600])),
                    ],
                  ),
                )),
                Divider(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('${total.toStringAsFixed(0)} DA', style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                if (paid > 0) ...[
                  SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Payé', style: TextStyle(color: Colors.green)),
                      Text('${paid.toStringAsFixed(0)} DA', style: TextStyle(color: Colors.green)),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDeliveriesList() {
    if (_deliveries.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.delivery_dining, size: 48, color: Colors.grey[400]),
            SizedBox(height: 8),
            Text('Aucune livraison', style: TextStyle(color: Colors.grey[600])),
          ],
        ),
      );
    }

    // Trier par date décroissante
    final sortedDeliveries = List.from(_deliveries)
      ..sort((a, b) => (b['createdAt'] ?? '').compareTo(a['createdAt'] ?? ''));

    return ListView.builder(
      padding: EdgeInsets.all(8),
      itemCount: sortedDeliveries.length,
      itemBuilder: (context, index) {
        final delivery = sortedDeliveries[index];
        return _buildDeliveryCard(delivery);
      },
    );
  }

  Widget _buildDeliveryCard(Map<String, dynamic> delivery) {
    final status = delivery['status'] ?? 'assigned';
    final delivererName = delivery['deliverer']?['name'] ?? 'Livreur';
    final collected = _parseDouble(delivery['amountCollected']);
    final comment = delivery['comment'];
    final failureReason = delivery['failureReason'];
    final deliveredAt = delivery['deliveredAt'] != null 
      ? DateTime.tryParse(delivery['deliveredAt']) 
      : null;
    final attempts = delivery['attempts'] ?? 0;

    return Card(
      margin: EdgeInsets.only(bottom: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 18,
                  backgroundColor: _getDeliveryStatusColor(status).withOpacity(0.2),
                  child: Icon(_getDeliveryStatusIcon(status), 
                    color: _getDeliveryStatusColor(status), size: 18),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(_getDeliveryStatusLabel(status), 
                        style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('Par $delivererName', style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                    ],
                  ),
                ),
                if (collected > 0)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text('${collected.toStringAsFixed(0)} DA', 
                      style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 12)),
                  ),
              ],
            ),
            if (deliveredAt != null) ...[
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.check_circle, size: 14, color: Colors.green),
                  SizedBox(width: 4),
                  Text('Livrée le ${deliveredAt.day}/${deliveredAt.month}/${deliveredAt.year} à ${deliveredAt.hour}:${deliveredAt.minute.toString().padLeft(2, '0')}',
                    style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                ],
              ),
            ],
            if (attempts > 1) ...[
              SizedBox(height: 4),
              Row(
                children: [
                  Icon(Icons.refresh, size: 14, color: Colors.orange),
                  SizedBox(width: 4),
                  Text('$attempts tentatives', style: TextStyle(fontSize: 12, color: Colors.orange)),
                ],
              ),
            ],
            if (failureReason != null && failureReason.isNotEmpty) ...[
              SizedBox(height: 8),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(Icons.error_outline, size: 16, color: Colors.red),
                    SizedBox(width: 8),
                    Expanded(child: Text(failureReason, style: TextStyle(fontSize: 12, color: Colors.red))),
                  ],
                ),
              ),
            ],
            if (comment != null && comment.isNotEmpty) ...[
              SizedBox(height: 8),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.comment, size: 16, color: Colors.grey),
                    SizedBox(width: 8),
                    Expanded(child: Text(comment, style: TextStyle(fontSize: 12, color: Colors.grey[700]))),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(String? status) {
    switch (status) {
      case 'pending': return Colors.orange;
      case 'locked': case 'validated': return Colors.blue;
      case 'in_delivery': return Colors.purple;
      case 'delivered': return Colors.green;
      case 'failed': return Colors.red;
      default: return Colors.grey;
    }
  }

  String _getStatusLabel(String? status) {
    switch (status) {
      case 'pending': return 'En attente';
      case 'locked': return 'Verrouillée';
      case 'validated': return 'Validée';
      case 'preparing': return 'En préparation';
      case 'ready': return 'Prête';
      case 'in_delivery': return 'En livraison';
      case 'delivered': return 'Livrée';
      case 'failed': return 'Échouée';
      default: return status ?? 'Inconnu';
    }
  }

  Color _getDeliveryStatusColor(String? status) {
    switch (status) {
      case 'assigned': return Colors.blue;
      case 'in_progress': return Colors.purple;
      case 'delivered': return Colors.green;
      case 'failed': return Colors.red;
      case 'postponed': return Colors.orange;
      default: return Colors.grey;
    }
  }

  IconData _getDeliveryStatusIcon(String? status) {
    switch (status) {
      case 'assigned': return Icons.assignment;
      case 'in_progress': return Icons.delivery_dining;
      case 'delivered': return Icons.check_circle;
      case 'failed': return Icons.cancel;
      case 'postponed': return Icons.schedule;
      default: return Icons.help;
    }
  }

  String _getDeliveryStatusLabel(String? status) {
    switch (status) {
      case 'assigned': return 'Assignée';
      case 'in_progress': return 'En cours';
      case 'delivered': return 'Livrée';
      case 'failed': return 'Échouée';
      case 'postponed': return 'Reportée';
      default: return status ?? 'Inconnu';
    }
  }

  String _formatDate(String? dateStr) {
    if (dateStr == null) return 'N/A';
    final date = DateTime.tryParse(dateStr);
    if (date == null) return 'N/A';
    final months = ['', 'Jan', 'Fév', 'Mar', 'Avr', 'Mai', 'Juin', 'Juil', 'Août', 'Sep', 'Oct', 'Nov', 'Déc'];
    return '${months[date.month]} ${date.year}';
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
        Navigator.pop(context, true);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Client ${isBlocked ? 'débloqué' : 'bloqué'}'), 
            backgroundColor: isBlocked ? Colors.green : Colors.orange),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Erreur: $e'), backgroundColor: Colors.red));
      }
    }
  }

  Widget _buildPaymentsList() {
    if (_paymentHistory.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.payment, size: 48, color: Colors.grey[400]),
            SizedBox(height: 8),
            Text('Aucun paiement enregistré', style: TextStyle(color: Colors.grey[600])),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: EdgeInsets.all(8),
      itemCount: _paymentHistory.length,
      itemBuilder: (context, index) {
        final payment = _paymentHistory[index];
        return _buildPaymentCard(payment);
      },
    );
  }

  Widget _buildPaymentCard(Map<String, dynamic> payment) {
    final amount = _parseDouble(payment['amount']);
    final date = DateTime.tryParse(payment['date'] ?? '');
    final recordedBy = payment['recorded_by'];
    final recordedByName = recordedBy?['name'] ?? 'Inconnu';
    final recordedByRole = recordedBy?['role'] ?? '';
    final paymentType = payment['payment_type'] ?? '';
    final paymentMode = payment['payment_mode'] ?? 'auto';
    final ordersAffected = payment['orders_affected'] as List? ?? [];
    final notes = payment['notes'];

    return Card(
      margin: EdgeInsets.only(bottom: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ExpansionTile(
        leading: CircleAvatar(
          backgroundColor: Colors.green.withOpacity(0.2),
          child: Icon(Icons.payment, color: Colors.green),
        ),
        title: Row(
          children: [
            Text('${amount.toStringAsFixed(0)} DA', 
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: paymentType == 'delivery' ? Colors.purple.withOpacity(0.1) : Colors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                paymentType == 'delivery' ? 'Livraison' : 'Dette',
                style: TextStyle(
                  color: paymentType == 'delivery' ? Colors.purple : Colors.blue,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.calendar_today, size: 12, color: Colors.grey),
                SizedBox(width: 4),
                Text(
                  date != null 
                    ? '${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute.toString().padLeft(2, '0')}'
                    : '',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
            SizedBox(height: 2),
            Row(
              children: [
                Icon(Icons.person, size: 12, color: Colors.grey),
                SizedBox(width: 4),
                Text(
                  'Par: $recordedByName (${recordedByRole == 'admin' ? 'Admin' : 'Livreur'})',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ],
        ),
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.info_outline, size: 16, color: Colors.grey),
                    SizedBox(width: 8),
                    Text('Mode: ${paymentMode == 'auto' ? 'Automatique' : 'Manuel'}',
                      style: TextStyle(fontSize: 13, color: Colors.grey[700])),
                  ],
                ),
                SizedBox(height: 12),
                Text('Répartition:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                SizedBox(height: 8),
                ...ordersAffected.map((order) => Padding(
                  padding: EdgeInsets.only(bottom: 4),
                  child: Row(
                    children: [
                      Icon(Icons.check_circle, color: Colors.green, size: 16),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Commande #${order['order_number']}: ${_parseDouble(order['amount_applied']).toStringAsFixed(0)} DA',
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: order['new_status'] == 'paid' ? Colors.green.withOpacity(0.1) : Colors.orange.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          order['new_status'] == 'paid' ? 'Payée' : 'Partiel',
                          style: TextStyle(
                            fontSize: 10,
                            color: order['new_status'] == 'paid' ? Colors.green : Colors.orange,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                )).toList(),
                if (notes != null && notes.isNotEmpty) ...[
                  SizedBox(height: 12),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.note, size: 16, color: Colors.grey),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(notes, style: TextStyle(fontSize: 12, color: Colors.grey[700])),
                        ),
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
}
