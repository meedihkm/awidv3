import '../repositories/deliverer_repository.dart';

/// Update Location Use Case
/// Met à jour la position du livreur
class UpdateLocationUseCase {
  const UpdateLocationUseCase(this._repository);

  final DelivererRepository _repository;

  Future<void> call({
    required double latitude,
    required double longitude,
  }) async {
    // Validation
    if (latitude < -90 || latitude > 90) {
      throw Exception('Latitude invalide');
    }

    if (longitude < -180 || longitude > 180) {
      throw Exception('Longitude invalide');
    }

    return _repository.updateLocation(
      latitude: latitude,
      longitude: longitude,
    );
  }
}
