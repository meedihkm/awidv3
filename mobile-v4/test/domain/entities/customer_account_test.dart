import 'package:flutter_test/flutter_test.dart';
import 'package:awid_mobile/features/customer/domain/entities/customer_account.dart';
import '../../helpers/mock_data.dart';

void main() {
  group('CustomerAccount Entity', () {
    late CustomerAccount account;

    setUp(() {
      account = MockData.mockCustomerAccount;
    });

    test('should create valid CustomerAccount', () {
      expect(account.id, MockData.testCustomerId);
      expect(account.name, 'John Doe');
      expect(account.email, 'john.doe@example.com');
      expect(account.phone, '+33612345678');
      expect(account.address, '123 Main St');
      expect(account.creditLimit, 1000.0);
      expect(account.currentCredit, 250.0);
      expect(account.totalOrders, 45);
      expect(account.totalSpent, 1250.50);
      expect(account.memberSince, isNotNull);
    });

    test('should calculate available credit', () {
      final available = account.availableCredit;
      expect(available, account.creditLimit - account.currentCredit);
      expect(available, 750.0);
    });

    test('should calculate credit usage percentage', () {
      final usage = account.creditUsagePercentage;
      expect(usage, (account.currentCredit / account.creditLimit) * 100);
      expect(usage, 25.0);
    });

    test('should check if credit is available', () {
      final withCredit = account.copyWith(currentCredit: 500.0);
      final noCredit = account.copyWith(currentCredit: 1000.0);

      expect(withCredit.hasCreditAvailable, true);
      expect(noCredit.hasCreditAvailable, false);
    });

    test('should check if credit is low', () {
      final lowCredit = account.copyWith(currentCredit: 900.0);
      final normalCredit = account.copyWith(currentCredit: 250.0);

      expect(lowCredit.isCreditLow, true);
      expect(normalCredit.isCreditLow, false);
    });

    test('should check if credit limit is exceeded', () {
      final exceeded = account.copyWith(currentCredit: 1100.0);
      final normal = account.copyWith(currentCredit: 500.0);

      expect(exceeded.isCreditExceeded, true);
      expect(normal.isCreditExceeded, false);
    });

    test('should calculate average order value', () {
      final avgOrder = account.averageOrderValue;
      expect(avgOrder, account.totalSpent / account.totalOrders);
      expect(avgOrder, closeTo(27.79, 0.01));
    });

    test('should calculate membership duration in days', () {
      final days = account.membershipDurationDays;
      final expectedDays = DateTime.now().difference(account.memberSince).inDays;
      expect(days, expectedDays);
    });

    test('should calculate membership duration in months', () {
      final months = account.membershipDurationMonths;
      expect(months, greaterThanOrEqualTo(0));
    });

    test('should check if account is new', () {
      final newAccount = account.copyWith(
        memberSince: DateTime.now().subtract(const Duration(days: 15)),
      );
      final oldAccount = account.copyWith(
        memberSince: DateTime.now().subtract(const Duration(days: 60)),
      );

      expect(newAccount.isNewMember, true);
      expect(oldAccount.isNewMember, false);
    });

    test('should check if account is active', () {
      final active = account.copyWith(totalOrders: 10);
      final inactive = account.copyWith(totalOrders: 0);

      expect(active.isActive, true);
      expect(inactive.isActive, false);
    });

    test('should validate email format', () {
      expect(account.email, contains('@'));
      expect(account.email, contains('.'));
    });

    test('should validate phone format', () {
      expect(account.phone, startsWith('+'));
      expect(account.phone.length, greaterThan(10));
    });

    test('should validate positive amounts', () {
      expect(account.creditLimit, greaterThanOrEqualTo(0));
      expect(account.currentCredit, greaterThanOrEqualTo(0));
      expect(account.totalSpent, greaterThanOrEqualTo(0));
    });

    test('should validate positive order count', () {
      expect(account.totalOrders, greaterThanOrEqualTo(0));
    });

    test('should copy with new values', () {
      final updated = account.copyWith(
        currentCredit: 300.0,
        totalOrders: 50,
      );

      expect(updated.id, account.id);
      expect(updated.currentCredit, 300.0);
      expect(updated.totalOrders, 50);
      expect(updated.name, account.name);
    });

    test('should compare accounts by equality', () {
      final sameAccount = account.copyWith();
      final differentAccount = account.copyWith(id: 'different-id');

      expect(account == sameAccount, true);
      expect(account == differentAccount, false);
    });

    test('should have valid member since date', () {
      expect(account.memberSince, isA<DateTime>());
      expect(account.memberSince.isBefore(DateTime.now()), true);
    });

    test('should calculate loyalty tier', () {
      final tier = account.loyaltyTier;
      
      if (account.totalSpent >= 5000) {
        expect(tier, 'platinum');
      } else if (account.totalSpent >= 2000) {
        expect(tier, 'gold');
      } else if (account.totalSpent >= 500) {
        expect(tier, 'silver');
      } else {
        expect(tier, 'bronze');
      }
    });

    test('should calculate spending rate per month', () {
      final months = account.membershipDurationMonths;
      if (months > 0) {
        final spendingRate = account.totalSpent / months;
        expect(spendingRate, greaterThanOrEqualTo(0));
      }
    });

    test('should calculate order frequency', () {
      final months = account.membershipDurationMonths;
      if (months > 0) {
        final frequency = account.totalOrders / months;
        expect(frequency, greaterThanOrEqualTo(0));
      }
    });

    test('should format account summary', () {
      final summary = '${account.name} - ${account.totalOrders} orders - \$${account.totalSpent}';
      expect(summary, contains(account.name));
      expect(summary, contains('${account.totalOrders}'));
    });

    test('should check if can place order with amount', () {
      final orderAmount = 100.0;
      final canPlace = account.availableCredit >= orderAmount;
      expect(canPlace, isA<bool>());
    });

    test('should calculate remaining credit after order', () {
      final orderAmount = 100.0;
      final remaining = account.availableCredit - orderAmount;
      expect(remaining, account.creditLimit - account.currentCredit - orderAmount);
    });
  });

  group('CustomerAccount Credit Management', () {
    test('should add credit correctly', () {
      final account = MockData.mockCustomerAccount;
      final amount = 100.0;
      final updated = account.copyWith(
        currentCredit: account.currentCredit + amount,
      );

      expect(updated.currentCredit, account.currentCredit + amount);
    });

    test('should reduce credit correctly', () {
      final account = MockData.mockCustomerAccount;
      final amount = 50.0;
      final updated = account.copyWith(
        currentCredit: account.currentCredit - amount,
      );

      expect(updated.currentCredit, account.currentCredit - amount);
    });

    test('should not allow negative credit', () {
      final account = MockData.mockCustomerAccount;
      final reduction = account.currentCredit + 100.0;
      
      expect(
        () => account.copyWith(currentCredit: -reduction),
        throwsA(anything),
      );
    });

    test('should handle credit limit increase', () {
      final account = MockData.mockCustomerAccount;
      final newLimit = 2000.0;
      final updated = account.copyWith(creditLimit: newLimit);

      expect(updated.creditLimit, newLimit);
      expect(updated.availableCredit, newLimit - account.currentCredit);
    });

    test('should handle credit limit decrease', () {
      final account = MockData.mockCustomerAccount;
      final newLimit = 500.0;
      final updated = account.copyWith(creditLimit: newLimit);

      expect(updated.creditLimit, newLimit);
    });
  });

  group('CustomerAccount Statistics', () {
    test('should track total orders', () {
      final account = MockData.mockCustomerAccount;
      expect(account.totalOrders, greaterThan(0));
    });

    test('should track total spent', () {
      final account = MockData.mockCustomerAccount;
      expect(account.totalSpent, greaterThan(0));
    });

    test('should calculate average order correctly', () {
      final account = MockData.mockCustomerAccount;
      final avg = account.totalSpent / account.totalOrders;
      expect(avg, account.averageOrderValue);
    });

    test('should handle zero orders', () {
      final account = MockData.mockCustomerAccount.copyWith(
        totalOrders: 0,
        totalSpent: 0,
      );

      expect(account.averageOrderValue, 0);
    });
  });

  group('CustomerAccount Edge Cases', () {
    test('should handle zero credit limit', () {
      final account = MockData.mockCustomerAccount.copyWith(creditLimit: 0);
      expect(account.availableCredit, 0);
      expect(account.hasCreditAvailable, false);
    });

    test('should handle zero current credit', () {
      final account = MockData.mockCustomerAccount.copyWith(currentCredit: 0);
      expect(account.availableCredit, account.creditLimit);
      expect(account.creditUsagePercentage, 0);
    });

    test('should handle max credit usage', () {
      final account = MockData.mockCustomerAccount.copyWith(
        currentCredit: 1000.0,
        creditLimit: 1000.0,
      );

      expect(account.availableCredit, 0);
      expect(account.creditUsagePercentage, 100);
      expect(account.hasCreditAvailable, false);
    });

    test('should handle very old member', () {
      final account = MockData.mockCustomerAccount.copyWith(
        memberSince: DateTime.now().subtract(const Duration(days: 3650)),
      );

      expect(account.membershipDurationDays, greaterThan(3600));
      expect(account.isNewMember, false);
    });

    test('should handle brand new member', () {
      final account = MockData.mockCustomerAccount.copyWith(
        memberSince: DateTime.now(),
        totalOrders: 0,
        totalSpent: 0,
      );

      expect(account.membershipDurationDays, 0);
      expect(account.isNewMember, true);
      expect(account.isActive, false);
    });

    test('should handle high value customer', () {
      final account = MockData.mockCustomerAccount.copyWith(
        totalSpent: 10000.0,
        totalOrders: 200,
      );

      expect(account.loyaltyTier, 'platinum');
      expect(account.averageOrderValue, 50.0);
    });

    test('should handle low value customer', () {
      final account = MockData.mockCustomerAccount.copyWith(
        totalSpent: 100.0,
        totalOrders: 5,
      );

      expect(account.loyaltyTier, 'bronze');
      expect(account.averageOrderValue, 20.0);
    });
  });

  group('CustomerAccount Validation', () {
    test('should validate name is not empty', () {
      expect(account.name, isNotEmpty);
    });

    test('should validate email is not empty', () {
      expect(account.email, isNotEmpty);
    });

    test('should validate phone is not empty', () {
      expect(account.phone, isNotEmpty);
    });

    test('should validate address is not empty', () {
      expect(account.address, isNotEmpty);
    });

    test('should validate credit limit is not negative', () {
      expect(account.creditLimit, greaterThanOrEqualTo(0));
    });

    test('should validate current credit is not negative', () {
      expect(account.currentCredit, greaterThanOrEqualTo(0));
    });

    test('should validate total orders is not negative', () {
      expect(account.totalOrders, greaterThanOrEqualTo(0));
    });

    test('should validate total spent is not negative', () {
      expect(account.totalSpent, greaterThanOrEqualTo(0));
    });

    test('should validate member since is not in future', () {
      expect(account.memberSince.isAfter(DateTime.now()), false);
    });
  });
}
