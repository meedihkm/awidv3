import 'package:flutter/services.dart';

/// Service pour le feedback haptique
class HapticService {
  static final HapticService _instance = HapticService._internal();
  factory HapticService() => _instance;
  HapticService._internal();

  /// Vibration légère pour les taps
  static Future<void> lightTap() async {
    await HapticFeedback.lightImpact();
  }

  /// Vibration moyenne pour les actions importantes
  static Future<void> mediumTap() async {
    await HapticFeedback.mediumImpact();
  }

  /// Vibration forte pour les confirmations
  static Future<void> heavyTap() async {
    await HapticFeedback.heavyImpact();
  }

  /// Vibration de sélection
  static Future<void> selection() async {
    await HapticFeedback.selectionClick();
  }

  /// Vibration de succès
  static Future<void> success() async {
    await HapticFeedback.mediumImpact();
  }

  /// Vibration d'erreur
  static Future<void> error() async {
    await HapticFeedback.heavyImpact();
  }

  /// Vibration de notification
  static Future<void> notification() async {
    await HapticFeedback.lightImpact();
  }
}
