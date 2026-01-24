// =====================================================
// PAGE : Finance (Refactorisée)
// Architecture propre avec séparation des responsabilités
// =====================================================

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../core/services/api_service.dart';
import '../../../../core/services/cache_service.dart';
import '../../../../core/services/report_service.dart';
import '../../models/financial_stats.dart';
import '../../services/financial_calculator.dart';
import '../../services/period_filter_service.dart';
import '../widgets/financial_stat_card.dart';
import '../widgets/period_selector.dart';
import '../widgets/recovery_rate_card.dart';
import 'client_detail_page.dart';

class FinancialPageRefactored extends StatefulWidget {
  const FinancialPageRefactored({super.key});

  @override
  State<FinancialPageRefactored> createState() => _FinancialPageRefactoredState();
}

class _FinancialPageRefactoredState extends State<FinancialPageRefactored> with SingleTickerProviderStateMixin {
  // ===== Services =====
  final _apiService = ApiService();
  final _cacheService = CacheService();
  final _reportService = ReportService();

  // ===== Controllers =====
  late TabController _tabController;

  // ===== État des données =====
  List<dynamic> _allOrders = [];
  List<dynamic> _allDeliveries = [];
  List<Map<String, dynamic>> _debts = [];
  Map<String, dynamic> _clients = {};
  List<dynamic> _deliverers = [];
  bool _isLoading = true;

  // ===== État des filtres =====
  PeriodFilter _selectedPeriod = PeriodFilter.day;
  DateTime _selectedDate = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  bool _showCalendar = false;
  DebtFilter _debtFilter = DebtFilter();

  // ===== Constantes =====
  static const _primaryColor = Color(0xFF2E7D32);

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

  // ===== Chargement des données =====

  Future<void> _loadData({bool forceRefresh = false}) async {
    setState(() => _isLoading = true);

    try {
      // Essayer le cache d'abord
      if (!forceRefresh && _allOrders.isNotEmpty) {
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
        _apiService.getDebtsList(
          limit: 100,
          customerId: _debtFilter.customerId,
          delivererId: _debtFilter.delivererId,
          dateFrom: _debtFilter.dateFrom?.toIso8601String(),
          dateTo: _debtFilter.dateTo?.toIso8601String(),
        ),
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
      for (final user in users) {
        if (user['role'] == 'customer') {
          clientsMap[user['id']] = user;
        }
      }

      // Mettre en cache
      await _cacheService.cacheOrders(orders);
      await _cacheService.cacheDebts(debts);

      if (mounted) {
        setState(() {
          _allOrders = orders;
          _debts = List<Map<String, dynamic>>.from(debts);
          _allDeliveries = deliveries;
          _clients = clientsMap;
          _deliverers = deliverers;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erreur: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  // ===== Calcul des statistiques =====

  FinancialStats _calculateCurrentStats() {
    final filteredOrders = PeriodFilterService.filterOrdersByPeriod(
      orders: _allOrders,
      period: _selectedPeriod,
      selectedDate: _selectedDate,
    );

    final filteredDeliveries = PeriodFilterService.filterDeliveriesByPeriod(
      deliveries: _allDeliveries,
      period: _selectedPeriod,
      selectedDate: _selectedDate,
    );

    return FinancialCalculator.calculateStats(
      orders: filteredOrders,
      deliveries: filteredDeliveries,
    );
  }

  // ===== Gestion des périodes =====

  void _onPeriodChanged(PeriodFilter newPeriod) {
    setState(() => _selectedPeriod = newPeriod);
  }

  void _navigatePeriod(int direction) {
    setState(() {
      _selectedDate = PeriodFilterService.navigatePeriod(
        period: _selectedPeriod,
        currentDate: _selectedDate,
        direction: direction,
      );
      _focusedDay = _selectedDate;
    });
  }

  void _toggleCalendar() {
    setState(() => _showCalendar = !_showCalendar);
  }

  void _onDateSelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDate = selectedDay;
      _focusedDay = focusedDay;
      _showCalendar = false;
    });
  }

  // ===== Gestion des filtres de dettes =====

  void _updateDebtFilter(DebtFilter newFilter) {
    setState(() => _debtFilter = newFilter);
    _loadData(forceRefresh: true);
  }

  void _clearDebtFilters() {
    setState(() => _debtFilter = DebtFilter());
    _loadData(forceRefresh: true);
  }

  // ===== Export =====

  void _showExportOptions() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Exporter',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.description, color: Colors.blue),
              ),
              title: const Text('Rapport journalier'),
              subtitle: const Text('PDF avec détails du jour'),
              onTap: () {
                Navigator.pop(context);
                _exportDailyReport();
              },
            ),
            ListTile(
              leading: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.account_balance, color: Colors.green),
              ),
              title: const Text('Rapport financier mensuel'),
              subtitle: const Text('PDF avec CA et dettes'),
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
    final stats = _calculateCurrentStats();
    final filteredOrders = PeriodFilterService.filterOrdersByPeriod(
      orders: _allOrders,
      period: _selectedPeriod,
      selectedDate: _selectedDate,
    );

    await _reportService.generateDailyReport(
      date: _selectedDate,
      stats: {
        'totalCA': stats.totalRevenue,
        'totalCollected': stats.totalCollected,
        'totalUnpaid': stats.totalUnpaid,
        'orderCount': stats.orderCount,
        'deliveredCount': stats.deliveredCount,
        'pendingCount': stats.pendingCount,
        'failedCount': stats.failedCount,
      },
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

  // ===== Build =====

  @override
  Widget build(BuildContext context) {
    if (_isLoading && _allOrders.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(color: _primaryColor),
      );
    }

    final stats = _calculateCurrentStats();
    final periodLabel = PeriodFilterService.getPeriodLabel(
      _selectedPeriod,
      _selectedDate,
    );

    return Column(
      children: [
        // Sélecteur de période
        PeriodSelector(
          selectedPeriod: _selectedPeriod,
          periodLabel: periodLabel,
          onCalendarToggle: _toggleCalendar,
          onExport: _showExportOptions,
          onPreviousPeriod: () => _navigatePeriod(-1),
          onNextPeriod: () => _navigatePeriod(1),
          onPeriodChanged: _onPeriodChanged,
        ),

        // Calendrier (si ouvert)
        if (_showCalendar) _buildCalendar(),

        // Tabs
        Container(
          color: Theme.of(context).cardColor,
          child: TabBar(
            controller: _tabController,
            labelColor: _primaryColor,
            unselectedLabelColor: Colors.grey,
            indicatorColor: _primaryColor,
            tabs: const [
              Tab(icon: Icon(Icons.dashboard, size: 20), text: 'Résumé'),
              Tab(icon: Icon(Icons.people, size: 20), text: 'Clients'),
              Tab(icon: Icon(Icons.delivery_dining, size: 20), text: 'Livreurs'),
              Tab(icon: Icon(Icons.warning, size: 20), text: 'Dettes'),
            ],
          ),
        ),

        // Contenu des tabs
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              _buildSummaryTab(stats),
              _buildClientsTab(stats),
              _buildDeliverersTab(stats),
              _buildDebtsTab(),
            ],
          ),
        ),
      ],
    );
  }

  // Suite dans le prochain fichier...

  // ===== Onglet Résumé =====

  Widget _buildSummaryTab(FinancialStats stats) {
    return RefreshIndicator(
      onRefresh: () => _loadData(forceRefresh: true),
      color: _primaryColor,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Stats principales en grille
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 1.5,
              children: [
                FinancialStatCard(
                  title: 'Chiffre d\'affaires',
                  value: '${stats.totalRevenue.toStringAsFixed(0)} DA',
                  icon: Icons.trending_up,
                  color: _primaryColor,
                ),
                FinancialStatCard(
                  title: 'Collecté',
                  value: '${stats.totalCollected.toStringAsFixed(0)} DA',
                  icon: Icons.payments,
                  color: Colors.blue,
                ),
                FinancialStatCard(
                  title: 'Non payé',
                  value: '${stats.totalUnpaid.toStringAsFixed(0)} DA',
                  icon: Icons.money_off,
                  color: Colors.red,
                ),
                FinancialStatCard(
                  title: 'Commandes',
                  value: '${stats.orderCount}',
                  icon: Icons.shopping_bag,
                  color: Colors.purple,
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Statuts des commandes
            _buildStatusCard(stats),
            const SizedBox(height: 16),

            // Taux de recouvrement
            RecoveryRateCard(rate: stats.recoveryRate),
            const SizedBox(height: 16),

            // Top produits
            const Text(
              'Top Produits',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _buildTopList(
              data: stats.revenueByProduct,
              color: Colors.purple,
              icon: Icons.fastfood,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusCard(FinancialStats stats) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor.withValues(alpha: 0.05),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Statuts',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _buildStatusBadge('Livrées', stats.deliveredCount, Colors.green),
              const SizedBox(width: 12),
              _buildStatusBadge('En attente', stats.pendingCount, Colors.orange),
              const SizedBox(width: 12),
              _buildStatusBadge('Échouées', stats.failedCount, Colors.red),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatusBadge(String label, int count, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(
              '$count',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            Text(
              label,
              style: TextStyle(fontSize: 11, color: color),
            ),
          ],
        ),
      ),
    );
  }

  // ===== Onglet Clients =====

  Widget _buildClientsTab(FinancialStats stats) {
    final sortedClients = stats.revenueByClient.entries.toList()..sort((a, b) => b.value.compareTo(a.value));

    if (sortedClients.isEmpty) {
      return _buildEmptyState(
        icon: Icons.people_outline,
        message: 'Aucune donnée pour cette période',
      );
    }

    return RefreshIndicator(
      onRefresh: () => _loadData(forceRefresh: true),
      color: _primaryColor,
      child: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: sortedClients.length,
        itemBuilder: (context, index) {
          final client = sortedClients[index];
          final percentage = stats.totalRevenue > 0 ? (client.value / stats.totalRevenue * 100) : 0.0;

          // Trouver les infos du client
          final clientData = _clients.values.firstWhere(
            (c) => c['name'] == client.key,
            orElse: () => {'name': client.key},
          );

          return Card(
            margin: const EdgeInsets.only(bottom: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: _primaryColor.withValues(alpha: 0.1),
                child: Text(
                  client.key[0].toUpperCase(),
                  style: const TextStyle(
                    color: _primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              title: Text(
                client.key,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              subtitle: Row(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: LinearProgressIndicator(
                        value: percentage / 100,
                        backgroundColor: Colors.grey[200],
                        valueColor: const AlwaysStoppedAnimation(_primaryColor),
                        minHeight: 6,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '${percentage.toStringAsFixed(1)}%',
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                ],
              ),
              trailing: Text(
                '${client.value.toStringAsFixed(0)} DA',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: _primaryColor,
                  fontSize: 16,
                ),
              ),
              onTap: () {
                if (clientData['id'] != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ClientDetailPage(client: clientData),
                    ),
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }

  // ===== Onglet Livreurs =====

  Widget _buildDeliverersTab(FinancialStats stats) {
    final delivererList = stats.statsByDeliverer.values.toList()
      ..sort((a, b) => b.deliveredCount.compareTo(a.deliveredCount));

    if (delivererList.isEmpty) {
      return _buildEmptyState(
        icon: Icons.delivery_dining,
        message: 'Aucune livraison pour cette période',
      );
    }

    return RefreshIndicator(
      onRefresh: () => _loadData(forceRefresh: true),
      color: _primaryColor,
      child: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: delivererList.length,
        itemBuilder: (context, index) {
          final deliverer = delivererList[index];
          final successRate = deliverer.successRate;

          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.blue.withValues(alpha: 0.1),
                        child: const Icon(Icons.delivery_dining, color: Colors.blue),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              deliverer.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              '${deliverer.totalDeliveries} livraisons',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: successRate >= 90
                              ? Colors.green
                              : successRate >= 70
                                  ? Colors.orange
                                  : Colors.red,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          '${successRate.toStringAsFixed(0)}%',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      _buildDelivererStat(
                        'Livrées',
                        deliverer.deliveredCount,
                        Colors.green,
                      ),
                      const SizedBox(width: 12),
                      _buildDelivererStat(
                        'Échouées',
                        deliverer.failedCount,
                        Colors.red,
                      ),
                      const SizedBox(width: 12),
                      _buildDelivererStat(
                        'Collecté',
                        '${deliverer.amountCollected.toStringAsFixed(0)} DA',
                        Colors.blue,
                      ),
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
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Text(
              '$value',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: color,
                fontSize: 16,
              ),
            ),
            Text(
              label,
              style: TextStyle(fontSize: 11, color: color),
            ),
          ],
        ),
      ),
    );
  }

  // Suite dans le prochain message...

  // ===== Onglet Dettes =====

  Widget _buildDebtsTab() {
    if (_debts.isEmpty && !_debtFilter.hasFilters) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, size: 80, color: Colors.green),
            const SizedBox(height: 16),
            const Text(
              'Aucune dette!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            Text(
              'Tous les clients sont à jour',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
      );
    }

    final totalDebt = _debts.fold<double>(
      0,
      (sum, d) => sum + _parseDouble(d['total_debt']),
    );

    return RefreshIndicator(
      onRefresh: () => _loadData(forceRefresh: true),
      color: _primaryColor,
      child: Column(
        children: [
          // Filtres
          _buildDebtsFilters(),

          // Total dettes
          Container(
            margin: const EdgeInsets.all(12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.red.shade600, Colors.red.shade400],
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                const Icon(Icons.warning, color: Colors.white, size: 32),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total des dettes',
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.9),
                        ),
                      ),
                      Text(
                        '${totalDebt.toStringAsFixed(0)} DA',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '${_debts.length} clients',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),

          // Liste des dettes
          Expanded(
            child: _debts.isEmpty
                ? _buildEmptyState(
                    icon: Icons.filter_alt_off,
                    message: 'Aucun résultat',
                    subtitle: 'Essayez de modifier les filtres',
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    itemCount: _debts.length,
                    itemBuilder: (context, index) {
                      final debt = _debts[index];
                      return _buildDebtCard(debt);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildDebtCard(Map<String, dynamic> debt) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ExpansionTile(
        leading: CircleAvatar(
          backgroundColor: Colors.red.shade100,
          child: Text(
            (debt['name'] ?? 'C')[0].toUpperCase(),
            style: TextStyle(
              color: Colors.red.shade700,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(
          debt['name'] ?? 'Client',
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text('${debt['unpaid_orders'] ?? 0} commande(s) impayée(s)'),
        trailing: Text(
          '${_parseDouble(debt['total_debt']).toStringAsFixed(0)} DA',
          style: const TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                if (debt['email'] != null)
                  Row(
                    children: [
                      const Icon(Icons.email, size: 18, color: Colors.grey),
                      const SizedBox(width: 8),
                      Text(
                        debt['email'],
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ],
                  ),
                if (debt['phone'] != null) ...[
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.phone, size: 18, color: Colors.grey),
                      const SizedBox(width: 8),
                      Text(
                        debt['phone'],
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ],
                  ),
                ],
                if (debt['last_order_date'] != null) ...[
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.access_time, size: 18, color: Colors.grey),
                      const SizedBox(width: 8),
                      Text(
                        'Dernière: ${_formatDate(debt['last_order_date'])}',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ],
                  ),
                ],
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: () {
                      final clientData = _clients.values.firstWhere(
                        (c) => c['name'] == debt['name'],
                        orElse: () => debt,
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ClientDetailPage(client: clientData),
                        ),
                      );
                    },
                    icon: const Icon(Icons.visibility),
                    label: const Text('Voir fiche client'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: _primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDebtsFilters() {
    return Container(
      padding: const EdgeInsets.all(12),
      color: Colors.grey[100],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.filter_list, size: 20, color: Colors.grey[700]),
              const SizedBox(width: 8),
              const Text(
                'Filtres',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const Spacer(),
              if (_debtFilter.hasFilters)
                TextButton.icon(
                  onPressed: _clearDebtFilters,
                  icon: const Icon(Icons.clear, size: 18),
                  label: const Text('Réinitialiser'),
                  style: TextButton.styleFrom(foregroundColor: Colors.red),
                ),
            ],
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _buildFilterChip(
                label:
                    _debtFilter.customerId == null ? 'Client' : _clients[_debtFilter.customerId]?['name'] ?? 'Client',
                icon: Icons.person,
                isSelected: _debtFilter.customerId != null,
                onTap: _showClientFilter,
              ),
              _buildFilterChip(
                label: _debtFilter.delivererId == null
                    ? 'Livreur'
                    : _deliverers.firstWhere(
                        (d) => d['id'] == _debtFilter.delivererId,
                        orElse: () => {'name': 'Livreur'},
                      )['name'],
                icon: Icons.delivery_dining,
                isSelected: _debtFilter.delivererId != null,
                onTap: _showDelivererFilter,
              ),
              _buildFilterChip(
                label: _debtFilter.dateFrom == null && _debtFilter.dateTo == null
                    ? 'Période'
                    : '${_debtFilter.dateFrom != null ? _formatDate(_debtFilter.dateFrom.toString()) : '...'} - ${_debtFilter.dateTo != null ? _formatDate(_debtFilter.dateTo.toString()) : '...'}',
                icon: Icons.date_range,
                isSelected: _debtFilter.dateFrom != null || _debtFilter.dateTo != null,
                onTap: _showDateFilter,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip({
    required String label,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? _primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? _primaryColor : Colors.grey[300]!,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 16,
              color: isSelected ? Colors.white : Colors.grey[700],
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.grey[700],
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Suite dans le prochain message...

  // ===== Dialogs de filtres =====

  void _showClientFilter() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Filtrer par client',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: _clients.values
                    .map((client) => ListTile(
                          leading: CircleAvatar(
                            backgroundColor: _primaryColor.withValues(alpha: 0.1),
                            child: Text(
                              client['name'][0].toUpperCase(),
                              style: const TextStyle(color: _primaryColor),
                            ),
                          ),
                          title: Text(client['name']),
                          trailing: _debtFilter.customerId == client['id']
                              ? const Icon(Icons.check, color: _primaryColor)
                              : null,
                          onTap: () {
                            _updateDebtFilter(
                              _debtFilter.copyWith(customerId: client['id']),
                            );
                            Navigator.pop(context);
                          },
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDelivererFilter() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Filtrer par livreur',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: _deliverers
                    .map((deliverer) => ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.orange.withValues(alpha: 0.1),
                            child: const Icon(
                              Icons.delivery_dining,
                              color: Colors.orange,
                            ),
                          ),
                          title: Text(deliverer['name']),
                          trailing: _debtFilter.delivererId == deliverer['id']
                              ? const Icon(Icons.check, color: Colors.orange)
                              : null,
                          onTap: () {
                            _updateDebtFilter(
                              _debtFilter.copyWith(delivererId: deliverer['id']),
                            );
                            Navigator.pop(context);
                          },
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showDateFilter() async {
    final result = await showDialog<Map<String, DateTime?>>(
      context: context,
      builder: (context) => _DateRangeDialog(
        dateFrom: _debtFilter.dateFrom,
        dateTo: _debtFilter.dateTo,
      ),
    );

    if (result != null) {
      _updateDebtFilter(
        _debtFilter.copyWith(
          dateFrom: result['from'],
          dateTo: result['to'],
        ),
      );
    }
  }

  // ===== Widgets utilitaires =====

  Widget _buildCalendar() {
    return Container(
      color: Theme.of(context).cardColor,
      child: TableCalendar(
        firstDay: DateTime(2024),
        lastDay: DateTime.now().add(const Duration(days: 1)),
        focusedDay: _focusedDay,
        selectedDayPredicate: (day) => isSameDay(_selectedDate, day),
        headerStyle: const HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          titleTextStyle: TextStyle(fontWeight: FontWeight.bold),
        ),
        calendarStyle: CalendarStyle(
          selectedDecoration: const BoxDecoration(
            color: _primaryColor,
            shape: BoxShape.circle,
          ),
          todayDecoration: BoxDecoration(
            color: _primaryColor.withValues(alpha: 0.3),
            shape: BoxShape.circle,
          ),
        ),
        onDaySelected: _onDateSelected,
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
              return const Positioned(
                bottom: 1,
                child: SizedBox(
                  width: 6,
                  height: 6,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: _primaryColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              );
            }
            return null;
          },
        ),
      ),
    );
  }

  Widget _buildTopList({
    required Map<String, double> data,
    required Color color,
    required IconData icon,
  }) {
    final sorted = data.entries.toList()..sort((a, b) => b.value.compareTo(a.value));
    final top5 = sorted.take(5).toList();

    if (top5.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Center(
          child: Text(
            'Aucune donnée',
            style: TextStyle(color: Colors.grey),
          ),
        ),
      );
    }

    final maxValue = top5.first.value;

    return Column(
      children: top5.asMap().entries.map((entry) {
        final index = entry.key;
        final item = entry.value;
        final percentage = maxValue > 0 ? item.value / maxValue : 0.0;

        return Container(
          margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).shadowColor.withValues(alpha: 0.05),
                blurRadius: 4,
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    '${index + 1}',
                    style: TextStyle(
                      color: color,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.key,
                      style: const TextStyle(fontWeight: FontWeight.w500),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: LinearProgressIndicator(
                        value: percentage,
                        backgroundColor: Colors.grey[200],
                        valueColor: AlwaysStoppedAnimation(color),
                        minHeight: 6,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Text(
                '${item.value.toStringAsFixed(0)} DA',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildEmptyState({
    required IconData icon,
    required String message,
    String? subtitle,
  }) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 64, color: Colors.grey[400]),
          const SizedBox(height: 16),
          Text(
            message,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (subtitle != null)
            Text(
              subtitle,
              style: TextStyle(color: Colors.grey[600]),
            ),
        ],
      ),
    );
  }

  // ===== Helpers =====

  double _parseDouble(dynamic value) {
    if (value == null) return 0;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) return double.tryParse(value) ?? 0.0;
    return 0;
  }

  String _formatDate(String? dateStr) {
    if (dateStr == null) return 'N/A';
    final date = DateTime.tryParse(dateStr);
    if (date == null) return 'N/A';
    return '${date.day}/${date.month}/${date.year}';
  }
}

// ===== Dialog pour sélectionner une plage de dates =====

class _DateRangeDialog extends StatefulWidget {
  const _DateRangeDialog({this.dateFrom, this.dateTo});
  final DateTime? dateFrom;
  final DateTime? dateTo;

  @override
  _DateRangeDialogState createState() => _DateRangeDialogState();
}

class _DateRangeDialogState extends State<_DateRangeDialog> {
  DateTime? _from;
  DateTime? _to;

  @override
  void initState() {
    super.initState();
    _from = widget.dateFrom;
    _to = widget.dateTo;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Filtrer par période'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.calendar_today, color: Color(0xFF2E7D32)),
            title: const Text('Du'),
            subtitle: Text(
              _from != null ? '${_from!.day}/${_from!.month}/${_from!.year}' : 'Non défini',
            ),
            onTap: () async {
              final date = await showDatePicker(
                context: context,
                initialDate: _from ?? DateTime.now(),
                firstDate: DateTime(2020),
                lastDate: DateTime.now(),
              );
              if (date != null) setState(() => _from = date);
            },
          ),
          ListTile(
            leading: const Icon(Icons.calendar_today, color: Color(0xFF2E7D32)),
            title: const Text('Au'),
            subtitle: Text(
              _to != null ? '${_to!.day}/${_to!.month}/${_to!.year}' : 'Non défini',
            ),
            onTap: () async {
              final date = await showDatePicker(
                context: context,
                initialDate: _to ?? DateTime.now(),
                firstDate: _from ?? DateTime(2020),
                lastDate: DateTime.now(),
              );
              if (date != null) setState(() => _to = date);
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Annuler'),
        ),
        TextButton(
          onPressed: () {
            setState(() {
              _from = null;
              _to = null;
            });
          },
          child: const Text('Effacer', style: TextStyle(color: Colors.red)),
        ),
        ElevatedButton(
          onPressed: () => Navigator.pop(context, {'from': _from, 'to': _to}),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF2E7D32),
          ),
          child: const Text(
            'Appliquer',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
