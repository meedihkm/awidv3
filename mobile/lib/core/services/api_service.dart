import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants/api_constants.dart';
import '../storage/secure_storage.dart';
import 'cache_service.dart';
import '../database/hive_service.dart';
import '../database/sync_service.dart';
import '../models/debt_model.dart';

class ApiException implements Exception {
  final int statusCode;
  final String message;
  
  ApiException(this.statusCode, this.message);
  
  @override
  String toString() => 'ApiException: [$statusCode] $message';
}

class ApiService {
  static final ApiService _instance = ApiService._internal();
  factory ApiService() => _instance;
  ApiService._internal();
  ApiService.forTesting();

  final SecureStorage _storage = SecureStorage();
  final HiveService _hive = HiveService();
  final CacheService _cache = CacheService();
  bool _isRefreshing = false;

  Future<Map<String, String>> _getHeaders({bool includeAuth = true}) async {
    final headers = {'Content-Type': 'application/json'};
    if (includeAuth) {
      final token = await _storage.getToken();
      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
      }
    }
    return headers;
  }



  // Méthode générique avec auto-refresh du token
  Future<Map<String, dynamic>> _request(
    String method,
    String url, {
    Map<String, dynamic>? body,
    bool includeAuth = true,
  }) async {
    Future<http.Response> makeRequest() async {
      final headers = await _getHeaders(includeAuth: includeAuth);
      final uri = Uri.parse(url);
      switch (method) {
        case 'GET': return await http.get(uri, headers: headers);
        case 'POST': return await http.post(uri, headers: headers, body: body != null ? json.encode(body) : null);
        case 'PUT': return await http.put(uri, headers: headers, body: body != null ? json.encode(body) : null);
        case 'PATCH': return await http.patch(uri, headers: headers, body: body != null ? json.encode(body) : null);
        case 'DELETE': return await http.delete(uri, headers: headers);
        default: throw Exception('Méthode HTTP non supportée');
      }
    }

    var response = await makeRequest();
    
    // Si token expiré, refresh et réessayer
    if (response.statusCode == 401 && includeAuth && !_isRefreshing) {
      final refreshed = await _refreshToken();
      if (refreshed) {
        response = await makeRequest();
      }
    }
    
    final data = json.decode(response.body);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return data;
    } else {
      throw ApiException(response.statusCode, data['error'] ?? 'Erreur serveur');
    }
  }

  Future<bool> _refreshToken() async {
    if (_isRefreshing) return false;
    _isRefreshing = true;
    
    try {
      final refreshToken = await _storage.getRefreshToken();
      if (refreshToken == null) {
        _isRefreshing = false;
        return false;
      }

      final response = await http.post(
        Uri.parse('${ApiConstants.baseUrl}/auth/refresh'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'refreshToken': refreshToken}),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['success'] == true) {
          await _storage.saveToken(data['accessToken']);
          await _storage.saveRefreshToken(data['refreshToken']);
          _isRefreshing = false;
          return true;
        }
      }
      
      await _storage.clearAll();
      _isRefreshing = false;
      return false;
    } catch (e) {
      _isRefreshing = false;
      return false;
    }
  }

  // ===== AUTH =====
  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await http.post(
      Uri.parse(ApiConstants.login),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'email': email, 'password': password}),
    );
    
    final data = json.decode(response.body);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      if (data['accessToken'] != null) await _storage.saveToken(data['accessToken']);
      if (data['refreshToken'] != null) await _storage.saveRefreshToken(data['refreshToken']);
      return data;
    } else {
      throw Exception(data['error'] ?? 'Erreur serveur');
    }
  }

  Future<void> logout() async {
    try {
      final refreshToken = await _storage.getRefreshToken();
      await http.post(
        Uri.parse('${ApiConstants.baseUrl}/auth/logout'),
        headers: await _getHeaders(),
        body: json.encode({'refreshToken': refreshToken}),
      );
    } catch (e) {}
    await _storage.clearAll();
  }

  Future<void> logoutAllDevices() async {
    try {
      await _request('POST', '${ApiConstants.baseUrl}/auth/logout-all');
    } catch (e) {}
    await _storage.clearAll();
  }

  Future<Map<String, dynamic>> getMe() async {
    return _request('GET', ApiConstants.me);
  }

  // ===== PRODUCTS =====
  Future<Map<String, dynamic>> getProducts({bool forceRefresh = false}) async {
    // Essayer le cache d'abord
    if (!forceRefresh) {
      final cached = await _cache.getCachedProducts();
      if (cached != null) {
        return {'success': true, 'data': cached, 'fromCache': true};
      }
    }
    final result = await _request('GET', ApiConstants.products);
    if (result['success'] == true && result['data'] != null) {
      await _cache.cacheProducts(result['data']);
    }
    return result;
  }
  Future<Map<String, dynamic>> createProduct(Map<String, dynamic> product) async {
    final result = await _request('POST', ApiConstants.products, body: product);
    await _cache.clearCache('cache_products'); // Invalider le cache
    return result;
  }
  Future<Map<String, dynamic>> updateProduct(String id, Map<String, dynamic> product) async {
    final result = await _request('PUT', '${ApiConstants.products}/$id', body: product);
    await _cache.clearCache('cache_products');
    return result;
  }
  Future<Map<String, dynamic>> toggleProduct(String id) async {
    final result = await _request('PUT', '${ApiConstants.products}/$id/toggle');
    await _cache.clearCache('cache_products');
    return result;
  }
  Future<Map<String, dynamic>> deleteProduct(String id) async {
    final result = await _request('DELETE', '${ApiConstants.products}/$id');
    await _cache.clearCache('cache_products');
    return result;
  }
  Future<Map<String, dynamic>> reorderProduct(String id, String direction) async => _request('PUT', '${ApiConstants.products}/$id/reorder', body: {'direction': direction});
  Future<Map<String, dynamic>> getProductCategories() async => _request('GET', '${ApiConstants.products}/categories');

  // ===== USERS =====
  Future<Map<String, dynamic>> getUsers({bool forceRefresh = false}) async {
    if (!forceRefresh) {
      final cached = await _cache.getCachedUsers();
      if (cached != null) {
        return {'success': true, 'data': cached, 'fromCache': true};
      }
    }
    final result = await _request('GET', ApiConstants.users);
    if (result['success'] == true && result['data'] != null) {
      await _cache.cacheUsers(result['data']);
    }
    return result;
  }
  Future<Map<String, dynamic>> getDeliverers() async => _request('GET', ApiConstants.deliverers);
  Future<Map<String, dynamic>> createUser(Map<String, dynamic> user) async {
    final result = await _request('POST', ApiConstants.users, body: user);
    await _cache.clearCache('cache_users');
    return result;
  }
  Future<Map<String, dynamic>> deleteUser(String id) async {
    final result = await _request('DELETE', '${ApiConstants.users}/$id');
    await _cache.clearCache('cache_users');
    return result;
  }
  Future<Map<String, dynamic>> toggleUser(String id) async {
    final result = await _request('PUT', '${ApiConstants.users}/$id/toggle');
    await _cache.clearCache('cache_users');
    return result;
  }
  Future<Map<String, dynamic>> updateUserAddress(String userId, String address, {double? latitude, double? longitude}) async => 
    _request('PUT', '${ApiConstants.users}/$userId/address', body: {'address': address, 'latitude': latitude, 'longitude': longitude});

  Future<Map<String, dynamic>> updateCreditLimit(String userId, double? limit) async =>
      _request('PUT', '${ApiConstants.users}/$userId/credit-limit', body: {'creditLimit': limit});

  // ===== ORDERS =====
  Future<Map<String, dynamic>> getOrders({
    int page = 1, 
    int limit = 20, 
    bool forceRefresh = false,
    String? cafeteriaId,
    String? status
  }) async {
    final cacheKey = 'orders_p${page}_l$limit${cafeteriaId != null ? "_c$cafeteriaId" : ""}${status != null ? "_s$status" : ""}';
    
    // 1. Try Cache if offline or not forced
    if (!forceRefresh) {
      if (!SyncService().isOnline) {
        final cached = _hive.getCachedData(cacheKey);
        if (cached != null) {
          return {'success': true, 'data': cached, 'fromCache': true};
        }
      }
    }

    try {
      String query = 'page=$page&limit=$limit';
      if (cafeteriaId != null) query += '&cafeteriaId=$cafeteriaId';
      if (status != null) query += '&status=$status';

      final result = await _request('GET', '${ApiConstants.orders}?$query');
      if (result['success'] == true && result['data'] != null) {
        await _hive.cacheData(cacheKey, result['data']);
        // Only cache generic list for page 1 if no filters
        if (page == 1 && cafeteriaId == null && status == null) await _hive.cacheData('orders', result['data']);
      }
      return result;
    } catch (e) {
      // If request failed (and we checked online status earlier but maybe it failed mid-flight), try cache
      final cached = _hive.getCachedData(cacheKey);
      if (cached != null) {
        return {'success': true, 'data': cached, 'fromCache': true, 'offline': true};
      }
      rethrow;
    }
  }
  Future<Map<String, dynamic>> getMyOrders({int page = 1, int limit = 20}) async => 
      _request('GET', '${ApiConstants.myOrders}?page=$page&limit=$limit');
  Future<Map<String, dynamic>> createOrder(Map<String, dynamic> order) async {
    final result = await _request('POST', ApiConstants.orders, body: order);
    await _cache.clearCache('cache_orders');
    return result;
  }
  Future<Map<String, dynamic>> updateOrder(String id, Map<String, dynamic> order) async {
    final result = await _request('PUT', '${ApiConstants.orders}/$id', body: order);
    await _cache.clearCache('cache_orders');
    return result;
  }
  Future<Map<String, dynamic>> lockOrder(String id) async {
    final result = await _request('PUT', '${ApiConstants.orders}/$id/lock');
    await _cache.clearCache('cache_orders');
    return result;
  }
  Future<Map<String, dynamic>> assignDeliverer(String orderId, String delivererId) async {
    final result = await _request('POST', '${ApiConstants.orders}/$orderId/assign', body: {'delivererId': delivererId});
    await _cache.clearCache('cache_orders');
    await _cache.clearCache('cache_deliveries');
    return result;
  }

  // ===== DELIVERIES =====
  Future<Map<String, dynamic>> getDeliveries({
    int page = 1, 
    int limit = 20, 
    bool forceRefresh = false,
    String? delivererId,
    String? status,
    String? cafeteriaId
  }) async {
    if (!forceRefresh && page == 1 && delivererId == null && status == null && cafeteriaId == null) {
      final cached = await _cache.getCachedDeliveries();
      if (cached != null) {
        return {'success': true, 'data': cached, 'fromCache': true};
      }
    }
    
    String query = 'page=$page&limit=$limit';
    if (delivererId != null) query += '&delivererId=$delivererId';
    if (status != null) query += '&status=$status';
    if (cafeteriaId != null) query += '&cafeteriaId=$cafeteriaId';

    final result = await _request('GET', '${ApiConstants.deliveries}?$query');
    if (result['success'] == true && result['data'] != null && page == 1 && delivererId == null && status == null && cafeteriaId == null) {
      await _cache.cacheDeliveries(result['data']);
    }
    return result;
  }
  Future<Map<String, dynamic>> getDeliveryRoute() async => _request('GET', ApiConstants.deliveryRoute);
  Future<Map<String, dynamic>> getDeliveryHistory() async => _request('GET', '${ApiConstants.baseUrl}/deliveries/history');
  Future<Map<String, dynamic>> getDelivery(String id) async => _request('GET', '${ApiConstants.deliveries}/$id');
  Future<Map<String, dynamic>> updateDeliveryStatus(String id, Map<String, dynamic> status) async {
    final result = await _request('PUT', '${ApiConstants.deliveries}/$id/status', body: status);
    await _cache.clearCache('cache_deliveries');
    await _cache.clearCache('cache_orders');
    return result;
  }

  // ===== FINANCIAL =====
  Future<Map<String, dynamic>> getDailyFinancial() async => _request('GET', ApiConstants.dailyFinancial);
  Future<Map<String, dynamic>> getDebts({bool forceRefresh = false}) async {
    if (!forceRefresh) {
      final cached = await _cache.getCachedDebts();
      if (cached != null) {
        return {'success': true, 'data': cached, 'fromCache': true};
      }
    }
    try {
      final result = await _request('GET', ApiConstants.debts);
      if (result['success'] == true && result['data'] != null) {
        await _cache.cacheDebts(result['data']);
      }
      return result;
    } catch (e) {
      print('Error getting debts: $e');
      return {'success': false, 'data': [], 'error': e.toString()};
    }
  }

  // ===== LOCATION =====
  Future<Map<String, dynamic>> updateDelivererLocation(double lat, double lng) async => _request('POST', ApiConstants.deliverersLocation, body: {'latitude': lat, 'longitude': lng});
  Future<Map<String, dynamic>> getDeliverersLocations() async => _request('GET', ApiConstants.deliverersLocations);
  Future<Map<String, dynamic>> getClientsLocations() async => _request('GET', '${ApiConstants.baseUrl}/users/clients-locations');
  Future<Map<String, dynamic>> getDelivererHistory(String delivererId, String date) async => _request('GET', '${ApiConstants.deliveries}/$delivererId/history?date=$date');

  // ===== ORGANIZATION =====
  Future<Map<String, dynamic>> getOrganizationSettings() async => _request('GET', '${ApiConstants.baseUrl}/organization/settings');
  Future<Map<String, dynamic>> updateOrganizationSettings(Map<String, dynamic> settings) async => _request('PUT', '${ApiConstants.baseUrl}/organization/settings', body: settings);

  // ===== KITCHEN =====
  Future<Map<String, dynamic>> getKitchenOrders() async => _request('GET', '${ApiConstants.baseUrl}/orders/kitchen');
  Future<Map<String, dynamic>> updateKitchenOrderStatus(String orderId, String status) async => _request('PUT', '${ApiConstants.baseUrl}/orders/$orderId/kitchen-status', body: {'status': status});

  // ===== AUDIT =====
  Future<Map<String, dynamic>> getAuditLogs({int limit = 100, int offset = 0, String? action}) async {
    String url = '${ApiConstants.auditLogs}?limit=$limit&offset=$offset';
    if (action != null) url += '&action=$action';
    return _request('GET', url);
  }

  // ===== DEBT (Feature 1) =====
  Future<CustomerDebt?> getCustomerDebt(String customerId) async {
    try {
      final result = await _request('GET', '${ApiConstants.debtBase}/customers/$customerId/debt');
      return CustomerDebt.fromJson(result);
    } catch (e) {
      if (e is ApiException && e.statusCode == 404) return null;
      rethrow;
    }
  }

  Future<List<dynamic>> getUnpaidOrders(String customerId) async {
    final result = await _request('GET', '${ApiConstants.debtBase}/customers/$customerId/unpaid-orders');
    return result as List;
  }

  Future<Map<String, dynamic>> getDebtsList({
    String sort = 'amount_desc',
    double minDebt = 0,
    int page = 1,
    int limit = 50,
  }) async {
    // Use the financial endpoint which is more reliably deployed
    String url = '${ApiConstants.debts}?sort=$sort&min_debt=$minDebt&page=$page&limit=$limit';
    return _request('GET', url);
  }

  Future<Map<String, dynamic>> recordDebtPayment(Map<String, dynamic> paymentData) async {
    final result = await _request('POST', '${ApiConstants.baseUrl}/payments/record', body: paymentData);
    // Invalider cache
    await _cache.clearCache('cache_debts');
    return result;
  }

  // ===== PACKAGING (Feature 3) =====
  Future<Map<String, dynamic>> getPackagingTypes() async => 
      _request('GET', '${ApiConstants.baseUrl}/packaging/types');

  Future<Map<String, dynamic>> createPackagingType(Map<String, dynamic> data) async =>
      _request('POST', '${ApiConstants.baseUrl}/packaging/types', body: data);

  Future<Map<String, dynamic>> updatePackagingType(String id, Map<String, dynamic> data) async =>
      _request('PUT', '${ApiConstants.baseUrl}/packaging/types/$id', body: data);

  Future<Map<String, dynamic>> getCustomerPackagingBalance(String customerId) async =>
      _request('GET', '${ApiConstants.baseUrl}/packaging/customers/$customerId/balance');

  Future<Map<String, dynamic>> getCustomerPackagingHistory(String customerId, {int limit = 50, int offset = 0}) async =>
      _request('GET', '${ApiConstants.baseUrl}/packaging/customers/$customerId/history?limit=$limit&offset=$offset');

  Future<Map<String, dynamic>> recordPackagingDeposit(Map<String, dynamic> data) async =>
      _request('POST', '${ApiConstants.baseUrl}/packaging/deposits', body: data);

  Future<Map<String, dynamic>> getPackagingSummary() async =>
      _request('GET', '${ApiConstants.baseUrl}/packaging/summary');

  // ===== RECURRING ORDERS (Feature 4) =====
  Future<Map<String, dynamic>> getRecurringOrders() async =>
      _request('GET', '${ApiConstants.baseUrl}/recurring');

  Future<Map<String, dynamic>> getRecurringOrderById(String id) async =>
      _request('GET', '${ApiConstants.baseUrl}/recurring/$id');

  Future<Map<String, dynamic>> createRecurringOrder(Map<String, dynamic> data) async =>
      _request('POST', '${ApiConstants.baseUrl}/recurring', body: data);

  Future<Map<String, dynamic>> updateRecurringOrder(String id, Map<String, dynamic> data) async =>
      _request('PUT', '${ApiConstants.baseUrl}/recurring/$id', body: data);

  Future<Map<String, dynamic>> deleteRecurringOrder(String id) async =>
      _request('DELETE', '${ApiConstants.baseUrl}/recurring/$id');

  Future<Map<String, dynamic>> toggleRecurringOrder(String id) async =>
      _request('POST', '${ApiConstants.baseUrl}/recurring/$id/toggle');

  Future<Map<String, dynamic>> getAdminRecurringOrders({bool? active}) async {
    String query = '';
    if (active != null) query = '?active=$active';
    return _request('GET', '${ApiConstants.baseUrl}/recurring/admin/all$query');
  }

  // ===== PAYMENT SERVICE (Phase 1) =====
  Future<Map<String, dynamic>> getClientDebtDetails(String clientId) async => 
      _request('GET', '${ApiConstants.baseUrl}/payments/client/$clientId/details');
  
  Future<Map<String, dynamic>> getMyCollections() async => 
      _request('GET', '${ApiConstants.baseUrl}/payments/my-collections');
  
  Future<Map<String, dynamic>> getMyPayments() async => 
      _request('GET', '${ApiConstants.baseUrl}/payments/my-payments');
  
  Future<Map<String, dynamic>> getPaymentStats() async => 
      _request('GET', '${ApiConstants.baseUrl}/payments/stats');
  
  Future<Map<String, dynamic>> getPaymentHistory({
    int page = 1,
    int limit = 50,
  }) async => 
      _request('GET', '${ApiConstants.baseUrl}/payments/history?page=$page&limit=$limit');
  
  // Alias for legacy or mismatched calls
  Future<Map<String, dynamic>> recordPayment(Map<String, dynamic> data) async => 
      _request('POST', '${ApiConstants.baseUrl}/payments/record', body: data);
}

