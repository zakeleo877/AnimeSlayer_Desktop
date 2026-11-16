import 'package:flutter/material.dart';

// مستخرج من res/values/colors.xml (15.7KB) + spec القسم 8
class AppColors {
  // Primary
  static const primaryLight = Color(0xFFFAFAFA); // colorPrimary
  static const primaryDarkLight = Color(0xFFE0E0E0); // colorPrimaryDark (light)
  
  // Dark themes
  static const darkBluePrimary = Color(0xFF252E39);
  static const darkBluePrimaryDark = Color(0xFF182128);
  static const darkGrayPrimary = Color(0xFF242529);
  static const darkGrayPrimaryDark = Color(0xFF202125);
  static const amoledPrimary = Color(0xFF000000);

  // Accent
  static const accent = Color(0xFFFF9800); // colorAccent - البرتقالي الشهير
  static const active = Color(0xFFF84235);
  static const stateBlue = Color(0xFF0091EA);
  static const stateGreen = Color(0xFF00C853);
  static const stateOrange = Color(0xFFFF6D00);
  static const stateRed = Color(0xFFC62828);

  // Text
  static const textDark = Color(0xFF424242);
  static const textDark2nd = Color(0xFF757575);
  static const textGrey = Color(0xFF9E9E9E);
  static const textGrey2nd = Color(0xFFBDBDBD);
  static const textLight = Color(0xFFFAFAFA);
  static const textLight2nd = Color(0xFFF5F5F5);

  // Background
  static const backgroundLight = Color(0xFFFAFAFA); // md_grey_50
  static const backgroundDarkBlue = Color(0xFF182128);
  static const backgroundDarkGray = Color(0xFF202125);

  // Content rating
  static const contentMild = Color(0xFFD8B32B);
  static const contentModerate = Color(0xFFCD6E00);
  static const contentNone = Color(0xFF42BD59);
  static const contentSevere = Color(0xFFD82B2D);

  // Player
  static const aypRed = Color(0xFFF44336);
  static const aypShadow = Color(0x66000000);

  // Material
  static const grey50 = Color(0xFFFAFAFA);
  static const grey100 = Color(0xFFF5F5F5);
  static const grey600 = Color(0xFF757575);
  static const grey800 = Color(0xFF424242);

  // Helper to get primary by theme
  static Color primaryByTheme(AppThemeVariant variant) {
    return switch (variant) {
      AppThemeVariant.light => primaryLight,
      AppThemeVariant.darkBlue => darkBluePrimary,
      AppThemeVariant.darkGray => darkGrayPrimary,
      AppThemeVariant.amoled => amoledPrimary,
    };
  }
}

enum AppThemeVariant { light, darkBlue, darkGray, amoled }
