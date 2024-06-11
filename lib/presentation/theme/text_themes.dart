import 'package:flutter/material.dart';
import 'package:qontact/presentation/theme/app_color.dart';
import 'package:qontact/presentation/theme/text_styles.dart';

class TextThemes {
  /// Main text theme

  static TextTheme get textTheme {
    return TextTheme(
      bodyLarge: AppTextStyles.bodyLarge,
      bodyMedium: AppTextStyles.bodyMedium,
      titleMedium: AppTextStyles.titleMedium,
      titleSmall: AppTextStyles.titleSmall,
      displayLarge: AppTextStyles.displayLarge,
      displayMedium: AppTextStyles.displayMedium,
      displaySmall: AppTextStyles.displaySmall,
      headlineMedium: AppTextStyles.headlineMedium,
    );
  }

  /// Dark text theme

  static TextTheme get darkTextTheme {
    return TextTheme(
      bodyLarge: AppTextStyles.bodyLarge.copyWith(color: AppColors.white),
      bodyMedium: AppTextStyles.bodyMedium.copyWith(color: AppColors.white),
      bodySmall: AppTextStyles.bodySmall.copyWith(color: AppColors.white),
      titleLarge: AppTextStyles.titleLarge.copyWith(color: AppColors.white),
      titleMedium: AppTextStyles.bodySmall.copyWith(color: AppColors.white),
      titleSmall: AppTextStyles.titleSmall.copyWith(color: AppColors.white),
      displayLarge: AppTextStyles.displayLarge.copyWith(color: AppColors.white),
      displayMedium:
          AppTextStyles.displayMedium.copyWith(color: AppColors.white),
      displaySmall: AppTextStyles.displaySmall.copyWith(color: AppColors.white),
      headlineMedium:
          AppTextStyles.headlineMedium.copyWith(color: AppColors.white),
      headlineLarge:
          AppTextStyles.headlineLarge.copyWith(color: AppColors.white),
      headlineSmall:
          AppTextStyles.headlineSmall.copyWith(color: AppColors.white),
      labelSmall: AppTextStyles.labelSmall.copyWith(color: AppColors.white),
      labelMedium: AppTextStyles.labelMedium.copyWith(color: AppColors.white),
      labelLarge: AppTextStyles.labelLarge.copyWith(color: AppColors.white),
    );
  }

  /// Primary text theme

  static TextTheme get primaryTextTheme {
    return TextTheme(
      bodyLarge: AppTextStyles.bodyLarge.copyWith(color: AppColors.black),
      bodyMedium: AppTextStyles.bodyMedium.copyWith(color: AppColors.black),
      bodySmall: AppTextStyles.bodySmall.copyWith(color: AppColors.black),
      titleLarge: AppTextStyles.titleLarge.copyWith(color: AppColors.black),
      titleMedium: AppTextStyles.bodySmall.copyWith(color: AppColors.black),
      titleSmall: AppTextStyles.titleSmall.copyWith(color: AppColors.black),
      displayLarge: AppTextStyles.displayLarge.copyWith(color: AppColors.black),
      displayMedium:
          AppTextStyles.displayMedium.copyWith(color: AppColors.black),
      displaySmall: AppTextStyles.displaySmall.copyWith(color: AppColors.black),
      headlineMedium:
          AppTextStyles.headlineMedium.copyWith(color: AppColors.black),
      headlineLarge:
          AppTextStyles.headlineLarge.copyWith(color: AppColors.black),
      headlineSmall:
          AppTextStyles.headlineSmall.copyWith(color: AppColors.black),
      labelSmall: AppTextStyles.labelSmall.copyWith(color: AppColors.black),
      labelMedium: AppTextStyles.labelMedium.copyWith(color: AppColors.black),
      labelLarge: AppTextStyles.labelLarge.copyWith(color: AppColors.black),
    );
  }
}
