import 'package:intl/intl.dart';

import '../constants/app_constants.dart';

/// Formatters
/// Utilitaires de formatage
class Formatters {
  Formatters._();

  /// Format currency (Algerian Dinar)
  static String currency(double amount) {
    final formatter = NumberFormat('#,##0.00', 'fr_DZ');
    return '${formatter.format(amount)} ${AppConstants.currencySymbol}';
  }

  /// Format date
  static String date(DateTime date) {
    return DateFormat(AppConstants.dateFormat).format(date);
  }

  /// Format time
  static String time(DateTime date) {
    return DateFormat(AppConstants.timeFormat).format(date);
  }

  /// Format date time
  static String dateTime(DateTime date) {
    return DateFormat(AppConstants.dateTimeFormat).format(date);
  }

  /// Format phone number
  static String phone(String phone) {
    // Remove all non-digit characters
    final digits = phone.replaceAll(RegExp(r'\D'), '');

    // Format as: 0XXX XX XX XX
    if (digits.length == 10) {
      return '${digits.substring(0, 4)} ${digits.substring(4, 6)} ${digits.substring(6, 8)} ${digits.substring(8)}';
    }

    return phone;
  }

  /// Format relative time (e.g., "il y a 2 heures")
  static String relativeTime(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inSeconds < 60) {
      return 'À l\'instant';
    } else if (difference.inMinutes < 60) {
      return 'Il y a ${difference.inMinutes} min';
    } else if (difference.inHours < 24) {
      return 'Il y a ${difference.inHours}h';
    } else if (difference.inDays < 7) {
      return 'Il y a ${difference.inDays}j';
    } else {
      return DateFormat('dd/MM/yyyy').format(date);
    }
  }

  /// Format file size
  static String fileSize(int bytes) {
    if (bytes < 1024) {
      return '$bytes B';
    } else if (bytes < 1024 * 1024) {
      return '${(bytes / 1024).toStringAsFixed(1)} KB';
    } else {
      return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
    }
  }

  /// Format percentage
  static String percentage(double value) {
    return '${(value * 100).toStringAsFixed(1)}%';
  }

  /// Capitalize first letter
  static String capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }

  /// Truncate text
  static String truncate(String text, int maxLength) {
    if (text.length <= maxLength) return text;
    return '${text.substring(0, maxLength)}...';
  }
}
