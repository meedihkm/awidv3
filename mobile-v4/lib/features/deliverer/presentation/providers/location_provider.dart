import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

import '../../domain/usecases/update_location_usecase.dart';
import 'deliverer_provider.dart';

// Use Case Provider
final updateLocationUseCaseProvider = Provider<UpdateLocationUseCase>((ref) {
  return UpdateLocationUseCase(ref.watch(delivererRepositoryProvider));
});

// Location State
class LocationState {
  LocationState({
    this.position,
    this.isTracking = false,
    this.error,
  });
  final Position? position;
  final bool isTracking;
  final String? error;

  LocationState copyWith({
    Position? position,
    bool? isTracking,
    String? error,
  }) {
    return LocationState(
      position: position ?? this.position,
      isTracking: isTracking ?? this.isTracking,
      error: error,
    );
  }
}

// Location Notifier
class LocationNotifier extends StateNotifier<LocationState> {
  LocationNotifier(this._updateLocationUseCase) : super(LocationState());

  final UpdateLocationUseCase _updateLocationUseCase;
  StreamSubscription<Position>? _positionStreamSubscription;
  Timer? _updateTimer;

  /// Check and request location permissions
  Future<bool> checkPermissions() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      state = state.copyWith(
        error: 'Les services de localisation sont désactivés',
      );
      return false;
    }

    // Check permissions
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        state = state.copyWith(
          error: 'Permission de localisation refusée',
        );
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      state = state.copyWith(
        error: 'Permission de localisation refusée définitivement',
      );
      return false;
    }

    return true;
  }

  /// Get current position
  Future<Position?> getCurrentPosition() async {
    try {
      final hasPermission = await checkPermissions();
      if (!hasPermission) return null;

      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      state = state.copyWith(position: position);
      return position;
    } catch (e) {
      state = state.copyWith(error: e.toString());
      return null;
    }
  }

  /// Start tracking location
  Future<void> startTracking() async {
    try {
      final hasPermission = await checkPermissions();
      if (!hasPermission) return;

      state = state.copyWith(isTracking: true);

      // Listen to position stream
      _positionStreamSubscription = Geolocator.getPositionStream(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          distanceFilter: 10, // Update every 10 meters
        ),
      ).listen(
        (Position position) {
          state = state.copyWith(position: position);
        },
        onError: (error) {
          state = state.copyWith(error: error.toString());
        },
      );

      // Update server every 30 seconds
      _updateTimer = Timer.periodic(
        const Duration(seconds: 30),
        (_) => _updateServerLocation(),
      );
    } catch (e) {
      state = state.copyWith(isTracking: false, error: e.toString());
    }
  }

  /// Stop tracking location
  void stopTracking() {
    _positionStreamSubscription?.cancel();
    _positionStreamSubscription = null;
    _updateTimer?.cancel();
    _updateTimer = null;
    state = state.copyWith(isTracking: false);
  }

  /// Update server with current location
  Future<void> _updateServerLocation() async {
    final position = state.position;
    if (position == null) return;

    try {
      await _updateLocationUseCase.call(
        latitude: position.latitude,
        longitude: position.longitude,
      );
    } catch (e) {
      // Silent fail - don't stop tracking
    }
  }

  @override
  void dispose() {
    stopTracking();
    super.dispose();
  }
}

// Location Provider
final locationProvider = StateNotifierProvider<LocationNotifier, LocationState>((ref) {
  return LocationNotifier(ref.watch(updateLocationUseCaseProvider));
});
