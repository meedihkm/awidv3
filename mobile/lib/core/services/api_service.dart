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
    final headers = {
      'Content-Type': 'application/json',
    };

    if (includeAuth) {
      final token = await _storage.getToken();
      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
      }
    }

    return headers;
  }

  Future<Map<String, dynamic>> _handleResponse(http.Response response, {Function? retryRequest}) async {
    // Si token expiré, essayer de refresh
    if (response.statusCode == 401 && retryRequest != null && !_isRefreshing) {
      final refreshed = await _refreshToken();
      if (refreshed) {
        // Réessayer la requête avec le nouveau token
        return await retryRequest();
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
      
      // Refresh échoué, déconnecter l'utilisateur
      await _storage.clearAll();
      _isRefreshing = false;
      return false;
    } catch (e) {
      _isRefreshing = false;
      return false;
    }
  }

  // Auth
  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await http.post(
      Uri.parse(ApiConstants.login),
      headers: await _getHeaders(includeAuth: false),
      body: json.encode({'email': email, 'password': password}),
    );
    
    final data = json.decode(response.body);
    
    if (response.statusCode >= 200 && response.statusCode < 300) {
      // Sauvegarder les deux tokens
      if (data['accessToken'] != null) {
        await _storage.saveToken(data['accessToken']);
      }
      if (data['refreshToken'] != null) {
        await _storage.saveRefreshToken(data['refreshToken']);
      }
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
    } catch (e) {
      // Ignorer les erreurs de logout
    } finally {
      await _storage.clearAll();
    }
  }

  Future<void> logoutAllDevices() async {
    try {
      await http.post(
        Uri.parse('${ApiConstants.baseUrl}/auth/logout-all'),
        headers: await _getHeaders(),
      );
    } catch (e) {
      // Ignorer les erreurs
    } finally {
      await _storage.clearAll();
    }
  }

  Future<Map<String, dynamic>> getMe() async {
    Future<Map<String, dynamic>> makeRequest() async {
      final response = await http.get(
        Uri.parse(ApiConstants.me),
        headers: await _getHeaders(),
      );
      return _handleResponse(response);
    }
    
    final response = await http.get(
      Uri.parse(ApiConstants.me),
      headers: await _getHeaders(),
    );
    return _handleResponse(response, retryRequest: makeRequest);
  }

  // Products
  Future<Map<String, dynamic>> getProducts() async {
    final response = await http.get(
      Uri.parse(ApiConstants.products),
      headers: await _getHeaders(),
    );
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> createProduct(Map<String, dynamic> product) async {
    final response = await http.post(
      Uri.parse(ApiConstants.products),
      headers: await _getHeaders(),
      body: json.encode(product),
    );
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> updateProduct(String id, Map<String, dynamic> product) async {
    final response = await http.put(
      Uri.parse('${ApiConstants.products}/$id'),
      headers: await _getHeaders(),
      body: json.encode(product),
    );
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> toggleProduct(String id) async {
    final response = await http.put(
      Uri.parse('${ApiConstants.products}/$id/toggle'),
      headers: await _getHeaders(),
    );
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> deleteProduct(String id) async {
    final response = await http.delete(
      Uri.parse('${ApiConstants.products}/$id'),
      headers: await _getHeaders(),
    );
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> reorderProduct(String id, String direction) async {
    final response = await http.put(
      Uri.parse('${ApiConstants.products}/$id/reorder'),
      headers: await _getHeaders(),
      body: json.encode({'direction': direction}),
    );
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> getProductCategories() async {
    final response = await http.get(
      Uri.parse('${ApiConstants.products}/categories'),
      headers: await _getHeaders(),
    );
    return _handleResponse(response);
  }

  // Users
  Future<Map<String, dynamic>> getUsers() async {
    final response = await http.get(
      Uri.parse(ApiConstants.users),
      headers: await _getHeaders(),
    );
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> getDeliverers() async {
    final response = await http.get(
      Uri.parse(ApiConstants.deliverers),
      headers: await _getHeaders(),
    );
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> createUser(Map<String, dynamic> user) async {
    final response = await http.post(
      Uri.parse(ApiConstants.users),
      headers: await _getHeaders(),
      body: json.encode(user),
    );
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> deleteUser(String id) async {
    final response = await http.delete(
      Uri.parse('${ApiConstants.users}/$id'),
      headers: await _getHeaders(),
    );
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> toggleUser(String id) async {
    final response = await http.put(
      Uri.parse('${ApiConstants.users}/$id/toggle'),
      headers: await _getHeaders(),
    );
    return _handleResponse(response);
  }

  // Orders
  Future<Map<String, dynamic>> getOrders() async {
    final response = await http.get(
      Uri.parse(ApiConstants.orders),
      headers: await _getHeaders(),
    );
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> getMyOrders() async {
    final response = await http.get(
      Uri.parse(ApiConstants.myOrders),
      headers: await _getHeaders(),
    );
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> createOrder(Map<String, dynamic> order) async {
    final response = await http.post(
      Uri.parse(ApiConstants.orders),
      headers: await _getHeaders(),
      body: json.encode(order),
    );
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> updateOrder(String id, Map<String, dynamic> order) async {
    final response = await http.put(
      Uri.parse('${ApiConstants.orders}/$id'),
      headers: await _getHeaders(),
      body: json.encode(order),
    );
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> lockOrder(String id) async {
    final response = await http.put(
      Uri.parse('${ApiConstants.orders}/$id/lock'),
      headers: await _getHeaders(),
    );
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> assignDeliverer(String orderId, String delivererId) async {
    final response = await http.post(
      Uri.parse('${ApiConstants.orders}/$orderId/assign'),
      headers: await _getHeaders(),
      body: json.encode({'delivererId': delivererId}),
    );
    return _handleResponse(response);
  }

  // Deliveries
  Future<Map<String, dynamic>> getDeliveries() async {
    final response = await http.get(
      Uri.parse(ApiConstants.deliveries),
      headers: await _getHeaders(),
    );
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> getDeliveryRoute() async {
    final response = await http.get(
      Uri.parse(ApiConstants.deliveryRoute),
      headers: await _getHeaders(),
    );
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> getDeliveryHistory() async {
    final response = await http.get(
      Uri.parse('${ApiConstants.baseUrl}/deliveries/history'),
      headers: await _getHeaders(),
    );
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> getDelivery(String id) async {
    final response = await http.get(
      Uri.parse('${ApiConstants.deliveries}/$id'),
      headers: await _getHeaders(),
    );
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> updateDeliveryStatus(String id, Map<String, dynamic> status) async {
    final response = await http.put(
      Uri.parse('${ApiConstants.deliveries}/$id/status'),
      headers: await _getHeaders(),
      body: json.encode(status),
    );
    return _handleResponse(response);
  }

  // Financial
  Future<Map<String, dynamic>> getDailyFinancial() async {
    final response = await http.get(
      Uri.parse(ApiConstants.dailyFinancial),
      headers: await _getHeaders(),
    );
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> getDebts() async {
    final response = await http.get(
      Uri.parse(ApiConstants.debts),
      headers: await _getHeaders(),
    );
    return _handleResponse(response);
  }

  // Location
  Future<Map<String, dynamic>> updateDelivererLocation(double lat, double lng) async {
    final response = await http.post(
      Uri.parse('${ApiConstants.baseUrl}/deliverers/location'),
      headers: await _getHeaders(),
      body: json.encode({'latitude': lat, 'longitude': lng}),
    );
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> getDeliverersLocations() async {
    final response = await http.get(
      Uri.parse('${ApiConstants.baseUrl}/deliverers/locations'),
      headers: await _getHeaders(),
    );
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> getDelivererHistory(String delivererId, String date) async {
    final response = await http.get(
      Uri.parse('${ApiConstants.baseUrl}/deliverers/$delivererId/history?date=$date'),
      headers: await _getHeaders(),
    );
    return _handleResponse(response);
  }

  // Organization Settings
  Future<Map<String, dynamic>> getOrganizationSettings() async {
    final response = await http.get(
      Uri.parse('${ApiConstants.baseUrl}/organization/settings'),
      headers: await _getHeaders(),
    );
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> updateOrganizationSettings(Map<String, dynamic> settings) async {
    final response = await http.put(
      Uri.parse('${ApiConstants.baseUrl}/organization/settings'),
      headers: await _getHeaders(),
      body: json.encode(settings),
    );
    return _handleResponse(response);
  }

  // Kitchen (Atelier)
  Future<Map<String, dynamic>> getKitchenOrders() async {
    final response = await http.get(
      Uri.parse('${ApiConstants.baseUrl}/orders/kitchen'),
      headers: await _getHeaders(),
    );
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> updateKitchenOrderStatus(String orderId, String status) async {
    final response = await http.put(
      Uri.parse('${ApiConstants.baseUrl}/orders/$orderId/kitchen-status'),
      headers: await _getHeaders(),
      body: json.encode({'status': status}),
    );
    return _handleResponse(response);
  }

  // Audit Logs (Admin)
  Future<Map<String, dynamic>> getAuditLogs({int limit = 100, int offset = 0, String? action}) async {
    String url = '${ApiConstants.baseUrl}/audit-logs?limit=$limit&offset=$offset';
    if (action != null) url += '&action=$action';
    
    final response = await http.get(
      Uri.parse(url),
      headers: await _getHeaders(),
    );
    return _handleResponse(response);
  }
}
