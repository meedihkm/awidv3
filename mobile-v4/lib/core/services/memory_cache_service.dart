import 'dart:collection';

/// Service de cache en mémoire avec LRU
class MemoryCacheService {
  static final MemoryCacheService _instance = MemoryCacheService._internal();
  factory MemoryCacheService() => _instance;
  MemoryCacheService._internal();

  final Map<String, _CacheEntry> _cache = {};
  final LinkedHashMap<String, DateTime> _accessOrder = LinkedHashMap();
  
  int _maxSize = 100;
  Duration _defaultTTL = const Duration(minutes: 5);

  /// Configurer la taille maximale du cache
  void setMaxSize(int size) {
    _maxSize = size;
    _evictIfNeeded();
  }

  /// Configurer le TTL par défaut
  void setDefaultTTL(Duration ttl) {
    _defaultTTL = ttl;
  }

  /// Mettre en cache une valeur
  void put<T>(String key, T value, {Duration? ttl}) {
    final expiresAt = DateTime.now().add(ttl ?? _defaultTTL);
    _cache[key] = _CacheEntry(value, expiresAt);
    _accessOrder[key] = DateTime.now();
    _evictIfNeeded();
  }

  /// Récupérer une valeur du cache
  T? get<T>(String key) {
    final entry = _cache[key];
    if (entry == null) {
      return null;
    }

    // Vérifier l'expiration
    if (entry.isExpired) {
      _cache.remove(key);
      _accessOrder.remove(key);
      return null;
    }

    // Mettre à jour l'ordre d'accès
    _accessOrder.remove(key);
    _accessOrder[key] = DateTime.now();

    return entry.value as T?;
  }

  /// Vérifier si une clé existe et est valide
  bool has(String key) {
    final entry = _cache[key];
    if (entry == null) return false;
    
    if (entry.isExpired) {
      _cache.remove(key);
      _accessOrder.remove(key);
      return false;
    }
    
    return true;
  }

  /// Supprimer une entrée
  void remove(String key) {
    _cache.remove(key);
    _accessOrder.remove(key);
  }

  /// Vider le cache
  void clear() {
    _cache.clear();
    _accessOrder.clear();
  }

  /// Nettoyer les entrées expirées
  void cleanExpired() {
    final expiredKeys = <String>[];
    
    for (final entry in _cache.entries) {
      if (entry.value.isExpired) {
        expiredKeys.add(entry.key);
      }
    }

    for (final key in expiredKeys) {
      _cache.remove(key);
      _accessOrder.remove(key);
    }
  }

  /// Évincer les entrées si nécessaire (LRU)
  void _evictIfNeeded() {
    while (_cache.length > _maxSize) {
      // Supprimer l'entrée la moins récemment utilisée
      final oldestKey = _accessOrder.keys.first;
      _cache.remove(oldestKey);
      _accessOrder.remove(oldestKey);
    }
  }

  /// Obtenir les statistiques du cache
  CacheStats getStats() {
    cleanExpired();
    return CacheStats(
      size: _cache.length,
      maxSize: _maxSize,
      hitRate: 0.0, // À implémenter avec compteurs
    );
  }

  /// Obtenir toutes les clés
  List<String> getKeys() {
    return _cache.keys.toList();
  }
}

/// Entrée de cache
class _CacheEntry {
  final dynamic value;
  final DateTime expiresAt;

  _CacheEntry(this.value, this.expiresAt);

  bool get isExpired => DateTime.now().isAfter(expiresAt);
}

/// Statistiques du cache
class CacheStats {
  final int size;
  final int maxSize;
  final double hitRate;

  CacheStats({
    required this.size,
    required this.maxSize,
    required this.hitRate,
  });

  double get usagePercentage => (size / maxSize) * 100;
}
