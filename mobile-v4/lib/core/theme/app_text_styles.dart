import 'package:flutter/material.dart';
import 'package:awid_mobile/core/theme/app_colors.dart';

/// Styles de texte de l'application
class AppTextStyles {
  AppTextStyles._();

  // Font family
  static const String fontFamily = 'Roboto';

  // Headings
  static const TextStyle h1 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    height: 1.2,
  );

  static const TextStyle h2 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    height: 1.2,
  );

  static const TextStyle h3 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    height: 1.3,
  );

  static const TextStyle h4 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.3,
  );

  static const TextStyle h5 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.4,
  );

  static const TextStyle h6 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.4,
  );

  // Body text
  static const TextStyle bodyLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
    height: 1.5,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
    height: 1.5,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
    height: 1.5,
  );

  // Labels
  static const TextStyle labelLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    height: 1.4,
  );

  static const TextStyle labelMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    height: 1.4,
  );

  static const TextStyle labelSmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
    height: 1.4,
  );

  // Buttons
  static const TextStyle button = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.textWhite,
    height: 1.2,
    letterSpacing: 0.5,
  );

  static const TextStyle buttonLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textWhite,
    height: 1.2,
    letterSpacing: 0.5,
  );

  static const TextStyle buttonSmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColors.textWhite,
    height: 1.2,
    letterSpacing: 0.5,
  );

  // Caption
  static const TextStyle caption = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
    height: 1.3,
  );

  static const TextStyle captionBold = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColors.textSecondary,
    height: 1.3,
  );

  // Overline
  static const TextStyle overline = TextStyle(
    fontFamily: fontFamily,
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
    height: 1.2,
    letterSpacing: 1.5,
  );

  // Spécifiques
  static const TextStyle price = TextStyle(
    fontFamily: fontFamily,
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
    height: 1.2,
  );

  static const TextStyle priceLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
    height: 1.2,
  );

  static const TextStyle priceSmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
    height: 1.2,
  );

  static const TextStyle badge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 10,
    fontWeight: FontWeight.bold,
    color: AppColors.textWhite,
    height: 1.2,
  );

  static const TextStyle chip = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    height: 1.2,
  );

  static const TextStyle link = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.primary,
    height: 1.5,
    decoration: TextDecoration.underline,
  );

  static const TextStyle error = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.error,
    height: 1.3,
  );

  static const TextStyle success = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.success,
    height: 1.3,
  );

  static const TextStyle warning = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.warning,
    height: 1.3,
  );

  // Input
  static const TextStyle input = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
    height: 1.5,
  );

  static const TextStyle inputLabel = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
    height: 1.4,
  );

  static const TextStyle inputHint = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.textHint,
    height: 1.5,
  );

  // Helpers pour créer des variations
  static TextStyle withColor(TextStyle style, Color color) {
    return style.copyWith(color: color);
  }

  static TextStyle withSize(TextStyle style, double size) {
    return style.copyWith(fontSize: size);
  }

  static TextStyle withWeight(TextStyle style, FontWeight weight) {
    return style.copyWith(fontWeight: weight);
  }

  static TextStyle bold(TextStyle style) {
    return style.copyWith(fontWeight: FontWeight.bold);
  }

  static TextStyle semiBold(TextStyle style) {
    return style.copyWith(fontWeight: FontWeight.w600);
  }

  static TextStyle medium(TextStyle style) {
    return style.copyWith(fontWeight: FontWeight.w500);
  }

  static TextStyle italic(TextStyle style) {
    return style.copyWith(fontStyle: FontStyle.italic);
  }

  static TextStyle underline(TextStyle style) {
    return style.copyWith(decoration: TextDecoration.underline);
  }

  static TextStyle lineThrough(TextStyle style) {
    return style.copyWith(decoration: TextDecoration.lineThrough);
  }

  static TextStyle withOpacity(TextStyle style, double opacity) {
    return style.copyWith(color: style.color?.withOpacity(opacity));
  }

  // Helpers pour les statuts
  static TextStyle statusText(String status) {
    final color = AppColors.getOrderStatusColor(status);
    return bodyMedium.copyWith(
      color: color,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle priorityText(String priority) {
    final color = AppColors.getPriorityColor(priority);
    return labelMedium.copyWith(
      color: color,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle roleText(String role) {
    final color = AppColors.getRoleColor(role);
    return labelMedium.copyWith(
      color: color,
      fontWeight: FontWeight.w600,
    );
  }
}

/// Extension pour faciliter l'utilisation
extension TextStyleExtension on TextStyle {
  TextStyle get bold => AppTextStyles.bold(this);
  TextStyle get semiBold => AppTextStyles.semiBold(this);
  TextStyle get medium => AppTextStyles.medium(this);
  TextStyle get italic => AppTextStyles.italic(this);
  TextStyle get underline => AppTextStyles.underline(this);
  TextStyle get lineThrough => AppTextStyles.lineThrough(this);

  TextStyle withColor(Color color) => AppTextStyles.withColor(this, color);
  TextStyle withSize(double size) => AppTextStyles.withSize(this, size);
  TextStyle withWeight(FontWeight weight) => AppTextStyles.withWeight(this, weight);
  TextStyle withOpacity(double opacity) => AppTextStyles.withOpacity(this, opacity);
}
