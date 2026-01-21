import 'package:flutter/material.dart';
import '../../../../core/services/api_service.dart';
import '../../../../core/services/report_service.dart';

class FinancialPage extends StatefulWidget {
  @override
  _FinancialPageState createState() => _FinancialPageState();
}

class _FinancialPageState extends State<FinancialPage> with SingleTickerProviderStateMixin {
  final ApiService _apiService = ApiService();
  final ReportService _reportService = ReportService();
  late TabController _tabController;
  
  // Data
  List<dynamic> _allOrders = [];
  List<Map<String, dynamic>> _debts = [];
  bool _isLoading = true;
  
  // Filtres période
  String _selectedPeriod = 'day'; // day, week, month, custom
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _loadData();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _loadData() async {
    setState(() => _isLoading = true);
    try {
      final ordersRes = await _apiService.getOrders();
      final debtsRes = await _apiService.getDebts();
      
      setState(() {
        _allOrders = ordersRes['data'] ?? [];
        _debts = List<Map<String, dynamic>>.from(debtsRes['data'] ?? []);
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur: ${e.toString()}')),
      );
    }
  }

  List<dynamic> _getFilteredOrders() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    
    return _allOrders.where((order) {
      final orderDate = DateTime.tryParse(order['createdAt'] ?? '') ?? now;
      final orderDay = DateTime(orderDate.year, orderDate.month, orderDate.day);
      
      switch (_selectedPeriod) {
        case 'day':
          return orderDay.isAtSameMomentAs(today);
        case 'week':
          final weekStart = today.subtract(Duration(days: today.weekday - 1));
          return orderDay.isAfter(weekStart.subtract(Duration(days: 1))) && orderDay.isBefore(today.add(Duration(days: 1)));
        case 'month':
          return orderDate.year == now.year && orderDate.month == now.month;
        case 'custom':
          return orderDay.isAfter(_startDate.subtract(Duration(days: 1))) && orderDay.isBefore(_endDate.add(Duration(days: 1)));
        default:
          return true;
      }
    }).toList();
  }

  Map<String, dynamic> _calculateStats(List<dynamic> orders) {
    double totalCA = 0;
    double totalCollected = 0;
    int deliveredCount = 0;
    int pendingCount = 0;
    Map<String, double> caByClient = {};
    Map<String, double> caByProduct = {};

    for (var order in orders) {
      final total = _parseDouble(order['total']);
      final paid = _parseDouble(order['amountPaid']);
      final status = order['status'] ?? '';
      final clientName = order['cafeteria']?['name'] ?? 'Inconnu';
      
      totalCA += total;
      totalCollected += paid;
      
      if (status == 'delivered') deliveredCount++;
      if (status == 'pending') pendingCount++;
      
      caByClient[clientName] = (caByClient[clientName] ?? 0) + total;
      
      for (var item in (order['items'] ?? [])) {
        final productName = item['productName'] ?? 'Produit';
        final itemTotal = _parseDouble(item['quantity']) * _parseDouble(item['unitPrice']);
        caByProduct[productName] = (caByProduct[productName] ?? 0) + itemTotal;
      }
    }

    return {
      'totalCA': totalCA,
      'totalCollected': totalCollected,
      'totalUnpaid': totalCA - totalCollected,
      'orderCount': orders.length,
      'deliveredCount': deliveredCount,
      'pendingCount': pendingCount,
      'caByClient': caByClient,
      'caByProduct': caByProduct,
    };
  }

  double _parseDouble(dynamic value) {
    if (value == null) return 0.0;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) return double.tryParse(value) ?? 0.0;
    return 0.0;
  }

  String _getPeriodLabel() {
    switch (_selectedPeriod) {
      case 'day': return "Aujourd'hui";
      case 'week': return 'Cette semaine';
      case 'month': return 'Ce mois';
      case 'custom': return 'Personnalisé';
      default: return '';
    }
  }

  Future<void> _selectCustomDates() async {
    // Sélection date début
    final startPicked = await showDatePicker(
      context: context,
      initialDate: _startDate,
      firstDate: DateTime(2024),
      lastDate: DateTime.now(),
      helpText: 'Date de début',
    );
    if (startPicked == null) return;

    // Sélection date fin
    final endPicked = await showDatePicker(
      context: context,
      initialDate: _endDate.isAfter(startPicked) ? _endDate : startPicked,
      firstDate: startPicked,
      lastDate: DateTime.now(),
      helpText: 'Date de fin',
    );
    if (endPicked == null) return;

    setState(() {
      _startDate = startPicked;
      _endDate = endPicked;
      _selectedPeriod = 'custom';
    });
  }

  void _showExportOptions() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) => Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Exporter', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            ListTile(
              leading: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(color: Colors.blue.shade50, borderRadius: BorderRadius.circular(10)),
                child: Icon(Icons.description, color: Colors.blue),
              ),
              title: Text('Rapport journalier'),
              subtitle: Text('PDF avec détails du jour'),
              onTap: () {
                Navigator.pop(context);
                _exportDailyReport();
              },
            ),
            ListTile(
              leading: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(color: Colors.green.shade50, borderRadius: BorderRadius.circular(10)),
                child: Icon(Icons.account_balance, color: Colors.green),
              ),
              title: Text('Rapport financier mensuel'),
              subtitle: Text('PDF avec CA et dettes'),
              onTap: () {
                Navigator.pop(context);
                _exportMonthlyReport();
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _exportDailyReport() async {
    final filteredOrders = _getFilteredOrders();
    final stats = _calculateStats(filteredOrders);
    
    await _reportService.generateDailyReport(
      date: DateTime.now(),
      stats: stats,
      orders: filteredOrders,
      deliveries: [],
    );
  }

  Future<void> _exportMonthlyReport() async {
    final now = DateTime.now();
    await _reportService.generateMonthlyFinancialReport(
      month: now.month,
      year: now.year,
      orders: _allOrders,
      debts: _debts,
    );
  }


  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator(color: Colors.blue));
    }

    final filteredOrders = _getFilteredOrders();
    final stats = _calculateStats(filteredOrders);

    return Column(
      children: [
        // Filtres période
        Container(
          padding: EdgeInsets.all(12),
          color: Colors.grey[100],
          child: Row(
            children: [
              _buildPeriodChip('day', 'Jour'),
              SizedBox(width: 8),
              _buildPeriodChip('week', 'Semaine'),
              SizedBox(width: 8),
              _buildPeriodChip('month', 'Mois'),
              SizedBox(width: 8),
              GestureDetector(
                onTap: _selectCustomDates,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: _selectedPeriod == 'custom' ? Colors.blue : Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.blue),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.calendar_today, size: 16, color: _selectedPeriod == 'custom' ? Colors.white : Colors.blue),
                      SizedBox(width: 4),
                      Text('Dates', style: TextStyle(color: _selectedPeriod == 'custom' ? Colors.white : Colors.blue, fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
              ),
              Spacer(),
              // Bouton export
              GestureDetector(
                onTap: _showExportOptions,
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(10)),
                  child: Icon(Icons.download, color: Colors.white, size: 20),
                ),
              ),
            ],
          ),
        ),

        // Tabs
        TabBar(
          controller: _tabController,
          labelColor: Colors.blue.shade700,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.blue.shade700,
          tabs: [
            Tab(text: 'Résumé'),
            Tab(text: 'Par Client'),
            Tab(text: 'Dettes'),
          ],
        ),

        // Content
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              _buildSummaryTab(stats, filteredOrders),
              _buildByClientTab(stats),
              _buildDebtsTab(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPeriodChip(String value, String label) {
    final isSelected = _selectedPeriod == value;
    return GestureDetector(
      onTap: () => setState(() => _selectedPeriod = value),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.blue),
        ),
        child: Text(label, style: TextStyle(color: isSelected ? Colors.white : Colors.blue, fontWeight: FontWeight.w500)),
      ),
    );
  }

  Widget _buildSummaryTab(Map<String, dynamic> stats, List<dynamic> orders) {
    return RefreshIndicator(
      onRefresh: _loadData,
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Titre période
            Row(
              children: [
                Icon(Icons.date_range, color: Colors.blue),
                SizedBox(width: 8),
                Text(_getPeriodLabel(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Spacer(),
                Text('${orders.length} commandes', style: TextStyle(color: Colors.grey[600])),
              ],
            ),
            SizedBox(height: 16),

            // Stats principales
            Row(
              children: [
                Expanded(child: _buildStatCard('Chiffre d\'affaires', '${stats['totalCA'].toStringAsFixed(0)} DA', Icons.trending_up, Colors.blue)),
                SizedBox(width: 12),
                Expanded(child: _buildStatCard('Collecté', '${stats['totalCollected'].toStringAsFixed(0)} DA', Icons.payments, Colors.green)),
              ],
            ),
            SizedBox(height: 12),
            Row(
              children: [
                Expanded(child: _buildStatCard('Non payé', '${stats['totalUnpaid'].toStringAsFixed(0)} DA', Icons.money_off, Colors.red)),
                SizedBox(width: 12),
                Expanded(child: _buildStatCard('Livrées', '${stats['deliveredCount']}', Icons.check_circle, Colors.teal)),
              ],
            ),

            SizedBox(height: 24),

            // Top produits
            Text('Top Produits', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 12),
            _buildTopList(stats['caByProduct'] as Map<String, double>, Colors.purple, Icons.fastfood),

            SizedBox(height: 24),

            // Taux de recouvrement
            _buildRecoveryRate(stats),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [color, color.withOpacity(0.7)], begin: Alignment.topLeft, end: Alignment.bottomRight),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: color.withOpacity(0.3), blurRadius: 8, offset: Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.white.withOpacity(0.9), size: 24),
          SizedBox(height: 8),
          Text(value, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
          Text(title, style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildTopList(Map<String, double> data, Color color, IconData icon) {
    final sorted = data.entries.toList()..sort((a, b) => b.value.compareTo(a.value));
    final top5 = sorted.take(5).toList();

    if (top5.isEmpty) {
      return Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(12)),
        child: Center(child: Text('Aucune donnée', style: TextStyle(color: Colors.grey))),
      );
    }

    final maxValue = top5.first.value;

    return Column(
      children: top5.asMap().entries.map((entry) {
        final index = entry.key;
        final item = entry.value;
        final percentage = maxValue > 0 ? item.value / maxValue : 0.0;

        return Container(
          margin: EdgeInsets.only(bottom: 8),
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4)],
          ),
          child: Row(
            children: [
              Container(
                width: 28, height: 28,
                decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
                child: Center(child: Text('${index + 1}', style: TextStyle(color: color, fontWeight: FontWeight.bold))),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.key, style: TextStyle(fontWeight: FontWeight.w500), maxLines: 1, overflow: TextOverflow.ellipsis),
                    SizedBox(height: 4),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: LinearProgressIndicator(value: percentage, backgroundColor: Colors.grey[200], valueColor: AlwaysStoppedAnimation(color), minHeight: 6),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 12),
              Text('${item.value.toStringAsFixed(0)} DA', style: TextStyle(fontWeight: FontWeight.bold, color: color)),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildRecoveryRate(Map<String, dynamic> stats) {
    final total = stats['totalCA'] as double;
    final collected = stats['totalCollected'] as double;
    final rate = total > 0 ? (collected / total * 100) : 0.0;

    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Taux de recouvrement', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('${rate.toStringAsFixed(1)}%', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: rate >= 80 ? Colors.green : rate >= 50 ? Colors.orange : Colors.red)),
            ],
          ),
          SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: rate / 100,
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation(rate >= 80 ? Colors.green : rate >= 50 ? Colors.orange : Colors.red),
              minHeight: 12,
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildByClientTab(Map<String, dynamic> stats) {
    final caByClient = stats['caByClient'] as Map<String, double>;
    final sorted = caByClient.entries.toList()..sort((a, b) => b.value.compareTo(a.value));

    if (sorted.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.people_outline, size: 64, color: Colors.grey[400]),
            SizedBox(height: 16),
            Text('Aucune donnée pour cette période', style: TextStyle(color: Colors.grey[600])),
          ],
        ),
      );
    }

    final totalCA = stats['totalCA'] as double;

    return RefreshIndicator(
      onRefresh: _loadData,
      child: ListView.builder(
        padding: EdgeInsets.all(12),
        itemCount: sorted.length,
        itemBuilder: (context, index) {
          final client = sorted[index];
          final percentage = totalCA > 0 ? (client.value / totalCA * 100) : 0.0;

          return Card(
            margin: EdgeInsets.only(bottom: 8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue.shade100,
                child: Text(client.key[0].toUpperCase(), style: TextStyle(color: Colors.blue.shade700, fontWeight: FontWeight.bold)),
              ),
              title: Text(client.key, style: TextStyle(fontWeight: FontWeight.w600)),
              subtitle: Row(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: LinearProgressIndicator(
                        value: percentage / 100,
                        backgroundColor: Colors.grey[200],
                        valueColor: AlwaysStoppedAnimation(Colors.blue),
                        minHeight: 6,
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Text('${percentage.toStringAsFixed(1)}%', style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                ],
              ),
              trailing: Text('${client.value.toStringAsFixed(0)} DA', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue.shade700, fontSize: 16)),
              onTap: () => _showClientDetails(client.key),
            ),
          );
        },
      ),
    );
  }

  void _showClientDetails(String clientName) {
    final clientOrders = _allOrders.where((o) => o['cafeteria']?['name'] == clientName).toList();
    
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.75,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 12),
              width: 40, height: 4,
              decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(2)),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.blue.shade100,
                    radius: 24,
                    child: Text(clientName[0].toUpperCase(), style: TextStyle(color: Colors.blue.shade700, fontWeight: FontWeight.bold, fontSize: 20)),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(clientName, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        Text('${clientOrders.length} commandes', style: TextStyle(color: Colors.grey[600])),
                      ],
                    ),
                  ),
                  IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.close)),
                ],
              ),
            ),
            Divider(height: 1),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(12),
                itemCount: clientOrders.length,
                itemBuilder: (context, index) {
                  final order = clientOrders[index];
                  final date = DateTime.tryParse(order['createdAt'] ?? '');
                  return Card(
                    margin: EdgeInsets.only(bottom: 8),
                    child: ListTile(
                      leading: Icon(Icons.receipt, color: Colors.blue),
                      title: Text('${_parseDouble(order['total']).toStringAsFixed(0)} DA'),
                      subtitle: Text(date != null ? '${date.day}/${date.month}/${date.year}' : ''),
                      trailing: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: order['status'] == 'delivered' ? Colors.green : Colors.orange,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(order['status'] == 'delivered' ? 'Livrée' : 'En cours', style: TextStyle(color: Colors.white, fontSize: 11)),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDebtsTab() {
    if (_debts.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle, size: 80, color: Colors.green),
            SizedBox(height: 16),
            Text('Aucune dette!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green)),
            Text('Tous les clients sont à jour', style: TextStyle(color: Colors.grey[600])),
          ],
        ),
      );
    }

    final totalDebt = _debts.fold<double>(0, (sum, d) => sum + _parseDouble(d['debt']));

    return RefreshIndicator(
      onRefresh: _loadData,
      child: Column(
        children: [
          // Total dettes
          Container(
            margin: EdgeInsets.all(12),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.red.shade600, Colors.red.shade400]),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Icon(Icons.warning, color: Colors.white, size: 32),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Total des dettes', style: TextStyle(color: Colors.white.withOpacity(0.9))),
                      Text('${totalDebt.toStringAsFixed(0)} DA', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), borderRadius: BorderRadius.circular(20)),
                  child: Text('${_debts.length} clients', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),

          // Liste des dettes
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 12),
              itemCount: _debts.length,
              itemBuilder: (context, index) {
                final debt = _debts[index];
                return Card(
                  margin: EdgeInsets.only(bottom: 8),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: ExpansionTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.red.shade100,
                      child: Text((debt['name'] ?? 'C')[0].toUpperCase(), style: TextStyle(color: Colors.red.shade700, fontWeight: FontWeight.bold)),
                    ),
                    title: Text(debt['name'] ?? 'Client', style: TextStyle(fontWeight: FontWeight.w600)),
                    subtitle: Text('${debt['order_count'] ?? 0} commande(s) impayée(s)'),
                    trailing: Text('${_parseDouble(debt['debt']).toStringAsFixed(0)} DA', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 16)),
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(Icons.email, size: 18, color: Colors.grey),
                                SizedBox(width: 8),
                                Text(debt['email'] ?? 'N/A', style: TextStyle(color: Colors.grey[700])),
                              ],
                            ),
                            SizedBox(height: 8),
                            if (debt['last_order'] != null)
                              Row(
                                children: [
                                  Icon(Icons.access_time, size: 18, color: Colors.grey),
                                  SizedBox(width: 8),
                                  Text('Dernière commande: ${_formatDate(debt['last_order'])}', style: TextStyle(color: Colors.grey[700])),
                                ],
                              ),
                            SizedBox(height: 12),
                            SizedBox(
                              width: double.infinity,
                              child: OutlinedButton.icon(
                                onPressed: () => _showClientDetails(debt['name']),
                                icon: Icon(Icons.visibility),
                                label: Text('Voir les commandes'),
                                style: OutlinedButton.styleFrom(foregroundColor: Colors.blue),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(String? dateStr) {
    if (dateStr == null) return 'N/A';
    final date = DateTime.tryParse(dateStr);
    if (date == null) return 'N/A';
    return '${date.day}/${date.month}/${date.year}';
  }
}
