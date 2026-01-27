import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Secure Storage
/// Stockage sécurisé pour les données sensibles (tokens, credentials)
class SecureStorage {
  factory SecureStorage() => _instance;
  SecureStorage._internal();
  static final SecureStorage _instance = SecureStorage._internal();

  final FlutterSecureStorage _storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
    iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
  );

  /// Write data
  Future<void> write(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  /// Read data
  Future<String?> read(String key) async {
    return await _storage.read(key: key);
  }

  /// Delete data
  Future<void> delete(String key) async {
    await _storage.delete(key: key);
  }

  /// Delete all data
  Future<void> deleteAll() async {
    await _storage.deleteAll();
  }

  /// Check if key exists
  Future<bool> containsKey(String key) async {
    final value = await read(key);
    return value != null;
  }

  /// Get all keys
  Future<Map<String, String>> readAll() async {
    return await _storage.readAll();
  }
}
