import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:awid_mobile/features/customer/presentation/providers/customer_orders_provider.dart';
import 'package:awid_mobile/features/customer/domain/usecases/get_orders_usecase.dart';
import 'package:awid_mobile/features/customer/domain/entities/customer_order.dart';

import '../../helpers/test_helpers.dart';
import '../../helpers/mock_data.dart';

@GenerateMocks([GetOrdersUseCase])
import 'customer_orders_provider_test.mocks.dart';

void main() {
  late CustomerOrdersNotifier notifier;
  late MockGetOrdersUseCase mockUseCase;

  setUp(() {
    mockUseCase = MockGetOrdersUseCase();
    // Setup default mock response to prevent errors in constructor
    when(mockUseCase.execute(any)).thenAnswer(
      (_) async => GetOrdersSuccess(
        orders: [],
        totalCount: 0,
        hasMore: false,
      ),
    );
    notifier = CustomerOrdersNotifier(mockUseCase, MockData.testCustomerId);
  });

  group('CustomerOrdersNotifier - Load Orders', () {
    test('initial state should be loading', () {
      // Arrange & Act
      final newNotifier = CustomerOrdersNotifier(mockUseCase, MockData.testCustomerId);

      // Assert
      expect(newNotifier.state, isA<AsyncLoading>());
    });

    test('loadOrders should set loading state', () async {
      // Arrange
      when(mockUseCase.execute(any)).thenAnswer(
        (_) async => GetOrdersSuccess(
          orders: [],
          totalCount: 0,
          hasMore: false,
        ),
      );

      // Act
      final future = notifier.loadOrders();
      
      // Assert - Check loading state
      expect(notifier.state, isA<AsyncLoading>());
      
      await future;
    });

    test('loadOrders should update state on success', () async {
      // Arrange
      final orders = [MockData.mockCustomerOrder];
      when(mockUseCase.execute(any)).thenAnswer(
        (_) async => GetOrdersSuccess(
          orders: orders,
          totalCount: 1,
          hasMore: false,
        ),
      );

      // Act
      await notifier.loadOrders();

      // Assert
      expect(notifier.state, isA<AsyncData<List<CustomerOrder>>>());
      final data = notifier.state as AsyncData<List<CustomerOrder>>;
      expect(data.value, orders);
      verify(mockUseCase.execute(any)).called(2); // Constructor + explicit call
    });

    test('loadOrders should set error on failure', () async {
      // Arrange
      const errorMessage = 'Failed to load orders';
      when(mockUseCase.execute(any)).thenAnswer(
        (_) async => GetOrdersFailure(
          error: errorMessage,
          customerId: MockData.testCustomerId,
        ),
      );

      // Act
      await notifier.loadOrders();

      // Assert
      expect(notifier.state, isA<AsyncError>());
      final error = notifier.state as AsyncError;
      expect(error.error.toString(), contains(errorMessage));
    });

    test('loadOrders with status filter should pass parameter', () async {
      // Arrange
      when(mockUseCase.execute(any)).thenAnswer(
        (_) async => GetOrdersSuccess(
          orders: [],
          totalCount: 0,
          hasMore: false,
        ),
      );

      // Act
      await notifier.loadOrders(status: OrderStatus.pending);

      // Assert
      final captured = verify(mockUseCase.execute(captureAny)).captured.last 
          as GetOrdersParams;
      expect(captured.status, OrderStatus.pending);
    });

    test('loadOrders with date range should pass parameters', () async {
      // Arrange
      when(mockUseCase.execute(any)).thenAnswer(
        (_) async => GetOrdersSuccess(
          orders: [],
          totalCount: 0,
          hasMore: false,
        ),
      );

      // Act
      await notifier.loadOrders(
        startDate: MockData.testDatePast,
        endDate: MockData.testDate,
      );

      // Assert
      final captured = verify(mockUseCase.execute(captureAny)).captured.last 
          as GetOrdersParams;
      expect(captured.startDate, MockData.testDatePast);
      expect(captured.endDate, MockData.testDate);
    });

    test('loadOrders with search query should pass parameter', () async {
      // Arrange
      when(mockUseCase.execute(any)).thenAnswer(
        (_) async => GetOrdersSuccess(
          orders: [],
          totalCount: 0,
          hasMore: false,
        ),
      );

      // Act
      await notifier.loadOrders(searchQuery: 'pizza');

      // Assert
      final captured = verify(mockUseCase.execute(captureAny)).captured.last 
          as GetOrdersParams;
      expect(captured.searchQuery, 'pizza');
    });

    test('loadOrders with pagination should pass parameters', () async {
      // Arrange
      when(mockUseCase.execute(any)).thenAnswer(
        (_) async => GetOrdersSuccess(
          orders: [],
          totalCount: 0,
          hasMore: false,
        ),
      );

      // Act
      await notifier.loadOrders(limit: 20, offset: 10);

      // Assert
      final captured = verify(mockUseCase.execute(captureAny)).captured.last 
          as GetOrdersParams;
      expect(captured.limit, 20);
      expect(captured.offset, 10);
    });

    test('loadOrders should handle exception', () async {
      // Arrange
      when(mockUseCase.execute(any)).thenThrow(Exception('Network error'));

      // Act
      await notifier.loadOrders();

      // Assert
      expect(notifier.state, isA<AsyncError>());
      final error = notifier.state as AsyncError;
      expect(error.error.toString(), contains('Network error'));
    });
  });

  group('CustomerOrdersNotifier - Actions', () {
    test('refresh should reload orders', () async {
      // Arrange
      when(mockUseCase.execute(any)).thenAnswer(
        (_) async => GetOrdersSuccess(
          orders: [],
          totalCount: 0,
          hasMore: false,
        ),
      );

      // Act
      await notifier.refresh();

      // Assert
      verify(mockUseCase.execute(any)).called(2); // Constructor + refresh
    });

    test('filterByStatus should load orders with status', () async {
      // Arrange
      when(mockUseCase.execute(any)).thenAnswer(
        (_) async => GetOrdersSuccess(
          orders: [],
          totalCount: 0,
          hasMore: false,
        ),
      );

      // Act
      await notifier.filterByStatus(OrderStatus.confirmed);

      // Assert
      final captured = verify(mockUseCase.execute(captureAny)).captured.last 
          as GetOrdersParams;
      expect(captured.status, OrderStatus.confirmed);
    });

    test('filterByPeriod should load orders with date range', () async {
      // Arrange
      when(mockUseCase.execute(any)).thenAnswer(
        (_) async => GetOrdersSuccess(
          orders: [],
          totalCount: 0,
          hasMore: false,
        ),
      );

      // Act
      await notifier.filterByPeriod(MockData.testDatePast, MockData.testDate);

      // Assert
      final captured = verify(mockUseCase.execute(captureAny)).captured.last 
          as GetOrdersParams;
      expect(captured.startDate, MockData.testDatePast);
      expect(captured.endDate, MockData.testDate);
    });

    test('search should load orders with query', () async {
      // Arrange
      when(mockUseCase.execute(any)).thenAnswer(
        (_) async => GetOrdersSuccess(
          orders: [],
          totalCount: 0,
          hasMore: false,
        ),
      );

      // Act
      await notifier.search('burger');

      // Assert
      final captured = verify(mockUseCase.execute(captureAny)).captured.last 
          as GetOrdersParams;
      expect(captured.searchQuery, 'burger');
    });
  });

  group('CustomerOrdersNotifier - Multiple Calls', () {
    test('multiple loadOrders should update state correctly', () async {
      // Arrange
      final orders1 = [MockData.mockCustomerOrder];
      final orders2 = [
        MockData.mockCustomerOrder,
        MockData.mockCustomerOrder.copyWith(id: 'order-2'),
      ];
      
      // First call returns orders1, second call returns orders2
      when(mockUseCase.execute(any))
          .thenAnswer((_) async => GetOrdersSuccess(
                orders: orders1,
                totalCount: 1,
                hasMore: false,
              ));

      // Act - First call
      await notifier.loadOrders();
      final firstData = notifier.state as AsyncData<List<CustomerOrder>>;
      
      // Setup second response
      when(mockUseCase.execute(any))
          .thenAnswer((_) async => GetOrdersSuccess(
                orders: orders2,
                totalCount: 2,
                hasMore: false,
              ));
      
      // Act - Second call
      await notifier.loadOrders();
      final secondData = notifier.state as AsyncData<List<CustomerOrder>>;

      // Assert
      expect(firstData.value.length, 1);
      expect(secondData.value.length, 2);
    });

    test('loadOrders during loading should not cause issues', () async {
      // Arrange
      when(mockUseCase.execute(any)).thenAnswer(
        (_) async {
          await Future.delayed(const Duration(milliseconds: 100));
          return GetOrdersSuccess(
            orders: [],
            totalCount: 0,
            hasMore: false,
          );
        },
      );

      // Act
      final future1 = notifier.loadOrders();
      final future2 = notifier.loadOrders();
      
      await Future.wait([future1, future2]);

      // Assert
      expect(notifier.state, isA<AsyncData>());
      verify(mockUseCase.execute(any)).called(3); // Constructor + 2 explicit calls
    });
  });

  group('SearchOrdersParams', () {
    test('should create params with required fields', () {
      // Arrange & Act
      const params = SearchOrdersParams(
        customerId: 'customer-123',
        query: 'pizza',
      );

      // Assert
      expect(params.customerId, 'customer-123');
      expect(params.query, 'pizza');
    });
  });
}
