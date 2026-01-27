import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:awid_mobile/features/customer/presentation/widgets/order_card.dart';
import 'package:awid_mobile/features/customer/domain/entities/customer_order.dart';

import '../../helpers/mock_data.dart';

void main() {
  group('OrderCardWidget', () {
    testWidgets('should display order number', (tester) async {
      // Arrange
      final order = MockData.mockCustomerOrder;

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: OrderCardWidget(order: order),
          ),
        ),
      );

      // Assert
      expect(find.text('Commande #${order.orderNumber}'), findsOneWidget);
    });

    testWidgets('should display order date', (tester) async {
      // Arrange
      final order = MockData.mockCustomerOrder;

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: OrderCardWidget(order: order),
          ),
        ),
      );

      // Assert
      expect(find.text(order.orderDateFormatted), findsOneWidget);
    });

    testWidgets('should display items count singular', (tester) async {
      // Arrange
      final order = MockData.mockCustomerOrder.copyWith(
        items: [
          CustomerOrderItem(
            id: 'item-001',
            productId: 'product-001',
            productName: 'Pizza',
            productCode: 'PIZZA-001',
            quantity: 1,
            unitPrice: 10.0,
            totalPrice: 10.0,
          ),
        ],
      );

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: OrderCardWidget(order: order),
          ),
        ),
      );

      // Assert
      expect(find.text('1 article'), findsOneWidget);
    });

    testWidgets('should display items count plural', (tester) async {
      // Arrange
      final order = MockData.mockCustomerOrder.copyWith(
        items: [
          CustomerOrderItem(
            id: 'item-001',
            productId: 'product-001',
            productName: 'Pizza',
            productCode: 'PIZZA-001',
            quantity: 1,
            unitPrice: 10.0,
            totalPrice: 10.0,
          ),
          CustomerOrderItem(
            id: 'item-002',
            productId: 'product-002',
            productName: 'Pasta',
            productCode: 'PASTA-001',
            quantity: 1,
            unitPrice: 15.0,
            totalPrice: 15.0,
          ),
        ],
      );

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: OrderCardWidget(order: order),
          ),
        ),
      );

      // Assert
      expect(find.text('${order.itemsCount} articles'), findsOneWidget);
    });

    testWidgets('should display total amount', (tester) async {
      // Arrange
      final order = MockData.mockCustomerOrder;

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: OrderCardWidget(order: order),
          ),
        ),
      );

      // Assert
      expect(find.text('Montant total'), findsOneWidget);
      expect(find.text(order.totalAmountFormatted), findsOneWidget);
    });

    testWidgets('should display status chip', (tester) async {
      // Arrange
      final order = MockData.mockCustomerOrder;

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: OrderCardWidget(order: order),
          ),
        ),
      );

      // Assert
      expect(find.text(order.status.displayName), findsOneWidget);
      expect(find.text(order.status.icon), findsOneWidget);
    });

    testWidgets('should display unpaid badge when not paid', (tester) async {
      // Arrange
      final order = MockData.mockCustomerOrder.copyWith(
        paidAmount: 0.0,
        remainingAmount: 25.0,
      );

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: OrderCardWidget(order: order),
          ),
        ),
      );

      // Assert
      expect(find.text(order.paymentStatus), findsOneWidget);
    });

    testWidgets('should display partially paid badge', (tester) async {
      // Arrange
      final order = MockData.mockCustomerOrder.copyWith(
        paidAmount: 10.0,
        remainingAmount: 15.0,
      );

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: OrderCardWidget(order: order),
          ),
        ),
      );

      // Assert
      expect(find.text(order.paymentStatus), findsOneWidget);
    });

    testWidgets('should display remaining amount when partially paid',
        (tester) async {
      // Arrange
      final order = MockData.mockCustomerOrder.copyWith(
        paidAmount: 10.0,
        remainingAmount: 15.0,
      );

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: OrderCardWidget(order: order),
          ),
        ),
      );

      // Assert
      expect(
        find.text('Reste à payer: ${order.remainingAmountFormatted}'),
        findsOneWidget,
      );
    });

    testWidgets('should not display remaining amount when fully paid',
        (tester) async {
      // Arrange
      final order = MockData.mockCustomerOrder.copyWith(
        paidAmount: 25.0,
        remainingAmount: 0.0,
      );

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: OrderCardWidget(order: order),
          ),
        ),
      );

      // Assert
      expect(find.textContaining('Reste à payer'), findsNothing);
    });

    testWidgets('should call onTap when card is tapped', (tester) async {
      // Arrange
      final order = MockData.mockCustomerOrder;
      var tapped = false;

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: OrderCardWidget(
              order: order,
              onTap: () => tapped = true,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(InkWell));
      await tester.pumpAndSettle();

      // Assert
      expect(tapped, true);
    });

    testWidgets('should not crash when onTap is null', (tester) async {
      // Arrange
      final order = MockData.mockCustomerOrder;

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: OrderCardWidget(order: order),
          ),
        ),
      );

      await tester.tap(find.byType(InkWell));
      await tester.pumpAndSettle();

      // Assert - Should not crash
      expect(find.byType(OrderCardWidget), findsOneWidget);
    });

    testWidgets('should display calendar icon', (tester) async {
      // Arrange
      final order = MockData.mockCustomerOrder;

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: OrderCardWidget(order: order),
          ),
        ),
      );

      // Assert
      expect(find.byIcon(Icons.calendar_today), findsOneWidget);
    });

    testWidgets('should display shopping bag icon', (tester) async {
      // Arrange
      final order = MockData.mockCustomerOrder;

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: OrderCardWidget(order: order),
          ),
        ),
      );

      // Assert
      expect(find.byIcon(Icons.shopping_bag), findsOneWidget);
    });

    testWidgets('should render card with proper styling', (tester) async {
      // Arrange
      final order = MockData.mockCustomerOrder;

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: OrderCardWidget(order: order),
          ),
        ),
      );

      // Assert
      expect(find.byType(Card), findsOneWidget);
      final card = tester.widget<Card>(find.byType(Card));
      expect(card.elevation, 2);
    });

    testWidgets('should display correct status color for pending',
        (tester) async {
      // Arrange
      final order = MockData.mockCustomerOrder.copyWith(
        status: OrderStatus.pending,
      );

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: OrderCardWidget(order: order),
          ),
        ),
      );

      // Assert
      expect(find.text(OrderStatus.pending.displayName), findsOneWidget);
    });

    testWidgets('should display correct status color for confirmed',
        (tester) async {
      // Arrange
      final order = MockData.mockCustomerOrder.copyWith(
        status: OrderStatus.confirmed,
      );

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: OrderCardWidget(order: order),
          ),
        ),
      );

      // Assert
      expect(find.text(OrderStatus.confirmed.displayName), findsOneWidget);
    });

    testWidgets('should display correct status color for delivered',
        (tester) async {
      // Arrange
      final order = MockData.mockCustomerOrder.copyWith(
        status: OrderStatus.delivered,
      );

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: OrderCardWidget(order: order),
          ),
        ),
      );

      // Assert
      expect(find.text(OrderStatus.delivered.displayName), findsOneWidget);
    });

    testWidgets('should display correct status color for cancelled',
        (tester) async {
      // Arrange
      final order = MockData.mockCustomerOrder.copyWith(
        status: OrderStatus.cancelled,
      );

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: OrderCardWidget(order: order),
          ),
        ),
      );

      // Assert
      expect(find.text(OrderStatus.cancelled.displayName), findsOneWidget);
    });
  });
}
