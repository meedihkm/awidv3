import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:awid_mobile/features/deliverer/domain/usecases/complete_delivery_usecase.dart';
import 'package:awid_mobile/features/deliverer/domain/repositories/delivery_actions_repository.dart';
import 'package:awid_mobile/features/deliverer/domain/repositories/deliverer_repository.dart';
import 'package:awid_mobile/features/deliverer/domain/entities/proof_of_delivery.dart';
import '../../helpers/mock_data.dart';

@GenerateMocks([DeliveryActionsRepository, DelivererRepository])
import 'complete_delivery_usecase_test.mocks.dart';

void main() {
  late CompleteDeliveryUseCase useCase;
  late MockDeliveryActionsRepository mockActionsRepository;
  late MockDelivererRepository mockDelivererRepository;

  setUp(() {
    mockActionsRepository = MockDeliveryActionsRepository();
    mockDelivererRepository = MockDelivererRepository();
    useCase = CompleteDeliveryUseCase(
      mockActionsRepository,
      mockDelivererRepository,
    );
  });

  group('CompleteDeliveryUseCase', () {
    final validParams = CompleteDeliveryParams(
      deliveryId: 'delivery-001',
      delivererId: 'deliverer-789',
      customerId: 'customer-456',
      latitude: 48.8566,
      longitude: 2.3522,
      signatoryName: 'John Doe',
      signatureImagePath: '/path/to/signature.png',
      photosPaths: ['/path/to/photo1.jpg', '/path/to/photo2.jpg'],
      notes: 'Delivered to front door',
      customerFeedback: 'Great service',
    );

    test('should complete delivery successfully', () async {
      // Arrange
      when(mockActionsRepository.saveProofOfDelivery(any))
          .thenAnswer((_) async => {});
      when(mockDelivererRepository.completeDelivery(any, any))
          .thenAnswer((_) async => {});
      when(mockActionsRepository.uploadProofOfDelivery(any))
          .thenAnswer((_) async => {});

      // Act
      final result = await useCase.execute(validParams);

      // Assert
      expect(result.isSuccess, true);
      final success = result as CompleteDeliverySuccess;
      expect(success.deliveryId, validParams.deliveryId);
      expect(success.proofId, isNotEmpty);
      verify(mockActionsRepository.saveProofOfDelivery(any)).called(1);
      verify(mockDelivererRepository.completeDelivery(
        validParams.deliveryId,
        validParams.delivererId,
      )).called(1);
    });

    test('should save proof of delivery locally', () async {
      // Arrange
      ProofOfDelivery? savedProof;
      when(mockActionsRepository.saveProofOfDelivery(any))
          .thenAnswer((invocation) async {
        savedProof = invocation.positionalArguments[0] as ProofOfDelivery;
      });
      when(mockDelivererRepository.completeDelivery(any, any))
          .thenAnswer((_) async => {});
      when(mockActionsRepository.uploadProofOfDelivery(any))
          .thenAnswer((_) async => {});

      // Act
      await useCase.execute(validParams);

      // Assert
      expect(savedProof, isNotNull);
      expect(savedProof!.deliveryId, validParams.deliveryId);
      expect(savedProof!.delivererId, validParams.delivererId);
      expect(savedProof!.customerId, validParams.customerId);
      expect(savedProof!.signatoryName, validParams.signatoryName);
      expect(savedProof!.signatureImagePath, validParams.signatureImagePath);
      expect(savedProof!.photosPaths, validParams.photosPaths);
      expect(savedProof!.notes, validParams.notes);
      expect(savedProof!.isUploaded, false);
    });

    test('should update delivery status', () async {
      // Arrange
      when(mockActionsRepository.saveProofOfDelivery(any))
          .thenAnswer((_) async => {});
      when(mockDelivererRepository.completeDelivery(any, any))
          .thenAnswer((_) async => {});
      when(mockActionsRepository.uploadProofOfDelivery(any))
          .thenAnswer((_) async => {});

      // Act
      await useCase.execute(validParams);

      // Assert
      verify(mockDelivererRepository.completeDelivery(
        validParams.deliveryId,
        validParams.delivererId,
      )).called(1);
    });

    test('should attempt immediate upload', () async {
      // Arrange
      when(mockActionsRepository.saveProofOfDelivery(any))
          .thenAnswer((_) async => {});
      when(mockDelivererRepository.completeDelivery(any, any))
          .thenAnswer((_) async => {});
      when(mockActionsRepository.uploadProofOfDelivery(any))
          .thenAnswer((_) async => {});

      // Act
      await useCase.execute(validParams);

      // Assert
      verify(mockActionsRepository.uploadProofOfDelivery(any)).called(1);
    });

    test('should succeed even if upload fails', () async {
      // Arrange
      when(mockActionsRepository.saveProofOfDelivery(any))
          .thenAnswer((_) async => {});
      when(mockDelivererRepository.completeDelivery(any, any))
          .thenAnswer((_) async => {});
      when(mockActionsRepository.uploadProofOfDelivery(any))
          .thenThrow(Exception('Network error'));

      // Act
      final result = await useCase.execute(validParams);

      // Assert
      expect(result.isSuccess, true);
    });

    test('should throw when delivery ID is empty', () async {
      // Arrange
      final params = CompleteDeliveryParams(
        deliveryId: '',
        delivererId: 'deliverer-789',
        customerId: 'customer-456',
        latitude: 48.8566,
        longitude: 2.3522,
        signatoryName: 'John Doe',
        signatureImagePath: '/path/to/signature.png',
        photosPaths: ['/path/to/photo.jpg'],
      );

      // Act
      final result = await useCase.execute(params);

      // Assert
      expect(result.isFailure, true);
      final failure = result as CompleteDeliveryFailure;
      expect(failure.error, contains('livraison est requis'));
    });

    test('should throw when deliverer ID is empty', () async {
      // Arrange
      final params = CompleteDeliveryParams(
        deliveryId: 'delivery-001',
        delivererId: '',
        customerId: 'customer-456',
        latitude: 48.8566,
        longitude: 2.3522,
        signatoryName: 'John Doe',
        signatureImagePath: '/path/to/signature.png',
        photosPaths: ['/path/to/photo.jpg'],
      );

      // Act
      final result = await useCase.execute(params);

      // Assert
      expect(result.isFailure, true);
      final failure = result as CompleteDeliveryFailure;
      expect(failure.error, contains('livreur est requis'));
    });

    test('should throw when customer ID is empty', () async {
      // Arrange
      final params = CompleteDeliveryParams(
        deliveryId: 'delivery-001',
        delivererId: 'deliverer-789',
        customerId: '',
        latitude: 48.8566,
        longitude: 2.3522,
        signatoryName: 'John Doe',
        signatureImagePath: '/path/to/signature.png',
        photosPaths: ['/path/to/photo.jpg'],
      );

      // Act
      final result = await useCase.execute(params);

      // Assert
      expect(result.isFailure, true);
      final failure = result as CompleteDeliveryFailure;
      expect(failure.error, contains('client est requis'));
    });

    test('should throw when signatory name is empty', () async {
      // Arrange
      final params = CompleteDeliveryParams(
        deliveryId: 'delivery-001',
        delivererId: 'deliverer-789',
        customerId: 'customer-456',
        latitude: 48.8566,
        longitude: 2.3522,
        signatoryName: '',
        signatureImagePath: '/path/to/signature.png',
        photosPaths: ['/path/to/photo.jpg'],
      );

      // Act
      final result = await useCase.execute(params);

      // Assert
      expect(result.isFailure, true);
      final failure = result as CompleteDeliveryFailure;
      expect(failure.error, contains('signataire est requis'));
    });

    test('should throw when signature is missing', () async {
      // Arrange
      final params = CompleteDeliveryParams(
        deliveryId: 'delivery-001',
        delivererId: 'deliverer-789',
        customerId: 'customer-456',
        latitude: 48.8566,
        longitude: 2.3522,
        signatoryName: 'John Doe',
        signatureImagePath: '',
        photosPaths: ['/path/to/photo.jpg'],
      );

      // Act
      final result = await useCase.execute(params);

      // Assert
      expect(result.isFailure, true);
      final failure = result as CompleteDeliveryFailure;
      expect(failure.error, contains('signature est requise'));
    });

    test('should throw when no photos provided', () async {
      // Arrange
      final params = CompleteDeliveryParams(
        deliveryId: 'delivery-001',
        delivererId: 'deliverer-789',
        customerId: 'customer-456',
        latitude: 48.8566,
        longitude: 2.3522,
        signatoryName: 'John Doe',
        signatureImagePath: '/path/to/signature.png',
        photosPaths: [],
      );

      // Act
      final result = await useCase.execute(params);

      // Assert
      expect(result.isFailure, true);
      final failure = result as CompleteDeliveryFailure;
      expect(failure.error, contains('photo est requise'));
    });

    test('should throw when latitude is invalid', () async {
      // Arrange
      final params = CompleteDeliveryParams(
        deliveryId: 'delivery-001',
        delivererId: 'deliverer-789',
        customerId: 'customer-456',
        latitude: 100.0,
        longitude: 2.3522,
        signatoryName: 'John Doe',
        signatureImagePath: '/path/to/signature.png',
        photosPaths: ['/path/to/photo.jpg'],
      );

      // Act
      final result = await useCase.execute(params);

      // Assert
      expect(result.isFailure, true);
      final failure = result as CompleteDeliveryFailure;
      expect(failure.error, contains('Latitude invalide'));
    });

    test('should throw when longitude is invalid', () async {
      // Arrange
      final params = CompleteDeliveryParams(
        deliveryId: 'delivery-001',
        delivererId: 'deliverer-789',
        customerId: 'customer-456',
        latitude: 48.8566,
        longitude: 200.0,
        signatoryName: 'John Doe',
        signatureImagePath: '/path/to/signature.png',
        photosPaths: ['/path/to/photo.jpg'],
      );

      // Act
      final result = await useCase.execute(params);

      // Assert
      expect(result.isFailure, true);
      final failure = result as CompleteDeliveryFailure;
      expect(failure.error, contains('Longitude invalide'));
    });

    test('should validate params correctly', () {
      // Assert
      expect(validParams.isValid, true);
    });

    test('should detect invalid params', () {
      // Arrange
      final invalidParams = CompleteDeliveryParams(
        deliveryId: '',
        delivererId: 'deliverer-789',
        customerId: 'customer-456',
        latitude: 48.8566,
        longitude: 2.3522,
        signatoryName: 'John Doe',
        signatureImagePath: '/path/to/signature.png',
        photosPaths: ['/path/to/photo.jpg'],
      );

      // Assert
      expect(invalidParams.isValid, false);
    });

    test('should count photos correctly', () {
      // Assert
      expect(validParams.photosCount, 2);
    });

    test('should detect if notes are present', () {
      // Assert
      expect(validParams.hasNotes, true);
    });

    test('should detect if customer feedback is present', () {
      // Assert
      expect(validParams.hasCustomerFeedback, true);
    });

    test('should format completed date correctly', () async {
      // Arrange
      when(mockActionsRepository.saveProofOfDelivery(any))
          .thenAnswer((_) async => {});
      when(mockDelivererRepository.completeDelivery(any, any))
          .thenAnswer((_) async => {});
      when(mockActionsRepository.uploadProofOfDelivery(any))
          .thenAnswer((_) async => {});

      // Act
      final result = await useCase.execute(validParams);

      // Assert
      expect(result.isSuccess, true);
      final success = result as CompleteDeliverySuccess;
      expect(success.completedAtFormatted, matches(r'\d{2}/\d{2}/\d{4} à \d{2}:\d{2}'));
    });

    test('should detect validation errors', () {
      // Arrange
      final failure = CompleteDeliveryFailure(
        error: 'ArgumentError: L\'ID est requis',
        deliveryId: 'delivery-001',
      );

      // Assert
      expect(failure.isValidationError, true);
      expect(failure.isNetworkError, false);
      expect(failure.isStorageError, false);
    });

    test('should detect network errors', () {
      // Arrange
      final failure = CompleteDeliveryFailure(
        error: 'Network connection timeout',
        deliveryId: 'delivery-001',
      );

      // Assert
      expect(failure.isNetworkError, true);
      expect(failure.isValidationError, false);
      expect(failure.isStorageError, false);
    });

    test('should detect storage errors', () {
      // Arrange
      final failure = CompleteDeliveryFailure(
        error: 'Storage permission denied',
        deliveryId: 'delivery-001',
      );

      // Assert
      expect(failure.isStorageError, true);
      expect(failure.isValidationError, false);
      expect(failure.isNetworkError, false);
    });

    test('should handle repository save errors', () async {
      // Arrange
      when(mockActionsRepository.saveProofOfDelivery(any))
          .thenThrow(Exception('Save failed'));

      // Act
      final result = await useCase.execute(validParams);

      // Assert
      expect(result.isFailure, true);
      final failure = result as CompleteDeliveryFailure;
      expect(failure.error, contains('Save failed'));
    });

    test('should handle delivery completion errors', () async {
      // Arrange
      when(mockActionsRepository.saveProofOfDelivery(any))
          .thenAnswer((_) async => {});
      when(mockDelivererRepository.completeDelivery(any, any))
          .thenThrow(Exception('Completion failed'));

      // Act
      final result = await useCase.execute(validParams);

      // Assert
      expect(result.isFailure, true);
      final failure = result as CompleteDeliveryFailure;
      expect(failure.error, contains('Completion failed'));
    });

    test('should generate unique proof IDs', () async {
      // Arrange
      final proofIds = <String>[];
      when(mockActionsRepository.saveProofOfDelivery(any))
          .thenAnswer((invocation) async {
        final proof = invocation.positionalArguments[0] as ProofOfDelivery;
        proofIds.add(proof.id);
      });
      when(mockDelivererRepository.completeDelivery(any, any))
          .thenAnswer((_) async => {});
      when(mockActionsRepository.uploadProofOfDelivery(any))
          .thenAnswer((_) async => {});

      // Act
      await useCase.execute(validParams);
      await Future.delayed(const Duration(milliseconds: 10));
      await useCase.execute(validParams);

      // Assert
      expect(proofIds.length, 2);
      expect(proofIds[0], isNot(equals(proofIds[1])));
    });

    test('should handle timeout', () async {
      // Arrange
      when(mockActionsRepository.saveProofOfDelivery(any))
          .thenAnswer((_) => Future.delayed(
                const Duration(seconds: 10),
                () => {},
              ));

      // Act & Assert
      expect(
        () => useCase.execute(validParams).timeout(
              const Duration(seconds: 1),
            ),
        throwsA(isA<TimeoutException>()),
      );
    });

    test('should include GPS coordinates in proof', () async {
      // Arrange
      ProofOfDelivery? savedProof;
      when(mockActionsRepository.saveProofOfDelivery(any))
          .thenAnswer((invocation) async {
        savedProof = invocation.positionalArguments[0] as ProofOfDelivery;
      });
      when(mockDelivererRepository.completeDelivery(any, any))
          .thenAnswer((_) async => {});
      when(mockActionsRepository.uploadProofOfDelivery(any))
          .thenAnswer((_) async => {});

      // Act
      await useCase.execute(validParams);

      // Assert
      expect(savedProof!.latitude, validParams.latitude);
      expect(savedProof!.longitude, validParams.longitude);
    });

    test('should include timestamp in proof', () async {
      // Arrange
      ProofOfDelivery? savedProof;
      when(mockActionsRepository.saveProofOfDelivery(any))
          .thenAnswer((invocation) async {
        savedProof = invocation.positionalArguments[0] as ProofOfDelivery;
      });
      when(mockDelivererRepository.completeDelivery(any, any))
          .thenAnswer((_) async => {});
      when(mockActionsRepository.uploadProofOfDelivery(any))
          .thenAnswer((_) async => {});

      // Act
      final beforeExecution = DateTime.now();
      await useCase.execute(validParams);
      final afterExecution = DateTime.now();

      // Assert
      expect(savedProof!.timestamp.isAfter(beforeExecution.subtract(const Duration(seconds: 1))), true);
      expect(savedProof!.timestamp.isBefore(afterExecution.add(const Duration(seconds: 1))), true);
    });
  });
}
