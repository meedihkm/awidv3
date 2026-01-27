import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:awid_mobile/features/customer/domain/usecases/get_orders_usecase.dart';
import 'package:awid_mobile/features/customer/domain/repositories/customer_repository.dart';
import 'package:awid_mobile/features/customer/domain/entities/customer_order.dart';
import '../../helpers/mock_data.dart';

@GenerateMocks([CustomerRepository])
import 'get_orders_usecase_test.mocks.dart';

void main() {
  late GetOrdersUseCase useCase;
  late MockCustomerRepository mockRepository;

  setUp(() {
    mockRepository = MockCustomerRepository();
    useCase = GetOrdersUseCase(mockRepository);
  });

  group('GetOrdersUseCase', () {
    const customerId = 'customer-456';

    test('should get all orders successfully', () async {
      // Arrange
      final orders = MockData.mockCustomerOrders;
      when(mockRepository.getOrders(
        customerId: customerId,
        status: null,
        startDate: null,
        endDate: null,
        searchQuery: null,
        limit: null,
        offset: null,
      )).thenAnswer((_) async => orders);

      // Act
      final result = await useCase.execute(GetOrdersParams(
        customerId: customerId,
      ));

      // Assert
      expect(result.isSuccess, true);
      final success = result as GetOrdersSuccess;
      expect(success.orders.length, 3);
      verify(mockRepository.getOrders(
        customerId: customerId,
        status: null,
        startDate: null,
        endDate: null,
        searchQuery: null,
        limit: null,
        offset: null,
      )).called(1);
    });

    test('should filter orders by status', () async {
      // Arrange
      final orders = [MockData.mockCustomerOrder];
      when(mockRepository.getOrders(
        customerId: customerId,
        status: OrderStatus.pending,
        startDate: null,
        endDate: null,
        searchQuery: null,
        limit: null,
        offset: null,
      )).thenAnswer((_) async => orders);

      // Act
      final result = await useCase.execute(GetOrdersParams(
        customerId: customerId,
        status: OrderStatus.pending,
      ));

      // Assert
      expect(result.isSuccess, true);
      final success = result as GetOrdersSuccess;
      expect(success.orders.length, 1);
      expect(success.orders.first.status, 'pending');
    });

    test('should filter orders by date range', () async {
      // Arrange
      final startDate = DateTime(2026, 1, 1);
      final endDate = DateTime(2026, 1, 31);
      final orders = MockData.mockCustomerOrders;
      when(mockRepository.getOrders(
        customerId: customerId,
        status: null,
        startDate: startDate,
        endDate: endDate,
        searchQuery: null,
        limit: null,
        offset: null,
      )).thenAnswer((_) async => orders);

      // Act
      final result = await useCase.execute(GetOrdersParams(
        customerId: customerId,
        startDate: startDate,
        endDate: endDate,
      ));

      // Assert
      expect(result.isSuccess, true);
      final success = result as GetOrdersSuccess;
      expect(success.orders.isNotEmpty, true);
    });

    test('should search orders by query', () async {
      // Arrange
      const query = 'Pizza';
      final orders = [MockData.mockCustomerOrder];
      when(mockRepository.getOrders(
        customerId: customerId,
        status: null,
        startDate: null,
        endDate: null,
        searchQuery: query,
        limit: null,
        offset: null,
      )).thenAnswer((_) async => orders);

      // Act
      final result = await useCase.execute(GetOrdersParams(
        customerId: customerId,
        searchQuery: query,
      ));

      // Assert
      expect(result.isSuccess, true);
      final success = result as GetOrdersSuccess;
      expect(success.orders.isNotEmpty, true);
    });

    test('should filter orders by paid status', () async {
      // Arrange
      final orders = MockData.mockCustomerOrders;
      when(mockRepository.getOrders(
        customerId: customerId,
        status: null,
        startDate: null,
        endDate: null,
        searchQuery: null,
        limit: null,
        offset: null,
      )).thenAnswer((_) async => orders);

      // Act
      final result = await useCase.execute(GetOrdersParams(
        customerId: customerId,
        isPaidOnly: true,
      ));

      // Assert
      expect(result.isSuccess, true);
    });

    test('should filter orders by minimum amount', () async {
      // Arrange
      final orders = MockData.mockCustomerOrders;
      when(mockRepository.getOrders(
        customerId: customerId,
        status: null,
        startDate: null,
        endDate: null,
        searchQuery: null,
        limit: null,
        offset: null,
      )).thenAnswer((_) async => orders);

      // Act
      final result = await useCase.execute(GetOrdersParams(
        customerId: customerId,
        minAmount: 20.0,
      ));

      // Assert
      expect(result.isSuccess, true);
      final success = result as GetOrdersSuccess;
      for (final order in success.orders) {
        expect(order.totalAmount >= 20.0, true);
      }
    });

    test('should filter orders by maximum amount', () async {
      // Arrange
      final orders = MockData.mockCustomerOrders;
      when(mockRepository.getOrders(
        customerId: customerId,
        status: null,
        startDate: null,
        endDate: null,
        searchQuery: null,
        limit: null,
        offset: null,
      )).thenAnswer((_) async => orders);

      // Act
      final result = await useCase.execute(GetOrdersParams(
        customerId: customerId,
        maxAmount: 30.0,
      ));

      // Assert
      expect(result.isSuccess, true);
      final success = result as GetOrdersSuccess;
      for (final order in success.orders) {
        expect(order.totalAmount <= 30.0, true);
      }
    });

    test('should sort orders by date descending', () async {
      // Arrange
      final orders = MockData.mockCustomerOrders;
      when(mockRepository.getOrders(
        customerId: customerId,
        status: null,
        startDate: null,
        endDate: null,
        searchQuery: null,
        limit: null,
        offset: null,
      )).thenAnswer((_) async => orders);

      // Act
      final result = await useCase.execute(GetOrdersParams(
        customerId: customerId,
        sortBy: OrderSortBy.dateDesc,
      ));

      // Assert
      expect(result.isSuccess, true);
      final success = result as GetOrdersSuccess;
      if (success.orders.length > 1) {
        expect(
          success.orders[0].orderDate.isAfter(success.orders[1].orderDate) ||
              success.orders[0].orderDate.isAtSameMomentAs(success.orders[1].orderDate),
          true,
        );
      }
    });

    test('should sort orders by amount ascending', () async {
      // Arrange
      final orders = MockData.mockCustomerOrders;
      when(mockRepository.getOrders(
        customerId: customerId,
        status: null,
        startDate: null,
        endDate: null,
        searchQuery: null,
        limit: null,
        offset: null,
      )).thenAnswer((_) async => orders);

      // Act
      final result = await useCase.execute(GetOrdersParams(
        customerId: customerId,
        sortBy: OrderSortBy.amountAsc,
      ));

      // Assert
      expect(result.isSuccess, true);
      final success = result as GetOrdersSuccess;
      if (success.orders.length > 1) {
        expect(
          success.orders[0].totalAmount <= success.orders[1].totalAmount,
          true,
        );
      }
    });

    test('should return empty list when no orders found', () async {
      // Arrange
      when(mockRepository.getOrders(
        customerId: customerId,
        status: null,
        startDate: null,
        endDate: null,
        searchQuery: null,
        limit: null,
        offset: null,
      )).thenAnswer((_) async => []);

      // Act
      final result = await useCase.execute(GetOrdersParams(
        customerId: customerId,
      ));

      // Assert
      expect(result.isSuccess, true);
      final success = result as GetOrdersSuccess;
      expect(success.orders.isEmpty, true);
      expect(success.isEmpty, true);
    });

    test('should handle repository errors', () async {
      // Arrange
      when(mockRepository.getOrders(
        customerId: customerId,
        status: null,
        startDate: null,
        endDate: null,
        searchQuery: null,
        limit: null,
        offset: null,
      )).thenThrow(Exception('Network error'));

      // Act
      final result = await useCase.execute(GetOrdersParams(
        customerId: customerId,
      ));

      // Assert
      expect(result.isFailure, true);
      final failure = result as GetOrdersFailure;
      expect(failure.error, contains('Network error'));
    });

    test('should throw when customer ID is empty', () async {
      // Act & Assert
      expect(
        () => useCase.execute(GetOrdersParams(customerId: '')),
        throwsArgumentError,
      );
    });

    test('should throw when start date is after end date', () async {
      // Arrange
      final startDate = DateTime(2026, 1, 31);
      final endDate = DateTime(2026, 1, 1);

      // Act & Assert
      expect(
        () => useCase.execute(GetOrdersParams(
          customerId: customerId,
          startDate: startDate,
          endDate: endDate,
        )),
        throwsArgumentError,
      );
    });

    test('should throw when min amount is negative', () async {
      // Act & Assert
      expect(
        () => useCase.execute(GetOrdersParams(
          customerId: customerId,
          minAmount: -10.0,
        )),
        throwsArgumentError,
      );
    });

    test('should throw when max amount is negative', () async {
      // Act & Assert
      expect(
        () => useCase.execute(GetOrdersParams(
          customerId: customerId,
          maxAmount: -10.0,
        )),
        throwsArgumentError,
      );
    });

    test('should throw when min amount is greater than max amount', () async {
      // Act & Assert
      expect(
        () => useCase.execute(GetOrdersParams(
          customerId: customerId,
          minAmount: 100.0,
          maxAmount: 50.0,
        )),
        throwsArgumentError,
      );
    });

    test('should get active orders', () async {
      // Arrange
      final orders = [MockData.mockCustomerOrder];
      when(mockRepository.getOrders(
        customerId: customerId,
        status: null,
        startDate: null,
        endDate: null,
        searchQuery: null,
        limit: null,
        offset: null,
      )).thenAnswer((_) async => orders);

      // Act
      final result = await useCase.getActiveOrders(customerId);

      // Assert
      expect(result.isSuccess, true);
    });

    test('should get order history', () async {
      // Arrange
      final orders = MockData.mockCustomerOrders;
      when(mockRepository.getOrders(
        customerId: customerId,
        status: null,
        startDate: null,
        endDate: null,
        searchQuery: null,
        limit: null,
        offset: null,
      )).thenAnswer((_) async => orders);

      // Act
      final result = await useCase.getOrderHistory(customerId);

      // Assert
      expect(result.isSuccess, true);
    });

    test('should search orders', () async {
      // Arrange
      const query = 'Pizza';
      final orders = [MockData.mockCustomerOrder];
      when(mockRepository.getOrders(
        customerId: customerId,
        status: null,
        startDate: null,
        endDate: null,
        searchQuery: query,
        limit: null,
        offset: null,
      )).thenAnswer((_) async => orders);

      // Act
      final result = await useCase.searchOrders(customerId, query);

      // Assert
      expect(result.isSuccess, true);
    });

    test('should get single order successfully', () async {
      // Arrange
      const orderId = 'order-123';
      final order = MockData.mockCustomerOrder;
      when(mockRepository.getOrder(orderId))
          .thenAnswer((_) async => order);

      // Act
      final result = await useCase.getOrder(orderId);

      // Assert
      expect(result.isSuccess, true);
      final success = result as GetOrderSuccess;
      expect(success.order.id, orderId);
    });

    test('should handle order not found', () async {
      // Arrange
      const orderId = 'order-999';
      when(mockRepository.getOrder(orderId))
          .thenAnswer((_) async => null);

      // Act
      final result = await useCase.getOrder(orderId);

      // Assert
      expect(result.isFailure, true);
      final failure = result as GetOrderFailure;
      expect(failure.error, contains('non trouvée'));
    });

    test('should handle pagination', () async {
      // Arrange
      final orders = MockData.mockCustomerOrders;
      when(mockRepository.getOrders(
        customerId: customerId,
        status: null,
        startDate: null,
        endDate: null,
        searchQuery: null,
        limit: 10,
        offset: 0,
      )).thenAnswer((_) async => orders);

      // Act
      final result = await useCase.execute(GetOrdersParams(
        customerId: customerId,
        limit: 10,
        offset: 0,
      ));

      // Assert
      expect(result.isSuccess, true);
      final success = result as GetOrdersSuccess;
      expect(success.orders.length <= 10, true);
    });

    test('should indicate if more orders available', () async {
      // Arrange
      final orders = List.generate(
        50,
        (i) => MockData.mockCustomerOrder.copyWith(id: 'order-$i'),
      );
      when(mockRepository.getOrders(
        customerId: customerId,
        status: null,
        startDate: null,
        endDate: null,
        searchQuery: null,
        limit: 50,
        offset: null,
      )).thenAnswer((_) async => orders);

      // Act
      final result = await useCase.execute(GetOrdersParams(
        customerId: customerId,
        limit: 50,
      ));

      // Assert
      expect(result.isSuccess, true);
      final success = result as GetOrdersSuccess;
      expect(success.hasMore, true);
    });

    test('should handle timeout', () async {
      // Arrange
      when(mockRepository.getOrders(
        customerId: customerId,
        status: null,
        startDate: null,
        endDate: null,
        searchQuery: null,
        limit: null,
        offset: null,
      )).thenAnswer(
        (_) => Future.delayed(
          const Duration(seconds: 10),
          () => MockData.mockCustomerOrders,
        ),
      );

      // Act & Assert
      expect(
        () => useCase
            .execute(GetOrdersParams(customerId: customerId))
            .timeout(const Duration(seconds: 1)),
        throwsA(isA<TimeoutException>()),
      );
    });

    test('should validate params correctly', () async {
      // Arrange
      final validParams = GetOrdersParams(
        customerId: customerId,
        startDate: DateTime(2026, 1, 1),
        endDate: DateTime(2026, 1, 31),
        minAmount: 10.0,
        maxAmount: 100.0,
      );

      // Assert
      expect(validParams.isValid, true);
    });

    test('should detect invalid params', () async {
      // Arrange
      final invalidParams = GetOrdersParams(
        customerId: customerId,
        startDate: DateTime(2026, 1, 31),
        endDate: DateTime(2026, 1, 1),
      );

      // Assert
      expect(invalidParams.isValid, false);
    });

    test('should detect if filters are applied', () async {
      // Arrange
      final paramsWithFilters = GetOrdersParams(
        customerId: customerId,
        status: OrderStatus.pending,
      );
      final paramsWithoutFilters = GetOrdersParams(
        customerId: customerId,
      );

      // Assert
      expect(paramsWithFilters.hasFilters, true);
      expect(paramsWithoutFilters.hasFilters, false);
    });
  });
}
