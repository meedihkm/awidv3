import '../../../../core/network/dio_client.dart';
import '../models/user_detail_model.dart';

/// Users Remote Datasource
/// Gère les appels API pour les utilisateurs
class UsersRemoteDatasource {
  const UsersRemoteDatasource(this._dioClient);

  final DioClient _dioClient;

  /// Get all users
  Future<List<UserDetailModel>> getUsers({int? page, int? limit, String? role, bool? isActive, String? search}) async {
    final queryParams = <String, dynamic>{};

    if (page != null) queryParams['page'] = page;
    if (limit != null) queryParams['limit'] = limit;
    if (role != null) queryParams['role'] = role;
    if (isActive != null) queryParams['is_active'] = isActive;
    if (search != null) queryParams['search'] = search;

    final response = await _dioClient.get('/api/v1/users', queryParameters: queryParams);

    final List<dynamic> data = response.data['data'] ?? response.data;
    return data.map((json) => UserDetailModel.fromJson(json)).toList();
  }

  /// Get user by ID
  Future<UserDetailModel> getUserById(String id) async {
    final response = await _dioClient.get('/api/v1/users/$id');

    return UserDetailModel.fromJson(response.data['data'] ?? response.data);
  }

  /// Create user
  Future<UserDetailModel> createUser(Map<String, dynamic> data) async {
    final response = await _dioClient.post('/api/v1/users', data: data);

    return UserDetailModel.fromJson(response.data['data'] ?? response.data);
  }

  /// Update user
  Future<UserDetailModel> updateUser(String id, Map<String, dynamic> data) async {
    final response = await _dioClient.put('/api/v1/users/$id', data: data);

    return UserDetailModel.fromJson(response.data['data'] ?? response.data);
  }

  /// Delete user
  Future<void> deleteUser(String id) async {
    await _dioClient.delete('/api/v1/users/$id');
  }

  /// Toggle active status
  Future<UserDetailModel> toggleActiveStatus(String id) async {
    final response = await _dioClient.patch('/api/v1/users/$id/toggle-active');

    return UserDetailModel.fromJson(response.data['data'] ?? response.data);
  }

  /// Update credit limit
  Future<UserDetailModel> updateCreditLimit(String id, double creditLimit) async {
    final response = await _dioClient.patch('/api/v1/users/$id/credit-limit', data: {'credit_limit': creditLimit});

    return UserDetailModel.fromJson(response.data['data'] ?? response.data);
  }

  /// Reset password
  Future<void> resetPassword(String id, String newPassword) async {
    await _dioClient.post('/api/v1/users/$id/reset-password', data: {'password': newPassword});
  }

  /// Get users by role
  Future<List<UserDetailModel>> getUsersByRole(String role) async {
    final response = await _dioClient.get('/api/v1/users', queryParameters: {'role': role});

    final List<dynamic> data = response.data['data'] ?? response.data;
    return data.map((json) => UserDetailModel.fromJson(json)).toList();
  }
}
