// Orders Page - Admin
import 'package:flutter/material.dart';
import '../../../../core/services/api_service.dart';
import '../../../../core/services/cache_service.dart';
import '../../../../core/services/settings_service.dart';
import '../../../../core/models/order_model.dart';
import '../../../../core/widgets/skeleton_loader.dart';
import '../../../../core/mixins/optimized_state.dart';

class OrdersPage extends StatefulWidget {
  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> with SingleTickerProviderStateMixin, OptimizedStateMixin {
  final ApiService _apiService = ApiService();
  final CacheService _cacheService = CacheService();
  final SettingsService _settingsService = SettingsService();
  List<Order> _orders = [];
  List<Map<String, dynamic>> _deliverers = [];
  bool _isLoading = true;
  bool _hasData = false;
  bool _kitchenMode = false;
  TabController? _tabController;
  bool _isInitialized = false;
  
  // Filtres
  String _groupBy = 'none'; // none, client, deliverer
  String _periodFilter = 'all'; // all, day, week, month
  String? _selectedClient;
  // ignore: unused_field
  String? _selectedDeliverer;

  @override
  void initState() {
    super.initState();
    // Initialize with default 5 tabs (was 4), will be updated if kitchenMode is true
    _tabController = TabController(length: 5, vsync: this);
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    await _settingsService.loadSettings();
    final newKitchenMode = _settingsService.kitchenMode;
    
    // Only recreate TabController if kitchenMode changed and requires different tab count
    if (newKitchenMode != _kitchenMode || !_isInitialized) {
      _tabController?.dispose();
      setState(() {
        _kitchenMode = newKitchenMode;
        // +1 for Litiges tab
        _tabController = TabController(length: _kitchenMode ? 8 : 5, vsync: this);
        _isInitialized = true;
      });
    }
    _loadData();
  }

  // ... (dispose and _loadData remain same)

  // ... (build start remains same)

        // Tabs
        Container(
          color: Theme.of(context).cardColor,
          child: TabBar(
            controller: _tabController!,
            labelColor: Theme.of(context).primaryColor,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Theme.of(context).primaryColor,
            isScrollable: true,
            tabs: _kitchenMode ? [
              Tab(text: 'En attente (${_getFilteredOrders('pending').length})'),
              Tab(text: 'Validées (${_getFilteredOrders('validated').length})'),
              Tab(text: 'Préparation (${_getFilteredOrders('preparing').length})'),
              Tab(text: 'Prêtes (${_getFilteredOrders('ready').length})'),
              Tab(text: 'En livraison (${_getFilteredOrders('in_delivery').length})'),
              Tab(text: 'Livrées (${_getFilteredOrders('delivered').length})'),
              Tab(text: 'Litiges (${_getFilteredOrders('problem').length})'),
              Tab(text: 'Toutes (${_orders.length})'),
            ] : [
              Tab(text: 'En attente (${_getFilteredOrders('pending').length})'),
              // Include workflow statuses in 'Validées' when kitchen mode is OFF
              Tab(text: 'Validées (${_getFilteredOrders(['locked', 'validated', 'preparing', 'ready']).length})'),
              Tab(text: 'En livraison (${_getFilteredOrders('in_delivery').length})'),
              Tab(text: 'Livrées (${_getFilteredOrders('delivered').length})'),
              Tab(text: 'Litiges (${_getFilteredOrders('problem').length})'),
            ],
          ),
        ),

        // Content
        Expanded(
          child: TabBarView(
            controller: _tabController!,
            children: _kitchenMode ? [
              _buildOrderList('pending'),
              _buildOrderList('validated'),
              _buildOrderList('preparing'),
              _buildOrderList('ready'),
              _buildOrderList('in_delivery'),
              _buildOrderList('delivered'),
              _buildOrderList('problem'),
              _buildOrderList('all'),
            ] : [
              _buildOrderList('pending'),
              // Pass list of statuses for the aggregated view
              _buildOrderList(['locked', 'validated', 'preparing', 'ready']),
              _buildOrderList('in_delivery'),
              _buildOrderList('delivered'),
              _buildOrderList('problem'),
            ],
          ),
        ),
      ],
     ),
    );
  }

  Widget _buildOrderList(dynamic status) {
    final orders = _getFilteredOrders(status);
    
    if (orders.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.inbox_outlined, size: 64, color: Colors.grey[400]),
            SizedBox(height: 16),
            Text('Aucune commande', style: TextStyle(color: Colors.grey[600], fontSize: 16)),
          ],
        ),
      );
    }

    // Groupement
    if (_groupBy != 'none') {
      final grouped = _groupOrders(orders);
      return RefreshIndicator(
        onRefresh: () => _loadData(forceRefresh: true),
        child: ListView(
          padding: EdgeInsets.all(12),
          children: grouped.entries.map((entry) {
            final groupTotal = entry.value.fold<double>(0, (sum, o) => sum + o.total);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  margin: EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(color: Colors.blue.shade50, borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.person, size: 18, color: Colors.blue),
                          SizedBox(width: 8),
                          Text(entry.key, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue.shade700)),
                        ],
                      ),
                      Text('${entry.value.length} cmd • ${groupTotal.toStringAsFixed(0)} DA', style: TextStyle(color: Colors.blue.shade700, fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
                ...entry.value.map((order) => _buildOrderCard(order)),
                SizedBox(height: 16),
              ],
            );
          }).toList(),
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () => _loadData(forceRefresh: true),
      color: const Color(0xFF2E7D32),
      child: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: orders.length,
        itemBuilder: (context, index) => _buildOrderCard(orders[index]),
      ),
    );
  }

  Widget _buildOrderCard(Order order) {
    return GestureDetector(
      onTap: () => _showOrderDetails(order),
      child: Card(
        margin: EdgeInsets.only(bottom: 12),
        elevation: 3,
        shadowColor: Colors.black26,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: _getStatusColor(order.status).withValues(alpha: 0.1),
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: _getStatusColor(order.status),
                    radius: 22,
                    child: Text((order.cafeteria?.name ?? 'C')[0].toUpperCase(), style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(order.cafeteria?.name ?? 'Client', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(color: _getStatusColor(order.status), borderRadius: BorderRadius.circular(10)),
                              child: Text(_getStatusText(order.status), style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w500)),
                            ),
                            SizedBox(width: 6),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(color: _getPaymentColor(order.paymentStatus), borderRadius: BorderRadius.circular(10)),
                              child: Text(_getPaymentText(order.paymentStatus), style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w500)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('${order.total.toStringAsFixed(0)} DA', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.blue.shade700)),
                      Text('${order.items.length} article${order.items.length > 1 ? 's' : ''}', style: TextStyle(color: Colors.grey[600], fontSize: 11)),
                    ],
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.chevron_right, color: Colors.grey),
                ],
              ),
            ),
            // Conditions d'affichage des boutons d'action
            // Conditions d'affichage des boutons d'action
            if (order.isPending || 
                order.isLocked || 
                order.status == 'ready' || 
                order.status == 'problem' ||
                (!_kitchenMode && (order.status == 'validated' || order.status == 'preparing')))
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Row(
                  children: [
                    if (order.isPending)
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () => _lockOrder(order),
                          icon: Icon(Icons.check, size: 16),
                          label: Text('Valider'),
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), padding: EdgeInsets.symmetric(vertical: 8)),
                        ),
                      ),
                    // Afficher le bouton assigner pour : locked, ready, ou (validated/preparing si PAS mode cuisine)
                    if (order.isLocked || 
                        order.status == 'ready' || 
                        (!_kitchenMode && (order.status == 'validated' || order.status == 'preparing')))
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () => _assignDeliverer(order),
                          icon: Icon(Icons.local_shipping, size: 16),
                          label: Text('Assigner'),
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.orange, foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), padding: EdgeInsets.symmetric(vertical: 8)),
                        ),
                      ),
                    // Bouton pour résoudre un litige
                    if (order.status == 'problem')
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                             // TODO: Implement resolve logic or show details
                             _showOrderDetails(order);
                          },
                          icon: Icon(Icons.visibility, size: 16),
                          label: Text('Voir Détails'),
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), padding: EdgeInsets.symmetric(vertical: 8)),
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
