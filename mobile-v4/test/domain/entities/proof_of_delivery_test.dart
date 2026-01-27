import 'package:flutter_test/flutter_test.dart';
import 'package:awid_mobile/features/deliverer/domain/entities/proof_of_delivery.dart';
import '../../helpers/mock_data.dart';

void main() {
  group('ProofOfDelivery Entity', () {
    late ProofOfDelivery proof;

    setUp(() {
      proof = MockData.mockProofOfDelivery;
    });

    test('should create valid ProofOfDelivery', () {
      expect(proof.id, 'pod-001');
      expect(proof.orderId, MockData.testOrderId);
      expect(proof.deliveryId, 'delivery-001');
      expect(proof.photoUrl, isNotEmpty);
      expect(proof.signatureUrl, isNotEmpty);
      expect(proof.recipientName, 'John Doe');
      expect(proof.notes, isNotNull);
      expect(proof.deliveredAt, isNotNull);
      expect(proof.latitude, isNotNull);
      expect(proof.longitude, isNotNull);
    });

    test('should have valid photo URL', () {
      expect(proof.photoUrl, startsWith('https://'));
      expect(proof.photoUrl, contains('.jpg'));
    });

    test('should have valid signature URL', () {
      expect(proof.signatureUrl, startsWith('https://'));
      expect(proof.signatureUrl, contains('.png'));
    });

    test('should have valid coordinates', () {
      expect(proof.latitude, greaterThanOrEqualTo(-90));
      expect(proof.latitude, lessThanOrEqualTo(90));
      expect(proof.longitude, greaterThanOrEqualTo(-180));
      expect(proof.longitude, lessThanOrEqualTo(180));
    });

    test('should check if has photo', () {
      final withPhoto = proof.copyWith(photoUrl: 'https://example.com/photo.jpg');
      final withoutPhoto = proof.copyWith(photoUrl: null);

      expect(withPhoto.hasPhoto, true);
      expect(withoutPhoto.hasPhoto, false);
    });

    test('should check if has signature', () {
      final withSignature = proof.copyWith(signatureUrl: 'https://example.com/sig.png');
      final withoutSignature = proof.copyWith(signatureUrl: null);

      expect(withSignature.hasSignature, true);
      expect(withoutSignature.hasSignature, false);
    });

    test('should check if has location', () {
      final withLocation = proof.copyWith(latitude: 48.8566, longitude: 2.3522);
      final withoutLocation = proof.copyWith(latitude: null, longitude: null);

      expect(withLocation.hasLocation, true);
      expect(withoutLocation.hasLocation, false);
    });

    test('should check if is complete', () {
      final complete = proof.copyWith(
        photoUrl: 'https://example.com/photo.jpg',
        signatureUrl: 'https://example.com/sig.png',
      );
      final incomplete = proof.copyWith(photoUrl: null);

      expect(complete.isComplete, true);
      expect(incomplete.isComplete, false);
    });

    test('should validate recipient name', () {
      expect(proof.recipientName, isNotEmpty);
      expect(proof.recipientName, isA<String>());
    });

    test('should have valid delivery timestamp', () {
      expect(proof.deliveredAt, isA<DateTime>());
      expect(proof.deliveredAt.isBefore(DateTime.now().add(const Duration(minutes: 1))), true);
    });

    test('should copy with new values', () {
      final updated = proof.copyWith(
        recipientName: 'Jane Doe',
        notes: 'Left at door',
      );

      expect(updated.id, proof.id);
      expect(updated.recipientName, 'Jane Doe');
      expect(updated.notes, 'Left at door');
      expect(updated.orderId, proof.orderId);
    });

    test('should compare proofs by equality', () {
      final sameProof = proof.copyWith();
      final differentProof = proof.copyWith(id: 'different-id');

      expect(proof == sameProof, true);
      expect(proof == differentProof, false);
    });

    test('should format location string', () {
      if (proof.hasLocation) {
        final location = '${proof.latitude}, ${proof.longitude}';
        expect(location, contains('48.8566'));
        expect(location, contains('2.3522'));
      }
    });

    test('should calculate distance from coordinates', () {
      if (proof.hasLocation) {
        final otherLat = 48.8600;
        final otherLon = 2.3500;
        
        // Simple distance calculation (not accurate, just for testing)
        final latDiff = (proof.latitude! - otherLat).abs();
        final lonDiff = (proof.longitude! - otherLon).abs();
        final distance = latDiff + lonDiff;
        
        expect(distance, greaterThanOrEqualTo(0));
      }
    });

    test('should handle optional notes', () {
      final withNotes = proof.copyWith(notes: 'Delivered successfully');
      final withoutNotes = proof.copyWith(notes: null);

      expect(withNotes.notes, isNotNull);
      expect(withoutNotes.notes, isNull);
    });

    test('should validate delivery time is not in future', () {
      expect(proof.deliveredAt.isAfter(DateTime.now()), false);
    });

    test('should calculate time since delivery', () {
      final timeSince = DateTime.now().difference(proof.deliveredAt);
      expect(timeSince, isA<Duration>());
      expect(timeSince.inSeconds, greaterThanOrEqualTo(0));
    });

    test('should check if delivery was recent', () {
      final recent = proof.copyWith(
        deliveredAt: DateTime.now().subtract(const Duration(minutes: 5)),
      );
      final old = proof.copyWith(
        deliveredAt: DateTime.now().subtract(const Duration(hours: 5)),
      );

      final isRecent = DateTime.now().difference(recent.deliveredAt).inHours < 1;
      final isOld = DateTime.now().difference(old.deliveredAt).inHours >= 1;

      expect(isRecent, true);
      expect(isOld, true);
    });
  });

  group('ProofOfDelivery Validation', () {
    test('should validate photo URL format', () {
      final proof = MockData.mockProofOfDelivery;
      if (proof.photoUrl != null) {
        expect(proof.photoUrl, matches(r'https?://.*\.(jpg|jpeg|png)'));
      }
    });

    test('should validate signature URL format', () {
      final proof = MockData.mockProofOfDelivery;
      if (proof.signatureUrl != null) {
        expect(proof.signatureUrl, matches(r'https?://.*\.png'));
      }
    });

    test('should validate coordinates range', () {
      final proof = MockData.mockProofOfDelivery;
      if (proof.hasLocation) {
        expect(proof.latitude, inInclusiveRange(-90, 90));
        expect(proof.longitude, inInclusiveRange(-180, 180));
      }
    });

    test('should validate IDs are not empty', () {
      final proof = MockData.mockProofOfDelivery;
      expect(proof.id, isNotEmpty);
      expect(proof.orderId, isNotEmpty);
      expect(proof.deliveryId, isNotEmpty);
    });

    test('should validate recipient name is not empty', () {
      final proof = MockData.mockProofOfDelivery;
      expect(proof.recipientName, isNotEmpty);
    });
  });

  group('ProofOfDelivery Edge Cases', () {
    test('should handle proof without photo', () {
      final proof = MockData.mockProofOfDelivery.copyWith(photoUrl: null);
      expect(proof.hasPhoto, false);
      expect(proof.isComplete, false);
    });

    test('should handle proof without signature', () {
      final proof = MockData.mockProofOfDelivery.copyWith(signatureUrl: null);
      expect(proof.hasSignature, false);
      expect(proof.isComplete, false);
    });

    test('should handle proof without location', () {
      final proof = MockData.mockProofOfDelivery.copyWith(
        latitude: null,
        longitude: null,
      );
      expect(proof.hasLocation, false);
    });

    test('should handle proof without notes', () {
      final proof = MockData.mockProofOfDelivery.copyWith(notes: null);
      expect(proof.notes, isNull);
    });

    test('should handle very old delivery', () {
      final proof = MockData.mockProofOfDelivery.copyWith(
        deliveredAt: DateTime.now().subtract(const Duration(days: 365)),
      );
      
      final daysSince = DateTime.now().difference(proof.deliveredAt).inDays;
      expect(daysSince, greaterThan(360));
    });

    test('should handle delivery at exact location', () {
      final proof = MockData.mockProofOfDelivery.copyWith(
        latitude: 0.0,
        longitude: 0.0,
      );
      
      expect(proof.latitude, 0.0);
      expect(proof.longitude, 0.0);
      expect(proof.hasLocation, true);
    });

    test('should handle extreme coordinates', () {
      final northPole = MockData.mockProofOfDelivery.copyWith(
        latitude: 90.0,
        longitude: 0.0,
      );
      final southPole = MockData.mockProofOfDelivery.copyWith(
        latitude: -90.0,
        longitude: 0.0,
      );

      expect(northPole.latitude, 90.0);
      expect(southPole.latitude, -90.0);
    });

    test('should handle long notes', () {
      final longNotes = 'A' * 1000;
      final proof = MockData.mockProofOfDelivery.copyWith(notes: longNotes);
      
      expect(proof.notes, longNotes);
      expect(proof.notes!.length, 1000);
    });
  });

  group('ProofOfDelivery Completeness', () {
    test('should be complete with all required fields', () {
      final complete = ProofOfDelivery(
        id: 'pod-001',
        orderId: 'order-123',
        deliveryId: 'delivery-001',
        photoUrl: 'https://example.com/photo.jpg',
        signatureUrl: 'https://example.com/sig.png',
        recipientName: 'John Doe',
        deliveredAt: DateTime.now(),
        latitude: 48.8566,
        longitude: 2.3522,
      );

      expect(complete.isComplete, true);
      expect(complete.hasPhoto, true);
      expect(complete.hasSignature, true);
      expect(complete.hasLocation, true);
    });

    test('should be incomplete without photo', () {
      final incomplete = ProofOfDelivery(
        id: 'pod-001',
        orderId: 'order-123',
        deliveryId: 'delivery-001',
        photoUrl: null,
        signatureUrl: 'https://example.com/sig.png',
        recipientName: 'John Doe',
        deliveredAt: DateTime.now(),
      );

      expect(incomplete.isComplete, false);
      expect(incomplete.hasPhoto, false);
    });

    test('should be incomplete without signature', () {
      final incomplete = ProofOfDelivery(
        id: 'pod-001',
        orderId: 'order-123',
        deliveryId: 'delivery-001',
        photoUrl: 'https://example.com/photo.jpg',
        signatureUrl: null,
        recipientName: 'John Doe',
        deliveredAt: DateTime.now(),
      );

      expect(incomplete.isComplete, false);
      expect(incomplete.hasSignature, false);
    });
  });
}
