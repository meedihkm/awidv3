import 'dart:convert';

import '../config/app_config.dart';
import '../constants/storage_keys.dart';
import 'local_storage.dart';

/// Cache Manager
/// Gère le cache des données avec expiration
class CacheManager {
  factory CacheManager() => _instance;
  CacheManager._internal();
  static final CacheManager _instance = CacheManager._internal();

  final LocalStorage _localStorage = LocalStorage();

  /// Save data to cache
  Future<void> save(String key, dynamic data) async {
    final cacheData = {'data': data, 'timestamp': DateTime.now().toIso8601String()};

    await _localStorage.write(StorageKeys.cacheBox, key, jsonEncode(cacheData));
  }

  /// Get data from cache
  Future<T?> get<T>(String key) async {
    final cachedString = await _localStorage.read<String>(StorageKeys.cacheBox, key);

    if (cachedString == null) {
      return null;
    }

    try {
      final cacheData = jsonDecode(cachedString) as Map<String, dynamic>;
      final timestamp = DateTime.parse(cacheData['timestamp'] as String);

      // Check if cache is expired
      if (DateTime.now().difference(timestamp) > AppConfig.cacheMaxAge) {
        await delete(key);
        return null;
      }

      return cacheData['data'] as T;
    } catch (e) {
      await delete(key);
      return null;
    }
  }

  /// Delete cache entry
  Future<void> delete(String key) async {
    await _localStorage.delete(StorageKeys.cacheBox, key);
  }

  /// Clear all cache
  Future<void> clearAll() async {
    await _localStorage.clear(StorageKeys.cacheBox);
  }

  /// Check if cache exists and is valid
  Future<bool> isValid(String key) async {
    final data = await get(key);
    return data != null;
  }

  /// Get cache age
  Future<Duration?> getAge(String key) async {
    final cachedString = await _localStorage.read<String>(StorageKeys.cacheBox, key);

    if (cachedString == null) {
      return null;
    }

    try {
      final cacheData = jsonDecode(cachedString) as Map<String, dynamic>;
      final timestamp = DateTime.parse(cacheData['timestamp'] as String);
      return DateTime.now().difference(timestamp);
    } catch (e) {
      return null;
    }
  }
}
