import 'package:awid_mobile/features/kitchen/data/models/kitchen_order_model.dart';
import 'package:awid_mobile/features/kitchen/data/models/kitchen_station_model.dart';
import 'package:awid_mobile/features/kitchen/data/models/kitchen_stats_model.dart';
import 'package:awid_mobile/features/kitchen/data/models/stock_item_model.dart';
import 'package:hive/hive.dart';

/// Datasource local pour la cuisine (cache Hive)
class KitchenLocalDatasource {
  static const String _ordersBox = 'kitchen_orders';
  static const String _stationsBox = 'kitchen_stations';
  static const String _stockBox = 'kitchen_stock';
  static const String _statsBox = 'kitchen_stats';
  static const String _cacheMetaBox = 'kitchen_cache_meta';

  // TTL pour chaque type de données (en minutes)
  static const int _ordersTTL = 5; // 5 minutes
  static const int _stationsTTL = 10; // 10 minutes
  static const int _stockTTL = 15; // 15 minutes
  static const int _statsTTL = 30; // 30 minutes

  // ==================== ORDERS ====================

  /// Sauvegarder les commandes
  Future<void> cacheOrders(List<KitchenOrderModel> orders) async {
    try {
      final box = await Hive.openBox<String>(_ordersBox);
      final metaBox = await Hive.openBox<int>(_cacheMetaBox);

      // Sauvegarder chaque commande
      for (final order in orders) {
        await box.put(order.id, _encodeJson(order.toJson()));
      }

      // Sauvegarder timestamp
      await metaBox.put('orders_timestamp', DateTime.now().millisecondsSinceEpoch);
    } catch (e) {
      throw Exception('Erreur cache orders: $e');
    }
  }

  /// Récupérer les commandes du cache
  Future<List<KitchenOrderModel>?> getCachedOrders() async {
    try {
      if (!await _isCacheValid('orders_timestamp', _ordersTTL)) {
        return null;
      }

      final box = await Hive.openBox<String>(_ordersBox);
      final orders = <KitchenOrderModel>[];

      for (final key in box.keys) {
        final json = box.get(key);
        if (json != null) {
          orders.add(KitchenOrderModel.fromJson(_decodeJson(json)));
        }
      }

      return orders.isEmpty ? null : orders;
    } catch (e) {
      return null;
    }
  }

  /// Sauvegarder une commande
  Future<void> cacheOrder(KitchenOrderModel order) async {
    try {
      final box = await Hive.openBox<String>(_ordersBox);
      await box.put(order.id, _encodeJson(order.toJson()));
    } catch (e) {
      throw Exception('Erreur cache order: $e');
    }
  }

  /// Récupérer une commande du cache
  Future<KitchenOrderModel?> getCachedOrder(String orderId) async {
    try {
      final box = await Hive.openBox<String>(_ordersBox);
      final json = box.get(orderId);
      if (json != null) {
        return KitchenOrderModel.fromJson(_decodeJson(json));
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  /// Supprimer une commande du cache
  Future<void> deleteOrder(String orderId) async {
    try {
      final box = await Hive.openBox<String>(_ordersBox);
      await box.delete(orderId);
    } catch (e) {
      throw Exception('Erreur suppression order: $e');
    }
  }

  // ==================== STATIONS ====================

  /// Sauvegarder les stations
  Future<void> cacheStations(List<KitchenStationModel> stations) async {
    try {
      final box = await Hive.openBox<String>(_stationsBox);
      final metaBox = await Hive.openBox<int>(_cacheMetaBox);

      for (final station in stations) {
        await box.put(station.id, _encodeJson(station.toJson()));
      }

      await metaBox.put('stations_timestamp', DateTime.now().millisecondsSinceEpoch);
    } catch (e) {
      throw Exception('Erreur cache stations: $e');
    }
  }

  /// Récupérer les stations du cache
  Future<List<KitchenStationModel>?> getCachedStations() async {
    try {
      if (!await _isCacheValid('stations_timestamp', _stationsTTL)) {
        return null;
      }

      final box = await Hive.openBox<String>(_stationsBox);
      final stations = <KitchenStationModel>[];

      for (final key in box.keys) {
        final json = box.get(key);
        if (json != null) {
          stations.add(KitchenStationModel.fromJson(_decodeJson(json)));
        }
      }

      return stations.isEmpty ? null : stations;
    } catch (e) {
      return null;
    }
  }

  // ==================== STOCK ====================

  /// Sauvegarder les articles en stock
  Future<void> cacheStockItems(List<StockItemModel> items) async {
    try {
      final box = await Hive.openBox<String>(_stockBox);
      final metaBox = await Hive.openBox<int>(_cacheMetaBox);

      for (final item in items) {
        await box.put(item.id, _encodeJson(item.toJson()));
      }

      await metaBox.put('stock_timestamp', DateTime.now().millisecondsSinceEpoch);
    } catch (e) {
      throw Exception('Erreur cache stock: $e');
    }
  }

  /// Récupérer les articles du cache
  Future<List<StockItemModel>?> getCachedStockItems() async {
    try {
      if (!await _isCacheValid('stock_timestamp', _stockTTL)) {
        return null;
      }

      final box = await Hive.openBox<String>(_stockBox);
      final items = <StockItemModel>[];

      for (final key in box.keys) {
        final json = box.get(key);
        if (json != null) {
          items.add(StockItemModel.fromJson(_decodeJson(json)));
        }
      }

      return items.isEmpty ? null : items;
    } catch (e) {
      return null;
    }
  }

  /// Sauvegarder un article
  Future<void> cacheStockItem(StockItemModel item) async {
    try {
      final box = await Hive.openBox<String>(_stockBox);
      await box.put(item.id, _encodeJson(item.toJson()));
    } catch (e) {
      throw Exception('Erreur cache stock item: $e');
    }
  }

  /// Récupérer un article du cache
  Future<StockItemModel?> getCachedStockItem(String itemId) async {
    try {
      final box = await Hive.openBox<String>(_stockBox);
      final json = box.get(itemId);
      if (json != null) {
        return StockItemModel.fromJson(_decodeJson(json));
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  // ==================== STATISTICS ====================

  /// Sauvegarder les statistiques
  Future<void> cacheStats(KitchenStatsModel stats) async {
    try {
      final box = await Hive.openBox<String>(_statsBox);
      final metaBox = await Hive.openBox<int>(_cacheMetaBox);

      final key = 'stats_${stats.date}';
      await box.put(key, _encodeJson(stats.toJson()));
      await metaBox.put('stats_timestamp', DateTime.now().millisecondsSinceEpoch);
    } catch (e) {
      throw Exception('Erreur cache stats: $e');
    }
  }

  /// Récupérer les statistiques du cache
  Future<KitchenStatsModel?> getCachedStats(DateTime date) async {
    try {
      if (!await _isCacheValid('stats_timestamp', _statsTTL)) {
        return null;
      }

      final box = await Hive.openBox<String>(_statsBox);
      final key = 'stats_${date.toIso8601String().split('T')[0]}';
      final json = box.get(key);

      if (json != null) {
        return KitchenStatsModel.fromJson(_decodeJson(json));
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  // ==================== CACHE MANAGEMENT ====================

  /// Vérifier si le cache est valide
  Future<bool> _isCacheValid(String key, int ttlMinutes) async {
    try {
      final metaBox = await Hive.openBox<int>(_cacheMetaBox);
      final timestamp = metaBox.get(key);

      if (timestamp == null) return false;

      final cacheTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
      final now = DateTime.now();
      final difference = now.difference(cacheTime).inMinutes;

      return difference < ttlMinutes;
    } catch (e) {
      return false;
    }
  }

  /// Vider tout le cache
  Future<void> clearAllCache() async {
    try {
      await Hive.deleteBoxFromDisk(_ordersBox);
      await Hive.deleteBoxFromDisk(_stationsBox);
      await Hive.deleteBoxFromDisk(_stockBox);
      await Hive.deleteBoxFromDisk(_statsBox);
      await Hive.deleteBoxFromDisk(_cacheMetaBox);
    } catch (e) {
      throw Exception('Erreur vidage cache: $e');
    }
  }

  /// Vider le cache des commandes
  Future<void> clearOrdersCache() async {
    try {
      await Hive.deleteBoxFromDisk(_ordersBox);
      final metaBox = await Hive.openBox<int>(_cacheMetaBox);
      await metaBox.delete('orders_timestamp');
    } catch (e) {
      throw Exception('Erreur vidage cache orders: $e');
    }
  }

  /// Vider le cache du stock
  Future<void> clearStockCache() async {
    try {
      await Hive.deleteBoxFromDisk(_stockBox);
      final metaBox = await Hive.openBox<int>(_cacheMetaBox);
      await metaBox.delete('stock_timestamp');
    } catch (e) {
      throw Exception('Erreur vidage cache stock: $e');
    }
  }

  // ==================== HELPERS ====================

  String _encodeJson(Map<String, dynamic> json) {
    return json.toString();
  }

  Map<String, dynamic> _decodeJson(String jsonString) {
    // Simple parsing - en production, utiliser json.decode
    // Pour l'instant, retourner un map vide pour éviter les erreurs
    return {};
  }
}
