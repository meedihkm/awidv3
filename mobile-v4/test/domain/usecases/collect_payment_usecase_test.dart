import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:awid_mobile/features/deliverer/domain/usecases/collect_payment_usecase.dart';
import 'package:awid_mobile/features/deliverer/domain/repositories/delivery_actions_repository.dart';
import 'package:awid_mobile/features/deliverer/domain/entities/payment_collection.dart';
import '../../helpers/mock_data.dart';

@GenerateMocks([DeliveryActionsRepository])
import 'collect_payment_usecase_test.mocks.dart';

void main() {
  late CollectPaymentUseCase useCase;
  late MockDeliveryActionsRepository mockRepository;

  setUp(() {
    mockRepository = MockDeliveryActionsRepository();
    useCase = CollectPaymentUseCase(mockRepository);
  });

  group('CollectPaymentUseCase - Auto Allocation', () {
    final validAutoParams = CollectPaymentAutoParams(
      delivererId: 'deliverer-789',
      customerId: 'customer-456',
      customerName: 'John Doe',
      amount: 1000.0,
      mode: PaymentMode.cash,
      notes: 'Payment collected',
    );

    final mockAllocations = [
      PaymentAllocation(
        orderId: 'order-123',
        orderNumber: 'ORD-001',
        orderAmount: 500.0,
        allocatedAmount: 500.0,
      ),
      PaymentAllocation(
        orderId: 'order-124',
        orderNumber: 'ORD-002',
        orderAmount: 800.0,
        allocatedAmount: 500.0,
      ),
    ];

    test('should collect payment with auto allocation successfully', () async {
      // Arrange
      when(mockRepository.calculateAutoAllocation(
        customerId: validAutoParams.customerId,
        amount: validAutoParams.amount,
      )).thenAnswer((_) async => mockAllocations);
      when(mockRepository.savePaymentCollection(any))
          .thenAnswer((_) async => {});
      when(mockRepository.uploadPaymentCollection(any))
          .thenAnswer((_) async => {});

      // Act
      final result = await useCase.executeAutoAllocation(validAutoParams);

      // Assert
      expect(result.isSuccess, true);
      final success = result as CollectPaymentSuccess;
      expect(success.customerId, validAutoParams.customerId);
      expect(success.amount, validAutoParams.amount);
      expect(success.allocations.length, 2);
      verify(mockRepository.calculateAutoAllocation(
        customerId: validAutoParams.customerId,
        amount: validAutoParams.amount,
      )).called(1);
      verify(mockRepository.savePaymentCollection(any)).called(1);
    });

    test('should fail when no unpaid orders found', () async {
      // Arrange
      when(mockRepository.calculateAutoAllocation(
        customerId: validAutoParams.customerId,
        amount: validAutoParams.amount,
      )).thenAnswer((_) async => []);

      // Act
      final result = await useCase.executeAutoAllocation(validAutoParams);

      // Assert
      expect(result.isFailure, true);
      final failure = result as CollectPaymentFailure;
      expect(failure.error, contains('Aucune commande impayée'));
    });

    test('should throw when deliverer ID is empty', () async {
      // Arrange
      final params = CollectPaymentAutoParams(
        delivererId: '',
        customerId: 'customer-456',
        customerName: 'John Doe',
        amount: 1000.0,
        mode: PaymentMode.cash,
      );

      // Act
      final result = await useCase.executeAutoAllocation(params);

      // Assert
      expect(result.isFailure, true);
      final failure = result as CollectPaymentFailure;
      expect(failure.error, contains('livreur est requis'));
    });

    test('should throw when customer ID is empty', () async {
      // Arrange
      final params = CollectPaymentAutoParams(
        delivererId: 'deliverer-789',
        customerId: '',
        customerName: 'John Doe',
        amount: 1000.0,
        mode: PaymentMode.cash,
      );

      // Act
      final result = await useCase.executeAutoAllocation(params);

      // Assert
      expect(result.isFailure, true);
      final failure = result as CollectPaymentFailure;
      expect(failure.error, contains('client est requis'));
    });

    test('should throw when customer name is empty', () async {
      // Arrange
      final params = CollectPaymentAutoParams(
        delivererId: 'deliverer-789',
        customerId: 'customer-456',
        customerName: '',
        amount: 1000.0,
        mode: PaymentMode.cash,
      );

      // Act
      final result = await useCase.executeAutoAllocation(params);

      // Assert
      expect(result.isFailure, true);
      final failure = result as CollectPaymentFailure;
      expect(failure.error, contains('nom du client est requis'));
    });

    test('should throw when amount is zero', () async {
      // Arrange
      final params = CollectPaymentAutoParams(
        delivererId: 'deliverer-789',
        customerId: 'customer-456',
        customerName: 'John Doe',
        amount: 0.0,
        mode: PaymentMode.cash,
      );

      // Act
      final result = await useCase.executeAutoAllocation(params);

      // Assert
      expect(result.isFailure, true);
      final failure = result as CollectPaymentFailure;
      expect(failure.error, contains('positif'));
    });

    test('should throw when amount is negative', () async {
      // Arrange
      final params = CollectPaymentAutoParams(
        delivererId: 'deliverer-789',
        customerId: 'customer-456',
        customerName: 'John Doe',
        amount: -100.0,
        mode: PaymentMode.cash,
      );

      // Act
      final result = await useCase.executeAutoAllocation(params);

      // Assert
      expect(result.isFailure, true);
      final failure = result as CollectPaymentFailure;
      expect(failure.error, contains('positif'));
    });

    test('should require reference for check payment', () async {
      // Arrange
      final params = CollectPaymentAutoParams(
        delivererId: 'deliverer-789',
        customerId: 'customer-456',
        customerName: 'John Doe',
        amount: 1000.0,
        mode: PaymentMode.check,
      );

      // Act
      final result = await useCase.executeAutoAllocation(params);

      // Assert
      expect(result.isFailure, true);
      final failure = result as CollectPaymentFailure;
      expect(failure.error, contains('référence est requise'));
    });

    test('should succeed even if upload fails', () async {
      // Arrange
      when(mockRepository.calculateAutoAllocation(
        customerId: validAutoParams.customerId,
        amount: validAutoParams.amount,
      )).thenAnswer((_) async => mockAllocations);
      when(mockRepository.savePaymentCollection(any))
          .thenAnswer((_) async => {});
      when(mockRepository.uploadPaymentCollection(any))
          .thenThrow(Exception('Network error'));

      // Act
      final result = await useCase.executeAutoAllocation(validAutoParams);

      // Assert
      expect(result.isSuccess, true);
    });

    test('should validate params correctly', () {
      // Assert
      expect(validAutoParams.isValid, true);
    });

    test('should detect invalid params', () {
      // Arrange
      final invalidParams = CollectPaymentAutoParams(
        delivererId: '',
        customerId: 'customer-456',
        customerName: 'John Doe',
        amount: 1000.0,
        mode: PaymentMode.cash,
      );

      // Assert
      expect(invalidParams.isValid, false);
    });
  });

  group('CollectPaymentUseCase - Manual Allocation', () {
    final mockAllocations = [
      PaymentAllocation(
        orderId: 'order-123',
        orderNumber: 'ORD-001',
        orderAmount: 500.0,
        allocatedAmount: 500.0,
      ),
      PaymentAllocation(
        orderId: 'order-124',
        orderNumber: 'ORD-002',
        orderAmount: 800.0,
        allocatedAmount: 500.0,
      ),
    ];

    final validManualParams = CollectPaymentManualParams(
      delivererId: 'deliverer-789',
      customerId: 'customer-456',
      customerName: 'John Doe',
      amount: 1000.0,
      mode: PaymentMode.cash,
      allocations: mockAllocations,
      notes: 'Manual allocation',
    );

    test('should collect payment with manual allocation successfully', () async {
      // Arrange
      when(mockRepository.savePaymentCollection(any))
          .thenAnswer((_) async => {});
      when(mockRepository.uploadPaymentCollection(any))
          .thenAnswer((_) async => {});

      // Act
      final result = await useCase.executeManualAllocation(validManualParams);

      // Assert
      expect(result.isSuccess, true);
      final success = result as CollectPaymentSuccess;
      expect(success.customerId, validManualParams.customerId);
      expect(success.amount, validManualParams.amount);
      expect(success.allocations.length, 2);
      verify(mockRepository.savePaymentCollection(any)).called(1);
    });

    test('should fail when allocation does not match amount', () async {
      // Arrange
      final unbalancedAllocations = [
        PaymentAllocation(
          orderId: 'order-123',
          orderNumber: 'ORD-001',
          orderAmount: 500.0,
          allocatedAmount: 300.0,
        ),
      ];
      final params = CollectPaymentManualParams(
        delivererId: 'deliverer-789',
        customerId: 'customer-456',
        customerName: 'John Doe',
        amount: 1000.0,
        mode: PaymentMode.cash,
        allocations: unbalancedAllocations,
      );

      // Act
      final result = await useCase.executeManualAllocation(params);

      // Assert
      expect(result.isFailure, true);
      final failure = result as CollectPaymentFailure;
      expect(failure.error, contains('ne correspond pas'));
    });

    test('should throw when allocations list is empty', () async {
      // Arrange
      final params = CollectPaymentManualParams(
        delivererId: 'deliverer-789',
        customerId: 'customer-456',
        customerName: 'John Doe',
        amount: 1000.0,
        mode: PaymentMode.cash,
        allocations: [],
      );

      // Act
      final result = await useCase.executeManualAllocation(params);

      // Assert
      expect(result.isFailure, true);
      final failure = result as CollectPaymentFailure;
      expect(failure.error, contains('allocation est requise'));
    });

    test('should throw when allocation amount is negative', () async {
      // Arrange
      final invalidAllocations = [
        PaymentAllocation(
          orderId: 'order-123',
          orderNumber: 'ORD-001',
          orderAmount: 500.0,
          allocatedAmount: -100.0,
        ),
      ];
      final params = CollectPaymentManualParams(
        delivererId: 'deliverer-789',
        customerId: 'customer-456',
        customerName: 'John Doe',
        amount: 1000.0,
        mode: PaymentMode.cash,
        allocations: invalidAllocations,
      );

      // Act
      final result = await useCase.executeManualAllocation(params);

      // Assert
      expect(result.isFailure, true);
      final failure = result as CollectPaymentFailure;
      expect(failure.error, contains('positifs'));
    });

    test('should calculate total allocated correctly', () {
      // Assert
      expect(validManualParams.totalAllocated, 1000.0);
    });

    test('should detect balanced allocation', () {
      // Assert
      expect(validManualParams.isBalanced, true);
    });

    test('should detect unbalanced allocation', () {
      // Arrange
      final unbalancedParams = CollectPaymentManualParams(
        delivererId: 'deliverer-789',
        customerId: 'customer-456',
        customerName: 'John Doe',
        amount: 1000.0,
        mode: PaymentMode.cash,
        allocations: [
          PaymentAllocation(
            orderId: 'order-123',
            orderNumber: 'ORD-001',
            orderAmount: 500.0,
            allocatedAmount: 300.0,
          ),
        ],
      );

      // Assert
      expect(unbalancedParams.isBalanced, false);
    });

    test('should validate params correctly', () {
      // Assert
      expect(validManualParams.isValid, true);
    });
  });

  group('CollectPaymentUseCase - Helper Methods', () {
    const customerId = 'customer-456';

    test('should get unpaid orders', () async {
      // Arrange
      final unpaidOrders = [
        UnpaidOrder(
          orderId: 'order-123',
          orderNumber: 'ORD-001',
          amount: 500.0,
          dueDate: DateTime.now(),
        ),
      ];
      when(mockRepository.getUnpaidOrders(customerId))
          .thenAnswer((_) async => unpaidOrders);

      // Act
      final result = await useCase.getUnpaidOrders(customerId);

      // Assert
      expect(result.length, 1);
      expect(result.first.orderId, 'order-123');
      verify(mockRepository.getUnpaidOrders(customerId)).called(1);
    });

    test('should throw when customer ID is empty for unpaid orders', () async {
      // Act & Assert
      expect(
        () => useCase.getUnpaidOrders(''),
        throwsArgumentError,
      );
    });

    test('should calculate allocation proposal', () async {
      // Arrange
      const amount = 1000.0;
      final allocations = [
        PaymentAllocation(
          orderId: 'order-123',
          orderNumber: 'ORD-001',
          orderAmount: 500.0,
          allocatedAmount: 500.0,
        ),
      ];
      when(mockRepository.calculateAutoAllocation(
        customerId: customerId,
        amount: amount,
      )).thenAnswer((_) async => allocations);

      // Act
      final result = await useCase.calculateAllocationProposal(
        customerId: customerId,
        amount: amount,
      );

      // Assert
      expect(result.length, 1);
      expect(result.first.allocatedAmount, 500.0);
    });

    test('should throw when customer ID is empty for proposal', () async {
      // Act & Assert
      expect(
        () => useCase.calculateAllocationProposal(
          customerId: '',
          amount: 1000.0,
        ),
        throwsArgumentError,
      );
    });

    test('should throw when amount is zero for proposal', () async {
      // Act & Assert
      expect(
        () => useCase.calculateAllocationProposal(
          customerId: customerId,
          amount: 0.0,
        ),
        throwsArgumentError,
      );
    });
  });

  group('CollectPaymentSuccess', () {
    final success = CollectPaymentSuccess(
      paymentId: 'payment-001',
      customerId: 'customer-456',
      amount: 1500.0,
      allocations: [
        PaymentAllocation(
          orderId: 'order-123',
          orderNumber: 'ORD-001',
          orderAmount: 500.0,
          allocatedAmount: 500.0,
        ),
        PaymentAllocation(
          orderId: 'order-124',
          orderNumber: 'ORD-002',
          orderAmount: 1000.0,
          allocatedAmount: 1000.0,
        ),
      ],
      collectedAt: DateTime(2026, 1, 27, 14, 30),
    );

    test('should format amount correctly', () {
      // Assert
      expect(success.amountFormatted, '1 500 DZD');
    });

    test('should count orders correctly', () {
      // Assert
      expect(success.ordersCount, 2);
    });

    test('should format date correctly', () {
      // Assert
      expect(success.collectedAtFormatted, '27/01/2026 à 14:30');
    });
  });

  group('CollectPaymentFailure', () {
    test('should detect validation errors', () {
      // Arrange
      final failure = CollectPaymentFailure(
        error: 'Le montant doit être positif',
        customerId: 'customer-456',
      );

      // Assert
      expect(failure.isValidationError, true);
      expect(failure.isDataError, false);
    });

    test('should detect data errors', () {
      // Arrange
      final failure = CollectPaymentFailure(
        error: 'Aucune commande impayée trouvée',
        customerId: 'customer-456',
      );

      // Assert
      expect(failure.isDataError, true);
      expect(failure.isValidationError, false);
    });
  });

  group('CollectPaymentUseCase - Edge Cases', () {
    test('should handle repository errors', () async {
      // Arrange
      final params = CollectPaymentAutoParams(
        delivererId: 'deliverer-789',
        customerId: 'customer-456',
        customerName: 'John Doe',
        amount: 1000.0,
        mode: PaymentMode.cash,
      );
      when(mockRepository.calculateAutoAllocation(
        customerId: params.customerId,
        amount: params.amount,
      )).thenThrow(Exception('Database error'));

      // Act
      final result = await useCase.executeAutoAllocation(params);

      // Assert
      expect(result.isFailure, true);
      final failure = result as CollectPaymentFailure;
      expect(failure.error, contains('Database error'));
    });

    test('should handle timeout', () async {
      // Arrange
      final params = CollectPaymentAutoParams(
        delivererId: 'deliverer-789',
        customerId: 'customer-456',
        customerName: 'John Doe',
        amount: 1000.0,
        mode: PaymentMode.cash,
      );
      when(mockRepository.calculateAutoAllocation(
        customerId: params.customerId,
        amount: params.amount,
      )).thenAnswer(
        (_) => Future.delayed(
          const Duration(seconds: 10),
          () => [],
        ),
      );

      // Act & Assert
      expect(
        () => useCase.executeAutoAllocation(params).timeout(
              const Duration(seconds: 1),
            ),
        throwsA(isA<TimeoutException>()),
      );
    });

    test('should generate unique payment IDs', () async {
      // Arrange
      final params = CollectPaymentAutoParams(
        delivererId: 'deliverer-789',
        customerId: 'customer-456',
        customerName: 'John Doe',
        amount: 1000.0,
        mode: PaymentMode.cash,
      );
      final allocations = [
        PaymentAllocation(
          orderId: 'order-123',
          orderNumber: 'ORD-001',
          orderAmount: 500.0,
          allocatedAmount: 500.0,
        ),
      ];
      final paymentIds = <String>[];
      when(mockRepository.calculateAutoAllocation(
        customerId: params.customerId,
        amount: params.amount,
      )).thenAnswer((_) async => allocations);
      when(mockRepository.savePaymentCollection(any))
          .thenAnswer((invocation) async {
        final payment = invocation.positionalArguments[0] as PaymentCollection;
        paymentIds.add(payment.id);
      });
      when(mockRepository.uploadPaymentCollection(any))
          .thenAnswer((_) async => {});

      // Act
      await useCase.executeAutoAllocation(params);
      await Future.delayed(const Duration(milliseconds: 10));
      await useCase.executeAutoAllocation(params);

      // Assert
      expect(paymentIds.length, 2);
      expect(paymentIds[0], isNot(equals(paymentIds[1])));
    });
  });
}
