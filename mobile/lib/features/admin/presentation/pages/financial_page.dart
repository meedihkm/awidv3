import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../../core/services/api_service.dart';
import '../../../../core/services/cache_service.dart';
import '../../../../core/services/report_service.dart';
import 'client_detail_page.dart';

class FinancialPage extends StatefulWidget {
  @override
  _FinancialPageState createState() => _FinancialPageState();
}

class _FinancialPageState extends State<FinancialPage> with SingleTickerProviderStateMixin {
  final ApiService _apiService = ApiService();
  final CacheService _cacheService = CacheService();
  final ReportService _reportService = ReportService();
  late TabController _tabController;
  
  // Data
  List<dynamic> _allOrders = [];
  List<dynamic> _allDeliveries = [];
  List<Map<String, dynamic>> _debts = [];
  // ignore: unused_field
  List<dynamic> _deliverers = [];
  Map<String, dynamic> _clients = {};
  bool _isLoading = true;
  
  // Filtres période
  String _selectedPeriod = 'day';
  DateTime _selectedDate = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  bool _showCalendar = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _loadData();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _loadData({bool forceRefresh = false}) async {
    setState(() => _isLoading = true);
    try {
      // Essayer le cache d'abord
      if (!forceRefresh) {
        final cachedOrders = await _cacheService.getCachedOrders();
        final cachedDebts = await _cacheService.getCachedDebts();
        if (cachedOrders != null && cachedDebts != null) {
          setState(() {
            _allOrders = cachedOrders;
            _debts = List<Map<String, dynamic>>.from(cachedDebts);
            _isLoading = false;
          });
        }
      }
      
      // Charger depuis le serveur
      final results = await Future.wait([
        _apiService.getOrders(limit: 500),
        _apiService.getDebtsList(limit: 100),
        _apiService.getDeliveries(limit: 500),
        _apiService.getDeliverers(),
        _apiService.getUsers(),
      ]);
      
      final orders = results[0]['data'] ?? [];
      final debts = results[1]['data'] ?? [];
      final deliveries = results[2]['data'] ?? [];
      final deliverers = results[3]['data'] ?? [];
      final users = results[4]['data'] ?? [];
      
      // Créer map des clients
      final clientsMap = <String, dynamic>{};
      for (var user in users) {
        if (user['role'] == 'cafeteria') {
          clientsMap[user['id']] = user;
        }
      }
      
      // Mettre en cache
      await _cacheService.cacheOrders(orders);
      await _cacheService.cacheDebts(debts);
      
      setState(() {
        _allOrders = orders;
        _debts = List<Map<String, dynamic>>.from(debts);
        _allDeliveries = deliveries;
        _deliverers = deliverers;
        _clients = clientsMap;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur: ${e.toString()}'), backgroundColor: Colors.red),
      );
    }
  }

  List<dynamic> _getFilteredOrders() {
    final now = DateTime.now();
    // final today = DateTime(now.year, now.month, now.day);
    final selected = DateTime(_selectedDate.year, _selectedDate.month, _selectedDate.day);
    
    return _allOrders.where((order) {
      final orderDate = DateTime.tryParse(order['createdAt'] ?? '') ?? now;
      final orderDay = DateTime(orderDate.year, orderDate.month, orderDate.day);
      
      switch (_selectedPeriod) {
        case 'day':
          return orderDay.isAtSameMomentAs(selected);
        case 'week':
          final weekStart = selected.subtract(Duration(days: selected.weekday - 1));
          final weekEnd = weekStart.add(Duration(days: 6));
          return !orderDay.isBefore(weekStart) && !orderDay.isAfter(weekEnd);
        case 'month':
          return orderDate.year == selected.year && orderDate.month == selected.month;
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
    int failedCount = 0;
    Map<String, double> caByClient = {};
    Map<String, double> caByProduct = {};
    Map<String, Map<String, dynamic>> statsByDeliverer = {};

    for (var order in orders) {
      final total = _parseDouble(order['total']);
      final paid = _parseDouble(order['amountPaid']);
      final status = order['status'] ?? '';
      final clientName = order['cafeteria']?['name'] ?? 'Inconnu';
      
      totalCA += total;
      totalCollected += paid;
      
      if (status == 'delivered') deliveredCount++;
      else if (status == 'pending') pendingCount++;
      else if (status == 'failed' || status == 'locked') failedCount++;
      
      caByClient[clientName] = (caByClient[clientName] ?? 0) + total;
      
      for (var item in (order['items'] ?? [])) {
        final productName = item['productName'] ?? 'Produit';
        final itemTotal = _parseDouble(item['quantity']) * _parseDouble(item['unitPrice']);
        caByProduct[productName] = (caByProduct[productName] ?? 0) + itemTotal;
      }
    }

    // Stats par livreur depuis les livraisons
    for (var delivery in _allDeliveries) {
      final deliveryDate = DateTime.tryParse(delivery['createdAt'] ?? '');
      if (deliveryDate == null) continue;
      
      final deliveryDay = DateTime(deliveryDate.year, deliveryDate.month, deliveryDate.day);
      final selected = DateTime(_selectedDate.year, _selectedDate.month, _selectedDate.day);
      
      bool inPeriod = false;
      switch (_selectedPeriod) {
        case 'day':
          inPeriod = deliveryDay.isAtSameMomentAs(selected);
          break;
        case 'week':
          final weekStart = selected.subtract(Duration(days: selected.weekday - 1));
          final weekEnd = weekStart.add(Duration(days: 6));
          inPeriod = !deliveryDay.isBefore(weekStart) && !deliveryDay.isAfter(weekEnd);
          break;
        case 'month':
          inPeriod = deliveryDate.year == selected.year && deliveryDate.month == selected.month;
          break;
      }
      
      if (!inPeriod) continue;
      
      final delivererId = delivery['delivererId'] ?? '';
      final delivererName = delivery['deliverer']?['name'] ?? 'Livreur';
      final status = delivery['status'] ?? '';
      final collected = _parseDouble(delivery['amountCollected']);
      
      if (!statsByDeliverer.containsKey(delivererId)) {
        statsByDeliverer[delivererId] = {
          'name': delivererName,
          'deliveries': 0,
          'delivered': 0,
          'failed': 0,
          'collected': 0.0,
        };
      }
      
      statsByDeliverer[delivererId]!['deliveries']++;
      if (status == 'delivered') {
        statsByDeliverer[delivererId]!['delivered']++;
        statsByDeliverer[delivererId]!['collected'] += collected;
      } else if (status == 'failed') {
        statsByDeliverer[delivererId]!['failed']++;
      }
    }

    return {
      'totalCA': totalCA,
      'totalCollected': totalCollected,
      'totalUnpaid': totalCA - totalCollected,
      'orderCount': orders.length,
      'deliveredCount': deliveredCount,
      'pendingCount': pendingCount,
      'failedCount': failedCount,
      'caByClient': caByClient,
      'caByProduct': caByProduct,
      'statsByDeliverer': statsByDeliverer,
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
    final d = _selectedDate;
    switch (_selectedPeriod) {
      case 'day':
        final now = DateTime.now();
        if (d.year == now.year && d.month == now.month && d.day == now.day) {
          return "Aujourd'hui";
        }
        return '${d.day}/${d.month}/${d.year}';
      case 'week':
        final weekStart = d.subtract(Duration(days: d.weekday - 1));
        final weekEnd = weekStart.add(Duration(days: 6));
        return '${weekStart.day}/${weekStart.month} - ${weekEnd.day}/${weekEnd.month}';
      case 'month':
        final months = ['', 'Janvier', 'Février', 'Mars', 'Avril', 'Mai', 'Juin', 
                       'Juillet', 'Août', 'Septembre', 'Octobre', 'Novembre', 'Décembre'];
        return '${months[d.month]} ${d.year}';
      default:
        return '';
    }
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
      date: _selectedDate,
      stats: stats,
      orders: filteredOrders,
      deliveries: [],
    );
  }

  Future<void> _exportMonthlyReport() async {
    await _reportService.generateMonthlyFinancialReport(
      month: _selectedDate.month,
      year: _selectedDate.year,
      orders: _allOrders,
      debts: _debts,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading && _allOrders.isEmpty) {
      return Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor));
    }

    final filteredOrders = _getFilteredOrders();
    final stats = _calculateStats(filteredOrders);

    return Column(
      children: [
        // Barre de période avec calendrier
        _buildPeriodSelector(),
        
        // Calendrier (si ouvert)
        if (_showCalendar) _buildCalendar(),

        // Tabs
        Container(
          color: Theme.of(context).cardColor,
          child: TabBar(
            controller: _tabController,
            labelColor: Theme.of(context).primaryColor,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Theme.of(context).primaryColor,
            tabs: [
              Tab(icon: Icon(Icons.dashboard, size: 20), text: 'Résumé'),
              Tab(icon: Icon(Icons.people, size: 20), text: 'Clients'),
              Tab(icon: Icon(Icons.delivery_dining, size: 20), text: 'Livreurs'),
              Tab(icon: Icon(Icons.warning, size: 20), text: 'Dettes'),
            ],
          ),
        ),

        // Content
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              _buildSummaryTab(stats, filteredOrders),
              _buildByClientTab(stats),
              _buildByDelivererTab(stats),
              _buildDebtsTab(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPeriodSelector() {
    return Container(
      padding: EdgeInsets.all(12),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        children: [
          Row(
            children: [
              _buildPeriodChip('day', 'Jour'),
              SizedBox(width: 8),
              _buildPeriodChip('week', 'Semaine'),
              SizedBox(width: 8),
              _buildPeriodChip('month', 'Mois'),
              Spacer(),
              // Bouton calendrier
              GestureDetector(
                onTap: () => setState(() => _showCalendar = !_showCalendar),
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: _showCalendar ? Color(0xFF2E7D32) : Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Color(0xFF2E7D32)),
                  ),
                  child: Icon(Icons.calendar_month, 
                    color: _showCalendar ? Colors.white : Color(0xFF2E7D32), size: 20),
                ),
              ),
              SizedBox(width: 8),
              // Bouton export
              GestureDetector(
                onTap: _showExportOptions,
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(color: Color(0xFF2E7D32), borderRadius: BorderRadius.circular(10)),
                  child: Icon(Icons.download, color: Colors.white, size: 20),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          // Label période sélectionnée
          Row(
            children: [
              Icon(Icons.date_range, color: Theme.of(context).primaryColor, size: 18),
              SizedBox(width: 8),
              Text(_getPeriodLabel(), style: TextStyle(fontWeight: FontWeight.w600, color: Theme.of(context).primaryColor)),
              Spacer(),
              // Navigation rapide
              IconButton(
                icon: Icon(Icons.chevron_left, size: 20),
                onPressed: () => _navigatePeriod(-1),
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(),
              ),
              IconButton(
                icon: Icon(Icons.chevron_right, size: 20),
                onPressed: () => _navigatePeriod(1),
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _navigatePeriod(int direction) {
    setState(() {
      switch (_selectedPeriod) {
        case 'day':
          _selectedDate = _selectedDate.add(Duration(days: direction));
          break;
        case 'week':
          _selectedDate = _selectedDate.add(Duration(days: 7 * direction));
          break;
        case 'month':
          _selectedDate = DateTime(_selectedDate.year, _selectedDate.month + direction, 1);
          break;
      }
      _focusedDay = _selectedDate;
    });
  }

  Widget _buildCalendar() {
    return Container(
      color: Theme.of(context).cardColor,
      child: TableCalendar(
        firstDay: DateTime(2024),
        lastDay: DateTime.now().add(Duration(days: 1)),
        focusedDay: _focusedDay,
        selectedDayPredicate: (day) => isSameDay(_selectedDate, day),
        calendarFormat: CalendarFormat.month,
        headerStyle: HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          titleTextStyle: TextStyle(fontWeight: FontWeight.bold),
        ),
        calendarStyle: CalendarStyle(
          selectedDecoration: BoxDecoration(color: Theme.of(context).primaryColor, shape: BoxShape.circle),
          todayDecoration: BoxDecoration(color: Theme.of(context).primaryColor.withValues(alpha: 0.3), shape: BoxShape.circle),
        ),
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDate = selectedDay;
            _focusedDay = focusedDay;
            _showCalendar = false;
          });
        },
        // Marquer les jours avec des commandes
        eventLoader: (day) {
          final dayOrders = _allOrders.where((o) {
            final d = DateTime.tryParse(o['createdAt'] ?? '');
            return d != null && d.year == day.year && d.month == day.month && d.day == day.day;
          }).toList();
          return dayOrders.isNotEmpty ? [1] : [];
        },
        calendarBuilders: CalendarBuilders(
          markerBuilder: (context, date, events) {
            if (events.isNotEmpty) {
              return Positioned(
                bottom: 1,
                child: Container(
                  width: 6, height: 6,
                  decoration: BoxDecoration(color: Color(0xFF2E7D32), shape: BoxShape.circle),
                ),
              );
            }
            return null;
          },
        ),
      ),
    );
  }

  Widget _buildPeriodChip(String value, String label) {
    final isSelected = _selectedPeriod == value;
    return GestureDetector(
      onTap: () => setState(() => _selectedPeriod = value),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Theme.of(context).primaryColor : Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Theme.of(context).primaryColor),
        ),
        child: Text(label, style: TextStyle(
          color: isSelected ? Colors.white : Theme.of(context).primaryColor, 
          fontWeight: FontWeight.w500,
        )),
      ),
    );
  }

  Widget _buildSummaryTab(Map<String, dynamic> stats, List<dynamic> orders) {
    return RefreshIndicator(
      onRefresh: () => _loadData(forceRefresh: true),
      color: Theme.of(context).primaryColor,
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Stats principales en grille
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 1.5,
              children: [
                _buildStatCard('Chiffre d\'affaires', '${stats['totalCA'].toStringAsFixed(0)} DA', 
                  Icons.trending_up, Theme.of(context).primaryColor),
                _buildStatCard('Collecté', '${stats['totalCollected'].toStringAsFixed(0)} DA', 
                  Icons.payments, Colors.blue),
                _buildStatCard('Non payé', '${stats['totalUnpaid'].toStringAsFixed(0)} DA', 
                  Icons.money_off, Colors.red),
                _buildStatCard('Commandes', '${stats['orderCount']}', 
                  Icons.shopping_bag, Colors.purple),
              ],
            ),
            SizedBox(height: 16),

            // Statuts des commandes
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [BoxShadow(color: Theme.of(context).shadowColor.withValues(alpha: 0.05), blurRadius: 8)],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Statuts', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      _buildStatusBadge('Livrées', stats['deliveredCount'], Colors.green),
                      SizedBox(width: 12),
                      _buildStatusBadge('En attente', stats['pendingCount'], Colors.orange),
                      SizedBox(width: 12),
                      _buildStatusBadge('Échouées', stats['failedCount'], Colors.red),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),

            // Taux de recouvrement
            _buildRecoveryRate(stats),
            SizedBox(height: 16),

            // Top produits
            Text('Top Produits', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 12),
            _buildTopList(stats['caByProduct'] as Map<String, double>, Colors.purple, Icons.fastfood),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusBadge(String label, int count, Color color) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text('$count', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color)),
            Text(label, style: TextStyle(fontSize: 11, color: color)),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [color, color.withValues(alpha: 0.7)], begin: Alignment.topLeft, end: Alignment.bottomRight),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: color.withValues(alpha: 0.3), blurRadius: 8, offset: Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white.withValues(alpha: 0.9), size: 24),
          SizedBox(height: 8),
          Text(value, style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          Text(title, style: TextStyle(color: Colors.white.withValues(alpha: 0.9), fontSize: 11)),
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
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [BoxShadow(color: Theme.of(context).shadowColor.withValues(alpha: 0.05), blurRadius: 4)],
          ),
          child: Row(
            children: [
              Container(
                width: 28, height: 28,
                decoration: BoxDecoration(color: color.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(8)),
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
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 8)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Taux de recouvrement', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('${rate.toStringAsFixed(1)}%', style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 18, 
                color: rate >= 80 ? Colors.green : rate >= 50 ? Colors.orange : Colors.red,
              )),
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
      onRefresh: () => _loadData(forceRefresh: true),
      color: Color(0xFF2E7D32),
      child: ListView.builder(
        padding: EdgeInsets.all(12),
        itemCount: sorted.length,
        itemBuilder: (context, index) {
          final client = sorted[index];
          final percentage = totalCA > 0 ? (client.value / totalCA * 100) : 0.0;
          
          // Trouver les infos du client
          final clientData = _clients.values.firstWhere(
            (c) => c['name'] == client.key,
            orElse: () => {'name': client.key},
          );

          return Card(
            margin: EdgeInsets.only(bottom: 8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Color(0xFF2E7D32).withValues(alpha: 0.1),
                child: Text(client.key[0].toUpperCase(), 
                  style: TextStyle(color: Color(0xFF2E7D32), fontWeight: FontWeight.bold)),
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
                        valueColor: AlwaysStoppedAnimation(Color(0xFF2E7D32)),
                        minHeight: 6,
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Text('${percentage.toStringAsFixed(1)}%', style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                ],
              ),
              trailing: Text('${client.value.toStringAsFixed(0)} DA', 
                style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF2E7D32), fontSize: 16)),
              onTap: () {
                if (clientData['id'] != null) {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (_) => ClientDetailPage(client: clientData),
                  ));
                }
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildByDelivererTab(Map<String, dynamic> stats) {
    final statsByDeliverer = stats['statsByDeliverer'] as Map<String, Map<String, dynamic>>;
    final delivererList = statsByDeliverer.entries.toList()
      ..sort((a, b) => (b.value['delivered'] as int).compareTo(a.value['delivered'] as int));

    if (delivererList.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.delivery_dining, size: 64, color: Colors.grey[400]),
            SizedBox(height: 16),
            Text('Aucune livraison pour cette période', style: TextStyle(color: Colors.grey[600])),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () => _loadData(forceRefresh: true),
      color: Color(0xFF2E7D32),
      child: ListView.builder(
        padding: EdgeInsets.all(12),
        itemCount: delivererList.length,
        itemBuilder: (context, index) {
          final entry = delivererList[index];
          final data = entry.value;
          final successRate = data['deliveries'] > 0 
            ? (data['delivered'] / data['deliveries'] * 100) 
            : 0.0;

          return Card(
            margin: EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.blue.withValues(alpha: 0.1),
                        child: Icon(Icons.delivery_dining, color: Colors.blue),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(data['name'], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                            Text('${data['deliveries']} livraisons', style: TextStyle(color: Colors.grey[600], fontSize: 13)),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: successRate >= 90 ? Colors.green : successRate >= 70 ? Colors.orange : Colors.red,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text('${successRate.toStringAsFixed(0)}%', 
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      _buildDelivererStat('Livrées', data['delivered'], Colors.green),
                      SizedBox(width: 12),
                      _buildDelivererStat('Échouées', data['failed'], Colors.red),
                      SizedBox(width: 12),
                      _buildDelivererStat('Collecté', '${(data['collected'] as double).toStringAsFixed(0)} DA', Colors.blue),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDelivererStat(String label, dynamic value, Color color) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Text('$value', style: TextStyle(fontWeight: FontWeight.bold, color: color, fontSize: 16)),
            Text(label, style: TextStyle(fontSize: 11, color: color)),
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

    final totalDebt = _debts.fold<double>(0, (sum, d) => sum + _parseDouble(d['total_debt']));

    return RefreshIndicator(
      onRefresh: () => _loadData(forceRefresh: true),
      color: Color(0xFF2E7D32),
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
                      Text('Total des dettes', style: TextStyle(color: Colors.white.withValues(alpha: 0.9))),
                      Text('${totalDebt.toStringAsFixed(0)} DA', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(20)),
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
                      child: Text((debt['name'] ?? 'C')[0].toUpperCase(), 
                        style: TextStyle(color: Colors.red.shade700, fontWeight: FontWeight.bold)),
                    ),
                    title: Text(debt['name'] ?? 'Client', style: TextStyle(fontWeight: FontWeight.w600)),
                    subtitle: Text('${debt['unpaid_orders'] ?? 0} commande(s) impayée(s)'),
                    trailing: Text('${_parseDouble(debt['total_debt']).toStringAsFixed(0)} DA', 
                      style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 16)),
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          children: [
                            if (debt['email'] != null)
                              Row(
                                children: [
                                  Icon(Icons.email, size: 18, color: Colors.grey),
                                  SizedBox(width: 8),
                                  Text(debt['email'], style: TextStyle(color: Colors.grey[700])),
                                ],
                              ),
                            if (debt['phone'] != null) ...[
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Icon(Icons.phone, size: 18, color: Colors.grey),
                                  SizedBox(width: 8),
                                  Text(debt['phone'], style: TextStyle(color: Colors.grey[700])),
                                ],
                              ),
                            ],
                            if (debt['last_order_date'] != null) ...[
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Icon(Icons.access_time, size: 18, color: Colors.grey),
                                  SizedBox(width: 8),
                                  Text('Dernière: ${_formatDate(debt['last_order_date'])}', 
                                    style: TextStyle(color: Colors.grey[700])),
                                ],
                              ),
                            ],
                            SizedBox(height: 12),
                            SizedBox(
                              width: double.infinity,
                              child: OutlinedButton.icon(
                                onPressed: () {
                                  final clientData = _clients.values.firstWhere(
                                    (c) => c['name'] == debt['name'],
                                    orElse: () => debt,
                                  );
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (_) => ClientDetailPage(client: clientData),
                                  ));
                                },
                                icon: Icon(Icons.visibility),
                                label: Text('Voir fiche client'),
                                style: OutlinedButton.styleFrom(foregroundColor: Color(0xFF2E7D32)),
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
