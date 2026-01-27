import 'package:hive_flutter/hive_flutter.dart';

/// Local Storage
/// Stockage local avec Hive pour les données non sensibles
class LocalStorage {
  static final LocalStorage _instance = LocalStorage._internal();
  factory LocalStorage() => _instance;
  LocalStorage._internal();

  /// Initialize Hive
  static Future<void> init() async {
    await Hive.initFlutter();
  }

  /// Open box
  Future<Box<T>> openBox<T>(String boxName) async {
    if (Hive.isBoxOpen(boxName)) {
      return Hive.box<T>(boxName);
    }
    return await Hive.openBox<T>(boxName);
  }

  /// Close box
  Future<void> closeBox(String boxName) async {
    if (Hive.isBoxOpen(boxName)) {
      await Hive.box(boxName).close();
    }
  }

  /// Write data
  Future<void> write<T>(String boxName, String key, T value) async {
    final box = await openBox<T>(boxName);
    await box.put(key, value);
  }

  /// Read data
  Future<T?> read<T>(String boxName, String key) async {
    final box = await openBox<T>(boxName);
    return box.get(key);
  }

  /// Delete data
  Future<void> delete(String boxName, String key) async {
    final box = await openBox(boxName);
    await box.delete(key);
  }

  /// Clear box
  Future<void> clear(String boxName) async {
    final box = await openBox(boxName);
    await box.clear();
  }

  /// Get all keys
  Future<List<String>> getKeys(String boxName) async {
    final box = await openBox(boxName);
    return box.keys.cast<String>().toList();
  }

  /// Get all values
  Future<List<T>> getValues<T>(String boxName) async {
    final box = await openBox<T>(boxName);
    return box.values.toList();
  }

  /// Check if key exists
  Future<bool> containsKey(String boxName, String key) async {
    final box = await openBox(boxName);
    return box.containsKey(key);
  }

  /// Get box length
  Future<int> length(String boxName) async {
    final box = await openBox(boxName);
    return box.length;
  }

  /// Write multiple
  Future<void> writeAll<T>(String boxName, Map<String, T> entries) async {
    final box = await openBox<T>(boxName);
    await box.putAll(entries);
  }

  /// Delete multiple
  Future<void> deleteAll(String boxName, List<String> keys) async {
    final box = await openBox(boxName);
    await box.deleteAll(keys);
  }

  /// Write a list of JSON objects
  /// Helper method for storing lists of serializable data
  Future<void> setList(String key, List<Map<String, dynamic>> data) async {
    const boxName = 'app_storage';
    await write(boxName, key, data);
  }

  /// Read a list of JSON objects
  /// Helper method for retrieving lists of serializable data
  Future<List<Map<String, dynamic>>?> getList(String key) async {
    const boxName = 'app_storage';
    final data = await read<List>(boxName, key);
    if (data == null) return null;
    return data.cast<Map<String, dynamic>>();
  }
}
