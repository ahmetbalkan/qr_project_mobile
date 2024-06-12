import 'package:flutter/material.dart';
import 'package:qontact/presentation/theme/app_spacing.dart';

class AppBorderRadius extends BorderRadius {
  AppBorderRadius.all(double value) : super.all(Radius.circular(value));

  AppBorderRadius.only({
    double? topLeft,
    double? topRight,
    double? bottomLeft,
    double? bottomRight,
  }) : super.only(
          topLeft: Radius.circular(topLeft ?? AppSpacing.spacing0),
          topRight: Radius.circular(topRight ?? AppSpacing.spacing0),
          bottomLeft: Radius.circular(bottomLeft ?? AppSpacing.spacing0),
          bottomRight: Radius.circular(bottomRight ?? AppSpacing.spacing0),
        );

  AppBorderRadius.top(double value)
      : super.only(
          topLeft: Radius.circular(value),
          topRight: Radius.circular(value),
        );

  AppBorderRadius.bottom(double value)
      : super.only(
          bottomLeft: Radius.circular(value),
          bottomRight: Radius.circular(value),
        );

  AppBorderRadius.left(double value)
      : super.only(
          topLeft: Radius.circular(value),
          bottomLeft: Radius.circular(value),
        );

  AppBorderRadius.right(double value)
      : super.only(
          topRight: Radius.circular(value),
          bottomRight: Radius.circular(value),
        );
}
