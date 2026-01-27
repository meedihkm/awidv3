import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

/// Widget de graphique pour les statistiques
class StatsChart extends StatelessWidget {
  final String title;
  final Map<String, int> data;

  const StatsChart({
    super.key,
    required this.title,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: _getMaxValue() * 1.2,
                  barTouchData: BarTouchData(
                    enabled: true,
                    touchTooltipData: BarTouchTooltipData(
                      getTooltipItem: (group, groupIndex, rod, rodIndex) {
                        final hour = data.keys.elementAt(groupIndex);
                        return BarTooltipItem(
                          '$hour\n${rod.toY.toInt()}',
                          const TextStyle(color: Colors.white),
                        );
                      },
                    ),
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          if (value.toInt() >= 0 && value.toInt() < data.length) {
                            final hour = data.keys.elementAt(value.toInt());
                            return Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text(
                                hour,
                                style: const TextStyle(fontSize: 10),
                              ),
                            );
                          }
                          return const Text('');
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        getTitlesWidget: (value, meta) {
                          return Text(
                            value.toInt().toString(),
                            style: const TextStyle(fontSize: 10),
                          );
                        },
                      ),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: false,
                    horizontalInterval: _getMaxValue() / 5,
                  ),
                  borderData: FlBorderData(show: false),
                  barGroups: _buildBarGroups(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Construire les groupes de barres
  List<BarChartGroupData> _buildBarGroups() {
    return data.entries.map((entry) {
      final index = data.keys.toList().indexOf(entry.key);
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: entry.value.toDouble(),
            color: Colors.blue,
            width: 16,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
          ),
        ],
      );
    }).toList();
  }

  /// Obtenir la valeur maximale
  double _getMaxValue() {
    if (data.isEmpty) return 10;
    return data.values.reduce((a, b) => a > b ? a : b).toDouble();
  }
}
