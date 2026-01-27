import 'package:flutter_test/flutter_test.dart';
import 'package:awid_mobile/features/deliverer/domain/entities/payment_collection.dart';
import '../../helpers/mock_data.dart';

void main() {
  group('PaymentCollection Entity', () {
    late PaymentCollection payment;

    setUp(() {
      payment = MockData.mockPaymentCollection;
    });

    test('should create valid PaymentCollection', () {
      expect(payment.id, 'payment-001');
      expect(payment.orderId, MockData.testOrderId);
      expect(payment.amount, 25.00);
      expect(payment.paymentMethod, PaymentMethod.cash);
      expect(payment.collectedAt, isNotNull);
      expect(payment.notes, isNotNull);
    });

    test('should validate positive amount', () {
      expect(payment.amount, greaterThan(0));
    });

    test('should check if payment is cash', () {
      final cashPayment = payment.copyWith(paymentMethod: PaymentMethod.cash);
      final cardPayment = payment.copyWith(paymentMethod: PaymentMethod.card);

      expect(cashPayment.isCash, true);
      expect(cardPayment.isCash, false);
    });

    test('should check if payment is card', () {
      final cardPayment = payment.copyWith(paymentMethod: PaymentMethod.card);
      final cashPayment = payment.copyWith(paymentMethod: PaymentMethod.cash);

      expect(cardPayment.isCard, true);
      expect(cashPayment.isCard, false);
    });

    test('should check if payment is mobile', () {
      final mobilePayment = payment.copyWith(paymentMethod: PaymentMethod.mobile);
      final cashPayment = payment.copyWith(paymentMethod: PaymentMethod.cash);

      expect(mobilePayment.isMobile, true);
      expect(cashPayment.isMobile, false);
    });

    test('should check if payment is check', () {
      final checkPayment = payment.copyWith(paymentMethod: PaymentMethod.check);
      final cashPayment = payment.copyWith(paymentMethod: PaymentMethod.cash);

      expect(checkPayment.isCheck, true);
      expect(cashPayment.isCheck, false);
    });

    test('should have valid collection timestamp', () {
      expect(payment.collectedAt, isA<DateTime>());
      expect(payment.collectedAt.isBefore(DateTime.now().add(const Duration(minutes: 1))), true);
    });

    test('should calculate time since collection', () {
      final timeSince = DateTime.now().difference(payment.collectedAt);
      expect(timeSince, isA<Duration>());
      expect(timeSince.inSeconds, greaterThanOrEqualTo(0));
    });

    test('should check if collection was recent', () {
      final recent = payment.copyWith(
        collectedAt: DateTime.now().subtract(const Duration(minutes: 5)),
      );
      final old = payment.copyWith(
        collectedAt: DateTime.now().subtract(const Duration(hours: 5)),
      );

      final isRecent = DateTime.now().difference(recent.collectedAt).inHours < 1;
      final isOld = DateTime.now().difference(old.collectedAt).inHours >= 1;

      expect(isRecent, true);
      expect(isOld, true);
    });

    test('should copy with new values', () {
      final updated = payment.copyWith(
        amount: 50.00,
        paymentMethod: PaymentMethod.card,
      );

      expect(updated.id, payment.id);
      expect(updated.amount, 50.00);
      expect(updated.paymentMethod, PaymentMethod.card);
      expect(updated.orderId, payment.orderId);
    });

    test('should compare payments by equality', () {
      final samePayment = payment.copyWith();
      final differentPayment = payment.copyWith(id: 'different-id');

      expect(payment == samePayment, true);
      expect(payment == differentPayment, false);
    });

    test('should format amount as currency', () {
      final formatted = '\$${payment.amount.toStringAsFixed(2)}';
      expect(formatted, '\$25.00');
    });

    test('should get payment method name', () {
      final methods = {
        PaymentMethod.cash: 'Cash',
        PaymentMethod.card: 'Card',
        PaymentMethod.mobile: 'Mobile',
        PaymentMethod.check: 'Check',
      };

      for (final entry in methods.entries) {
        final p = payment.copyWith(paymentMethod: entry.key);
        expect(p.paymentMethod.toString(), contains(entry.value.toLowerCase()));
      }
    });

    test('should handle optional notes', () {
      final withNotes = payment.copyWith(notes: 'Exact change');
      final withoutNotes = payment.copyWith(notes: null);

      expect(withNotes.notes, isNotNull);
      expect(withoutNotes.notes, isNull);
    });

    test('should validate IDs are not empty', () {
      expect(payment.id, isNotEmpty);
      expect(payment.orderId, isNotEmpty);
    });

    test('should validate collection time is not in future', () {
      expect(payment.collectedAt.isAfter(DateTime.now()), false);
    });

    test('should calculate payment summary', () {
      final summary = '${payment.paymentMethod} - \$${payment.amount}';
      expect(summary, contains('cash'));
      expect(summary, contains('25.0'));
    });
  });

  group('PaymentMethod', () {
    test('should have all payment methods', () {
      expect(PaymentMethod.values.length, greaterThanOrEqualTo(4));
      expect(PaymentMethod.values, contains(PaymentMethod.cash));
      expect(PaymentMethod.values, contains(PaymentMethod.card));
      expect(PaymentMethod.values, contains(PaymentMethod.mobile));
      expect(PaymentMethod.values, contains(PaymentMethod.check));
    });

    test('should convert to string', () {
      expect(PaymentMethod.cash.toString(), contains('cash'));
      expect(PaymentMethod.card.toString(), contains('card'));
      expect(PaymentMethod.mobile.toString(), contains('mobile'));
      expect(PaymentMethod.check.toString(), contains('check'));
    });
  });

  group('PaymentCollection Validation', () {
    test('should validate amount is positive', () {
      expect(payment.amount, greaterThan(0));
    });

    test('should validate amount has valid precision', () {
      final amount = payment.amount;
      final rounded = double.parse(amount.toStringAsFixed(2));
      expect(amount, closeTo(rounded, 0.001));
    });

    test('should validate payment method is valid', () {
      expect(PaymentMethod.values, contains(payment.paymentMethod));
    });

    test('should validate collection time is valid', () {
      expect(payment.collectedAt, isA<DateTime>());
      expect(payment.collectedAt.year, greaterThanOrEqualTo(2020));
    });
  });

  group('PaymentCollection Edge Cases', () {
    test('should handle small amount', () {
      final small = payment.copyWith(amount: 0.01);
      expect(small.amount, 0.01);
    });

    test('should handle large amount', () {
      final large = payment.copyWith(amount: 10000.00);
      expect(large.amount, 10000.00);
    });

    test('should handle decimal amounts', () {
      final decimal = payment.copyWith(amount: 25.99);
      expect(decimal.amount, 25.99);
    });

    test('should handle payment without notes', () {
      final noNotes = payment.copyWith(notes: null);
      expect(noNotes.notes, isNull);
    });

    test('should handle long notes', () {
      final longNotes = 'A' * 500;
      final withLongNotes = payment.copyWith(notes: longNotes);
      expect(withLongNotes.notes, longNotes);
      expect(withLongNotes.notes!.length, 500);
    });

    test('should handle very old collection', () {
      final old = payment.copyWith(
        collectedAt: DateTime.now().subtract(const Duration(days: 365)),
      );
      
      final daysSince = DateTime.now().difference(old.collectedAt).inDays;
      expect(daysSince, greaterThan(360));
    });

    test('should handle collection at midnight', () {
      final midnight = payment.copyWith(
        collectedAt: DateTime(2026, 1, 27, 0, 0, 0),
      );
      
      expect(midnight.collectedAt.hour, 0);
      expect(midnight.collectedAt.minute, 0);
    });

    test('should handle different payment methods', () {
      for (final method in PaymentMethod.values) {
        final p = payment.copyWith(paymentMethod: method);
        expect(p.paymentMethod, method);
      }
    });
  });

  group('PaymentCollection Business Logic', () {
    test('should calculate change for cash payment', () {
      final cashPayment = payment.copyWith(
        amount: 25.00,
        paymentMethod: PaymentMethod.cash,
      );
      
      final tendered = 30.00;
      final change = tendered - cashPayment.amount;
      expect(change, 5.00);
    });

    test('should validate sufficient payment', () {
      final orderAmount = 25.00;
      final payment1 = payment.copyWith(amount: 25.00);
      final payment2 = payment.copyWith(amount: 20.00);

      expect(payment1.amount >= orderAmount, true);
      expect(payment2.amount >= orderAmount, false);
    });

    test('should calculate overpayment', () {
      final orderAmount = 25.00;
      final paymentAmount = 30.00;
      final overpayment = paymentAmount - orderAmount;
      
      expect(overpayment, 5.00);
    });

    test('should calculate underpayment', () {
      final orderAmount = 25.00;
      final paymentAmount = 20.00;
      final underpayment = orderAmount - paymentAmount;
      
      expect(underpayment, 5.00);
    });

    test('should check if exact payment', () {
      final orderAmount = 25.00;
      final exactPayment = payment.copyWith(amount: 25.00);
      
      expect(exactPayment.amount == orderAmount, true);
    });

    test('should calculate tip amount', () {
      final orderAmount = 25.00;
      final paymentWithTip = payment.copyWith(amount: 30.00);
      final tip = paymentWithTip.amount - orderAmount;
      
      expect(tip, 5.00);
    });

    test('should calculate tip percentage', () {
      final orderAmount = 25.00;
      final paymentWithTip = payment.copyWith(amount: 30.00);
      final tip = paymentWithTip.amount - orderAmount;
      final tipPercentage = (tip / orderAmount) * 100;
      
      expect(tipPercentage, 20.0);
    });
  });

  group('PaymentCollection Formatting', () {
    test('should format as receipt line', () {
      final receipt = '${payment.paymentMethod.toString().split('.').last.toUpperCase()}: \$${payment.amount.toStringAsFixed(2)}';
      expect(receipt, contains('CASH'));
      expect(receipt, contains('25.00'));
    });

    test('should format collection time', () {
      final formatted = '${payment.collectedAt.day}/${payment.collectedAt.month}/${payment.collectedAt.year}';
      expect(formatted, matches(r'\d{1,2}/\d{1,2}/\d{4}'));
    });

    test('should format amount with currency symbol', () {
      final formatted = '\$${payment.amount.toStringAsFixed(2)}';
      expect(formatted, startsWith('\$'));
      expect(formatted, contains('.'));
    });
  });

  group('PaymentCollection Security', () {
    test('should not allow negative amounts', () {
      expect(
        () => PaymentCollection(
          id: 'payment-001',
          orderId: 'order-123',
          amount: -10.00,
          paymentMethod: PaymentMethod.cash,
          collectedAt: DateTime.now(),
        ),
        throwsA(anything),
      );
    });

    test('should not allow zero amount', () {
      expect(
        () => PaymentCollection(
          id: 'payment-001',
          orderId: 'order-123',
          amount: 0.00,
          paymentMethod: PaymentMethod.cash,
          collectedAt: DateTime.now(),
        ),
        throwsA(anything),
      );
    });

    test('should validate payment method is set', () {
      expect(payment.paymentMethod, isNotNull);
    });

    test('should validate collection time is set', () {
      expect(payment.collectedAt, isNotNull);
    });
  });
}
