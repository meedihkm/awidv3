import 'package:flutter/material.dart';
import '../../../../core/services/api_service.dart';
import '../../../../core/services/payment_service.dart';
import '../../../../core/models/order_model.dart';
import '../../../../core/models/product_model.dart';

class OrderHistoryPage extends StatefulWidget {
  @override
  _OrderHistoryPageState createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> with SingleTickerProviderStateMixin {
  final ApiService _apiService = ApiService();
  final PaymentService _paymentService = PaymentService();
  late TabController _tabController;
  List<Order> _orders = [];
  List<dynamic> _paymentHistory = [];
  double _totalDebt = 0;
  bool _isLoading = true;
  bool _isLoadingPayments = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _loadOrders();
    _loadPayments();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _loadPayments() async {
    setState(() => _isLoadingPayments = true);
    try {
      final result = await _paymentService.getMyPayments();
      final data = result['data'];
      setState(() {
        _totalDebt = (data['total_debt'] ?? 0).toDouble();
        _paymentHistory = data['payment_history'] ?? [];
        _isLoadingPayments = false;
      });
    } catch (e) {
      setState(() => _isLoadingPayments = false);
    }
  }

  Future<void> _loadOrders() async {
    try {
      final response = await _apiService.getMyOrders();
      if (response['success']) {
        setState(() {
          _orders = (response['data'] as List)
              .map((json) => Order.fromJson(json))
              .toList();
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() => _isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur: ${e.toString()}')),
      );
    }
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'pending': return Colors.orange;
      case 'locked': return Colors.blue;
      case 'in_delivery': return Colors.purple;
      case 'delivered': return Colors.green;
      default: return Colors.grey;
    }
  }

  IconData _getStatusIcon(String status) {
    switch (status) {
      case 'pending': return Icons.hourglass_empty;
      case 'locked': return Icons.lock;
      case 'in_delivery': return Icons.local_shipping;
      case 'delivered': return Icons.check_circle;
      default: return Icons.help;
    }
  }

  String _getStatusText(String status) {
    switch (status) {
      case 'pending': return 'En attente';
      case 'locked': return 'Validée';
      case 'in_delivery': return 'En livraison';
      case 'delivered': return 'Livrée';
      default: return status;
    }
  }

  Future<void> _editOrder(Order order) async {
    try {
      final response = await _apiService.getProducts();
      if (!response['success']) return;

      final products = (response['data'] as List)
          .where((json) => json['active'] == true)
          .map((json) => Product.fromJson(json))
          .toList();

      Map<String, int> cart = {};
      for (var item in order.items) {
        cart[item.productId] = item.quantity;
      }

      final result = await showModalBottomSheet<Map<String, int>>(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) => _EditOrderSheet(products: products, initialCart: cart),
      );

      if (result != null && result.isNotEmpty) {
        final items = result.entries.map((e) => {'productId': e.key, 'quantity': e.value}).toList();
        await _apiService.updateOrder(order.id, {'items': items});
        _loadOrders();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Commande modifiée!'), backgroundColor: Colors.green),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // TabBar
        Container(
          color: Colors.white,
          child: TabBar(
            controller: _tabController,
            labelColor: Colors.green.shade700,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.green.shade700,
            tabs: [
              Tab(icon: Icon(Icons.shopping_bag, size: 20), text: 'Commandes'),
              Tab(icon: Icon(Icons.account_balance_wallet, size: 20), text: 'Finance'),
            ],
          ),
        ),
        
        // TabBarView
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              _buildOrdersTab(),
              _buildFinanceTab(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildOrdersTab() {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator(color: Colors.green));
    }

    if (_orders.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.receipt_long_outlined, size: 80, color: Colors.grey[400]),
            SizedBox(height: 16),
            Text('Aucune commande', style: TextStyle(fontSize: 18, color: Colors.grey[600])),
            SizedBox(height: 8),
            Text('Vos commandes apparaîtront ici', style: TextStyle(color: Colors.grey[500])),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: _loadOrders,
      color: Colors.green,
      child: ListView.builder(
        padding: EdgeInsets.all(12),
        itemCount: _orders.length,
        itemBuilder: (context, index) {
          final order = _orders[index];
          return Card(
            margin: EdgeInsets.only(bottom: 12),
            elevation: 3,
            shadowColor: Colors.black26,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Column(
              children: [
                // Header avec statut
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: _getStatusColor(order.status).withOpacity(0.1),
                    borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: _getStatusColor(order.status),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(_getStatusIcon(order.status), color: Colors.white, size: 24),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _getStatusText(order.status),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: _getStatusColor(order.status),
                              ),
                            ),
                            Text(
                              'Commande #${order.id.substring(0, 8)}',
                              style: TextStyle(color: Colors.grey[600], fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        '${order.total.toStringAsFixed(0)} DA',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.green.shade700),
                      ),
                    ],
                  ),
                ),
                
                // Liste des articles
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...order.items.map((item) => Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Row(
                          children: [
                            Container(
                              width: 28,
                              height: 28,
                              decoration: BoxDecoration(
                                color: Colors.green.shade50,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Center(
                                child: Text(
                                  '${item.quantity}',
                                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green.shade700),
                                ),
                              ),
                            ),
                            SizedBox(width: 12),
                            Expanded(child: Text(item.productName)),
                            Text('${item.totalPrice.toStringAsFixed(0)} DA', style: TextStyle(color: Colors.grey[600])),
                          ],
                        ),
                      )),
                      
                      // Paiement
                      if (order.amountPaid > 0 || order.remainingAmount > 0) ...[
                        Divider(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Payé', style: TextStyle(color: Colors.grey[600])),
                            Text('${order.amountPaid.toStringAsFixed(0)} DA', style: TextStyle(color: Colors.green)),
                          ],
                        ),
                        if (order.remainingAmount > 0)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Reste à payer', style: TextStyle(color: Colors.grey[600])),
                              Text(
                                '${order.remainingAmount.toStringAsFixed(0)} DA',
                                style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                      ],
                      
                      // Boutons d'action si commande en attente
                      if (order.isPending) ...[
                        SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton.icon(
                                onPressed: () => _editOrder(order),
                                icon: Icon(Icons.edit, size: 18),
                                label: Text('Modifier'),
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: Colors.blue,
                                  side: BorderSide(color: Colors.blue),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildFinanceTab() {
    if (_isLoadingPayments) {
      return Center(child: CircularProgressIndicator(color: Colors.green));
    }

    final unpaidOrders = _orders.where((o) => o.remainingAmount > 0).toList();

    return RefreshIndicator(
      onRefresh: () async {
        await _loadPayments();
        await _loadOrders();
      },
      color: Colors.green,
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Card Dette Actuelle
            Card(
              elevation: 4,
              shadowColor: _totalDebt > 0 ? Colors.red.withOpacity(0.3) : Colors.green.withOpacity(0.3),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: _totalDebt > 0 
                      ? [Colors.red.shade600, Colors.red.shade400]
                      : [Colors.green.shade600, Colors.green.shade400],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        _totalDebt > 0 ? Icons.warning : Icons.check_circle,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _totalDebt > 0 ? 'Dette actuelle' : 'Aucune dette',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '${_totalDebt.toStringAsFixed(0)} DA',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 12),

            // Card Commandes Impayées
            if (unpaidOrders.isNotEmpty)
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.orange.shade50,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(Icons.receipt_long, color: Colors.orange, size: 24),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Commandes impayées',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 13,
                              ),
                            ),
                            Text(
                              '${unpaidOrders.length}',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            SizedBox(height: 20),

            // Historique des Paiements
            Row(
              children: [
                Icon(Icons.history, color: Colors.grey[700], size: 20),
                SizedBox(width: 8),
                Text(
                  'Historique des paiements',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),

            // Liste des paiements
            if (_paymentHistory.isEmpty)
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: Center(
                    child: Column(
                      children: [
                        Icon(Icons.payment, size: 48, color: Colors.grey[400]),
                        SizedBox(height: 12),
                        Text(
                          'Aucun paiement enregistré',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            else
              ..._paymentHistory.map((payment) {
                final amount = (payment['amount'] ?? 0).toDouble();
                final date = DateTime.tryParse(payment['payment_date'] ?? '');
                final recordedBy = payment['recorded_by_name'] ?? 'Admin';
                final ordersAffected = payment['orders_affected'] as List? ?? [];
                final notes = payment['notes'] as String?;

                return Card(
                  margin: EdgeInsets.only(bottom: 8),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: ExpansionTile(
                    leading: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.green.shade50,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(Icons.check_circle, color: Colors.green, size: 24),
                    ),
                    title: Text(
                      '${amount.toStringAsFixed(0)} DA',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.green.shade700,
                      ),
                    ),
                    subtitle: Text(
                      date != null 
                        ? '${date.day}/${date.month}/${date.year} à ${date.hour}:${date.minute.toString().padLeft(2, '0')}'
                        : 'Date inconnue',
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Enregistré par
                            Row(
                              children: [
                                Icon(Icons.person, size: 18, color: Colors.grey[600]),
                                SizedBox(width: 8),
                                Text(
                                  'Enregistré par: $recordedBy',
                                  style: TextStyle(color: Colors.grey[700]),
                                ),
                              ],
                            ),
                            
                            // Notes
                            if (notes != null && notes.isNotEmpty) ...[
                              SizedBox(height: 8),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(Icons.note, size: 18, color: Colors.grey[600]),
                                  SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      notes,
                                      style: TextStyle(color: Colors.grey[700]),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                            
                            // Commandes affectées
                            if (ordersAffected.isNotEmpty) ...[
                              SizedBox(height: 12),
                              Divider(),
                              SizedBox(height: 8),
                              Text(
                                'Répartition sur ${ordersAffected.length} commande(s):',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey[800],
                                ),
                              ),
                              SizedBox(height: 8),
                              ...ordersAffected.map((order) {
                                final orderAmount = (order['amount_applied'] ?? 0).toDouble();
                                final orderId = order['order_id'] ?? '';
                                return Padding(
                                  padding: EdgeInsets.only(bottom: 4),
                                  child: Row(
                                    children: [
                                      Icon(Icons.arrow_right, size: 16, color: Colors.grey),
                                      SizedBox(width: 4),
                                      Expanded(
                                        child: Text(
                                          'Commande #${orderId.substring(0, 8)}',
                                          style: TextStyle(fontSize: 13, color: Colors.grey[700]),
                                        ),
                                      ),
                                      Text(
                                        '${orderAmount.toStringAsFixed(0)} DA',
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.green.shade700,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
          ],
        ),
      ),
    );
  }
}

class _EditOrderSheet extends StatefulWidget {
  final List<Product> products;
  final Map<String, int> initialCart;

  _EditOrderSheet({required this.products, required this.initialCart});

  @override
  _EditOrderSheetState createState() => _EditOrderSheetState();
}

class _EditOrderSheetState extends State<_EditOrderSheet> {
  late Map<String, int> _cart;

  @override
  void initState() {
    super.initState();
    _cart = Map.from(widget.initialCart);
  }

  void _updateQuantity(String productId, int change) {
    setState(() {
      final currentQty = _cart[productId] ?? 0;
      final newQty = currentQty + change;
      if (newQty <= 0) {
        _cart.remove(productId);
      } else {
        _cart[productId] = newQty;
      }
    });
  }

  double get _total {
    double total = 0;
    _cart.forEach((id, qty) {
      final product = widget.products.firstWhere((p) => p.id == id, orElse: () => widget.products.first);
      total += product.price * qty;
    });
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        children: [
          // Handle
          Container(
            margin: EdgeInsets.only(top: 12),
            width: 40,
            height: 4,
            decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(2)),
          ),
          
          // Header
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Modifier la commande', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.close)),
              ],
            ),
          ),
          
          // Products
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemCount: widget.products.length,
              itemBuilder: (context, index) {
                final product = widget.products[index];
                final qty = _cart[product.id] ?? 0;
                
                return Card(
                  margin: EdgeInsets.only(bottom: 8),
                  child: ListTile(
                    title: Text(product.name, style: TextStyle(fontWeight: FontWeight.w500)),
                    subtitle: Text('${product.price.toStringAsFixed(0)} DA'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: qty > 0 ? () => _updateQuantity(product.id, -1) : null,
                          icon: Icon(Icons.remove_circle, color: qty > 0 ? Colors.red : Colors.grey),
                        ),
                        SizedBox(width: 24, child: Text('$qty', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold))),
                        IconButton(
                          onPressed: () => _updateQuantity(product.id, 1),
                          icon: Icon(Icons.add_circle, color: Colors.green),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          
          // Footer
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, -2))],
            ),
            child: SafeArea(
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: _cart.isEmpty ? null : () => Navigator.pop(context, _cart),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                  child: Text('SAUVEGARDER  •  ${_total.toStringAsFixed(0)} DA', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
