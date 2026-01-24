// =====================================================
// SERVICE : Filtrage par Période
// =====================================================

import '../models/financial_stats.dart';

/// Service responsable du filtrage des données par période
class PeriodFilterService {
  /// Filtre les commandes selon la période sélectionnée
  static List<dynamic> filterOrdersByPeriod({
    required List<dynamic> orders,
    required PeriodFilter period,
    required DateTime selectedDate,
  }) {
    final selected = _normalizeDate(selectedDate);

    return orders.where((order) {
      final orderDate = DateTime.tryParse(order['createdAt'] ?? '');
      if (orderDate == null) return false;

      final orderDay = _normalizeDate(orderDate);

      switch (period) {
        case PeriodFilter.day:
          return _isSameDay(orderDay, selected);

        case PeriodFilter.week:
          return _isInSameWeek(orderDay, selected);

        case PeriodFilter.month:
          return _isInSameMonth(orderDay, selected);
      }
    }).toList();
  }

  /// Filtre les livraisons selon la période sélectionnée
  static List<dynamic> filterDeliveriesByPeriod({
    required List<dynamic> deliveries,
    required PeriodFilter period,
    required DateTime selectedDate,
  }) {
    final selected = _normalizeDate(selectedDate);

    return deliveries.where((delivery) {
      final deliveryDate = DateTime.tryParse(delivery['createdAt'] ?? '');
      if (deliveryDate == null) return false;

      final deliveryDay = _normalizeDate(deliveryDate);

      switch (period) {
        case PeriodFilter.day:
          return _isSameDay(deliveryDay, selected);

        case PeriodFilter.week:
          return _isInSameWeek(deliveryDay, selected);

        case PeriodFilter.month:
          return _isInSameMonth(deliveryDay, selected);
      }
    }).toList();
  }

  /// Génère le label de la période sélectionnée
  static String getPeriodLabel(PeriodFilter period, DateTime selectedDate) {
    switch (period) {
      case PeriodFilter.day:
        return _getDayLabel(selectedDate);

      case PeriodFilter.week:
        return _getWeekLabel(selectedDate);

      case PeriodFilter.month:
        return _getMonthLabel(selectedDate);
    }
  }

  /// Navigue vers la période suivante ou précédente
  static DateTime navigatePeriod({
    required PeriodFilter period,
    required DateTime currentDate,
    required int direction, // -1 pour précédent, +1 pour suivant
  }) {
    switch (period) {
      case PeriodFilter.day:
        return currentDate.add(Duration(days: direction));

      case PeriodFilter.week:
        return currentDate.add(Duration(days: 7 * direction));

      case PeriodFilter.month:
        return DateTime(
          currentDate.year,
          currentDate.month + direction,
          currentDate.day,
        );
    }
  }

  // ===== Méthodes privées =====

  /// Normalise une date (supprime l'heure)
  static DateTime _normalizeDate(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  /// Vérifie si deux dates sont le même jour
  static bool _isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year && date1.month == date2.month && date1.day == date2.day;
  }

  /// Vérifie si deux dates sont dans la même semaine
  static bool _isInSameWeek(DateTime date, DateTime reference) {
    final weekStart = reference.subtract(Duration(days: reference.weekday - 1));
    final weekEnd = weekStart.add(Duration(days: 6));
    return !date.isBefore(weekStart) && !date.isAfter(weekEnd);
  }

  /// Vérifie si deux dates sont dans le même mois
  static bool _isInSameMonth(DateTime date, DateTime reference) {
    return date.year == reference.year && date.month == reference.month;
  }

  /// Génère le label pour un jour
  static String _getDayLabel(DateTime date) {
    final now = DateTime.now();
    if (_isSameDay(date, now)) {
      return "Aujourd'hui";
    }
    return '${date.day}/${date.month}/${date.year}';
  }

  /// Génère le label pour une semaine
  static String _getWeekLabel(DateTime date) {
    final weekStart = date.subtract(Duration(days: date.weekday - 1));
    final weekEnd = weekStart.add(Duration(days: 6));
    return '${weekStart.day}/${weekStart.month} - ${weekEnd.day}/${weekEnd.month}';
  }

  /// Génère le label pour un mois
  static String _getMonthLabel(DateTime date) {
    const months = [
      '',
      'Janvier',
      'Février',
      'Mars',
      'Avril',
      'Mai',
      'Juin',
      'Juillet',
      'Août',
      'Septembre',
      'Octobre',
      'Novembre',
      'Décembre'
    ];
    return '${months[date.month]} ${date.year}';
  }
}
