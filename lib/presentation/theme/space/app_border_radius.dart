import 'package:flutter/material.dart';
import 'package:qontact/presentation/theme/app_spacing.dart';

class AppBorderRadius extends BorderRadius {
  AppBorderRadius.all(double value) : super.all(Radius.circular(value));

  AppBorderRadius.only({
    double topLeft = AppSpacing.spacing0,
    double topRight = AppSpacing.spacing0,
    double bottomLeft = AppSpacing.spacing0,
    double bottomRight = AppSpacing.spacing0,
  }) : super.only(
          topLeft: Radius.circular(topLeft),
          topRight: Radius.circular(topRight),
          bottomLeft: Radius.circular(bottomLeft),
          bottomRight: Radius.circular(bottomRight),
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
