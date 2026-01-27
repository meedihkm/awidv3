import 'package:flutter_test/flutter_test.dart';
import 'package:awid_mobile/features/deliverer/data/models/proof_of_delivery_model.dart';
import 'package:awid_mobile/features/deliverer/domain/entities/proof_of_delivery.dart';
import '../../helpers/mock_data.dart';

void main() {
  group('ProofOfDeliveryModel', () {
    final testDate = DateTime(2026, 1, 27, 12, 0);
    
    final validJson = {
      'id': 'proof-001',
      'delivery_id': 'delivery-001',
      'deliverer_id': 'deliverer-789',
      'customer_id': 'customer-456',
      'timestamp': testDate.toIso8601String(),
      'latitude': 48.8566,
      'longitude': 2.3522,
      'signatory_name': 'John Doe',
      'signature_image_path': '/path/to/signature.png',
      'photos_paths': ['/path/to/photo1.jpg', '/path/to/photo2.jpg'],
      'notes': 'Delivered to front door',
      'customer_feedback': 'Great service',
      'is_uploaded': false,
      'created_at': testDate.toIso8601String(),
    };

    test('should be a subclass of ProofOfDelivery entity', () {
      // Arrange
      final model = ProofOfDeliveryModel.fromJson(validJson);

      // Act
      final entity = model.toEntity();

      // Assert
      expect(entity, isA<ProofOfDelivery>());
    });

    test('should deserialize from valid JSON', () {
      // Act
      final model = ProofOfDeliveryModel.fromJson(validJson);

      // Assert
      expect(model.id, 'proof-001');
      expect(model.deliveryId, 'delivery-001');
      expect(model.delivererId, 'deliverer-789');
      expect(model.customerId, 'customer-456');
      expect(model.signatoryName, 'John Doe');
      expect(model.latitude, 48.8566);
      expect(model.longitude, 2.3522);
    });

    test('should parse photos paths correctly', () {
      // Act
      final model = ProofOfDeliveryModel.fromJson(validJson);

      // Assert
      expect(model.photosPaths.length, 2);
      expect(model.photosPaths.first, '/path/to/photo1.jpg');
      expect(model.photosPaths.last, '/path/to/photo2.jpg');
    });

    test('should parse timestamp correctly', () {
      // Act
      final model = ProofOfDeliveryModel.fromJson(validJson);

      // Assert
      expect(model.timestamp.year, 2026);
      expect(model.timestamp.month, 1);
      expect(model.timestamp.day, 27);
    });

    test('should handle optional fields', () {
      // Arrange
      final minimalJson = {
        'id': 'proof-001',
        'delivery_id': 'delivery-001',
        'deliverer_id': 'deliverer-789',
        'customer_id': 'customer-456',
        'timestamp': testDate.toIso8601String(),
        'latitude': 48.8566,
        'longitude': 2.3522,
        'signatory_name': 'John Doe',
        'signature_image_path': '/path/to/signature.png',
        'photos_paths': ['/path/to/photo.jpg'],
      };

      // Act
      final model = ProofOfDeliveryModel.fromJson(minimalJson);

      // Assert
      expect(model.notes, isNull);
      expect(model.customerFeedback, isNull);
      expect(model.uploadedAt, isNull);
      expect(model.isUploaded, false);
    });

    test('should throw when required fields are missing', () {
      // Arrange
      final invalidJson = {
        'id': 'proof-001',
        // Missing required fields
      };

      // Act & Assert
      expect(
        () => ProofOfDeliveryModel.fromJson(invalidJson),
        throwsA(anything),
      );
    });

    test('should serialize to JSON correctly', () {
      // Arrange
      final model = ProofOfDeliveryModel.fromJson(validJson);

      // Act
      final json = model.toJson();

      // Assert
      expect(json['id'], 'proof-001');
      expect(json['delivery_id'], 'delivery-001');
      expect(json['signatory_name'], 'John Doe');
      expect(json['latitude'], 48.8566);
    });

    test('should serialize photos paths correctly', () {
      // Arrange
      final model = ProofOfDeliveryModel.fromJson(validJson);

      // Act
      final json = model.toJson();

      // Assert
      expect(json['photos_paths'], isA<List>());
      expect(json['photos_paths'].length, 2);
    });

    test('should be reversible (fromJson -> toJson)', () {
      // Arrange
      final model = ProofOfDeliveryModel.fromJson(validJson);

      // Act
      final json = model.toJson();
      final model2 = ProofOfDeliveryModel.fromJson(json);

      // Assert
      expect(model2.id, model.id);
      expect(model2.deliveryId, model.deliveryId);
      expect(model2.signatoryName, model.signatoryName);
      expect(model2.photosPaths.length, model.photosPaths.length);
    });

    test('should convert to entity correctly', () {
      // Arrange
      final model = ProofOfDeliveryModel.fromJson(validJson);

      // Act
      final entity = model.toEntity();

      // Assert
      expect(entity.id, model.id);
      expect(entity.deliveryId, model.deliveryId);
      expect(entity.signatoryName, model.signatoryName);
      expect(entity.latitude, model.latitude);
      expect(entity.longitude, model.longitude);
    });

    test('should preserve all data when converting to entity', () {
      // Arrange
      final model = ProofOfDeliveryModel.fromJson(validJson);

      // Act
      final entity = model.toEntity();

      // Assert
      expect(entity.notes, model.notes);
      expect(entity.customerFeedback, model.customerFeedback);
      expect(entity.isUploaded, model.isUploaded);
      expect(entity.photosPaths.length, model.photosPaths.length);
    });

    test('should convert from entity correctly', () {
      // Arrange
      final entity = ProofOfDelivery(
        id: 'proof-001',
        deliveryId: 'delivery-001',
        delivererId: 'deliverer-789',
        customerId: 'customer-456',
        timestamp: testDate,
        latitude: 48.8566,
        longitude: 2.3522,
        signatoryName: 'John Doe',
        signatureImagePath: '/path/to/signature.png',
        photosPaths: ['/path/to/photo.jpg'],
        isUploaded: false,
        createdAt: testDate,
      );

      // Act
      final model = ProofOfDeliveryModel.fromEntity(entity);

      // Assert
      expect(model.id, entity.id);
      expect(model.deliveryId, entity.deliveryId);
      expect(model.signatoryName, entity.signatoryName);
    });

    test('should be reversible (entity -> model -> entity)', () {
      // Arrange
      final entity = ProofOfDelivery(
        id: 'proof-001',
        deliveryId: 'delivery-001',
        delivererId: 'deliverer-789',
        customerId: 'customer-456',
        timestamp: testDate,
        latitude: 48.8566,
        longitude: 2.3522,
        signatoryName: 'John Doe',
        signatureImagePath: '/path/to/signature.png',
        photosPaths: ['/path/to/photo.jpg'],
        isUploaded: false,
        createdAt: testDate,
      );

      // Act
      final model = ProofOfDeliveryModel.fromEntity(entity);
      final entity2 = model.toEntity();

      // Assert
      expect(entity2.id, entity.id);
      expect(entity2.deliveryId, entity.deliveryId);
      expect(entity2.signatoryName, entity.signatoryName);
    });

    test('should create upload JSON correctly', () {
      // Arrange
      final model = ProofOfDeliveryModel.fromJson(validJson);

      // Act
      final uploadJson = model.toUploadJson();

      // Assert
      expect(uploadJson['delivery_id'], 'delivery-001');
      expect(uploadJson['deliverer_id'], 'deliverer-789');
      expect(uploadJson['signatory_name'], 'John Doe');
      expect(uploadJson['latitude'], 48.8566);
      expect(uploadJson['photos_paths'], isA<List>());
    });

    test('should exclude empty optional fields from upload JSON', () {
      // Arrange
      final minimalJson = {
        'id': 'proof-001',
        'delivery_id': 'delivery-001',
        'deliverer_id': 'deliverer-789',
        'customer_id': 'customer-456',
        'timestamp': testDate.toIso8601String(),
        'latitude': 48.8566,
        'longitude': 2.3522,
        'signatory_name': 'John Doe',
        'signature_image_path': '/path/to/signature.png',
        'photos_paths': ['/path/to/photo.jpg'],
      };
      final model = ProofOfDeliveryModel.fromJson(minimalJson);

      // Act
      final uploadJson = model.toUploadJson();

      // Assert
      expect(uploadJson.containsKey('notes'), false);
      expect(uploadJson.containsKey('customer_feedback'), false);
    });

    test('should parse from API response correctly', () {
      // Arrange
      final apiJson = {
        'id': 'proof-001',
        'delivery_id': 'delivery-001',
        'deliverer_id': 'deliverer-789',
        'customer_id': 'customer-456',
        'timestamp': testDate.toIso8601String(),
        'latitude': 48.8566,
        'longitude': 2.3522,
        'signatory_name': 'John Doe',
        'signature_image_path': '/path/to/signature.png',
        'photos_paths': ['/path/to/photo.jpg'],
        'is_uploaded': true,
        'uploaded_at': testDate.toIso8601String(),
      };

      // Act
      final model = ProofOfDeliveryModel.fromApiResponse(apiJson);

      // Assert
      expect(model.id, 'proof-001');
      expect(model.isUploaded, true);
      expect(model.uploadedAt, isNotNull);
    });

    test('should support copyWith', () {
      // Arrange
      final model = ProofOfDeliveryModel.fromJson(validJson);

      // Act
      final updated = model.copyWith(
        isUploaded: true,
        uploadedAt: testDate,
      );

      // Assert
      expect(updated.isUploaded, true);
      expect(updated.uploadedAt, testDate);
      expect(updated.id, model.id);
    });

    test('should maintain immutability', () {
      // Arrange
      final model = ProofOfDeliveryModel.fromJson(validJson);
      final originalUploaded = model.isUploaded;

      // Act
      final updated = model.copyWith(isUploaded: true);

      // Assert
      expect(model.isUploaded, originalUploaded);
      expect(updated.isUploaded, true);
    });

    test('should support equality comparison', () {
      // Arrange
      final model1 = ProofOfDeliveryModel.fromJson(validJson);
      final model2 = ProofOfDeliveryModel.fromJson(validJson);

      // Assert
      expect(model1, equals(model2));
    });

    test('should validate GPS coordinates', () {
      // Arrange
      final model = ProofOfDeliveryModel.fromJson(validJson);

      // Assert
      expect(model.latitude >= -90 && model.latitude <= 90, true);
      expect(model.longitude >= -180 && model.longitude <= 180, true);
    });
  });

  group('UploadProofResponse', () {
    final testDate = DateTime(2026, 1, 27, 12, 0);

    test('should detect success status', () {
      // Arrange
      final response = UploadProofResponse(
        id: 'proof-001',
        status: 'success',
        message: 'Uploaded successfully',
        uploadedAt: testDate,
        signatureUrl: 'https://example.com/signature.png',
        photosUrls: ['https://example.com/photo1.jpg'],
      );

      // Assert
      expect(response.isSuccess, true);
      expect(response.isFailure, false);
    });

    test('should detect failure status', () {
      // Arrange
      final response = UploadProofResponse(
        id: 'proof-001',
        status: 'error',
        message: 'Upload failed',
        uploadedAt: testDate,
      );

      // Assert
      expect(response.isFailure, true);
      expect(response.isSuccess, false);
    });

    test('should count photos correctly', () {
      // Arrange
      final response = UploadProofResponse(
        id: 'proof-001',
        status: 'success',
        message: 'Uploaded successfully',
        uploadedAt: testDate,
        photosUrls: ['url1', 'url2', 'url3'],
      );

      // Assert
      expect(response.photosCount, 3);
    });

    test('should check if all URLs are present', () {
      // Arrange
      final completeResponse = UploadProofResponse(
        id: 'proof-001',
        status: 'success',
        message: 'Uploaded successfully',
        uploadedAt: testDate,
        signatureUrl: 'https://example.com/signature.png',
        photosUrls: ['https://example.com/photo.jpg'],
      );

      final incompleteResponse = UploadProofResponse(
        id: 'proof-001',
        status: 'success',
        message: 'Uploaded successfully',
        uploadedAt: testDate,
      );

      // Assert
      expect(completeResponse.hasAllUrls, true);
      expect(incompleteResponse.hasAllUrls, false);
    });
  });
}
