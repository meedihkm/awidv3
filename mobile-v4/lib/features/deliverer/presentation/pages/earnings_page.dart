import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:fl_chart/fl_chart.dart';

import '../providers/delivery_actions_provider.dart';

/// Page des gains du livreur
class EarningsPage extends ConsumerStatefulWidget {
  final String delivererId;

  const EarningsPage({
    super.key,
    required this.delivererId,
  });

  @override
  ConsumerState<EarningsPage> createState() => _EarningsPageState();
}

class _EarningsPageState extends ConsumerState<EarningsPage> {
  DateTime? _startDate;
  DateTime? _endDate;
  String _selectedPeriod = 'month'; // week, month, year, custom

  @override
  void initState() {
    super.initState();
    _setDefaultPeriod();
  }

  void _setDefaultPeriod() {
    final now = DateTime.now();
    switch (_selectedPeriod) {
      case 'week':
        _startDate = now.subtract(const Duration(days: 7));
        _endDate = now;
        break;
      case 'month':
        _startDate = DateTime(now.year, now.month, 1);
        _endDate = now;
        break;
      case 'year':
        _startDate = DateTime(now.year, 1, 1);
        _endDate = now;
        break;
      default:
        _startDate = DateTime(now.year, now.month, 1);
        _endDate = now;
    }
  }

  @override
  Widget build(BuildContext context) {
    final earningsParams = EarningsParams(
      delivererId: widget.delivererId,
      startDate: _startDate,
      endDate: _endDate,
    );

    final statsParams = StatsParams(
      delivererId: widget.delivererId,
      startDate: _startDate,
      endDate: _endDate,
    );

    final earningsAsync = ref.watch(delivererEarningsProvider(earningsParams));
    final statsAsync = ref.watch(detailedStatsProvider(statsParams));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mes Gains'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: _showPeriodSelector,
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.refresh(delivererEarningsProvider(earningsParams));
          ref.refresh(detailedStatsProvider(statsParams));
        },
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Period Selector
            _buildPeriodChips(),
            const SizedBox(height: 16),

            // Earnings Summary
            earningsAsync.when(
              loading: () => const Card(
                child: Padding(
                  padding: EdgeInsets.all(32),
                  child: Center(child: CircularProgressIndicator()),
                ),
              ),
              error: (error, stack) => Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      const Icon(Icons.error_outline, size: 48, color: Colors.red),
                      const SizedBox(height: 8),
                      Text('Erreur: $error'),
                    ],
                  ),
                ),
              ),
              data: (earnings) => _buildEarningsSummary(earnings),
            ),
            const SizedBox(height: 16),

            // Detailed Stats
            statsAsync.when(
              loading: () => const Card(
                child: Padding(
                  padding: EdgeInsets.all(32),
                  child: Center(child: CircularProgressIndicator()),
                ),
              ),
              error: (error, stack) => const SizedBox.shrink(),
              data: (stats) => Column(
                children: [
                  _buildStatsCards(stats),
                  const SizedBox(height: 16),
                  _buildPerformanceChart(stats),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPeriodChips() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildPeriodChip('Semaine', 'week'),
          const SizedBox(width: 8),
          _buildPeriodChip('Mois', 'month'),
          const SizedBox(width: 8),
          _buildPeriodChip('Année', 'year'),
          const SizedBox(width: 8),
          _buildPeriodChip('Personnalisé', 'custom'),
        ],
      ),
    );
  }

  Widget _buildPeriodChip(String label, String value) {
    final isSelected = _selectedPeriod == value;
    
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) {
        if (selected) {
          setState(() {
            _selectedPeriod = value;
            if (value != 'custom') {
              _setDefaultPeriod();
            } else {
              _showCustomPeriodDialog();
            }
          });
        }
      },
    );
  }

  Widget _buildEarningsSummary(DelivererEarnings earnings) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'Gains Totaux',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.grey.shade600,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              NumberFormat.currency(symbol: '€').format(earnings.totalEarnings),
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
            ),
            const SizedBox(height: 4),
            Text(
              '${DateFormat('dd/MM').format(_startDate!)} - ${DateFormat('dd/MM').format(_endDate!)}',
              style: TextStyle(color: Colors.grey.shade600),
            ),
            const Divider(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildEarningsItem(
                  'Livraisons',
                  '${earnings.deliveryCount}',
                  Icons.local_shipping,
                  Colors.blue,
                ),
                _buildEarningsItem(
                  'Commission',
                  NumberFormat.currency(symbol: '€', decimalDigits: 0).format(earnings.commissionEarned),
                  Icons.attach_money,
                  Colors.orange,
                ),
                _buildEarningsItem(
                  'Bonus',
                  NumberFormat.currency(symbol: '€', decimalDigits: 0).format(earnings.bonusEarned),
                  Icons.star,
                  Colors.amber,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEarningsItem(String label, String value, IconData icon, Color color) {
    return Column(
      children: [
        Icon(icon, color: color, size: 28),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }

  Widget _buildStatsCards(DelivererDetailedStats stats) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildStatCard(
                'Taux Réussite',
                '${stats.successRate.toStringAsFixed(1)}%',
                Icons.check_circle,
                Colors.green,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildStatCard(
                'Temps Moyen',
                '${stats.averageDeliveryTime.toStringAsFixed(0)} min',
                Icons.timer,
                Colors.blue,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildStatCard(
                'Distance',
                '${stats.totalDistance.toStringAsFixed(1)} km',
                Icons.route,
                Colors.purple,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildStatCard(
                'Paiements',
                NumberFormat.currency(symbol: '€', decimalDigits: 0).format(stats.totalPaymentsCollected),
                Icons.payment,
                Colors.orange,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatCard(String label, String value, IconData icon, Color color) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(icon, color: color, size: 32),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade600,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPerformanceChart(DelivererDetailedStats stats) {
    if (stats.dailyEarnings.isEmpty) {
      return const SizedBox.shrink();
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Performance Quotidienne',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: true),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        getTitlesWidget: (value, meta) {
                          return Text(
                            '${value.toInt()}€',
                            style: const TextStyle(fontSize: 10),
                          );
                        },
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          if (value.toInt() >= 0 && value.toInt() < stats.dailyEarnings.length) {
                            final date = stats.dailyEarnings[value.toInt()].date;
                            return Text(
                              DateFormat('dd/MM').format(date),
                              style: const TextStyle(fontSize: 10),
                            );
                          }
                          return const Text('');
                        },
                      ),
                    ),
                    rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  ),
                  borderData: FlBorderData(show: true),
                  lineBarsData: [
                    LineChartBarData(
                      spots: stats.dailyEarnings.asMap().entries.map((entry) {
                        return FlSpot(
                          entry.key.toDouble(),
                          entry.value.earnings,
                        );
                      }).toList(),
                      isCurved: true,
                      color: Colors.green,
                      barWidth: 3,
                      dotData: FlDotData(show: true),
                      belowBarData: BarAreaData(
                        show: true,
                        color: Colors.green.withOpacity(0.1),
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

  void _showPeriodSelector() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sélectionner une période',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.calendar_view_week),
              title: const Text('Cette semaine'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _selectedPeriod = 'week';
                  _setDefaultPeriod();
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.calendar_view_month),
              title: const Text('Ce mois'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _selectedPeriod = 'month';
                  _setDefaultPeriod();
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.calendar_today),
              title: const Text('Cette année'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _selectedPeriod = 'year';
                  _setDefaultPeriod();
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.date_range),
              title: const Text('Période personnalisée'),
              onTap: () {
                Navigator.pop(context);
                _showCustomPeriodDialog();
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showCustomPeriodDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Période personnalisée'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            OutlinedButton.icon(
              icon: const Icon(Icons.calendar_today),
              label: Text(
                _startDate != null
                    ? 'Début: ${DateFormat('dd/MM/yyyy').format(_startDate!)}'
                    : 'Sélectionner date début',
              ),
              onPressed: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: _startDate ?? DateTime.now(),
                  firstDate: DateTime(2020),
                  lastDate: DateTime.now(),
                );
                if (date != null) {
                  setState(() => _startDate = date);
                }
              },
            ),
            const SizedBox(height: 12),
            OutlinedButton.icon(
              icon: const Icon(Icons.calendar_today),
              label: Text(
                _endDate != null
                    ? 'Fin: ${DateFormat('dd/MM/yyyy').format(_endDate!)}'
                    : 'Sélectionner date fin',
              ),
              onPressed: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: _endDate ?? DateTime.now(),
                  firstDate: _startDate ?? DateTime(2020),
                  lastDate: DateTime.now(),
                );
                if (date != null) {
                  setState(() => _endDate = date);
                }
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annuler'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                _selectedPeriod = 'custom';
              });
            },
            child: const Text('Appliquer'),
          ),
        ],
      ),
    );
  }
}
