import 'package:flutter_test/flutter_test.dart';
import 'package:awid/core/models/user_model.dart';

void main() {
  group('User Model', () {
    test('fromJson should parse valid JSON correctly', () {
      final json = {
        'id': '123',
        'email': 'test@example.com',
        'name': 'Test User',
        'role': 'admin',
        'organizationId': '456',
        'organization': {
          'id': '456',
          'name': 'Test Org',
          'type': 'restaurant',
        },
        'phone': '+1234567890',
      };

      final user = User.fromJson(json);

      expect(user.id, '123');
      expect(user.email, 'test@example.com');
      expect(user.name, 'Test User');
      expect(user.role, 'admin');
      expect(user.organizationId, '456');
      expect(user.organization.id, '456');
      expect(user.organization.name, 'Test Org');
      expect(user.phone, '+1234567890');
    });

    test('fromJson should handle missing optional fields', () {
      final json = {
        'id': '123',
        'email': 'test@example.com',
        'name': 'Test User',
        'role': 'cafeteria',
        'organizationId': '456',
        'organization': {
          'id': '456',
          'name': 'Test Org',
          'type': 'restaurant',
        },
      };

      final user = User.fromJson(json);

      expect(user.phone, null);
    });

    test('toJson should serialize user correctly', () {
      final user = User(
        id: '123',
        email: 'test@example.com',
        name: 'Test User',
        role: 'deliverer',
        organizationId: '456',
        organization: Organization(
          id: '456',
          name: 'Test Org',
          type: 'restaurant',
        ),
        phone: '+1234567890',
      );

      final json = user.toJson();

      expect(json['id'], '123');
      expect(json['email'], 'test@example.com');
      expect(json['name'], 'Test User');
      expect(json['role'], 'deliverer');
      expect(json['phone'], '+1234567890');
      expect(json['organization']['id'], '456');
    });

    test('isAdmin should return true for admin role', () {
      final user = User(
        id: '1',
        email: 'admin@test.com',
        name: 'Admin',
        role: 'admin',
        organizationId: '1',
        organization: Organization(id: '1', name: 'Org', type: 'restaurant'),
      );

      expect(user.isAdmin, true);
      expect(user.isCafeteria, false);
      expect(user.isDeliverer, false);
    });

    test('isCafeteria should return true for cafeteria role', () {
      final user = User(
        id: '1',
        email: 'cafe@test.com',
        name: 'Cafe',
        role: 'cafeteria',
        organizationId: '1',
        organization: Organization(id: '1', name: 'Org', type: 'restaurant'),
      );

      expect(user.isAdmin, false);
      expect(user.isCafeteria, true);
      expect(user.isDeliverer, false);
    });

    test('isDeliverer should return true for deliverer role', () {
      final user = User(
        id: '1',
        email: 'driver@test.com',
        name: 'Driver',
        role: 'deliverer',
        organizationId: '1',
        organization: Organization(id: '1', name: 'Org', type: 'restaurant'),
      );

      expect(user.isAdmin, false);
      expect(user.isCafeteria, false);
      expect(user.isDeliverer, true);
    });
  });

  group('Organization Model', () {
    test('fromJson should parse valid JSON correctly', () {
      final json = {
        'id': '456',
        'name': 'Test Organization',
        'type': 'restaurant',
      };

      final org = Organization.fromJson(json);

      expect(org.id, '456');
      expect(org.name, 'Test Organization');
      expect(org.type, 'restaurant');
    });

    test('toJson should serialize organization correctly', () {
      final org = Organization(
        id: '456',
        name: 'Test Organization',
        type: 'restaurant',
      );

      final json = org.toJson();

      expect(json['id'], '456');
      expect(json['name'], 'Test Organization');
      expect(json['type'], 'restaurant');
    });
  });
}
