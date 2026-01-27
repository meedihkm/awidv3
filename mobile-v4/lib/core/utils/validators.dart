import '../constants/app_constants.dart';

/// Validators
/// Validateurs pour les formulaires
class Validators {
  Validators._();

  /// Email validator
  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email requis';
    }

    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

    if (!emailRegex.hasMatch(value)) {
      return 'Email invalide';
    }

    return null;
  }

  /// Password validator
  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'Mot de passe requis';
    }

    if (value.length < AppConstants.minPasswordLength) {
      return 'Minimum ${AppConstants.minPasswordLength} caractères';
    }

    if (value.length > AppConstants.maxPasswordLength) {
      return 'Maximum ${AppConstants.maxPasswordLength} caractères';
    }

    return null;
  }

  /// Phone validator
  static String? phone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Téléphone requis';
    }

    final phoneRegex = RegExp(r'^[0-9]{10,15}$');

    if (!phoneRegex.hasMatch(value.replaceAll(RegExp(r'[\s\-\(\)]'), ''))) {
      return 'Téléphone invalide';
    }

    return null;
  }

  /// Required validator
  static String? required(String? value, [String fieldName = 'Ce champ']) {
    if (value == null || value.isEmpty) {
      return '$fieldName est requis';
    }
    return null;
  }

  /// Min length validator
  static String? minLength(String? value, int min) {
    if (value == null || value.isEmpty) {
      return 'Ce champ est requis';
    }

    if (value.length < min) {
      return 'Minimum $min caractères';
    }

    return null;
  }

  /// Max length validator
  static String? maxLength(String? value, int max) {
    if (value != null && value.length > max) {
      return 'Maximum $max caractères';
    }
    return null;
  }

  /// Number validator
  static String? number(String? value) {
    if (value == null || value.isEmpty) {
      return 'Ce champ est requis';
    }

    if (double.tryParse(value) == null) {
      return 'Nombre invalide';
    }

    return null;
  }

  /// Positive number validator
  static String? positiveNumber(String? value) {
    final numberError = number(value);
    if (numberError != null) return numberError;

    if (double.parse(value!) <= 0) {
      return 'Le nombre doit être positif';
    }

    return null;
  }
}
