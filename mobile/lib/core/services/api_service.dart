import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants/api_constants.dart';
import '../storage/secure_storage.dart';

class ApiService {
  static final ApiService _instance = ApiService._internal();
  factory ApiService() => _instance;
  ApiService._internal();

  final SecureStorage _storage = SecureStorage();
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
      throw Exception(data['error'] ?? 'Erreur serveur');
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
  Future<Map<String, dynamic>> getProducts() async => _request('GET', ApiConstants.products);
  Future<Map<String, dynamic>> createProduct(Map<String, dynamic> product) async => _request('POST', ApiConstants.products, body: product);
  Future<Map<String, dynamic>> updateProduct(String id, Map<String, dynamic> product) async => _request('PUT', '${ApiConstants.products}/$id', body: product);
  Future<Map<String, dynamic>> toggleProduct(String id) async => _request('PUT', '${ApiConstants.products}/$id/toggle');
  Future<Map<String, dynamic>> deleteProduct(String id) async => _request('DELETE', '${ApiConstants.products}/$id');
  Future<Map<String, dynamic>> reorderProduct(String id, String direction) async => _request('PUT', '${ApiConstants.products}/$id/reorder', body: {'direction': direction});
  Future<Map<String, dynamic>> getProductCategories() async => _request('GET', '${ApiConstants.products}/categories');

  // ===== USERS =====
  Future<Map<String, dynamic>> getUsers() async => _request('GET', ApiConstants.users);
  Future<Map<String, dynamic>> getDeliverers() async => _request('GET', ApiConstants.deliverers);
  Future<Map<String, dynamic>> createUser(Map<String, dynamic> user) async => _request('POST', ApiConstants.users, body: user);
  Future<Map<String, dynamic>> deleteUser(String id) async => _request('DELETE', '${ApiConstants.users}/$id');
  Future<Map<String, dynamic>> toggleUser(String id) async => _request('PUT', '${ApiConstants.users}/$id/toggle');

  // ===== ORDERS =====
  Future<Map<String, dynamic>> getOrders() async => _request('GET', ApiConstants.orders);
  Future<Map<String, dynamic>> getMyOrders() async => _request('GET', ApiConstants.myOrders);
  Future<Map<String, dynamic>> createOrder(Map<String, dynamic> order) async => _request('POST', ApiConstants.orders, body: order);
  Future<Map<String, dynamic>> updateOrder(String id, Map<String, dynamic> order) async => _request('PUT', '${ApiConstants.orders}/$id', body: order);
  Future<Map<String, dynamic>> lockOrder(String id) async => _request('PUT', '${ApiConstants.orders}/$id/lock');
  Future<Map<String, dynamic>> assignDeliverer(String orderId, String delivererId) async => _request('POST', '${ApiConstants.orders}/$orderId/assign', body: {'delivererId': delivererId});

  // ===== DELIVERIES =====
  Future<Map<String, dynamic>> getDeliveries() async => _request('GET', ApiConstants.deliveries);
  Future<Map<String, dynamic>> getDeliveryRoute() async => _request('GET', ApiConstants.deliveryRoute);
  Future<Map<String, dynamic>> getDeliveryHistory() async => _request('GET', '${ApiConstants.baseUrl}/deliveries/history');
  Future<Map<String, dynamic>> getDelivery(String id) async => _request('GET', '${ApiConstants.deliveries}/$id');
  Future<Map<String, dynamic>> updateDeliveryStatus(String id, Map<String, dynamic> status) async => _request('PUT', '${ApiConstants.deliveries}/$id/status', body: status);

  // ===== FINANCIAL =====
  Future<Map<String, dynamic>> getDailyFinancial() async => _request('GET', ApiConstants.dailyFinancial);
  Future<Map<String, dynamic>> getDebts() async => _request('GET', ApiConstants.debts);

  // ===== LOCATION =====
  Future<Map<String, dynamic>> updateDelivererLocation(double lat, double lng) async => _request('POST', '${ApiConstants.baseUrl}/deliverers/location', body: {'latitude': lat, 'longitude': lng});
  Future<Map<String, dynamic>> getDeliverersLocations() async => _request('GET', '${ApiConstants.baseUrl}/deliverers/locations');
  Future<Map<String, dynamic>> getDelivererHistory(String delivererId, String date) async => _request('GET', '${ApiConstants.baseUrl}/deliverers/$delivererId/history?date=$date');

  // ===== ORGANIZATION =====
  Future<Map<String, dynamic>> getOrganizationSettings() async => _request('GET', '${ApiConstants.baseUrl}/organization/settings');
  Future<Map<String, dynamic>> updateOrganizationSettings(Map<String, dynamic> settings) async => _request('PUT', '${ApiConstants.baseUrl}/organization/settings', body: settings);

  // ===== KITCHEN =====
  Future<Map<String, dynamic>> getKitchenOrders() async => _request('GET', '${ApiConstants.baseUrl}/orders/kitchen');
  Future<Map<String, dynamic>> updateKitchenOrderStatus(String orderId, String status) async => _request('PUT', '${ApiConstants.baseUrl}/orders/$orderId/kitchen-status', body: {'status': status});

  // ===== AUDIT =====
  Future<Map<String, dynamic>> getAuditLogs({int limit = 100, int offset = 0, String? action}) async {
    String url = '${ApiConstants.baseUrl}/audit-logs?limit=$limit&offset=$offset';
    if (action != null) url += '&action=$action';
    return _request('GET', url);
  }
}
