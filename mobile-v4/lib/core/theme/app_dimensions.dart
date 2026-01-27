import 'package:flutter/material.dart';

/// Dimensions et espacements de l'application
class AppDimensions {
  AppDimensions._();

  // Espacements
  static const double spacingXs = 4.0;
  static const double spacingSm = 8.0;
  static const double spacingMd = 16.0;
  static const double spacingLg = 24.0;
  static const double spacingXl = 32.0;
  static const double spacingXxl = 48.0;

  // Padding
  static const EdgeInsets paddingXs = EdgeInsets.all(spacingXs);
  static const EdgeInsets paddingSm = EdgeInsets.all(spacingSm);
  static const EdgeInsets paddingMd = EdgeInsets.all(spacingMd);
  static const EdgeInsets paddingLg = EdgeInsets.all(spacingLg);
  static const EdgeInsets paddingXl = EdgeInsets.all(spacingXl);

  // Padding horizontal
  static const EdgeInsets paddingHorizontalXs = EdgeInsets.symmetric(horizontal: spacingXs);
  static const EdgeInsets paddingHorizontalSm = EdgeInsets.symmetric(horizontal: spacingSm);
  static const EdgeInsets paddingHorizontalMd = EdgeInsets.symmetric(horizontal: spacingMd);
  static const EdgeInsets paddingHorizontalLg = EdgeInsets.symmetric(horizontal: spacingLg);
  static const EdgeInsets paddingHorizontalXl = EdgeInsets.symmetric(horizontal: spacingXl);

  // Padding vertical
  static const EdgeInsets paddingVerticalXs = EdgeInsets.symmetric(vertical: spacingXs);
  static const EdgeInsets paddingVerticalSm = EdgeInsets.symmetric(vertical: spacingSm);
  static const EdgeInsets paddingVerticalMd = EdgeInsets.symmetric(vertical: spacingMd);
  static const EdgeInsets paddingVerticalLg = EdgeInsets.symmetric(vertical: spacingLg);
  static const EdgeInsets paddingVerticalXl = EdgeInsets.symmetric(vertical: spacingXl);

  // Padding de page
  static const EdgeInsets pagePadding = EdgeInsets.all(spacingMd);
  static const EdgeInsets pageHorizontalPadding = EdgeInsets.symmetric(horizontal: spacingMd);
  static const EdgeInsets pageVerticalPadding = EdgeInsets.symmetric(vertical: spacingMd);

  // Border radius
  static const double radiusXs = 4.0;
  static const double radiusSm = 8.0;
  static const double radiusMd = 12.0;
  static const double radiusLg = 16.0;
  static const double radiusXl = 24.0;
  static const double radiusRound = 999.0;

  static const BorderRadius borderRadiusXs = BorderRadius.all(Radius.circular(radiusXs));
  static const BorderRadius borderRadiusSm = BorderRadius.all(Radius.circular(radiusSm));
  static const BorderRadius borderRadiusMd = BorderRadius.all(Radius.circular(radiusMd));
  static const BorderRadius borderRadiusLg = BorderRadius.all(Radius.circular(radiusLg));
  static const BorderRadius borderRadiusXl = BorderRadius.all(Radius.circular(radiusXl));
  static const BorderRadius borderRadiusRound = BorderRadius.all(Radius.circular(radiusRound));

  // Border radius top
  static const BorderRadius borderRadiusTopSm = BorderRadius.only(
    topLeft: Radius.circular(radiusSm),
    topRight: Radius.circular(radiusSm),
  );
  static const BorderRadius borderRadiusTopMd = BorderRadius.only(
    topLeft: Radius.circular(radiusMd),
    topRight: Radius.circular(radiusMd),
  );
  static const BorderRadius borderRadiusTopLg = BorderRadius.only(
    topLeft: Radius.circular(radiusLg),
    topRight: Radius.circular(radiusLg),
  );

  // Border radius bottom
  static const BorderRadius borderRadiusBottomSm = BorderRadius.only(
    bottomLeft: Radius.circular(radiusSm),
    bottomRight: Radius.circular(radiusSm),
  );
  static const BorderRadius borderRadiusBottomMd = BorderRadius.only(
    bottomLeft: Radius.circular(radiusMd),
    bottomRight: Radius.circular(radiusMd),
  );
  static const BorderRadius borderRadiusBottomLg = BorderRadius.only(
    bottomLeft: Radius.circular(radiusLg),
    bottomRight: Radius.circular(radiusLg),
  );

  // Elevation (shadow)
  static const double elevationNone = 0.0;
  static const double elevationXs = 1.0;
  static const double elevationSm = 2.0;
  static const double elevationMd = 4.0;
  static const double elevationLg = 8.0;
  static const double elevationXl = 16.0;

  // Border width
  static const double borderWidthThin = 1.0;
  static const double borderWidthMedium = 2.0;
  static const double borderWidthThick = 3.0;

  // Icon sizes
  static const double iconXs = 16.0;
  static const double iconSm = 20.0;
  static const double iconMd = 24.0;
  static const double iconLg = 32.0;
  static const double iconXl = 48.0;
  static const double iconXxl = 64.0;

  // Button heights
  static const double buttonHeightSm = 32.0;
  static const double buttonHeightMd = 44.0;
  static const double buttonHeightLg = 56.0;

  // Button padding
  static const EdgeInsets buttonPaddingSm = EdgeInsets.symmetric(
    horizontal: spacingMd,
    vertical: spacingSm,
  );
  static const EdgeInsets buttonPaddingMd = EdgeInsets.symmetric(
    horizontal: spacingLg,
    vertical: spacingMd,
  );
  static const EdgeInsets buttonPaddingLg = EdgeInsets.symmetric(
    horizontal: spacingXl,
    vertical: spacingLg,
  );

  // Input heights
  static const double inputHeightSm = 40.0;
  static const double inputHeightMd = 48.0;
  static const double inputHeightLg = 56.0;

  // Card dimensions
  static const double cardElevation = elevationSm;
  static const BorderRadius cardBorderRadius = borderRadiusMd;
  static const EdgeInsets cardPadding = paddingMd;
  static const EdgeInsets cardMargin = EdgeInsets.symmetric(
    horizontal: spacingMd,
    vertical: spacingSm,
  );

  // List item dimensions
  static const double listItemHeight = 72.0;
  static const double listItemHeightCompact = 56.0;
  static const EdgeInsets listItemPadding = EdgeInsets.symmetric(
    horizontal: spacingMd,
    vertical: spacingSm,
  );

  // Avatar sizes
  static const double avatarXs = 24.0;
  static const double avatarSm = 32.0;
  static const double avatarMd = 48.0;
  static const double avatarLg = 64.0;
  static const double avatarXl = 96.0;

  // Badge sizes
  static const double badgeSm = 16.0;
  static const double badgeMd = 20.0;
  static const double badgeLg = 24.0;

  // Divider
  static const double dividerThickness = 1.0;
  static const double dividerIndent = spacingMd;

  // AppBar
  static const double appBarHeight = 56.0;
  static const double appBarElevation = elevationSm;

  // Bottom navigation
  static const double bottomNavHeight = 56.0;
  static const double bottomNavElevation = elevationMd;

  // Drawer
  static const double drawerWidth = 280.0;

  // Dialog
  static const double dialogMaxWidth = 400.0;
  static const EdgeInsets dialogPadding = paddingLg;
  static const BorderRadius dialogBorderRadius = borderRadiusLg;

  // Bottom sheet
  static const BorderRadius bottomSheetBorderRadius = BorderRadius.only(
    topLeft: Radius.circular(radiusLg),
    topRight: Radius.circular(radiusLg),
  );
  static const EdgeInsets bottomSheetPadding = paddingLg;

  // Snackbar
  static const double snackbarElevation = elevationMd;
  static const BorderRadius snackbarBorderRadius = borderRadiusSm;
  static const EdgeInsets snackbarPadding = EdgeInsets.symmetric(
    horizontal: spacingMd,
    vertical: spacingSm,
  );
  static const EdgeInsets snackbarMargin = EdgeInsets.all(spacingSm);

  // Chip
  static const double chipHeight = 32.0;
  static const EdgeInsets chipPadding = EdgeInsets.symmetric(
    horizontal: spacingMd,
    vertical: spacingXs,
  );
  static const BorderRadius chipBorderRadius = borderRadiusRound;

  // Progress indicator
  static const double progressIndicatorSm = 16.0;
  static const double progressIndicatorMd = 24.0;
  static const double progressIndicatorLg = 48.0;
  static const double progressIndicatorStrokeWidth = 3.0;

  // Image dimensions
  static const double imageThumbnailSm = 48.0;
  static const double imageThumbnailMd = 80.0;
  static const double imageThumbnailLg = 120.0;
  static const double imagePreviewHeight = 200.0;

  // Spacing helpers
  static SizedBox get verticalSpaceXs => const SizedBox(height: spacingXs);
  static SizedBox get verticalSpaceSm => const SizedBox(height: spacingSm);
  static SizedBox get verticalSpaceMd => const SizedBox(height: spacingMd);
  static SizedBox get verticalSpaceLg => const SizedBox(height: spacingLg);
  static SizedBox get verticalSpaceXl => const SizedBox(height: spacingXl);
  static SizedBox get verticalSpaceXxl => const SizedBox(height: spacingXxl);

  static SizedBox get horizontalSpaceXs => const SizedBox(width: spacingXs);
  static SizedBox get horizontalSpaceSm => const SizedBox(width: spacingSm);
  static SizedBox get horizontalSpaceMd => const SizedBox(width: spacingMd);
  static SizedBox get horizontalSpaceLg => const SizedBox(width: spacingLg);
  static SizedBox get horizontalSpaceXl => const SizedBox(width: spacingXl);
  static SizedBox get horizontalSpaceXxl => const SizedBox(width: spacingXxl);

  // Divider helpers
  static Divider get divider => const Divider(
        thickness: dividerThickness,
        height: dividerThickness,
      );

  static Divider get dividerWithIndent => const Divider(
        thickness: dividerThickness,
        height: dividerThickness,
        indent: dividerIndent,
        endIndent: dividerIndent,
      );

  static VerticalDivider get verticalDivider => const VerticalDivider(
        thickness: dividerThickness,
        width: dividerThickness,
      );

  // Responsive helpers
  static double responsiveValue(
    BuildContext context, {
    required double mobile,
    double? tablet,
    double? desktop,
  }) {
    final width = MediaQuery.of(context).size.width;
    if (width >= 1200 && desktop != null) {
      return desktop;
    } else if (width >= 600 && tablet != null) {
      return tablet;
    }
    return mobile;
  }

  static EdgeInsets responsivePadding(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width >= 1200) {
      return paddingXl;
    } else if (width >= 600) {
      return paddingLg;
    }
    return paddingMd;
  }
}
