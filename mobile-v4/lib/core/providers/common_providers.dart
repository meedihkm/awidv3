import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../network/dio_client.dart';
import '../storage/local_storage.dart';

/// Provider pour DioClient
/// Fournit une instance unique de DioClient pour les requêtes HTTP
final dioClientProvider = Provider<DioClient>((ref) {
  return DioClient();
});

/// Provider pour LocalStorage
/// Fournit une instance unique de LocalStorage pour le stockage local
final localStorageProvider = Provider<LocalStorage>((ref) {
  return LocalStorage();
});
