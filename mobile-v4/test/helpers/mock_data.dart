import 'package:awid_mobile/features/kitchen/domain/entities/kitchen_order.dart';
import 'package:awid_mobile/features/kitchen/domain/entities/kitchen_stats.dart';
import 'package:awid_mobile/features/kitchen/domain/entities/stock_item.dart';
import 'package:awid_mobile/features/customer/domain/entities/customer_order.dart';
import 'package:awid_mobile/features/customer/domain/entities/customer_account.dart';
import 'package:awid_mobile/features/deliverer/domain/entities/proof_of_delivery.dart';
import 'package:awid_mobile/features/deliverer/domain/entities/payment_collection.dart';

/// Données de test mock

class MockData {
  // IDs de test
  static const String testOrderId = 'order-123';
  static const String testCustomerId = 'customer-456';
  static const String testDelivererId = 'deliverer-789';
  static const String testProductId = 'product-001';
  static const String testOrganizationId = 'org-001';

  // Dates de test
  static final DateTime testDate = DateTime(2026, 1, 27, 12, 0);
  static final DateTime testDatePast = DateTime(2026, 1, 26, 12, 0);
  static final DateTime testDateFuture = DateTime(2026, 1, 28, 12, 0);

  // Kitchen Order Mock
  static KitchenOrder get mockKitchenOrder => KitchenOrder(
        id: testOrderId,
        orderNumber: 'ORD-001',
        customerId: testCustomerId,
        customerName: 'John Doe',
        status: KitchenOrderStatus.pending,
        priority: OrderPriority.normal,
        items: [
          KitchenOrderItem(
            id: 'item-001',
            productId: testProductId,
            productName: 'Pizza Margherita',
            quantity: 2,
            notes: 'Extra cheese',
          ),
        ],
        orderTime: testDate,
        estimatedMinutes: 30,
      );

  static List<KitchenOrder> get mockKitchenOrders => [
        mockKitchenOrder,
        mockKitchenOrder.copyWith(
          id: 'order-124',
          orderNumber: 'ORD-002',
          status: KitchenOrderStatus.preparing,
        ),
        mockKitchenOrder.copyWith(
          id: 'order-125',
          orderNumber: 'ORD-003',
          status: KitchenOrderStatus.ready,
        ),
      ];

  // Kitchen Stats Mock
  static KitchenStats get mockKitchenStats => KitchenStats(
        date: testDate,
        totalOrders: 150,
        completedOrders: 125,
        pendingOrders: 12,
        cancelledOrders: 5,
        averagePreparationTime: 25.5,
        onTimeRate: 92.5,
        delayedOrders: 8,
      );

  // Stock Item Mock
  static StockItem get mockStockItem => StockItem(
        id: testProductId,
        productId: testProductId,
        productName: 'Tomato Sauce',
        currentQuantity: 50.0,
        minimumQuantity: 20.0,
        maximumQuantity: 100.0,
        unit: StockUnit.kg,
        lastRestockDate: testDatePast,
        expirationDate: testDateFuture,
      );

  static List<StockItem> get mockStockItems => [
        mockStockItem,
        mockStockItem.copyWith(
          id: 'product-002',
          productId: 'product-002',
          productName: 'Mozzarella',
          currentQuantity: 15.0,
        ),
        mockStockItem.copyWith(
          id: 'product-003',
          productId: 'product-003',
          productName: 'Flour',
          currentQuantity: 80.0,
        ),
      ];

  // Customer Order Mock
  static CustomerOrder get mockCustomerOrder => CustomerOrder(
        id: testOrderId,
        orderNumber: 'ORD-001',
        customerId: testCustomerId,
        customerName: 'John Doe',
        orderDate: testDate,
        deliveryDate: testDateFuture,
        status: OrderStatus.pending,
        items: [
          CustomerOrderItem(
            id: 'item-001',
            productId: testProductId,
            productName: 'Pizza Margherita',
            productCode: 'PIZZA-001',
            quantity: 2,
            unitPrice: 12.50,
            totalPrice: 25.00,
          ),
        ],
        subtotal: 25.00,
        deliveryFee: 0.0,
        packagingDeposit: 0.0,
        totalAmount: 25.00,
        paidAmount: 0.0,
        remainingAmount: 25.00,
        deliveryAddress: '123 Main St',
      );

  static List<CustomerOrder> get mockCustomerOrders => [
        mockCustomerOrder,
        mockCustomerOrder.copyWith(
          id: 'order-124',
          orderNumber: 'ORD-002',
          status: OrderStatus.confirmed,
        ),
        mockCustomerOrder.copyWith(
          id: 'order-125',
          orderNumber: 'ORD-003',
          status: OrderStatus.delivered,
        ),
      ];

  // Customer Account Mock
  static CustomerAccount get mockCustomerAccount => CustomerAccount(
        id: testCustomerId,
        organizationId: testOrganizationId,
        organizationName: 'Test Organization',
        name: 'John Doe',
        email: 'john.doe@example.com',
        phone: '+33612345678',
        address: '123 Main St',
        creditInfo: CustomerCreditInfo(
          creditLimit: 1000.0,
          currentBalance: 250.0,
          availableCredit: 750.0,
          daysOverdue: 0,
          lastPaymentAmount: 0.0,
        ),
        packagingInfo: CustomerPackagingInfo(
          totalValue: 0.0,
          totalQuantity: 0,
          items: [],
        ),
        stats: CustomerStats(
          totalOrders: 45,
          completedOrders: 40,
          cancelledOrders: 5,
          totalSpent: 1250.50,
          averageOrderValue: 27.79,
          daysAsCustomer: 365,
        ),
        createdAt: testDatePast,
      );

  // Proof of Delivery Mock
  static ProofOfDelivery get mockProofOfDelivery => ProofOfDelivery(
        id: 'pod-001',
        deliveryId: 'delivery-001',
        delivererId: testDelivererId,
        customerId: testCustomerId,
        timestamp: testDate,
        latitude: 48.8566,
        longitude: 2.3522,
        signatoryName: 'John Doe',
        signatureImagePath: '/path/to/signature.png',
        photosPaths: ['/path/to/photo1.jpg', '/path/to/photo2.jpg'],
        notes: 'Delivered to front door',
      );

  // Payment Collection Mock
  static PaymentCollection get mockPaymentCollection => PaymentCollection(
        id: 'payment-001',
        delivererId: testDelivererId,
        customerId: testCustomerId,
        customerName: 'John Doe',
        amount: 25.00,
        mode: PaymentMode.cash,
        collectedAt: testDate,
        allocations: [
          PaymentAllocation(
            orderId: testOrderId,
            orderNumber: 'ORD-001',
            allocatedAmount: 25.00,
            orderDate: testDate,
            isFullyPaid: true,
          ),
        ],
        notes: 'Exact change',
      );

  // JSON Mock Data
  static Map<String, dynamic> get mockKitchenOrderJson => {
        'id': testOrderId,
        'orderNumber': 'ORD-001',
        'customerId': testCustomerId,
        'customerName': 'John Doe',
        'status': 'pending',
        'priority': 'normal',
        'items': [
          {
            'id': 'item-001',
            'productId': testProductId,
            'productName': 'Pizza Margherita',
            'quantity': 2,
            'notes': 'Extra cheese',
          },
        ],
        'orderTime': testDate.toIso8601String(),
        'estimatedMinutes': 30,
      };

  static Map<String, dynamic> get mockKitchenStatsJson => {
        'date': testDate.toIso8601String(),
        'totalOrders': 150,
        'completedOrders': 125,
        'pendingOrders': 12,
        'cancelledOrders': 5,
        'averagePreparationTime': 25.5,
        'onTimeRate': 92.5,
        'delayedOrders': 8,
      };

  static Map<String, dynamic> get mockStockItemJson => {
        'id': testProductId,
        'productId': testProductId,
        'productName': 'Tomato Sauce',
        'currentQuantity': 50.0,
        'minimumQuantity': 20.0,
        'maximumQuantity': 100.0,
        'unit': 'kg',
        'lastRestockDate': testDatePast.toIso8601String(),
        'expirationDate': testDateFuture.toIso8601String(),
      };

  static Map<String, dynamic> get mockCustomerOrderJson => {
        'id': testOrderId,
        'orderNumber': 'ORD-001',
        'customerId': testCustomerId,
        'customerName': 'John Doe',
        'orderDate': testDate.toIso8601String(),
        'deliveryDate': testDateFuture.toIso8601String(),
        'status': 'pending',
        'items': [
          {
            'id': 'item-001',
            'productId': testProductId,
            'productName': 'Pizza Margherita',
            'productCode': 'PIZZA-001',
            'quantity': 2,
            'unitPrice': 12.50,
            'totalPrice': 25.00,
          },
        ],
        'subtotal': 25.00,
        'deliveryFee': 0.0,
        'packagingDeposit': 0.0,
        'totalAmount': 25.00,
        'paidAmount': 0.0,
        'remainingAmount': 25.00,
        'deliveryAddress': '123 Main St',
      };

  static Map<String, dynamic> get mockCustomerAccountJson => {
        'id': testCustomerId,
        'organizationId': testOrganizationId,
        'organizationName': 'Test Organization',
        'name': 'John Doe',
        'email': 'john.doe@example.com',
        'phone': '+33612345678',
        'address': '123 Main St',
        'creditInfo': {
          'creditLimit': 1000.0,
          'currentBalance': 250.0,
          'availableCredit': 750.0,
          'daysOverdue': 0,
          'lastPaymentAmount': 0.0,
        },
        'packagingInfo': {
          'totalValue': 0.0,
          'totalQuantity': 0,
          'items': [],
        },
        'stats': {
          'totalOrders': 45,
          'completedOrders': 40,
          'cancelledOrders': 5,
          'totalSpent': 1250.50,
          'averageOrderValue': 27.79,
          'daysAsCustomer': 365,
        },
        'createdAt': testDatePast.toIso8601String(),
      };

  static Map<String, dynamic> get mockProofOfDeliveryJson => {
        'id': 'pod-001',
        'deliveryId': 'delivery-001',
        'delivererId': testDelivererId,
        'customerId': testCustomerId,
        'timestamp': testDate.toIso8601String(),
        'latitude': 48.8566,
        'longitude': 2.3522,
        'signatoryName': 'John Doe',
        'signatureImagePath': '/path/to/signature.png',
        'photosPaths': ['/path/to/photo1.jpg', '/path/to/photo2.jpg'],
        'notes': 'Delivered to front door',
      };

  static Map<String, dynamic> get mockPaymentCollectionJson => {
        'id': 'payment-001',
        'delivererId': testDelivererId,
        'customerId': testCustomerId,
        'customerName': 'John Doe',
        'amount': 25.00,
        'mode': 'cash',
        'collectedAt': testDate.toIso8601String(),
        'allocations': [
          {
            'orderId': testOrderId,
            'orderNumber': 'ORD-001',
            'allocatedAmount': 25.00,
            'orderDate': testDate.toIso8601String(),
            'isFullyPaid': true,
          },
        ],
        'notes': 'Exact change',
      };

  // API Response Mocks
  static Map<String, dynamic> successResponse(dynamic data) => {
        'success': true,
        'data': data,
      };

  static Map<String, dynamic> errorResponse(String message) => {
        'success': false,
        'error': message,
      };

  static Map<String, dynamic> paginatedResponse(
    List<dynamic> data, {
    int page = 1,
    int pageSize = 20,
    int total = 100,
  }) =>
      {
        'success': true,
        'data': data,
        'pagination': {
          'page': page,
          'pageSize': pageSize,
          'total': total,
          'totalPages': (total / pageSize).ceil(),
        },
      };
}
