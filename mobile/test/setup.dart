import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Helper to create a test widget wrapped with MaterialApp
Widget createTestWidget(Widget child) {
  return MaterialApp(
    home: Scaffold(
      body: child,
    ),
  );
}

/// Mock User Factory
Map<String, dynamic> createMockUser({
  int id = 1,
  String email = 'test@example.com',
  String name = 'Test User',
  String role = 'admin',
  int organizationId = 1,
}) {
  return {
    'id': id,
    'email': email,
    'name': name,
    'role': role,
    'organization_id': organizationId,
    'active': true,
  };
}

/// Mock Order Factory
Map<String, dynamic> createMockOrder({
  String id = '123e4567-e89b-12d3-a456-426614174000',
  String status = 'pending',
  double total = 100.0,
  int orderNumber = 1,
}) {
  return {
    'id': id,
    'status': status,
    'total': total,
    'order_number': orderNumber,
    'created_at': DateTime.now().toIso8601String(),
    'items': [],
  };
}

/// Mock Delivery Factory
Map<String, dynamic> createMockDelivery({
  String id = 'delivery-uuid',
  String status = 'assigned',
  String orderId = 'order-uuid',
}) {
  return {
    'id': id,
    'status': status,
    'order_id': orderId,
    'deliverer_id': null,
    'created_at': DateTime.now().toIso8601String(),
  };
}

/// Mock Product Factory
Map<String, dynamic> createMockProduct({
  String id = 'product-uuid',
  String name = 'Test Product',
  double price = 10.0,
}) {
  return {
    'id': id,
    'name': name,
    'price': price,
    'category': 'Main',
    'active': true,
  };
}
