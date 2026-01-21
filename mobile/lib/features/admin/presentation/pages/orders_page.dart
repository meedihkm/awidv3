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
  late TabController _tabController;
  
  // Filtres
  String _groupBy = 'none'; // none, client, deliverer
  String _periodFilter = 'all'; // all, day, week, month
  String? _selectedClient;
  // ignore: unused_field
  String? _selectedDeliverer;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    await _settingsService.loadSettings();
    setState(() {
      _kitchenMode = _settingsService.kitchenMode;
      // 4 tabs sans kitchen mode, 7 tabs avec kitchen mode
      _tabController = TabController(length: _kitchenMode ? 7 : 4, vsync: this);
    });
    _loadData();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _loadData({bool forceRefresh = false}) async {
    // Charger depuis le cache d'abord
    if (!forceRefresh) {
      final cachedOrders = await _cacheService.getCachedOrders();
      if (cachedOrders != null && cachedOrders.isNotEmpty) {
        setState(() {
          _orders = cachedOrders.map((json) => Order.fromJson(json)).toList();
          _hasData = true;
          _isLoading = false;
        });
      }
    }
    
    try {
      final results = await Future.wait([
        _apiService.getOrders(forceRefresh: forceRefresh),
        _apiService.getDeliverers(),
      ]);
      
      final ordersResponse = results[0];
      final deliverersResponse = results[1];
      
      if (ordersResponse['success'] == true) {
        setState(() {
          _orders = (ordersResponse['data'] as List).map((json) => Order.fromJson(json)).toList();
          if (deliverersResponse['success'] == true) {
            _deliverers = List<Map<String, dynamic>>.from(deliverersResponse['data']);
          }
          _hasData = _orders.isNotEmpty;
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() => _isLoading = false);
      showError('Erreur: ${e.toString()}');
    }
  }

  List<Order> _getFilteredOrders(String status) {
    var orders = status == 'all' ? _orders : _orders.where((o) => o.status == status).toList();
    
    // Filtre par période
    if (_periodFilter != 'all') {
      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);
      orders = orders.where((o) {
        final orderDate = o.createdAt ?? now;
        final orderDay = DateTime(orderDate.year, orderDate.month, orderDate.day);
        switch (_periodFilter) {
          case 'day': return orderDay.isAtSameMomentAs(today);
          case 'week':
            final weekStart = today.subtract(Duration(days: today.weekday - 1));
            return orderDay.isAfter(weekStart.subtract(Duration(days: 1)));
          case 'month': return orderDate.year == now.year && orderDate.month == now.month;
          default: return true;
        }
      }).toList();
    }
    
    // Filtre par client
    if (_selectedClient != null) {
      orders = orders.where((o) => o.cafeteria?.name == _selectedClient).toList();
    }
    
    return orders;
  }

  Map<String, List<Order>> _groupOrders(List<Order> orders) {
    if (_groupBy == 'none') return {'Toutes': orders};
    
    Map<String, List<Order>> grouped = {};
    for (var order in orders) {
      String key;
      if (_groupBy == 'client') {
        key = order.cafeteria?.name ?? 'Inconnu';
      } else {
        key = 'Non assigné'; // Pour le groupement par livreur, on aurait besoin de l'info
      }
      grouped.putIfAbsent(key, () => []).add(order);
    }
    return grouped;
  }

  List<String> _getUniqueClients() {
    return _orders.map((o) => o.cafeteria?.name ?? '').where((n) => n.isNotEmpty).toSet().toList();
  }

  Future<void> _lockOrder(Order order) async {
    // Optimistic UI: mettre à jour immédiatement
    final originalStatus = order.status;
    setState(() {
      final index = _orders.indexWhere((o) => o.id == order.id);
      if (index != -1) {
        _orders[index] = Order(
          id: order.id,
          organizationId: order.organizationId,
          cafeteriaId: order.cafeteriaId,
          date: order.date,
          total: order.total,
          status: 'locked',
          paymentStatus: order.paymentStatus,
          amountPaid: order.amountPaid,
          createdAt: order.createdAt,
          items: order.items,
          cafeteria: order.cafeteria,
        );
      }
    });
    
    try {
      await _apiService.lockOrder(order.id);
      showSuccess('Commande validée!');
      _loadData(forceRefresh: true);
    } catch (e) {
      // Rollback
      setState(() {
        final index = _orders.indexWhere((o) => o.id == order.id);
        if (index != -1) {
          _orders[index] = Order(
            id: order.id,
            organizationId: order.organizationId,
            cafeteriaId: order.cafeteriaId,
            date: order.date,
            total: order.total,
            status: originalStatus,
            paymentStatus: order.paymentStatus,
            amountPaid: order.amountPaid,
            createdAt: order.createdAt,
            items: order.items,
            cafeteria: order.cafeteria,
          );
        }
      });
      showError('Erreur: ${e.toString()}');
    }
  }

  Future<void> _assignDeliverer(Order order) async {
    if (_deliverers.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Aucun livreur disponible')));
      return;
    }

    final selected = await showModalBottomSheet<String>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: BoxDecoration(color: Theme.of(context).cardColor, borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(margin: EdgeInsets.only(top: 12), width: 40, height: 4, decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(2))),
            Padding(padding: EdgeInsets.all(16), child: Text('Choisir un livreur', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
            ...(_deliverers.map((d) => ListTile(
              leading: CircleAvatar(backgroundColor: Colors.orange.shade100, child: Icon(Icons.person, color: Colors.orange)),
              title: Text(d['name'] ?? 'Livreur'),
              subtitle: Text(d['phone'] ?? ''),
              onTap: () => Navigator.pop(context, d['id']?.toString()),
            ))),
            SizedBox(height: 20),
          ],
        ),
      ),
    );

    if (selected != null) {
      // Protection contre double clic
      await safeAction(() async {
        await _apiService.assignDeliverer(order.id, selected);
        showSuccess('Livreur assigné!');
        _loadData(forceRefresh: true);
      }, onError: (e) => showError('Erreur: ${e.toString()}'));
    }
  }


  void _showOrderDetails(Order order) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.85,
        decoration: BoxDecoration(color: Theme.of(context).cardColor, borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
        child: Column(
          children: [
            // Handle
            Container(margin: EdgeInsets.only(top: 12), width: 40, height: 4, decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(2))),
            
            // Header
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [_getStatusColor(order.status), _getStatusColor(order.status).withValues(alpha: 0.7)]),
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white.withValues(alpha: 0.2),
                    radius: 28,
                    child: Icon(Icons.receipt_long, color: Colors.white, size: 28),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Commande', style: TextStyle(color: Colors.white.withValues(alpha: 0.9), fontSize: 14)),
                        Text('${order.total.toStringAsFixed(0)} DA', style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                    child: Text(_getStatusText(order.status), style: TextStyle(color: _getStatusColor(order.status), fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Client info
                    _buildDetailSection('Client', [
                      _buildDetailRow(Icons.person, order.cafeteria?.name ?? 'N/A'),
                      if (order.cafeteria?.phone != null) _buildDetailRow(Icons.phone, order.cafeteria!.phone!),
                    ]),

                    SizedBox(height: 20),

                    // Date et statut
                    _buildDetailSection('Informations', [
                      _buildDetailRow(Icons.calendar_today, order.createdAt != null ? '${order.createdAt!.day}/${order.createdAt!.month}/${order.createdAt!.year} à ${order.createdAt!.hour}:${order.createdAt!.minute.toString().padLeft(2, '0')}' : 'N/A'),
                      _buildDetailRow(Icons.payment, 'Paiement: ${_getPaymentText(order.paymentStatus)}', color: _getPaymentColor(order.paymentStatus)),
                    ]),

                    SizedBox(height: 20),

                    // Articles
                    Text('Articles (${order.items.length})', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(height: 12),
                    Container(
                      decoration: BoxDecoration(color: Theme.of(context).colorScheme.surfaceContainerHighest, borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        children: order.items.asMap().entries.map((entry) {
                          final item = entry.value;
                          final isLast = entry.key == order.items.length - 1;
                          return Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(border: isLast ? null : Border(bottom: BorderSide(color: Theme.of(context).dividerColor))),
                            child: Row(
                              children: [
                                Container(
                                  width: 36, height: 36,
                                  decoration: BoxDecoration(color: Colors.blue.shade100, borderRadius: BorderRadius.circular(8)),
                                  child: Center(child: Text('${item.quantity}', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue.shade700))),
                                ),
                                SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(item.productName, style: TextStyle(fontWeight: FontWeight.w500)),
                                      Text('${item.unitPrice.toStringAsFixed(0)} DA/unité', style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                                    ],
                                  ),
                                ),
                                Text('${item.totalPrice.toStringAsFixed(0)} DA', style: TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),

                    SizedBox(height: 20),

                    // Résumé paiement
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Theme.of(context).primaryColor.withValues(alpha: 0.3)),
                      ),
                      child: Column(
                        children: [
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                            Text('Total'), Text('${order.total.toStringAsFixed(0)} DA', style: TextStyle(fontWeight: FontWeight.bold)),
                          ]),
                          SizedBox(height: 8),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                            Text('Payé', style: TextStyle(color: Colors.green)), Text('${order.amountPaid.toStringAsFixed(0)} DA', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                          ]),
                          if (order.remainingAmount > 0) ...[
                            Divider(height: 16),
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                              Text('Reste à payer', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                              Text('${order.remainingAmount.toStringAsFixed(0)} DA', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 18)),
                            ]),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Actions
            if (order.isPending || order.isLocked || order.status == 'ready')
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(color: Theme.of(context).cardColor, boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, -2))]),
                child: SafeArea(
                  child: Row(
                    children: [
                      if (order.isPending)
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () { Navigator.pop(context); _lockOrder(order); },
                            icon: Icon(Icons.check),
                            label: Text('VALIDER'),
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white, padding: EdgeInsets.symmetric(vertical: 14), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                          ),
                        ),
                      if (order.isLocked || order.status == 'ready')
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () { Navigator.pop(context); _assignDeliverer(order); },
                            icon: Icon(Icons.local_shipping),
                            label: Text('ASSIGNER LIVREUR'),
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange, foregroundColor: Colors.white, padding: EdgeInsets.symmetric(vertical: 14), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(color: Theme.of(context).colorScheme.surfaceContainerHighest, borderRadius: BorderRadius.circular(12)),
          child: Column(children: children),
        ),
      ],
    );
  }

  Widget _buildDetailRow(IconData icon, String text, {Color? color}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, size: 20, color: color ?? Colors.grey[600]),
          SizedBox(width: 12),
          Expanded(child: Text(text, style: TextStyle(color: color ?? Colors.grey[800]))),
        ],
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'pending': return Colors.orange;
      case 'validated': return Colors.blue;
      case 'preparing': return Colors.purple;
      case 'ready': return Colors.teal;
      case 'locked': return Colors.blue;
      case 'in_delivery': return Colors.purple;
      case 'delivered': return Colors.green;
      default: return Colors.grey;
    }
  }

  String _getStatusText(String status) {
    switch (status) {
      case 'pending': return 'En attente';
      case 'validated': return 'Validée';
      case 'preparing': return 'En préparation';
      case 'ready': return 'Prête';
      case 'locked': return 'Validée';
      case 'in_delivery': return 'En livraison';
      case 'delivered': return 'Livrée';
      default: return status;
    }
  }

  String _getPaymentText(String status) {
    switch (status) {
      case 'paid': return 'Payé';
      case 'partial': return 'Partiel';
      case 'unpaid': return 'Non payé';
      default: return status;
    }
  }

  Color _getPaymentColor(String status) {
    switch (status) {
      case 'paid': return Colors.green;
      case 'partial': return Colors.orange;
      case 'unpaid': return Colors.red;
      default: return Colors.grey;
    }
  }


  // ignore: unused_element
  void _showFilters() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => StatefulBuilder(
        builder: (context, setModalState) => Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(color: Theme.of(context).cardColor, borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Container(width: 40, height: 4, decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(2)))),
              SizedBox(height: 20),
              Text('Filtres', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),

              // Période
              Text('Période', style: TextStyle(fontWeight: FontWeight.w600)),
              SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: [
                  _buildFilterChip('Tout', 'all', _periodFilter, (v) => setModalState(() => _periodFilter = v)),
                  _buildFilterChip('Aujourd\'hui', 'day', _periodFilter, (v) => setModalState(() => _periodFilter = v)),
                  _buildFilterChip('Semaine', 'week', _periodFilter, (v) => setModalState(() => _periodFilter = v)),
                  _buildFilterChip('Mois', 'month', _periodFilter, (v) => setModalState(() => _periodFilter = v)),
                ],
              ),

              SizedBox(height: 16),

              // Grouper par
              Text('Grouper par', style: TextStyle(fontWeight: FontWeight.w600)),
              SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: [
                  _buildFilterChip('Aucun', 'none', _groupBy, (v) => setModalState(() => _groupBy = v)),
                  _buildFilterChip('Client', 'client', _groupBy, (v) => setModalState(() => _groupBy = v)),
                ],
              ),

              SizedBox(height: 16),

              // Client
              Text('Client', style: TextStyle(fontWeight: FontWeight.w600)),
              SizedBox(height: 8),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(color: Theme.of(context).colorScheme.surfaceContainerHighest, borderRadius: BorderRadius.circular(12)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String?>(
                    value: _selectedClient,
                    isExpanded: true,
                    hint: Text('Tous les clients'),
                    items: [
                      DropdownMenuItem(value: null, child: Text('Tous les clients')),
                      ..._getUniqueClients().map((c) => DropdownMenuItem(value: c, child: Text(c))),
                    ],
                    onChanged: (v) => setModalState(() => _selectedClient = v),
                  ),
                ),
              ),

              SizedBox(height: 24),

              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        setModalState(() {
                          _periodFilter = 'all';
                          _groupBy = 'none';
                          _selectedClient = null;
                        });
                      },
                      child: Text('Réinitialiser'),
                      style: OutlinedButton.styleFrom(padding: EdgeInsets.symmetric(vertical: 14)),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {});
                        Navigator.pop(context);
                      },
                      child: Text('Appliquer'),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, foregroundColor: Colors.white, padding: EdgeInsets.symmetric(vertical: 14)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterChip(String label, String value, String current, Function(String) onSelect) {
    final isSelected = current == value;
    return GestureDetector(
      onTap: () => onSelect(value),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Theme.of(context).primaryColor : Theme.of(context).colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(label, style: TextStyle(color: isSelected ? Colors.white : Colors.grey[700], fontWeight: FontWeight.w500)),
      ),
    );
  }

  Widget _buildQuickFilter(String label, String value) {
    final isSelected = _periodFilter == value;
    return GestureDetector(
      onTap: () => setState(() => _periodFilter = value),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Theme.of(context).primaryColor : Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Theme.of(context).primaryColor),
        ),
        child: Text(label, style: TextStyle(color: isSelected ? Colors.white : Colors.blue, fontWeight: FontWeight.w500, fontSize: 13)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Skeleton loading au premier chargement
    if (_isLoading && !_hasData) {
      return Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            color: Theme.of(context).scaffoldBackgroundColor,
            child: const SkeletonLoader(height: 40),
          ),
          Expanded(
            child: SkeletonList(count: 5, itemBuilder: () => const OrderCardSkeleton()),
          ),
        ],
      );
    }

    return Column(
      children: [
        // Filtres période directement visibles
        Container(
          padding: EdgeInsets.all(10),
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Column(
            children: [
              // Ligne 1: Filtres période
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildQuickFilter('Tout', 'all'),
                    SizedBox(width: 8),
                    _buildQuickFilter('Jour', 'day'),
                    SizedBox(width: 8),
                    _buildQuickFilter('Semaine', 'week'),
                    SizedBox(width: 8),
                    _buildQuickFilter('Mois', 'month'),
                    SizedBox(width: 12),
                    // Grouper par client
                    GestureDetector(
                      onTap: () => setState(() => _groupBy = _groupBy == 'client' ? 'none' : 'client'),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color: _groupBy == 'client' ? Colors.purple : Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.purple),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.people, size: 16, color: _groupBy == 'client' ? Colors.white : Colors.purple),
                            SizedBox(width: 4),
                            Text('Par client', style: TextStyle(color: _groupBy == 'client' ? Colors.white : Colors.purple, fontWeight: FontWeight.w500, fontSize: 13)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Ligne 2: Filtre client si actif
              if (_selectedClient != null || _getUniqueClients().isNotEmpty)
                Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          height: 40,
                          decoration: BoxDecoration(color: Theme.of(context).cardColor, borderRadius: BorderRadius.circular(20)),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String?>(
                              value: _selectedClient,
                              isExpanded: true,
                              hint: Text('Tous les clients', style: TextStyle(fontSize: 13)),
                              style: TextStyle(fontSize: 13, color: Colors.black),
                              items: [
                                DropdownMenuItem(value: null, child: Text('Tous les clients')),
                                ..._getUniqueClients().map((c) => DropdownMenuItem(value: c, child: Text(c, overflow: TextOverflow.ellipsis))),
                              ],
                              onChanged: (v) => setState(() => _selectedClient = v),
                            ),
                          ),
                        ),
                      ),
                      if (_selectedClient != null || _periodFilter != 'all' || _groupBy != 'none')
                        Padding(
                          padding: EdgeInsets.only(left: 8),
                          child: GestureDetector(
                            onTap: () => setState(() {
                              _periodFilter = 'all';
                              _groupBy = 'none';
                              _selectedClient = null;
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

        // Tabs
        Container(
          color: Theme.of(context).cardColor,
          child: TabBar(
            controller: _tabController,
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
              Tab(text: 'Toutes (${_orders.length})'),
            ] : [
              Tab(text: 'En attente (${_getFilteredOrders('pending').length})'),
              Tab(text: 'Validées (${_getFilteredOrders('locked').length})'),
              Tab(text: 'En livraison (${_getFilteredOrders('in_delivery').length})'),
              Tab(text: 'Livrées (${_getFilteredOrders('delivered').length})'),
            ],
          ),
        ),

        // Content
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: _kitchenMode ? [
              _buildOrderList('pending'),
              _buildOrderList('validated'),
              _buildOrderList('preparing'),
              _buildOrderList('ready'),
              _buildOrderList('in_delivery'),
              _buildOrderList('delivered'),
              _buildOrderList('all'),
            ] : [
              _buildOrderList('pending'),
              _buildOrderList('locked'),
              _buildOrderList('in_delivery'),
              _buildOrderList('delivered'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildOrderList(String status) {
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
        onRefresh: _loadData,
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
            if (order.isPending || order.isLocked || order.status == 'ready')
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
                    if (order.isLocked || order.status == 'ready')
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () => _assignDeliverer(order),
                          icon: Icon(Icons.local_shipping, size: 16),
                          label: Text('Assigner'),
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.orange, foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), padding: EdgeInsets.symmetric(vertical: 8)),
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
