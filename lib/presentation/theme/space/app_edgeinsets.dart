import 'package:flutter/material.dart';
import 'package:qontact/presentation/theme/app_spacing.dart';

class AppEdgeInset extends EdgeInsets {
  AppEdgeInset.horizontal({double? value})
      : super.symmetric(horizontal: value ?? AppSpacing.spacing16);
  AppEdgeInset.vertical({double? value})
      : super.symmetric(vertical: value ?? AppSpacing.spacing16);
  AppEdgeInset.symmetric({
    double? horizontal,
    double? vertical,
  }) : super.symmetric(
          horizontal: horizontal ?? AppSpacing.spacing16,
          vertical: vertical ?? AppSpacing.spacing16,
        );
  AppEdgeInset.all({double? value}) : super.all(value ?? AppSpacing.spacing16);
  AppEdgeInset.only({
    double? left,
    double? top,
    double? right,
    double? bottom,
  }) : super.only(
          left: left ?? AppSpacing.spacing16,
          top: top ?? AppSpacing.spacing16,
          right: right ?? AppSpacing.spacing16,
          bottom: bottom ?? AppSpacing.spacing16,
        );
}
