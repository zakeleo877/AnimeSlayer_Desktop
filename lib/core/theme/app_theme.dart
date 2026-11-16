import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: AppColors.primaryLight,
      scaffoldBackgroundColor: AppColors.backgroundLight,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primaryLight,
        secondary: AppColors.accent,
        surface: Colors.white,
        error: AppColors.stateRed,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primaryLight,
        foregroundColor: AppColors.textDark,
        elevation: 2,
        centerTitle: false,
        titleTextStyle: TextStyle(
          fontFamily: 'Tajawal',
          color: AppColors.textDark,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      drawerTheme: const DrawerThemeData(
        backgroundColor: Colors.white,
      ),
      tabBarTheme: const TabBarThemeData(
        labelColor: AppColors.accent,
        unselectedLabelColor: Color(0xFF5F6368),
        indicatorColor: AppColors.accent,
        indicatorSize: TabBarIndicatorSize.tab,
      ),
      cardTheme: CardThemeData(
        color: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      fontFamily: 'Tajawal',
    );
  }

  static ThemeData get darkBlueTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: AppColors.darkBluePrimary,
      scaffoldBackgroundColor: AppColors.backgroundDarkBlue,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.darkBluePrimary,
        secondary: AppColors.accent,
        surface: Color(0xFF252E39),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.darkBluePrimary,
        foregroundColor: Colors.white,
        elevation: 2,
      ),
      cardTheme: CardThemeData(
        color: const Color(0xFF252E39),
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      fontFamily: 'Tajawal',
    );
  }

  static ThemeData get darkGrayTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: AppColors.darkGrayPrimary,
      scaffoldBackgroundColor: AppColors.backgroundDarkGray,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.darkGrayPrimary,
        secondary: AppColors.accent,
        surface: Color(0xFF242529),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.darkGrayPrimary,
        foregroundColor: Colors.white,
      ),
      fontFamily: 'Tajawal',
    );
  }

  static ThemeData get amoledTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: AppColors.amoledPrimary,
      scaffoldBackgroundColor: Colors.black,
      colorScheme: const ColorScheme.dark(
        primary: Colors.black,
        secondary: AppColors.accent,
        surface: Color(0xFF121212),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      fontFamily: 'Tajawal',
    );
  }
}
