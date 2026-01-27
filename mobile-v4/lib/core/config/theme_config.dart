import 'package:flutter/material.dart';

/// Theme Configuration
/// Design System complet pour l'application
class ThemeConfig {
  ThemeConfig._();

  // Colors
  static const Color primaryColor = Color(0xFF2196F3);
  static const Color primaryDark = Color(0xFF1976D2);
  static const Color primaryLight = Color(0xFF64B5F6);

  static const Color accentColor = Color(0xFFFF9800);

  static const Color successColor = Color(0xFF4CAF50);
  static const Color warningColor = Color(0xFFFFC107);
  static const Color errorColor = Color(0xFFF44336);
  static const Color infoColor = Color(0xFF2196F3);

  static const Color backgroundColor = Color(0xFFF5F5F5);
  static const Color surfaceColor = Color(0xFFFFFFFF);
  static const Color textPrimaryColor = Color(0xFF212121);
  static const Color textSecondaryColor = Color(0xFF757575);
  static const Color dividerColor = Color(0xFFE0E0E0);

  // Light Theme
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: backgroundColor,

      colorScheme: const ColorScheme.light(
        primary: primaryColor,
        secondary: accentColor,
        error: errorColor,
        background: backgroundColor,
        surface: surfaceColor,
      ),

      appBarTheme: const AppBarTheme(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),

      cardTheme: CardTheme(
        color: surfaceColor,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surfaceColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: dividerColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: dividerColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: primaryColor, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: errorColor),
        ),
      ),

      textTheme: const TextTheme(
        displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: textPrimaryColor),
        displayMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: textPrimaryColor),
        displaySmall: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: textPrimaryColor),
        headlineMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: textPrimaryColor),
        bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: textPrimaryColor),
        bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: textPrimaryColor),
        bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: textSecondaryColor),
        labelLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
      ),
    );
  }

  // Dark Theme
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: const Color(0xFF121212),

      colorScheme: const ColorScheme.dark(
        primary: primaryColor,
        secondary: accentColor,
        error: errorColor,
        background: Color(0xFF121212),
        surface: Color(0xFF1E1E1E),
      ),

      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF1E1E1E),
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),

      cardTheme: CardTheme(
        color: const Color(0xFF1E1E1E),
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
