import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:awid_mobile/core/storage/local_storage.dart';
import 'package:awid_mobile/features/deliverer/data/repositories/delivery_actions_repository_impl.dart';
import 'package:awid_mobile/features/deliverer/data/datasources/delivery_actions_remote_datasource.dart';
import 'package:awid_mobile/features/deliverer/data/models/proof_of_delivery_model.dart';
import 'package:awid_mobile/features/deliverer/data/models/payment_collection_model.dart';
import 'package:awid_mobile/features/deliverer/data/models/packaging_transaction_model.dart';
import 'package:awid_mobile/features/deliverer/domain/entities/proof_of_delivery.dart';
import 'package:awid_mobile/features/deliverer/domain/entities/payment_collection.dart';
import 'package:awid_mobile/features/deliverer/domain/entities/packaging_transaction.dart';

import '../../helpers/test_helpers.dart';
import '../../helpers/mock_data.dart';

@GenerateMocks([DeliveryActionsRemoteDatasource, LocalStorage])
import 'delivery_actions_repository_impl_test.mocks.dart';

void main() {
  late DeliveryActionsRepositoryImpl repository;
  late MockDeliveryActionsRemoteDatasource mockRemoteDatasource;
  late MockLocalStorage mockLocalStorage;

  setUp(() {
    mockRemoteDatasource = MockDeliveryActionsRemoteDatasource();
    mockLocalStorage = MockLocalStorage();
    repository = DeliveryActionsRepositoryImpl(
      mockRemoteDatasource,
      mockLocalStorage,
    );
  });

  group('DeliveryActionsRepositoryImpl - Proof of Delivery', () {
    test('saveProofOfDelivery should save to local storage', () async {
      // Arrange
      final proof = MockData.mockProofOfDelivery;
      when(mockLocalStorage.getList(any)).thenAnswer((_) async => []);
      when(mockLocalStorage.setList(any, any)).thenAnswer((_) async => {});

      // Act
      await repository.saveProofOfDelivery(proof);

      // Assert
      verify(mockLocalStorage.getList('proofs_of_delivery')).called(1);
      verify(mockLocalStorage.setList('proofs_of_delivery', any)).called(1);
    });

    test('saveProofOfDelivery should replace existing proof', () async {
      // Arrange
      final proof = MockData.mockProofOfDelivery;
      final existingModel = ProofOfDeliveryModel.fromEntity(proof);
      when(mockLocalStorage.getList(any)).thenAnswer(
        (_) async => [existingModel.toJson()],
      );
      when(mockLocalStorage.setList(any, any)).thenAnswer((_) async => {});

      // Act
      await repository.saveProofOfDelivery(proof);

      // Assert
      final captured = verify(mockLocalStorage.setList(
        'proofs_of_delivery',
        captureAny,
      )).captured.first as List;
      expect(captured.length, 1); // Should still be 1 (replaced)
    });

    test('saveProofOfDelivery should handle errors', () async {
      // Arrange
      final proof = MockData.mockProofOfDelivery;
      when(mockLocalStorage.getList(any))
          .thenThrow(Exception('Storage error'));

      // Act & Assert
      expect(
        () => repository.saveProofOfDelivery(proof),
        throwsException,
      );
    });

    test('uploadProofOfDelivery should upload and mark as uploaded', () async {
      // Arrange
      final proof = MockData.mockProofOfDelivery;
      final proofModel = ProofOfDeliveryModel.fromEntity(proof);
      final uploadResponse = UploadResponse(
        isSuccess: true,
        uploadedAt: MockData.testDate,
        message: 'Success',
      );
      
      when(mockLocalStorage.getList(any)).thenAnswer(
        (_) async => [proofModel.toJson()],
      );
      when(mockRemoteDatasource.uploadProofOfDelivery(
        deliveryId: anyNamed('deliveryId'),
        delivererId: anyNamed('delivererId'),
        customerId: anyNamed('customerId'),
        timestamp: anyNamed('timestamp'),
        latitude: anyNamed('latitude'),
        longitude: anyNamed('longitude'),
        signatoryName: anyNamed('signatoryName'),
        signatureImagePath: anyNamed('signatureImagePath'),
        photosPaths: anyNamed('photosPaths'),
        notes: anyNamed('notes'),
        customerFeedback: anyNamed('customerFeedback'),
      )).thenAnswer((_) async => uploadResponse);
      when(mockLocalStorage.setList(any, any)).thenAnswer((_) async => {});

      // Act
      await repository.uploadProofOfDelivery(proof.id);

      // Assert
      verify(mockRemoteDatasource.uploadProofOfDelivery(
        deliveryId: proofModel.deliveryId,
        delivererId: proofModel.delivererId,
        customerId: proofModel.customerId,
        timestamp: proofModel.timestamp,
        latitude: proofModel.latitude,
        longitude: proofModel.longitude,
        signatoryName: proofModel.signatoryName,
        signatureImagePath: proofModel.signatureImagePath,
        photosPaths: proofModel.photosPaths,
        notes: proofModel.notes,
        customerFeedback: proofModel.customerFeedback,
      )).called(1);
    });

    test('uploadProofOfDelivery should skip if already uploaded', () async {
      // Arrange
      final proof = MockData.mockProofOfDelivery;
      final proofModel = ProofOfDeliveryModel.fromEntity(proof).copyWith(
        isUploaded: true,
      );
      
      when(mockLocalStorage.getList(any)).thenAnswer(
        (_) async => [proofModel.toJson()],
      );

      // Act
      await repository.uploadProofOfDelivery(proof.id);

      // Assert
      verifyNever(mockRemoteDatasource.uploadProofOfDelivery(
        deliveryId: anyNamed('deliveryId'),
        delivererId: anyNamed('delivererId'),
        customerId: anyNamed('customerId'),
        timestamp: anyNamed('timestamp'),
        latitude: anyNamed('latitude'),
        longitude: anyNamed('longitude'),
        signatoryName: anyNamed('signatoryName'),
        signatureImagePath: anyNamed('signatureImagePath'),
        photosPaths: anyNamed('photosPaths'),
        notes: anyNamed('notes'),
        customerFeedback: anyNamed('customerFeedback'),
      ));
    });

    test('uploadProofOfDelivery should throw when proof not found', () async {
      // Arrange
      when(mockLocalStorage.getList(any)).thenAnswer((_) async => []);

      // Act & Assert
      expect(
        () => repository.uploadProofOfDelivery('non-existent'),
        throwsException,
      );
    });

    test('getProofsOfDelivery should filter by delivererId', () async {
      // Arrange
      final proof1 = ProofOfDeliveryModel.fromEntity(
        MockData.mockProofOfDelivery,
      );
      final proof2 = ProofOfDeliveryModel.fromEntity(
        MockData.mockProofOfDelivery.copyWith(
          id: 'pod-002',
          delivererId: 'other-deliverer',
        ),
      );
      
      when(mockLocalStorage.getList(any)).thenAnswer(
        (_) async => [proof1.toJson(), proof2.toJson()],
      );

      // Act
      final result = await repository.getProofsOfDelivery(
        delivererId: MockData.testDelivererId,
      );

      // Assert
      expect(result.length, 1);
      expect(result.first.delivererId, MockData.testDelivererId);
    });

    test('getProofsOfDelivery should filter by date range', () async {
      // Arrange
      final proof1 = ProofOfDeliveryModel.fromEntity(
        MockData.mockProofOfDelivery.copyWith(
          deliveredAt: MockData.testDate,
        ),
      );
      final proof2 = ProofOfDeliveryModel.fromEntity(
        MockData.mockProofOfDelivery.copyWith(
          id: 'pod-002',
          deliveredAt: MockData.testDatePast,
        ),
      );
      
      when(mockLocalStorage.getList(any)).thenAnswer(
        (_) async => [proof1.toJson(), proof2.toJson()],
      );

      // Act
      final result = await repository.getProofsOfDelivery(
        delivererId: MockData.testDelivererId,
        startDate: MockData.testDate,
      );

      // Assert
      expect(result.length, 1);
      expect(result.first.id, 'pod-001');
    });

    test('getProofsOfDelivery should filter by upload status', () async {
      // Arrange
      final proof1 = ProofOfDeliveryModel.fromEntity(
        MockData.mockProofOfDelivery,
      ).copyWith(isUploaded: true);
      final proof2 = ProofOfDeliveryModel.fromEntity(
        MockData.mockProofOfDelivery.copyWith(id: 'pod-002'),
      ).copyWith(isUploaded: false);
      
      when(mockLocalStorage.getList(any)).thenAnswer(
        (_) async => [proof1.toJson(), proof2.toJson()],
      );

      // Act
      final result = await repository.getProofsOfDelivery(
        delivererId: MockData.testDelivererId,
        isUploaded: false,
      );

      // Assert
      expect(result.length, 1);
      expect(result.first.id, 'pod-002');
    });

    test('deleteProofOfDelivery should remove from storage', () async {
      // Arrange
      final proof = ProofOfDeliveryModel.fromEntity(MockData.mockProofOfDelivery);
      when(mockLocalStorage.getList(any)).thenAnswer(
        (_) async => [proof.toJson()],
      );
      when(mockLocalStorage.setList(any, any)).thenAnswer((_) async => {});

      // Act
      await repository.deleteProofOfDelivery('pod-001');

      // Assert
      final captured = verify(mockLocalStorage.setList(
        'proofs_of_delivery',
        captureAny,
      )).captured.first as List;
      expect(captured.length, 0); // Should be empty
    });

    test('uploadPendingProofs should upload all pending proofs', () async {
      // Arrange
      final proof1 = ProofOfDeliveryModel.fromEntity(
        MockData.mockProofOfDelivery,
      ).copyWith(isUploaded: false);
      final proof2 = ProofOfDeliveryModel.fromEntity(
        MockData.mockProofOfDelivery.copyWith(id: 'pod-002'),
      ).copyWith(isUploaded: false);
      final uploadResponse = UploadResponse(
        isSuccess: true,
        uploadedAt: MockData.testDate,
        message: 'Success',
      );
      
      when(mockLocalStorage.getList(any)).thenAnswer(
        (_) async => [proof1.toJson(), proof2.toJson()],
      );
      when(mockRemoteDatasource.uploadProofOfDelivery(
        deliveryId: anyNamed('deliveryId'),
        delivererId: anyNamed('delivererId'),
        customerId: anyNamed('customerId'),
        timestamp: anyNamed('timestamp'),
        latitude: anyNamed('latitude'),
        longitude: anyNamed('longitude'),
        signatoryName: anyNamed('signatoryName'),
        signatureImagePath: anyNamed('signatureImagePath'),
        photosPaths: anyNamed('photosPaths'),
        notes: anyNamed('notes'),
        customerFeedback: anyNamed('customerFeedback'),
      )).thenAnswer((_) async => uploadResponse);
      when(mockLocalStorage.setList(any, any)).thenAnswer((_) async => {});

      // Act
      await repository.uploadPendingProofs(MockData.testDelivererId);

      // Assert
      verify(mockRemoteDatasource.uploadProofOfDelivery(
        deliveryId: anyNamed('deliveryId'),
        delivererId: anyNamed('delivererId'),
        customerId: anyNamed('customerId'),
        timestamp: anyNamed('timestamp'),
        latitude: anyNamed('latitude'),
        longitude: anyNamed('longitude'),
        signatoryName: anyNamed('signatoryName'),
        signatureImagePath: anyNamed('signatureImagePath'),
        photosPaths: anyNamed('photosPaths'),
        notes: anyNamed('notes'),
        customerFeedback: anyNamed('customerFeedback'),
      )).called(2);
    });
  });

  group('DeliveryActionsRepositoryImpl - Payment Collection', () {
    test('savePaymentCollection should save to local storage', () async {
      // Arrange
      final payment = MockData.mockPaymentCollection;
      when(mockLocalStorage.getList(any)).thenAnswer((_) async => []);
      when(mockLocalStorage.setList(any, any)).thenAnswer((_) async => {});

      // Act
      await repository.savePaymentCollection(payment);

      // Assert
      verify(mockLocalStorage.getList('payment_collections')).called(1);
      verify(mockLocalStorage.setList('payment_collections', any)).called(1);
    });

    test('uploadPaymentCollection should upload and mark as uploaded', () async {
      // Arrange
      final payment = MockData.mockPaymentCollection;
      final paymentModel = PaymentCollectionModel.fromEntity(payment);
      final uploadResponse = UploadResponse(
        isSuccess: true,
        uploadedAt: MockData.testDate,
        message: 'Success',
      );
      
      when(mockLocalStorage.getList(any)).thenAnswer(
        (_) async => [paymentModel.toJson()],
      );
      when(mockRemoteDatasource.uploadPaymentCollection(
        delivererId: anyNamed('delivererId'),
        customerId: anyNamed('customerId'),
        customerName: anyNamed('customerName'),
        amount: anyNamed('amount'),
        mode: anyNamed('mode'),
        collectedAt: anyNamed('collectedAt'),
        allocations: anyNamed('allocations'),
        reference: anyNamed('reference'),
        notes: anyNamed('notes'),
        receiptImagePath: anyNamed('receiptImagePath'),
      )).thenAnswer((_) async => uploadResponse);
      when(mockLocalStorage.setList(any, any)).thenAnswer((_) async => {});

      // Act
      await repository.uploadPaymentCollection(payment.id);

      // Assert
      verify(mockRemoteDatasource.uploadPaymentCollection(
        delivererId: anyNamed('delivererId'),
        customerId: anyNamed('customerId'),
        customerName: anyNamed('customerName'),
        amount: anyNamed('amount'),
        mode: anyNamed('mode'),
        collectedAt: anyNamed('collectedAt'),
        allocations: anyNamed('allocations'),
        reference: anyNamed('reference'),
        notes: anyNamed('notes'),
        receiptImagePath: anyNamed('receiptImagePath'),
      )).called(1);
    });

    test('getPaymentCollections should filter by mode', () async {
      // Arrange
      final payment1 = PaymentCollectionModel.fromEntity(
        MockData.mockPaymentCollection.copyWith(paymentMethod: PaymentMethod.cash),
      );
      final payment2 = PaymentCollectionModel.fromEntity(
        MockData.mockPaymentCollection.copyWith(
          id: 'payment-002',
          paymentMethod: PaymentMethod.card,
        ),
      );
      
      when(mockLocalStorage.getList(any)).thenAnswer(
        (_) async => [payment1.toJson(), payment2.toJson()],
      );

      // Act
      final result = await repository.getPaymentCollections(
        delivererId: MockData.testDelivererId,
        mode: PaymentMode.cash,
      );

      // Assert
      expect(result.length, 1);
      expect(result.first.paymentMethod, PaymentMethod.cash);
    });

    test('getUnpaidOrders should fetch from remote', () async {
      // Arrange
      final unpaidOrderModels = [
        UnpaidOrderModel(
          orderId: MockData.testOrderId,
          orderNumber: 'ORD-001',
          amount: 25.00,
          dueDate: MockData.testDate,
        ),
      ];
      when(mockRemoteDatasource.getUnpaidOrders(any))
          .thenAnswer((_) async => unpaidOrderModels);

      // Act
      final result = await repository.getUnpaidOrders(MockData.testCustomerId);

      // Assert
      expect(result, isNotEmpty);
      verify(mockRemoteDatasource.getUnpaidOrders(MockData.testCustomerId))
          .called(1);
    });

    test('calculateAutoAllocation should fetch from remote', () async {
      // Arrange
      final allocationModels = [
        PaymentAllocationModel(
          orderId: MockData.testOrderId,
          amount: 25.00,
        ),
      ];
      when(mockRemoteDatasource.calculateAutoAllocation(
        customerId: anyNamed('customerId'),
        amount: anyNamed('amount'),
      )).thenAnswer((_) async => allocationModels);

      // Act
      final result = await repository.calculateAutoAllocation(
        customerId: MockData.testCustomerId,
        amount: 100.00,
      );

      // Assert
      expect(result, isNotEmpty);
      verify(mockRemoteDatasource.calculateAutoAllocation(
        customerId: MockData.testCustomerId,
        amount: 100.00,
      )).called(1);
    });
  });

  group('DeliveryActionsRepositoryImpl - Packaging Transaction', () {
    test('savePackagingTransaction should save to local storage', () async {
      // Arrange
      final transaction = PackagingTransaction(
        id: 'trans-001',
        delivererId: MockData.testDelivererId,
        customerId: MockData.testCustomerId,
        customerName: 'John Doe',
        type: PackagingTransactionType.delivery,
        items: [],
        transactionDate: MockData.testDate,
        notes: null,
        qrCodeData: null,
      );
      when(mockLocalStorage.getList(any)).thenAnswer((_) async => []);
      when(mockLocalStorage.setList(any, any)).thenAnswer((_) async => {});

      // Act
      await repository.savePackagingTransaction(transaction);

      // Assert
      verify(mockLocalStorage.getList('packaging_transactions')).called(1);
      verify(mockLocalStorage.setList('packaging_transactions', any)).called(1);
    });

    test('uploadPackagingTransaction should upload and mark as uploaded', () async {
      // Arrange
      final transaction = PackagingTransaction(
        id: 'trans-001',
        delivererId: MockData.testDelivererId,
        customerId: MockData.testCustomerId,
        customerName: 'John Doe',
        type: PackagingTransactionType.delivery,
        items: [],
        transactionDate: MockData.testDate,
        notes: null,
        qrCodeData: null,
      );
      final transactionModel = PackagingTransactionModel.fromEntity(transaction);
      final uploadResponse = UploadResponse(
        isSuccess: true,
        uploadedAt: MockData.testDate,
        message: 'Success',
      );
      
      when(mockLocalStorage.getList(any)).thenAnswer(
        (_) async => [transactionModel.toJson()],
      );
      when(mockRemoteDatasource.uploadPackagingTransaction(
        delivererId: anyNamed('delivererId'),
        customerId: anyNamed('customerId'),
        customerName: anyNamed('customerName'),
        type: anyNamed('type'),
        items: anyNamed('items'),
        transactionDate: anyNamed('transactionDate'),
        notes: anyNamed('notes'),
        qrCodeData: anyNamed('qrCodeData'),
      )).thenAnswer((_) async => uploadResponse);
      when(mockLocalStorage.setList(any, any)).thenAnswer((_) async => {});

      // Act
      await repository.uploadPackagingTransaction(transaction.id);

      // Assert
      verify(mockRemoteDatasource.uploadPackagingTransaction(
        delivererId: anyNamed('delivererId'),
        customerId: anyNamed('customerId'),
        customerName: anyNamed('customerName'),
        type: anyNamed('type'),
        items: anyNamed('items'),
        transactionDate: anyNamed('transactionDate'),
        notes: anyNamed('notes'),
        qrCodeData: anyNamed('qrCodeData'),
      )).called(1);
    });

    test('getPackagingTypes should cache from remote', () async {
      // Arrange
      final packagingTypeModels = [
        PackagingTypeModel(
          id: 'type-001',
          name: 'Box',
          deposit: 5.00,
        ),
      ];
      when(mockLocalStorage.getList(any)).thenAnswer((_) async => []);
      when(mockRemoteDatasource.getPackagingTypes())
          .thenAnswer((_) async => packagingTypeModels);
      when(mockLocalStorage.setList(any, any)).thenAnswer((_) async => {});

      // Act
      final result = await repository.getPackagingTypes();

      // Assert
      expect(result, isNotEmpty);
      verify(mockRemoteDatasource.getPackagingTypes()).called(1);
      verify(mockLocalStorage.setList('packaging_types', any)).called(1);
    });

    test('getPackagingTypes should return cached data', () async {
      // Arrange
      final packagingTypeModels = [
        PackagingTypeModel(
          id: 'type-001',
          name: 'Box',
          deposit: 5.00,
        ),
      ];
      when(mockLocalStorage.getList(any)).thenAnswer(
        (_) async => packagingTypeModels.map((t) => t.toJson()).toList(),
      );

      // Act
      final result = await repository.getPackagingTypes();

      // Assert
      expect(result, isNotEmpty);
      verifyNever(mockRemoteDatasource.getPackagingTypes());
    });

    test('getPackagingBalance should fetch from remote', () async {
      // Arrange
      final balanceModel = PackagingBalanceModel(
        customerId: MockData.testCustomerId,
        totalDeposit: 50.00,
        items: [],
      );
      when(mockRemoteDatasource.getPackagingBalance(any))
          .thenAnswer((_) async => balanceModel);

      // Act
      final result = await repository.getPackagingBalance(MockData.testCustomerId);

      // Assert
      expect(result.customerId, MockData.testCustomerId);
      verify(mockRemoteDatasource.getPackagingBalance(MockData.testCustomerId))
          .called(1);
    });

    test('scanPackagingQrCode should fetch from remote', () async {
      // Arrange
      final qrDataModel = PackagingQrDataModel(
        packagingTypeId: 'type-001',
        packagingTypeName: 'Box',
        serialNumber: 'SN-12345',
      );
      when(mockRemoteDatasource.scanPackagingQrCode(any))
          .thenAnswer((_) async => qrDataModel);

      // Act
      final result = await repository.scanPackagingQrCode('QR-DATA');

      // Assert
      expect(result, isNotNull);
      verify(mockRemoteDatasource.scanPackagingQrCode('QR-DATA')).called(1);
    });
  });

  group('DeliveryActionsRepositoryImpl - History & Stats', () {
    test('getDeliveryHistory should fetch from remote', () async {
      // Arrange
      final historyData = [
        {
          'id': 'delivery-001',
          'order_number': 'ORD-001',
          'customer_name': 'John Doe',
          'delivery_date': MockData.testDate.toIso8601String(),
          'status': 'completed',
          'order_value': 25.00,
          'payment_collected': 25.00,
          'has_proof_of_delivery': true,
          'notes': null,
        },
      ];
      when(mockRemoteDatasource.getDeliveryHistory(
        delivererId: anyNamed('delivererId'),
        startDate: anyNamed('startDate'),
        endDate: anyNamed('endDate'),
        status: anyNamed('status'),
        customerId: anyNamed('customerId'),
        limit: anyNamed('limit'),
        offset: anyNamed('offset'),
      )).thenAnswer((_) async => historyData);

      // Act
      final result = await repository.getDeliveryHistory(
        delivererId: MockData.testDelivererId,
      );

      // Assert
      expect(result, isNotEmpty);
      expect(result.first.id, 'delivery-001');
    });

    test('getDelivererEarnings should fetch from remote', () async {
      // Arrange
      final earningsData = {
        'deliverer_id': MockData.testDelivererId,
        'start_date': MockData.testDatePast.toIso8601String(),
        'end_date': MockData.testDate.toIso8601String(),
        'total_deliveries': 50,
        'total_order_value': 1250.00,
        'total_commissions': 125.00,
        'total_bonuses': 25.00,
        'total_earnings': 150.00,
        'breakdown': [],
      };
      when(mockRemoteDatasource.getDelivererEarnings(
        delivererId: anyNamed('delivererId'),
        startDate: anyNamed('startDate'),
        endDate: anyNamed('endDate'),
      )).thenAnswer((_) async => earningsData);

      // Act
      final result = await repository.getDelivererEarnings(
        delivererId: MockData.testDelivererId,
      );

      // Assert
      expect(result.delivererId, MockData.testDelivererId);
      expect(result.totalDeliveries, 50);
    });

    test('getDetailedStats should fetch from remote', () async {
      // Arrange
      final statsData = {
        'deliverer_id': MockData.testDelivererId,
        'start_date': MockData.testDatePast.toIso8601String(),
        'end_date': MockData.testDate.toIso8601String(),
        'total_deliveries': 50,
        'successful_deliveries': 48,
        'failed_deliveries': 2,
        'success_rate': 96.0,
        'average_delivery_time': 25.5,
        'total_distance': 150.0,
        'average_rating': 4.8,
        'deliveries_by_status': {},
        'earnings_by_period': {},
      };
      when(mockRemoteDatasource.getDetailedStats(
        delivererId: anyNamed('delivererId'),
        startDate: anyNamed('startDate'),
        endDate: anyNamed('endDate'),
      )).thenAnswer((_) async => statsData);

      // Act
      final result = await repository.getDetailedStats(
        delivererId: MockData.testDelivererId,
      );

      // Assert
      expect(result.delivererId, MockData.testDelivererId);
      expect(result.totalDeliveries, 50);
      expect(result.successRate, 96.0);
    });
  });

  group('DeliveryActionsRepositoryImpl - Synchronization', () {
    test('syncAllPendingData should fetch from remote', () async {
      // Arrange
      final syncData = {
        'proofs_uploaded': 2,
        'payments_uploaded': 3,
        'transactions_uploaded': 1,
        'errors': [],
        'synced_at': MockData.testDate.toIso8601String(),
      };
      when(mockRemoteDatasource.syncAllPendingData(any))
          .thenAnswer((_) async => syncData);

      // Act
      final result = await repository.syncAllPendingData(MockData.testDelivererId);

      // Assert
      expect(result.proofsUploaded, 2);
      expect(result.paymentsUploaded, 3);
      expect(result.transactionsUploaded, 1);
    });

    test('getSyncStatus should fetch from remote', () async {
      // Arrange
      final statusData = {
        'pending_proofs': 2,
        'pending_payments': 3,
        'pending_transactions': 1,
        'last_sync_at': MockData.testDate.toIso8601String(),
        'is_syncing': false,
      };
      when(mockRemoteDatasource.getSyncStatus(any))
          .thenAnswer((_) async => statusData);

      // Act
      final result = await repository.getSyncStatus(MockData.testDelivererId);

      // Assert
      expect(result.pendingProofs, 2);
      expect(result.pendingPayments, 3);
      expect(result.pendingTransactions, 1);
      expect(result.isSyncing, false);
    });

    test('forceSyncAll should upload all pending data', () async {
      // Arrange
      when(mockLocalStorage.getList(any)).thenAnswer((_) async => []);

      // Act
      await repository.forceSyncAll(MockData.testDelivererId);

      // Assert
      verify(mockLocalStorage.getList('proofs_of_delivery')).called(greaterThan(0));
      verify(mockLocalStorage.getList('payment_collections')).called(greaterThan(0));
      verify(mockLocalStorage.getList('packaging_transactions')).called(greaterThan(0));
    });
  });
}
