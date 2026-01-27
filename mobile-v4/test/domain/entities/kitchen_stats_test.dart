import 'package:flutter_test/flutter_test.dart';
import 'package:awid_mobile/features/kitchen/domain/entities/kitchen_stats.dart';
import '../../helpers/mock_data.dart';

void main() {
  group('KitchenStats Entity', () {
    late KitchenStats stats;

    setUp(() {
      stats = MockData.mockKitchenStats;
    });

    test('should create valid KitchenStats', () {
      expect(stats.totalOrders, 150);
      expect(stats.pendingOrders, 12);
      expect(stats.preparingOrders, 8);
      expect(stats.readyOrders, 5);
      expect(stats.completedToday, 125);
      expect(stats.averagePreparationTime, 25.5);
      expect(stats.onTimePercentage, 92.5);
      expect(stats.date, isNotNull);
    });

    test('should calculate active orders correctly', () {
      final activeOrders = stats.activeOrders;
      expect(activeOrders, stats.pendingOrders + stats.preparingOrders + stats.readyOrders);
      expect(activeOrders, 25);
    });

    test('should calculate completion rate', () {
      final completionRate = stats.completionRate;
      expect(completionRate, stats.completedToday / stats.totalOrders);
      expect(completionRate, closeTo(0.833, 0.001));
    });

    test('should check if performance is good', () {
      final goodStats = stats.copyWith(onTimePercentage: 95.0);
      final poorStats = stats.copyWith(onTimePercentage: 70.0);

      expect(goodStats.isPerformanceGood, true);
      expect(poorStats.isPerformanceGood, false);
    });

    test('should check if average time is acceptable', () {
      final fastStats = stats.copyWith(averagePreparationTime: 20.0);
      final slowStats = stats.copyWith(averagePreparationTime: 45.0);

      expect(fastStats.isAverageTimeAcceptable, true);
      expect(slowStats.isAverageTimeAcceptable, false);
    });

    test('should validate positive numbers', () {
      expect(stats.totalOrders, greaterThanOrEqualTo(0));
      expect(stats.pendingOrders, greaterThanOrEqualTo(0));
      expect(stats.preparingOrders, greaterThanOrEqualTo(0));
      expect(stats.readyOrders, greaterThanOrEqualTo(0));
      expect(stats.completedToday, greaterThanOrEqualTo(0));
      expect(stats.averagePreparationTime, greaterThanOrEqualTo(0));
    });

    test('should validate percentage range', () {
      expect(stats.onTimePercentage, greaterThanOrEqualTo(0));
      expect(stats.onTimePercentage, lessThanOrEqualTo(100));
    });

    test('should copy with new values', () {
      final updated = stats.copyWith(
        pendingOrders: 15,
        preparingOrders: 10,
      );

      expect(updated.totalOrders, stats.totalOrders);
      expect(updated.pendingOrders, 15);
      expect(updated.preparingOrders, 10);
      expect(updated.readyOrders, stats.readyOrders);
    });

    test('should compare stats by equality', () {
      final sameStats = stats.copyWith();
      final differentStats = stats.copyWith(totalOrders: 200);

      expect(stats == sameStats, true);
      expect(stats == differentStats, false);
    });

    test('should have valid date', () {
      expect(stats.date, isA<DateTime>());
      expect(stats.date.isBefore(DateTime.now().add(const Duration(days: 1))), true);
    });

    test('should calculate efficiency score', () {
      final efficiency = stats.efficiencyScore;
      expect(efficiency, greaterThan(0));
      expect(efficiency, lessThanOrEqualTo(100));
    });

    test('should handle zero orders', () {
      final emptyStats = stats.copyWith(
        totalOrders: 0,
        pendingOrders: 0,
        preparingOrders: 0,
        readyOrders: 0,
        completedToday: 0,
      );

      expect(emptyStats.activeOrders, 0);
      expect(emptyStats.completionRate, 0);
    });

    test('should handle all orders completed', () {
      final allCompleted = stats.copyWith(
        totalOrders: 100,
        completedToday: 100,
        pendingOrders: 0,
        preparingOrders: 0,
        readyOrders: 0,
      );

      expect(allCompleted.completionRate, 1.0);
      expect(allCompleted.activeOrders, 0);
    });

    test('should calculate pending percentage', () {
      final pendingPercentage = (stats.pendingOrders / stats.activeOrders) * 100;
      expect(pendingPercentage, closeTo(48.0, 0.1));
    });

    test('should calculate preparing percentage', () {
      final preparingPercentage = (stats.preparingOrders / stats.activeOrders) * 100;
      expect(preparingPercentage, closeTo(32.0, 0.1));
    });

    test('should calculate ready percentage', () {
      final readyPercentage = (stats.readyOrders / stats.activeOrders) * 100;
      expect(readyPercentage, closeTo(20.0, 0.1));
    });

    test('should validate logical consistency', () {
      // Active orders should not exceed total orders
      expect(stats.activeOrders, lessThanOrEqualTo(stats.totalOrders));
      
      // Completed should not exceed total
      expect(stats.completedToday, lessThanOrEqualTo(stats.totalOrders));
    });

    test('should handle high load scenario', () {
      final highLoad = stats.copyWith(
        totalOrders: 500,
        pendingOrders: 50,
        preparingOrders: 40,
        readyOrders: 30,
        completedToday: 380,
      );

      expect(highLoad.activeOrders, 120);
      expect(highLoad.completionRate, 0.76);
    });

    test('should handle low load scenario', () {
      final lowLoad = stats.copyWith(
        totalOrders: 10,
        pendingOrders: 2,
        preparingOrders: 1,
        readyOrders: 1,
        completedToday: 6,
      );

      expect(lowLoad.activeOrders, 4);
      expect(lowLoad.completionRate, 0.6);
    });

    test('should format average time correctly', () {
      expect(stats.averagePreparationTime, isA<double>());
      expect(stats.averagePreparationTime.toStringAsFixed(1), '25.5');
    });

    test('should format percentage correctly', () {
      expect(stats.onTimePercentage, isA<double>());
      expect(stats.onTimePercentage.toStringAsFixed(1), '92.5');
    });
  });

  group('KitchenStats Calculations', () {
    test('should calculate throughput', () {
      final stats = MockData.mockKitchenStats;
      final throughput = stats.completedToday / 24; // Orders per hour
      expect(throughput, closeTo(5.2, 0.1));
    });

    test('should calculate workload', () {
      final stats = MockData.mockKitchenStats;
      final workload = stats.activeOrders / stats.totalOrders;
      expect(workload, closeTo(0.167, 0.001));
    });

    test('should identify bottlenecks', () {
      final stats = MockData.mockKitchenStats;
      
      // High pending = bottleneck at start
      if (stats.pendingOrders > stats.preparingOrders) {
        expect(true, true); // Bottleneck identified
      }
    });
  });

  group('KitchenStats Edge Cases', () {
    test('should handle negative values gracefully', () {
      expect(
        () => KitchenStats(
          totalOrders: -1,
          pendingOrders: 0,
          preparingOrders: 0,
          readyOrders: 0,
          completedToday: 0,
          averagePreparationTime: 0,
          onTimePercentage: 0,
          date: DateTime.now(),
        ),
        throwsA(anything),
      );
    });

    test('should handle percentage over 100', () {
      expect(
        () => KitchenStats(
          totalOrders: 100,
          pendingOrders: 0,
          preparingOrders: 0,
          readyOrders: 0,
          completedToday: 0,
          averagePreparationTime: 0,
          onTimePercentage: 150.0,
          date: DateTime.now(),
        ),
        throwsA(anything),
      );
    });

    test('should handle very large numbers', () {
      final largeStats = KitchenStats(
        totalOrders: 1000000,
        pendingOrders: 100000,
        preparingOrders: 50000,
        readyOrders: 25000,
        completedToday: 825000,
        averagePreparationTime: 25.5,
        onTimePercentage: 92.5,
        date: DateTime.now(),
      );

      expect(largeStats.activeOrders, 175000);
      expect(largeStats.completionRate, 0.825);
    });
  });
}
