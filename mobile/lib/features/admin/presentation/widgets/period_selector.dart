// =====================================================
// WIDGET : Sélecteur de Période
// =====================================================

import 'package:flutter/material.dart';

import '../../models/financial_stats.dart';

/// Widget pour sélectionner et naviguer dans les périodes
class PeriodSelector extends StatelessWidget {
  const PeriodSelector({
    required this.selectedPeriod,
    required this.periodLabel,
    required this.onCalendarToggle,
    required this.onExport,
    required this.onPreviousPeriod,
    required this.onNextPeriod,
    required this.onPeriodChanged,
    this.primaryColor = const Color(0xFF2E7D32),
    super.key,
  });
  final PeriodFilter selectedPeriod;
  final String periodLabel;
  final VoidCallback onCalendarToggle;
  final VoidCallback onExport;
  final VoidCallback onPreviousPeriod;
  final VoidCallback onNextPeriod;
  final Function(PeriodFilter) onPeriodChanged;
  final Color primaryColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        children: [
          // Chips de sélection de période
          Row(
            children: [
              _buildPeriodChip(PeriodFilter.day),
              const SizedBox(width: 8),
              _buildPeriodChip(PeriodFilter.week),
              const SizedBox(width: 8),
              _buildPeriodChip(PeriodFilter.month),
              const Spacer(),
              // Bouton calendrier
              _buildIconButton(
                icon: Icons.calendar_month,
                onTap: onCalendarToggle,
              ),
              const SizedBox(width: 8),
              // Bouton export
              _buildIconButton(
                icon: Icons.download,
                onTap: onExport,
                filled: true,
              ),
            ],
          ),
          const SizedBox(height: 8),
          // Label et navigation
          Row(
            children: [
              Icon(Icons.date_range, color: primaryColor, size: 18),
              const SizedBox(width: 8),
              Text(
                periodLabel,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: primaryColor,
                ),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.chevron_left, size: 20),
                onPressed: onPreviousPeriod,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
              IconButton(
                icon: const Icon(Icons.chevron_right, size: 20),
                onPressed: onNextPeriod,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPeriodChip(PeriodFilter period) {
    final isSelected = selectedPeriod == period;
    return GestureDetector(
      onTap: () => onPeriodChanged(period),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: primaryColor),
        ),
        child: Text(
          period.label,
          style: TextStyle(
            color: isSelected ? Colors.white : primaryColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildIconButton({
    required IconData icon,
    required VoidCallback onTap,
    bool filled = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: filled ? primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: primaryColor),
        ),
        child: Icon(
          icon,
          color: filled ? Colors.white : primaryColor,
          size: 20,
        ),
      ),
    );
  }
}
