import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:awid_mobile/features/deliverer/domain/usecases/manage_packaging_usecase.dart';
import 'package:awid_mobile/features/deliverer/domain/repositories/delivery_actions_repository.dart';
import 'package:awid_mobile/features/deliverer/domain/entities/packaging_transaction.dart';
import '../../helpers/mock_data.dart';

@GenerateMocks([DeliveryActionsRepository])
import 'manage_packaging_usecase_test.mocks.dart';

void main() {
  late ManagePackagingUseCase useCase;
  late MockDeliveryActionsRepository mockRepository;

  setUp(() {
    mockRepository = MockDeliveryActionsRepository();
    useCase = ManagePackagingUseCase(mockRepository);
  });

  group('ManagePackagingUseCase - Deposit', () {
    final mockItems = [
      PackagingItem(
        packagingTypeId: 'pkg-001',
        packagingName: 'Bouteille 1.5L',
        quantity: 5,
        unitValue: 50.0,
      ),
      PackagingItem(
        packagingTypeId: 'pkg-002',
        packagingName: 'Caisse plastique',
        quantity: 2,
        unitValue: 200.0,
      ),
    ];

    final validDepositParams = PackagingDepositParams(
      delivererId: 'deliverer-789',
      customerId: 'customer-456',
      customerName: 'John Doe',
      items: mockItems,
      notes: 'Deposit recorded',
      qrCodeData: 'QR123456',
    );

    final mockBalance = PackagingBalance(
      customerId: 'customer-456',
      totalValue: 650.0,
      items: mockItems,
      lastUpdated: DateTime.now(),
    );

    test('should record deposit successfully', () async {
      // Arrange
      when(mockRepository.savePackagingTransaction(any))
          .thenAnswer((_) async => {});
      when(mockRepository.uploadPackagingTransaction(any))
          .thenAnswer((_) async => {});
      when(mockRepository.getPackagingBalance(validDepositParams.customerId))
          .thenAnswer((_) async => mockBalance);

      // Act
      final result = await useCase.recordDeposit(validDepositParams);

      // Assert
      expect(result.isSuccess, true);
      final success = result as ManagePackagingSuccess;
      expect(success.customerId, validDepositParams.customerId);
      expect(success.type, PackagingTransactionType.deposit);
      expect(success.totalValue, 650.0);
      verify(mockRepository.savePackagingTransaction(any)).called(1);
    });

    test('should calculate total value correctly', () {
      // Assert
      expect(validDepositParams.totalValue, 650.0);
    });

    test('should calculate total items correctly', () {
      // Assert
      expect(validDepositParams.totalItems, 7);
    });

    test('should throw when deliverer ID is empty', () async {
      // Arrange
      final params = PackagingDepositParams(
        delivererId: '',
        customerId: 'customer-456',
        customerName: 'John Doe',
        items: mockItems,
      );

      // Act
      final result = await useCase.recordDeposit(params);

      // Assert
      expect(result.isFailure, true);
      final failure = result as ManagePackagingFailure;
      expect(failure.error, contains('livreur est requis'));
    });

    test('should throw when customer ID is empty', () async {
      // Arrange
      final params = PackagingDepositParams(
        delivererId: 'deliverer-789',
        customerId: '',
        customerName: 'John Doe',
        items: mockItems,
      );

      // Act
      final result = await useCase.recordDeposit(params);

      // Assert
      expect(result.isFailure, true);
      final failure = result as ManagePackagingFailure;
      expect(failure.error, contains('client est requis'));
    });

    test('should throw when customer name is empty', () async {
      // Arrange
      final params = PackagingDepositParams(
        delivererId: 'deliverer-789',
        customerId: 'customer-456',
        customerName: '',
        items: mockItems,
      );

      // Act
      final result = await useCase.recordDeposit(params);

      // Assert
      expect(result.isFailure, true);
      final failure = result as ManagePackagingFailure;
      expect(failure.error, contains('nom du client est requis'));
    });

    test('should throw when items list is empty', () async {
      // Arrange
      final params = PackagingDepositParams(
        delivererId: 'deliverer-789',
        customerId: 'customer-456',
        customerName: 'John Doe',
        items: [],
      );

      // Act
      final result = await useCase.recordDeposit(params);

      // Assert
      expect(result.isFailure, true);
      final failure = result as ManagePackagingFailure;
      expect(failure.error, contains('article de consigne est requis'));
    });

    test('should throw when item quantity is zero', () async {
      // Arrange
      final invalidItems = [
        PackagingItem(
          packagingTypeId: 'pkg-001',
          packagingName: 'Bouteille 1.5L',
          quantity: 0,
          unitValue: 50.0,
        ),
      ];
      final params = PackagingDepositParams(
        delivererId: 'deliverer-789',
        customerId: 'customer-456',
        customerName: 'John Doe',
        items: invalidItems,
      );

      // Act
      final result = await useCase.recordDeposit(params);

      // Assert
      expect(result.isFailure, true);
      final failure = result as ManagePackagingFailure;
      expect(failure.error, contains('quantité doit être positive'));
    });

    test('should throw when item unit value is zero', () async {
      // Arrange
      final invalidItems = [
        PackagingItem(
          packagingTypeId: 'pkg-001',
          packagingName: 'Bouteille 1.5L',
          quantity: 5,
          unitValue: 0.0,
        ),
      ];
      final params = PackagingDepositParams(
        delivererId: 'deliverer-789',
        customerId: 'customer-456',
        customerName: 'John Doe',
        items: invalidItems,
      );

      // Act
      final result = await useCase.recordDeposit(params);

      // Assert
      expect(result.isFailure, true);
      final failure = result as ManagePackagingFailure;
      expect(failure.error, contains('valeur unitaire doit être positive'));
    });

    test('should succeed even if upload fails', () async {
      // Arrange
      when(mockRepository.savePackagingTransaction(any))
          .thenAnswer((_) async => {});
      when(mockRepository.uploadPackagingTransaction(any))
          .thenThrow(Exception('Network error'));
      when(mockRepository.getPackagingBalance(validDepositParams.customerId))
          .thenAnswer((_) async => mockBalance);

      // Act
      final result = await useCase.recordDeposit(validDepositParams);

      // Assert
      expect(result.isSuccess, true);
    });

    test('should validate params correctly', () {
      // Assert
      expect(validDepositParams.isValid, true);
    });

    test('should detect invalid params', () {
      // Arrange
      final invalidParams = PackagingDepositParams(
        delivererId: '',
        customerId: 'customer-456',
        customerName: 'John Doe',
        items: mockItems,
      );

      // Assert
      expect(invalidParams.isValid, false);
    });
  });

  group('ManagePackagingUseCase - Return', () {
    final mockItems = [
      PackagingItem(
        packagingTypeId: 'pkg-001',
        packagingName: 'Bouteille 1.5L',
        quantity: 3,
        unitValue: 50.0,
      ),
    ];

    final validReturnParams = PackagingReturnParams(
      delivererId: 'deliverer-789',
      customerId: 'customer-456',
      customerName: 'John Doe',
      items: mockItems,
      notes: 'Return recorded',
    );

    final mockBalance = PackagingBalance(
      customerId: 'customer-456',
      totalValue: 500.0,
      items: mockItems,
      lastUpdated: DateTime.now(),
    );

    final mockNewBalance = PackagingBalance(
      customerId: 'customer-456',
      totalValue: 350.0,
      items: [],
      lastUpdated: DateTime.now(),
    );

    test('should record return successfully', () async {
      // Arrange
      when(mockRepository.getPackagingBalance(validReturnParams.customerId))
          .thenAnswer((_) async => mockBalance)
          .thenAnswer((_) async => mockNewBalance);
      when(mockRepository.savePackagingTransaction(any))
          .thenAnswer((_) async => {});
      when(mockRepository.uploadPackagingTransaction(any))
          .thenAnswer((_) async => {});

      // Act
      final result = await useCase.recordReturn(validReturnParams);

      // Assert
      expect(result.isSuccess, true);
      final success = result as ManagePackagingSuccess;
      expect(success.customerId, validReturnParams.customerId);
      expect(success.type, PackagingTransactionType.return_);
      expect(success.totalValue, 150.0);
    });

    test('should fail when balance is insufficient', () async {
      // Arrange
      final insufficientBalance = PackagingBalance(
        customerId: 'customer-456',
        totalValue: 100.0,
        items: [],
        lastUpdated: DateTime.now(),
      );
      when(mockRepository.getPackagingBalance(validReturnParams.customerId))
          .thenAnswer((_) async => insufficientBalance);

      // Act
      final result = await useCase.recordReturn(validReturnParams);

      // Assert
      expect(result.isFailure, true);
      final failure = result as ManagePackagingFailure;
      expect(failure.error, contains('Solde consignes insuffisant'));
      expect(failure.isBalanceError, true);
    });

    test('should calculate total value correctly', () {
      // Assert
      expect(validReturnParams.totalValue, 150.0);
    });

    test('should calculate total items correctly', () {
      // Assert
      expect(validReturnParams.totalItems, 3);
    });

    test('should validate params correctly', () {
      // Assert
      expect(validReturnParams.isValid, true);
    });
  });

  group('ManagePackagingUseCase - QR Scan', () {
    const qrData = 'PKG-QR-123456';

    final mockQrInfo = PackagingQrData(
      packagingTypeId: 'pkg-001',
      packagingName: 'Bouteille 1.5L',
      unitValue: 50.0,
      scannedAt: DateTime.now(),
    );

    test('should scan QR code successfully', () async {
      // Arrange
      when(mockRepository.scanPackagingQrCode(qrData))
          .thenAnswer((_) async => mockQrInfo);

      // Act
      final result = await useCase.scanQrCode(qrData);

      // Assert
      expect(result.isSuccess, true);
      final success = result as PackagingQrSuccess;
      expect(success.data.packagingTypeId, 'pkg-001');
      verify(mockRepository.scanPackagingQrCode(qrData)).called(1);
    });

    test('should fail when QR code is empty', () async {
      // Act
      final result = await useCase.scanQrCode('');

      // Assert
      expect(result.isFailure, true);
      final failure = result as PackagingQrFailure;
      expect(failure.error, contains('vide'));
    });

    test('should fail when QR code is invalid', () async {
      // Arrange
      when(mockRepository.scanPackagingQrCode(qrData))
          .thenAnswer((_) async => null);

      // Act
      final result = await useCase.scanQrCode(qrData);

      // Assert
      expect(result.isFailure, true);
      final failure = result as PackagingQrFailure;
      expect(failure.error, contains('invalide'));
    });

    test('should handle scan errors', () async {
      // Arrange
      when(mockRepository.scanPackagingQrCode(qrData))
          .thenThrow(Exception('Scan error'));

      // Act
      final result = await useCase.scanQrCode(qrData);

      // Assert
      expect(result.isFailure, true);
      final failure = result as PackagingQrFailure;
      expect(failure.error, contains('Scan error'));
    });
  });

  group('ManagePackagingUseCase - Helper Methods', () {
    const customerId = 'customer-456';
    const delivererId = 'deliverer-789';

    test('should get packaging balance', () async {
      // Arrange
      final mockBalance = PackagingBalance(
        customerId: customerId,
        totalValue: 500.0,
        items: [],
        lastUpdated: DateTime.now(),
      );
      when(mockRepository.getPackagingBalance(customerId))
          .thenAnswer((_) async => mockBalance);

      // Act
      final result = await useCase.getPackagingBalance(customerId);

      // Assert
      expect(result.totalValue, 500.0);
      verify(mockRepository.getPackagingBalance(customerId)).called(1);
    });

    test('should throw when customer ID is empty for balance', () async {
      // Act & Assert
      expect(
        () => useCase.getPackagingBalance(''),
        throwsArgumentError,
      );
    });

    test('should get packaging types', () async {
      // Arrange
      final mockTypes = [
        PackagingType(
          id: 'pkg-001',
          name: 'Bouteille 1.5L',
          unitValue: 50.0,
          category: 'Bouteilles',
        ),
      ];
      when(mockRepository.getPackagingTypes())
          .thenAnswer((_) async => mockTypes);

      // Act
      final result = await useCase.getPackagingTypes();

      // Assert
      expect(result.length, 1);
      expect(result.first.name, 'Bouteille 1.5L');
    });

    test('should get transaction history', () async {
      // Arrange
      final mockTransactions = [
        PackagingTransaction(
          id: 'trans-001',
          delivererId: delivererId,
          customerId: customerId,
          customerName: 'John Doe',
          type: PackagingTransactionType.deposit,
          items: [],
          transactionDate: DateTime.now(),
          isUploaded: true,
          createdAt: DateTime.now(),
        ),
      ];
      when(mockRepository.getPackagingTransactions(
        delivererId: delivererId,
        startDate: null,
        endDate: null,
        type: null,
      )).thenAnswer((_) async => mockTransactions);

      // Act
      final result = await useCase.getTransactionHistory(
        delivererId: delivererId,
      );

      // Assert
      expect(result.length, 1);
      expect(result.first.type, PackagingTransactionType.deposit);
    });

    test('should throw when deliverer ID is empty for history', () async {
      // Act & Assert
      expect(
        () => useCase.getTransactionHistory(delivererId: ''),
        throwsArgumentError,
      );
    });

    test('should filter transaction history by type', () async {
      // Arrange
      final mockTransactions = [
        PackagingTransaction(
          id: 'trans-001',
          delivererId: delivererId,
          customerId: customerId,
          customerName: 'John Doe',
          type: PackagingTransactionType.deposit,
          items: [],
          transactionDate: DateTime.now(),
          isUploaded: true,
          createdAt: DateTime.now(),
        ),
      ];
      when(mockRepository.getPackagingTransactions(
        delivererId: delivererId,
        startDate: null,
        endDate: null,
        type: PackagingTransactionType.deposit,
      )).thenAnswer((_) async => mockTransactions);

      // Act
      final result = await useCase.getTransactionHistory(
        delivererId: delivererId,
        type: PackagingTransactionType.deposit,
      );

      // Assert
      expect(result.length, 1);
      expect(result.first.type, PackagingTransactionType.deposit);
    });

    test('should filter transaction history by date range', () async {
      // Arrange
      final startDate = DateTime(2026, 1, 1);
      final endDate = DateTime(2026, 1, 31);
      final mockTransactions = [
        PackagingTransaction(
          id: 'trans-001',
          delivererId: delivererId,
          customerId: customerId,
          customerName: 'John Doe',
          type: PackagingTransactionType.deposit,
          items: [],
          transactionDate: DateTime(2026, 1, 15),
          isUploaded: true,
          createdAt: DateTime(2026, 1, 15),
        ),
      ];
      when(mockRepository.getPackagingTransactions(
        delivererId: delivererId,
        startDate: startDate,
        endDate: endDate,
        type: null,
      )).thenAnswer((_) async => mockTransactions);

      // Act
      final result = await useCase.getTransactionHistory(
        delivererId: delivererId,
        startDate: startDate,
        endDate: endDate,
      );

      // Assert
      expect(result.length, 1);
    });
  });

  group('ManagePackagingSuccess', () {
    final success = ManagePackagingSuccess(
      transactionId: 'trans-001',
      customerId: 'customer-456',
      type: PackagingTransactionType.deposit,
      totalValue: 1500.0,
      newBalance: PackagingBalance(
        customerId: 'customer-456',
        totalValue: 2500.0,
        items: [],
        lastUpdated: DateTime.now(),
      ),
      transactionDate: DateTime.now(),
    );

    test('should format total value correctly', () {
      // Assert
      expect(success.totalValueFormatted, '1 500 DZD');
    });

    test('should format new balance correctly', () {
      // Assert
      expect(success.newBalanceFormatted, '2 500 DZD');
    });
  });

  group('ManagePackagingFailure', () {
    test('should detect balance errors', () {
      // Arrange
      final failure = ManagePackagingFailure(
        error: 'Solde consignes insuffisant',
        customerId: 'customer-456',
        type: PackagingTransactionType.return_,
      );

      // Assert
      expect(failure.isBalanceError, true);
      expect(failure.isValidationError, false);
    });

    test('should detect validation errors', () {
      // Arrange
      final failure = ManagePackagingFailure(
        error: 'La quantité doit être positive',
        customerId: 'customer-456',
        type: PackagingTransactionType.deposit,
      );

      // Assert
      expect(failure.isValidationError, true);
      expect(failure.isBalanceError, false);
    });
  });

  group('PackagingItem', () {
    test('should calculate total value correctly', () {
      // Arrange
      final item = PackagingItem(
        packagingTypeId: 'pkg-001',
        packagingName: 'Bouteille 1.5L',
        quantity: 5,
        unitValue: 50.0,
      );

      // Assert
      expect(item.totalValue, 250.0);
    });
  });

  group('ManagePackagingUseCase - Edge Cases', () {
    test('should handle repository errors', () async {
      // Arrange
      final params = PackagingDepositParams(
        delivererId: 'deliverer-789',
        customerId: 'customer-456',
        customerName: 'John Doe',
        items: [
          PackagingItem(
            packagingTypeId: 'pkg-001',
            packagingName: 'Bouteille 1.5L',
            quantity: 5,
            unitValue: 50.0,
          ),
        ],
      );
      when(mockRepository.savePackagingTransaction(any))
          .thenThrow(Exception('Database error'));

      // Act
      final result = await useCase.recordDeposit(params);

      // Assert
      expect(result.isFailure, true);
      final failure = result as ManagePackagingFailure;
      expect(failure.error, contains('Database error'));
    });

    test('should handle timeout', () async {
      // Arrange
      final params = PackagingDepositParams(
        delivererId: 'deliverer-789',
        customerId: 'customer-456',
        customerName: 'John Doe',
        items: [
          PackagingItem(
            packagingTypeId: 'pkg-001',
            packagingName: 'Bouteille 1.5L',
            quantity: 5,
            unitValue: 50.0,
          ),
        ],
      );
      when(mockRepository.savePackagingTransaction(any)).thenAnswer(
        (_) => Future.delayed(
          const Duration(seconds: 10),
          () => {},
        ),
      );

      // Act & Assert
      expect(
        () => useCase.recordDeposit(params).timeout(
              const Duration(seconds: 1),
            ),
        throwsA(isA<TimeoutException>()),
      );
    });

    test('should generate unique transaction IDs', () async {
      // Arrange
      final params = PackagingDepositParams(
        delivererId: 'deliverer-789',
        customerId: 'customer-456',
        customerName: 'John Doe',
        items: [
          PackagingItem(
            packagingTypeId: 'pkg-001',
            packagingName: 'Bouteille 1.5L',
            quantity: 5,
            unitValue: 50.0,
          ),
        ],
      );
      final mockBalance = PackagingBalance(
        customerId: 'customer-456',
        totalValue: 500.0,
        items: [],
        lastUpdated: DateTime.now(),
      );
      final transactionIds = <String>[];
      when(mockRepository.savePackagingTransaction(any))
          .thenAnswer((invocation) async {
        final transaction = invocation.positionalArguments[0] as PackagingTransaction;
        transactionIds.add(transaction.id);
      });
      when(mockRepository.uploadPackagingTransaction(any))
          .thenAnswer((_) async => {});
      when(mockRepository.getPackagingBalance(params.customerId))
          .thenAnswer((_) async => mockBalance);

      // Act
      await useCase.recordDeposit(params);
      await Future.delayed(const Duration(milliseconds: 10));
      await useCase.recordDeposit(params);

      // Assert
      expect(transactionIds.length, 2);
      expect(transactionIds[0], isNot(equals(transactionIds[1])));
    });
  });
}
