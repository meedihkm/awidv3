import 'package:flutter/material.dart';

/// Couleurs de l'application
class AppColors {
  AppColors._();

  // Couleurs primaires
  static const Color primary = Color(0xFF2196F3); // Bleu
  static const Color primaryDark = Color(0xFF1976D2);
  static const Color primaryLight = Color(0xFF64B5F6);
  
  static const Color secondary = Color(0xFFFF9800); // Orange
  static const Color secondaryDark = Color(0xFFF57C00);
  static const Color secondaryLight = Color(0xFFFFB74D);

  static const Color accent = Color(0xFF4CAF50); // Vert
  static const Color accentDark = Color(0xFF388E3C);
  static const Color accentLight = Color(0xFF81C784);

  // Couleurs de statut
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFF9800);
  static const Color error = Color(0xFFF44336);
  static const Color info = Color(0xFF2196F3);

  // Couleurs de texte
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textHint = Color(0xFF9E9E9E);
  static const Color textDisabled = Color(0xFFBDBDBD);
  static const Color textWhite = Color(0xFFFFFFFF);

  // Couleurs de fond
  static const Color background = Color(0xFFFAFAFA);
  static const Color backgroundDark = Color(0xFFEEEEEE);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceDark = Color(0xFFF5F5F5);

  // Couleurs de bordure
  static const Color border = Color(0xFFE0E0E0);
  static const Color borderDark = Color(0xFFBDBDBD);
  static const Color divider = Color(0xFFEEEEEE);

  // Couleurs spécifiques aux rôles
  static const Color admin = Color(0xFF9C27B0); // Violet
  static const Color kitchen = Color(0xFFFF5722); // Rouge-orange
  static const Color deliverer = Color(0xFF2196F3); // Bleu
  static const Color customer = Color(0xFF4CAF50); // Vert

  // Couleurs de statut de commande
  static const Color orderPending = Color(0xFFFF9800); // Orange
  static const Color orderConfirmed = Color(0xFF2196F3); // Bleu
  static const Color orderPreparing = Color(0xFFFF5722); // Rouge-orange
  static const Color orderReady = Color(0xFF9C27B0); // Violet
  static const Color orderInDelivery = Color(0xFF00BCD4); // Cyan
  static const Color orderDelivered = Color(0xFF4CAF50); // Vert
  static const Color orderCancelled = Color(0xFF9E9E9E); // Gris

  // Couleurs de priorité
  static const Color priorityLow = Color(0xFF4CAF50); // Vert
  static const Color priorityMedium = Color(0xFFFF9800); // Orange
  static const Color priorityHigh = Color(0xFFF44336); // Rouge
  static const Color priorityUrgent = Color(0xFF9C27B0); // Violet

  // Couleurs de paiement
  static const Color paymentPaid = Color(0xFF4CAF50); // Vert
  static const Color paymentPending = Color(0xFFFF9800); // Orange
  static const Color paymentOverdue = Color(0xFFF44336); // Rouge
  static const Color paymentPartial = Color(0xFF2196F3); // Bleu

  // Couleurs de stock
  static const Color stockHigh = Color(0xFF4CAF50); // Vert
  static const Color stockMedium = Color(0xFFFF9800); // Orange
  static const Color stockLow = Color(0xFFF44336); // Rouge
  static const Color stockOut = Color(0xFF9E9E9E); // Gris

  // Couleurs d'overlay
  static const Color overlay = Color(0x80000000); // Noir 50%
  static const Color overlayLight = Color(0x40000000); // Noir 25%
  static const Color overlayDark = Color(0xB3000000); // Noir 70%

  // Couleurs de gradient
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, primaryDark],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient secondaryGradient = LinearGradient(
    colors: [secondary, secondaryDark],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient successGradient = LinearGradient(
    colors: [accent, accentDark],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Couleurs de shadow
  static const Color shadowLight = Color(0x1A000000); // Noir 10%
  static const Color shadowMedium = Color(0x33000000); // Noir 20%
  static const Color shadowDark = Color(0x4D000000); // Noir 30%

  // Helpers pour obtenir la couleur selon le statut
  static Color getOrderStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return orderPending;
      case 'confirmed':
        return orderConfirmed;
      case 'preparing':
        return orderPreparing;
      case 'ready':
        return orderReady;
      case 'in_delivery':
      case 'delivering':
        return orderInDelivery;
      case 'delivered':
        return orderDelivered;
      case 'cancelled':
        return orderCancelled;
      default:
        return textSecondary;
    }
  }

  static Color getPriorityColor(String priority) {
    switch (priority.toLowerCase()) {
      case 'low':
        return priorityLow;
      case 'medium':
        return priorityMedium;
      case 'high':
        return priorityHigh;
      case 'urgent':
        return priorityUrgent;
      default:
        return textSecondary;
    }
  }

  static Color getPaymentStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'paid':
        return paymentPaid;
      case 'pending':
        return paymentPending;
      case 'overdue':
        return paymentOverdue;
      case 'partial':
        return paymentPartial;
      default:
        return textSecondary;
    }
  }

  static Color getStockLevelColor(double percentage) {
    if (percentage >= 50) {
      return stockHigh;
    } else if (percentage >= 20) {
      return stockMedium;
    } else if (percentage > 0) {
      return stockLow;
    } else {
      return stockOut;
    }
  }

  static Color getRoleColor(String role) {
    switch (role.toLowerCase()) {
      case 'admin':
        return admin;
      case 'kitchen':
        return kitchen;
      case 'deliverer':
        return deliverer;
      case 'customer':
        return customer;
      default:
        return textSecondary;
    }
  }

  // Helpers pour les variations de couleur
  static Color lighten(Color color, [double amount = 0.1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(color);
    final lightness = (hsl.lightness + amount).clamp(0.0, 1.0);
    return hsl.withLightness(lightness).toColor();
  }

  static Color darken(Color color, [double amount = 0.1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(color);
    final lightness = (hsl.lightness - amount).clamp(0.0, 1.0);
    return hsl.withLightness(lightness).toColor();
  }

  static Color withOpacity(Color color, double opacity) {
    assert(opacity >= 0 && opacity <= 1);
    return color.withOpacity(opacity);
  }
}
