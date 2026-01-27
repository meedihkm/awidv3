import 'package:awid_mobile/features/kitchen/domain/entities/kitchen_stats.dart';
import 'package:awid_mobile/features/kitchen/domain/repositories/kitchen_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider pour les statistiques cuisine
final kitchenStatsProvider = FutureProvider.autoDispose<KitchenStats>((ref) async {
  // TODO: Injecter repository
  throw UnimplementedError('Repository not configured');
});

/// Provider pour les statistiques par période
final periodStatsProvider = FutureProvider.family.autoDispose<PeriodStats, DateRange>(
  (ref, dateRange) async {
    // TODO: Implémenter
    throw UnimplementedError();
  },
);

/// Provider pour les statistiques horaires
final hourlyStatsProvider = FutureProvider.autoDispose<List<HourlyStats>>((ref) async {
  // TODO: Implémenter
  throw UnimplementedError();
});

/// Range de dates pour les statistiques
class DateRange {
  final DateTime startDate;
  final DateTime endDate;

  DateRange(this.startDate, this.endDate);
}
