import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyles {
  static String fontFamily = 'Graphik';

  static TextStyle get displayLarge => TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.normal,
        fontSize: 56.sp,
        height: 1.10,
        letterSpacing: -1,
      );

  static TextStyle get displayMedium => TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 28.sp,
        height: 1.35,
      );

  static TextStyle get displaySmall => TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.normal,
        fontSize: 24.sp,
        height: 1.20,
      );

  static TextStyle get headlineLarge => TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w600,
        fontSize: 40.sp,
        height: 1.10,
        letterSpacing: -1,
      );

  static TextStyle get headlineMedium => TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 32.sp,
        height: 1.00,
        letterSpacing: -1,
      );

  static TextStyle get headlineSmall => TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 30.sp,
        height: 1.00,
        letterSpacing: -0.5,
      );

  static TextStyle get titleLarge => TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 28.sp,
        height: 1.35,
        letterSpacing: -1,
      );

  static TextStyle get titleMedium => TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 22.sp,
        height: 1.45,
        letterSpacing: -1,
      );

  static TextStyle get titleSmall => TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 20.sp,
        height: 1.45,
        letterSpacing: -1,
      );

  static TextStyle get bodyLarge => TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w400,
        fontSize: 16.sp,
        height: 1.40,
      );

  static TextStyle get bodyMedium => TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.normal,
        fontSize: 14.sp,
        height: 1.50,
      );

  static TextStyle get bodySmall => TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.normal,
        fontSize: 12.sp,
        height: 1.50,
      );

  static TextStyle get labelLarge => TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 14.sp,
        height: 1.10,
      );

  static TextStyle get labelMedium => TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 12.sp,
        height: 1.50,
      );

  static TextStyle get labelSmall => TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 10.sp,
        height: 1.50,
      );

  static TextStyle get bodySmallAlt => TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.normal,
        fontSize: 12.sp,
        height: 1.60,
      );
}
