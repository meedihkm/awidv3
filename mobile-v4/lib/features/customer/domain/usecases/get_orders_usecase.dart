import '../entities/customer_order.dart';
import '../repositories/customer_repository.dart';

/// Use Case: Récupérer les Commandes Client
/// Gère la récupération et le filtrage des commandes d'un client
class GetOrdersUseCase {
  final CustomerRepository _repository;

  const GetOrdersUseCase(this._repository);

  /// Récupère toutes les commandes du client
  Future<GetOrdersResult> execute(GetOrdersParams params) async {
    try {
      // 1. Valider les paramètres
      _validateParams(params);

      // 2. Récupérer les commandes
      final orders = await _repository.getOrders(
        customerId: params.customerId,
        status: params.status,
        startDate: params.startDate,
        endDate: params.endDate,
        searchQuery: params.searchQuery,
        limit: params.limit,
        offset: params.offset,
      );

      // 3. Appliquer les filtres supplémentaires si nécessaire
      var filteredOrders = orders;

      if (params.isPaidOnly != null) {
        filteredOrders = filteredOrders.where((order) {
          return params.isPaidOnly! ? order.isPaid : !order.isPaid;
        }).toList();
      }

      if (params.minAmount != null) {
        filteredOrders = filteredOrders.where((order) {
          return order.totalAmount >= params.minAmount!;
        }).toList();
      }

      if (params.maxAmount != null) {
        filteredOrders = filteredOrders.where((order) {
          return order.totalAmount <= params.maxAmount!;
        }).toList();
      }

      // 4. Trier les commandes
      if (params.sortBy != null) {
        filteredOrders = _sortOrders(filteredOrders, params.sortBy!);
      }

      return GetOrdersResult.success(
        orders: filteredOrders,
        totalCount: filteredOrders.length,
        hasMore: orders.length >= (params.limit ?? 50),
      );
    } catch (error) {
      return GetOrdersResult.failure(
        error: error.toString(),
        customerId: params.customerId,
      );
    }
  }

  /// Récupère une commande spécifique
  Future<GetOrderResult> getOrder(String orderId) async {
    try {
      if (orderId.isEmpty) {
        throw ArgumentError('L\'ID de commande est requis');
      }

      final order = await _repository.getOrder(orderId);

      if (order == null) {
        return GetOrderResult.failure(
          error: 'Commande non trouvée',
          orderId: orderId,
        );
      }

      return GetOrderResult.success(order: order);
    } catch (error) {
      return GetOrderResult.failure(
        error: error.toString(),
        orderId: orderId,
      );
    }
  }

  /// Récupère les commandes actives (en cours)
  Future<GetOrdersResult> getActiveOrders(String customerId) async {
    return execute(GetOrdersParams(
      customerId: customerId,
      statusFilter: OrderStatusFilter.active,
      sortBy: OrderSortBy.dateDesc,
    ));
  }

  /// Récupère l'historique des commandes
  Future<GetOrdersResult> getOrderHistory(
    String customerId, {
    DateTime? startDate,
    DateTime? endDate,
    int? limit,
  }) async {
    return execute(GetOrdersParams(
      customerId: customerId,
      statusFilter: OrderStatusFilter.completed,
      startDate: startDate,
      endDate: endDate,
      limit: limit,
      sortBy: OrderSortBy.dateDesc,
    ));
  }

  /// Recherche des commandes
  Future<GetOrdersResult> searchOrders(
    String customerId,
    String query,
  ) async {
    return execute(GetOrdersParams(
      customerId: customerId,
      searchQuery: query,
      sortBy: OrderSortBy.relevance,
    ));
  }

  /// Valide les paramètres
  void _validateParams(GetOrdersParams params) {
    if (params.customerId.isEmpty) {
      throw ArgumentError('L\'ID du client est requis');
    }

    if (params.startDate != null &&
        params.endDate != null &&
        params.startDate!.isAfter(params.endDate!)) {
      throw ArgumentError('La date de début doit être avant la date de fin');
    }

    if (params.minAmount != null && params.minAmount! < 0) {
      throw ArgumentError('Le montant minimum doit être positif');
    }

    if (params.maxAmount != null && params.maxAmount! < 0) {
      throw ArgumentError('Le montant maximum doit être positif');
    }

    if (params.minAmount != null &&
        params.maxAmount != null &&
        params.minAmount! > params.maxAmount!) {
      throw ArgumentError(
          'Le montant minimum doit être inférieur au montant maximum');
    }
  }

  /// Trie les commandes
  List<CustomerOrder> _sortOrders(
    List<CustomerOrder> orders,
    OrderSortBy sortBy,
  ) {
    final sortedOrders = List<CustomerOrder>.from(orders);

    switch (sortBy) {
      case OrderSortBy.dateAsc:
        sortedOrders.sort((a, b) => a.orderDate.compareTo(b.orderDate));
        break;
      case OrderSortBy.dateDesc:
        sortedOrders.sort((a, b) => b.orderDate.compareTo(a.orderDate));
        break;
      case OrderSortBy.amountAsc:
        sortedOrders.sort((a, b) => a.totalAmount.compareTo(b.totalAmount));
        break;
      case OrderSortBy.amountDesc:
        sortedOrders.sort((a, b) => b.totalAmount.compareTo(a.totalAmount));
        break;
      case OrderSortBy.statusAsc:
        sortedOrders.sort((a, b) => a.status.index.compareTo(b.status.index));
        break;
      case OrderSortBy.statusDesc:
        sortedOrders.sort((a, b) => b.status.index.compareTo(a.status.index));
        break;
      case OrderSortBy.relevance:
        // Tri par pertinence (déjà trié par le backend)
        break;
    }

    return sortedOrders;
  }
}

/// Paramètres pour récupérer les commandes
class GetOrdersParams {
  final String customerId;
  final OrderStatus? status;
  final OrderStatusFilter? statusFilter;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? searchQuery;
  final bool? isPaidOnly;
  final double? minAmount;
  final double? maxAmount;
  final OrderSortBy? sortBy;
  final int? limit;
  final int? offset;

  const GetOrdersParams({
    required this.customerId,
    this.status,
    this.statusFilter,
    this.startDate,
    this.endDate,
    this.searchQuery,
    this.isPaidOnly,
    this.minAmount,
    this.maxAmount,
    this.sortBy,
    this.limit,
    this.offset,
  });

  /// Vérifie si les paramètres sont valides
  bool get isValid {
    return customerId.isNotEmpty &&
        (startDate == null ||
            endDate == null ||
            !startDate!.isAfter(endDate!)) &&
        (minAmount == null || minAmount! >= 0) &&
        (maxAmount == null || maxAmount! >= 0) &&
        (minAmount == null ||
            maxAmount == null ||
            minAmount! <= maxAmount!);
  }

  /// Vérifie si des filtres sont appliqués
  bool get hasFilters {
    return status != null ||
        statusFilter != null ||
        startDate != null ||
        endDate != null ||
        searchQuery != null ||
        isPaidOnly != null ||
        minAmount != null ||
        maxAmount != null;
  }
}

/// Filtre de statut de commande
enum OrderStatusFilter {
  all,
  active,
  completed,
  cancelled,
}

/// Tri des commandes
enum OrderSortBy {
  dateAsc,
  dateDesc,
  amountAsc,
  amountDesc,
  statusAsc,
  statusDesc,
  relevance,
}

/// Résultat de récupération des commandes
abstract class GetOrdersResult {
  const GetOrdersResult();

  factory GetOrdersResult.success({
    required List<CustomerOrder> orders,
    required int totalCount,
    required bool hasMore,
  }) = GetOrdersSuccess;

  factory GetOrdersResult.failure({
    required String error,
    required String customerId,
  }) = GetOrdersFailure;

  bool get isSuccess => this is GetOrdersSuccess;
  bool get isFailure => this is GetOrdersFailure;
}

class GetOrdersSuccess extends GetOrdersResult {
  final List<CustomerOrder> orders;
  final int totalCount;
  final bool hasMore;

  const GetOrdersSuccess({
    required this.orders,
    required this.totalCount,
    required this.hasMore,
  });

  bool get isEmpty => orders.isEmpty;
  bool get isNotEmpty => orders.isNotEmpty;
}

class GetOrdersFailure extends GetOrdersResult {
  final String error;
  final String customerId;

  const GetOrdersFailure({
    required this.error,
    required this.customerId,
  });
}

/// Résultat de récupération d'une commande
abstract class GetOrderResult {
  const GetOrderResult();

  factory GetOrderResult.success({
    required CustomerOrder order,
  }) = GetOrderSuccess;

  factory GetOrderResult.failure({
    required String error,
    required String orderId,
  }) = GetOrderFailure;

  bool get isSuccess => this is GetOrderSuccess;
  bool get isFailure => this is GetOrderFailure;
}

class GetOrderSuccess extends GetOrderResult {
  final CustomerOrder order;

  const GetOrderSuccess({required this.order});
}

class GetOrderFailure extends GetOrderResult {
  final String error;
  final String orderId;

  const GetOrderFailure({
    required this.error,
    required this.orderId,
  });
}
