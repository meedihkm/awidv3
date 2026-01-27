import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:awid_mobile/features/deliverer/presentation/providers/delivery_actions_provider.dart';
import 'package:awid_mobile/features/deliverer/domain/usecases/complete_delivery_usecase.dart';
import 'package:awid_mobile/features/deliverer/domain/usecases/collect_payment_usecase.dart';
import 'package:awid_mobile/features/deliverer/domain/usecases/manage_packaging_usecase.dart';
import 'package:awid_mobile/features/deliverer/domain/entities/proof_of_delivery.dart';
import 'package:awid_mobile/features/deliverer/domain/entities/payment_collection.dart';
import 'package:awid_mobile/features/deliverer/domain/entities/packaging_transaction.dart';
import 'package:awid_mobile/features/deliverer/domain/repositories/delivery_actions_repository.dart';

import '../../helpers/test_helpers.dart';
import '../../helpers/mock_data.dart';

@GenerateMocks([
  CompleteDeliveryUseCase,
  CollectPaymentUseCase,
  ManagePackagingUseCase,
  DeliveryActionsRepository,
])
import 'delivery_actions_provider_test.mocks.dart';

void main() {
  late DeliveryActionsNotifier notifier;
  late MockCompleteDeliveryUseCase mockCompleteUseCase;
  late MockCollectPaymentUseCase mockPaymentUseCase;
  late MockManagePackagingUseCase mockPackagingUseCase;

  setUp(() {
    mockCompleteUseCase = MockCompleteDeliveryUseCase();
    mockPaymentUseCase = MockCollectPaymentUseCase();
    mockPackagingUseCase = MockManagePackagingUseCase();
    notifier = DeliveryActionsNotifier(
      mockCompleteUseCase,
      mockPaymentUseCase,
      mockPackagingUseCase,
    );
  });

  group('DeliveryActionsState', () {
    test('idle state should be created', () {
      // Arrange & Act
      const state = DeliveryActionsState.idle();

      // Assert
      expect(state, isA<Idle>());
    });

    test('loading state should be created', () {
      // Arrange & Act
      const state = DeliveryActionsState.loading();

      // Assert
      expect(state, isA<Loading>());
    });

    test('error state should contain message', () {
      // Arrange & Act
      const state = DeliveryActionsState.error('Test error');

      // Assert
      expect(state, isA<Error>());
      expect((state as Error).message, 'Test error');
    });

    test('deliveryCompleted state should contain data', () {
      // Arrange & Act
      final state = DeliveryActionsState.deliveryCompleted(
        proofId: 'proof-001',
        deliveryId: 'delivery-001',
        completedAt: MockData.testDate,
      );

      // Assert
      expect(state, isA<DeliveryCompleted>());
      final completed = state as DeliveryCompleted;
      expect(completed.proofId, 'proof-001');
      expect(completed.deliveryId, 'delivery-001');
      expect(completed.completedAt, MockData.testDate);
    });

    test('paymentCollected state should contain data', () {
      // Arrange & Act
      final state = DeliveryActionsState.paymentCollected(
        paymentId: 'payment-001',
        customerId: MockData.testCustomerId,
        amount: 100.0,
        allocations: [],
        collectedAt: MockData.testDate,
      );

      // Assert
      expect(state, isA<PaymentCollected>());
      final collected = state as PaymentCollected;
      expect(collected.paymentId, 'payment-001');
      expect(collected.amount, 100.0);
    });
  });

  group('DeliveryActionsNotifier - Complete Delivery', () {
    test('initial state should be idle', () {
      // Assert
      expect(notifier.state, isA<Idle>());
    });

    test('completeDelivery should set loading state', () async {
      // Arrange
      final params = CompleteDeliveryParams(
        deliveryId: 'delivery-001',
        delivererId: MockData.testDelivererId,
        customerId: MockData.testCustomerId,
        timestamp: MockData.testDate,
        latitude: 48.8566,
        longitude: 2.3522,
        signatoryName: 'John Doe',
        signatureImagePath: '/path/to/signature.png',
        photosPaths: ['/path/to/photo.jpg'],
      );
      when(mockCompleteUseCase.execute(any)).thenAnswer(
        (_) async => CompleteDeliverySuccess(
          proofId: 'proof-001',
          deliveryId: 'delivery-001',
          completedAt: MockData.testDate,
        ),
      );

      // Act
      final future = notifier.completeDelivery(params);
      
      // Assert - Check loading state immediately
      expect(notifier.state, isA<Loading>());
      
      await future;
    });

    test('completeDelivery should set success state', () async {
      // Arrange
      final params = CompleteDeliveryParams(
        deliveryId: 'delivery-001',
        delivererId: MockData.testDelivererId,
        customerId: MockData.testCustomerId,
        timestamp: MockData.testDate,
        latitude: 48.8566,
        longitude: 2.3522,
        signatoryName: 'John Doe',
        signatureImagePath: '/path/to/signature.png',
        photosPaths: ['/path/to/photo.jpg'],
      );
      when(mockCompleteUseCase.execute(any)).thenAnswer(
        (_) async => CompleteDeliverySuccess(
          proofId: 'proof-001',
          deliveryId: 'delivery-001',
          completedAt: MockData.testDate,
        ),
      );

      // Act
      await notifier.completeDelivery(params);

      // Assert
      expect(notifier.state, isA<DeliveryCompleted>());
      final completed = notifier.state as DeliveryCompleted;
      expect(completed.proofId, 'proof-001');
      expect(completed.deliveryId, 'delivery-001');
      verify(mockCompleteUseCase.execute(params)).called(1);
    });

    test('completeDelivery should set error state on failure', () async {
      // Arrange
      final params = CompleteDeliveryParams(
        deliveryId: 'delivery-001',
        delivererId: MockData.testDelivererId,
        customerId: MockData.testCustomerId,
        timestamp: MockData.testDate,
        latitude: 48.8566,
        longitude: 2.3522,
        signatoryName: 'John Doe',
        signatureImagePath: '/path/to/signature.png',
        photosPaths: ['/path/to/photo.jpg'],
      );
      when(mockCompleteUseCase.execute(any)).thenAnswer(
        (_) async => const CompleteDeliveryFailure(
          error: 'Failed to complete delivery',
          deliveryId: 'delivery-001',
        ),
      );

      // Act
      await notifier.completeDelivery(params);

      // Assert
      expect(notifier.state, isA<Error>());
      final error = notifier.state as Error;
      expect(error.message, 'Failed to complete delivery');
    });

    test('completeDelivery should handle exception', () async {
      // Arrange
      final params = CompleteDeliveryParams(
        deliveryId: 'delivery-001',
        delivererId: MockData.testDelivererId,
        customerId: MockData.testCustomerId,
        timestamp: MockData.testDate,
        latitude: 48.8566,
        longitude: 2.3522,
        signatoryName: 'John Doe',
        signatureImagePath: '/path/to/signature.png',
        photosPaths: ['/path/to/photo.jpg'],
      );
      when(mockCompleteUseCase.execute(any))
          .thenThrow(Exception('Network error'));

      // Act
      await notifier.completeDelivery(params);

      // Assert
      expect(notifier.state, isA<Error>());
      final error = notifier.state as Error;
      expect(error.message, contains('Network error'));
    });
  });

  group('DeliveryActionsNotifier - Collect Payment', () {
    test('collectPaymentAuto should set success state', () async {
      // Arrange
      final params = CollectPaymentAutoParams(
        delivererId: MockData.testDelivererId,
        customerId: MockData.testCustomerId,
        customerName: 'John Doe',
        amount: 100.0,
        mode: PaymentMode.cash,
        collectedAt: MockData.testDate,
      );
      final allocations = [
        PaymentAllocation(
          orderId: MockData.testOrderId,
          orderNumber: 'ORD-001',
          allocatedAmount: 100.0,
          orderDate: MockData.testDate,
          isFullyPaid: true,
        ),
      ];
      when(mockPaymentUseCase.executeAutoAllocation(any)).thenAnswer(
        (_) async => CollectPaymentSuccess(
          paymentId: 'payment-001',
          customerId: MockData.testCustomerId,
          amount: 100.0,
          allocations: allocations,
          collectedAt: MockData.testDate,
        ),
      );

      // Act
      await notifier.collectPaymentAuto(params);

      // Assert
      expect(notifier.state, isA<PaymentCollected>());
      final collected = notifier.state as PaymentCollected;
      expect(collected.paymentId, 'payment-001');
      expect(collected.amount, 100.0);
      expect(collected.allocations, allocations);
      verify(mockPaymentUseCase.executeAutoAllocation(params)).called(1);
    });

    test('collectPaymentAuto should set error state on failure', () async {
      // Arrange
      final params = CollectPaymentAutoParams(
        delivererId: MockData.testDelivererId,
        customerId: MockData.testCustomerId,
        customerName: 'John Doe',
        amount: 100.0,
        mode: PaymentMode.cash,
        collectedAt: MockData.testDate,
      );
      when(mockPaymentUseCase.executeAutoAllocation(any)).thenAnswer(
        (_) async => const CollectPaymentFailure(
          error: 'Failed to collect payment',
          customerId: MockData.testCustomerId,
        ),
      );

      // Act
      await notifier.collectPaymentAuto(params);

      // Assert
      expect(notifier.state, isA<Error>());
      final error = notifier.state as Error;
      expect(error.message, 'Failed to collect payment');
    });

    test('collectPaymentManual should set success state', () async {
      // Arrange
      final allocations = [
        PaymentAllocation(
          orderId: MockData.testOrderId,
          orderNumber: 'ORD-001',
          allocatedAmount: 50.0,
          orderDate: MockData.testDate,
          isFullyPaid: false,
        ),
        PaymentAllocation(
          orderId: 'order-2',
          orderNumber: 'ORD-002',
          allocatedAmount: 50.0,
          orderDate: MockData.testDate,
          isFullyPaid: true,
        ),
      ];
      final params = CollectPaymentManualParams(
        delivererId: MockData.testDelivererId,
        customerId: MockData.testCustomerId,
        customerName: 'John Doe',
        amount: 100.0,
        mode: PaymentMode.cash,
        allocations: allocations,
        collectedAt: MockData.testDate,
      );
      when(mockPaymentUseCase.executeManualAllocation(any)).thenAnswer(
        (_) async => CollectPaymentSuccess(
          paymentId: 'payment-001',
          customerId: MockData.testCustomerId,
          amount: 100.0,
          allocations: allocations,
          collectedAt: MockData.testDate,
        ),
      );

      // Act
      await notifier.collectPaymentManual(params);

      // Assert
      expect(notifier.state, isA<PaymentCollected>());
      final collected = notifier.state as PaymentCollected;
      expect(collected.allocations.length, 2);
      verify(mockPaymentUseCase.executeManualAllocation(params)).called(1);
    });

    test('collectPaymentManual should handle exception', () async {
      // Arrange
      final allocations = [
        PaymentAllocation(
          orderId: MockData.testOrderId,
          orderNumber: 'ORD-001',
          allocatedAmount: 100.0,
          orderDate: MockData.testDate,
          isFullyPaid: true,
        ),
      ];
      final params = CollectPaymentManualParams(
        delivererId: MockData.testDelivererId,
        customerId: MockData.testCustomerId,
        customerName: 'John Doe',
        amount: 100.0,
        mode: PaymentMode.cash,
        allocations: allocations,
        collectedAt: MockData.testDate,
      );
      when(mockPaymentUseCase.executeManualAllocation(any))
          .thenThrow(Exception('Network error'));

      // Act
      await notifier.collectPaymentManual(params);

      // Assert
      expect(notifier.state, isA<Error>());
    });
  });

  group('DeliveryActionsNotifier - Packaging', () {
    test('recordPackagingDeposit should set success state', () async {
      // Arrange
      final params = PackagingDepositParams(
        delivererId: MockData.testDelivererId,
        customerId: MockData.testCustomerId,
        customerName: 'John Doe',
        items: [],
      );
      final balance = PackagingBalance(
        customerId: MockData.testCustomerId,
        customerName: 'John Doe',
        items: [],
        totalValue: 50.0,
        lastUpdated: MockData.testDate,
      );
      when(mockPackagingUseCase.recordDeposit(any)).thenAnswer(
        (_) async => ManagePackagingSuccess(
          transactionId: 'trans-001',
          customerId: MockData.testCustomerId,
          type: PackagingTransactionType.deposit,
          totalValue: 50.0,
          newBalance: balance,
          transactionDate: MockData.testDate,
        ),
      );

      // Act
      await notifier.recordPackagingDeposit(params);

      // Assert
      expect(notifier.state, isA<PackagingTransactionRecorded>());
      final recorded = notifier.state as PackagingTransactionRecorded;
      expect(recorded.transactionId, 'trans-001');
      expect(recorded.totalValue, 50.0);
      verify(mockPackagingUseCase.recordDeposit(params)).called(1);
    });

    test('recordPackagingReturn should set success state', () async {
      // Arrange
      final params = PackagingReturnParams(
        delivererId: MockData.testDelivererId,
        customerId: MockData.testCustomerId,
        customerName: 'John Doe',
        items: [],
      );
      final balance = PackagingBalance(
        customerId: MockData.testCustomerId,
        customerName: 'John Doe',
        items: [],
        totalValue: 0.0,
        lastUpdated: MockData.testDate,
      );
      when(mockPackagingUseCase.recordReturn(any)).thenAnswer(
        (_) async => ManagePackagingSuccess(
          transactionId: 'trans-002',
          customerId: MockData.testCustomerId,
          type: PackagingTransactionType.return_,
          totalValue: 50.0,
          newBalance: balance,
          transactionDate: MockData.testDate,
        ),
      );

      // Act
      await notifier.recordPackagingReturn(params);

      // Assert
      expect(notifier.state, isA<PackagingTransactionRecorded>());
      final recorded = notifier.state as PackagingTransactionRecorded;
      expect(recorded.type, PackagingTransactionType.return_);
      verify(mockPackagingUseCase.recordReturn(params)).called(1);
    });

    test('scanPackagingQrCode should set success state', () async {
      // Arrange
      const qrData = 'QR-12345';
      final packagingData = PackagingQrData(
        packagingId: 'type-001',
        packagingName: 'Box',
        quantity: 1,
        batchNumber: 'SN-12345',
      );
      when(mockPackagingUseCase.scanQrCode(any)).thenAnswer(
        (_) async => PackagingQrSuccess(packagingData),
      );

      // Act
      await notifier.scanPackagingQrCode(qrData);

      // Assert
      expect(notifier.state, isA<QrCodeScanned>());
      final scanned = notifier.state as QrCodeScanned;
      expect(scanned.data.batchNumber, 'SN-12345');
      verify(mockPackagingUseCase.scanQrCode(qrData)).called(1);
    });

    test('scanPackagingQrCode should set error state on failure', () async {
      // Arrange
      const qrData = 'INVALID-QR';
      when(mockPackagingUseCase.scanQrCode(any)).thenAnswer(
        (_) async => const PackagingQrFailure('Invalid QR code'),
      );

      // Act
      await notifier.scanPackagingQrCode(qrData);

      // Assert
      expect(notifier.state, isA<Error>());
      final error = notifier.state as Error;
      expect(error.message, 'Invalid QR code');
    });
  });

  group('DeliveryActionsNotifier - Reset State', () {
    test('resetState should set state to idle', () {
      // Arrange
      notifier.state = const DeliveryActionsState.error('Test error');

      // Act
      notifier.resetState();

      // Assert
      expect(notifier.state, isA<Idle>());
    });

    test('resetState after success should set state to idle', () async {
      // Arrange
      final allocations = [
        PaymentAllocation(
          orderId: MockData.testOrderId,
          orderNumber: 'ORD-001',
          allocatedAmount: 100.0,
          orderDate: MockData.testDate,
          isFullyPaid: true,
        ),
      ];
      final params = CollectPaymentAutoParams(
        delivererId: MockData.testDelivererId,
        customerId: MockData.testCustomerId,
        customerName: 'John Doe',
        amount: 100.0,
        mode: PaymentMode.cash,
        collectedAt: MockData.testDate,
      );
      when(mockPaymentUseCase.executeAutoAllocation(any)).thenAnswer(
        (_) async => CollectPaymentSuccess(
          paymentId: 'payment-001',
          customerId: MockData.testCustomerId,
          amount: 100.0,
          allocations: allocations,
          collectedAt: MockData.testDate,
        ),
      );
      await notifier.collectPaymentAuto(params);

      // Act
      notifier.resetState();

      // Assert
      expect(notifier.state, isA<Idle>());
    });
  });

  group('Params Classes', () {
    test('DeliveryHistoryParams should create with required fields', () {
      // Arrange & Act
      const params = DeliveryHistoryParams(
        delivererId: 'deliverer-123',
        startDate: null,
        endDate: null,
      );

      // Assert
      expect(params.delivererId, 'deliverer-123');
      expect(params.startDate, isNull);
    });

    test('EarningsParams should create with required fields', () {
      // Arrange & Act
      const params = EarningsParams(
        delivererId: 'deliverer-123',
      );

      // Assert
      expect(params.delivererId, 'deliverer-123');
    });

    test('StatsParams should create with required fields', () {
      // Arrange & Act
      const params = StatsParams(
        delivererId: 'deliverer-123',
      );

      // Assert
      expect(params.delivererId, 'deliverer-123');
    });
  });
}
