import 'package:flutter/material.dart';
import 'package:qontact/core/utils/extentions/ColorToMaterial.dart';
import 'package:qontact/presentation/theme/app_color.dart';
import 'package:qontact/presentation/theme/text_styles.dart';
import 'package:qontact/presentation/theme/text_themes.dart';

class AppTheme {
  // Dark Theme
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      fontFamily: AppTextStyles.fontFamily,
      primaryColor: AppColors.mainPrimary,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.mainPrimary,
        secondary: AppColors.mainSecondary,
        error: AppColors.error,
        background: AppColors.black,
      ),
      scaffoldBackgroundColor: AppColors.scaffoldBackgroundDark,
      textTheme: TextThemes.darkTextTheme,
      primaryTextTheme: TextThemes.primaryTextTheme,
      appBarTheme: AppBarTheme(
        elevation: 1,
        backgroundColor: AppColors.black,
        titleTextStyle: AppTextStyles.titleSmall,
        iconTheme: const IconThemeData(color: AppColors.white),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(AppColors.white),
          backgroundColor: MaterialStateProperty.all(AppColors.mainPrimary),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    );
  }

  // Light Theme
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      fontFamily: AppTextStyles.fontFamily,
      primaryColor: AppColors.mainPrimary,
      colorScheme: const ColorScheme.light(
        primary: AppColors.mainPrimary,
        secondary: AppColors.mainSecondary,
        error: AppColors.error,
      ),
      scaffoldBackgroundColor: AppColors.scaffoldBackgroundLight,
      textTheme: TextThemes.textTheme,
      primaryTextTheme: TextThemes.primaryTextTheme,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.mainPrimary,
      ),
      appBarTheme: AppBarTheme(
        elevation: 2,
        color: AppColors.mainPrimary,
        titleTextStyle: AppTextStyles.titleSmall,
        iconTheme: const IconThemeData(color: AppColors.black),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(
            AppTextStyles.bodyMedium,
          ),
          foregroundColor: MaterialStateProperty.all(AppColors.white),
          backgroundColor: MaterialStateProperty.all(AppColors.primary),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}
