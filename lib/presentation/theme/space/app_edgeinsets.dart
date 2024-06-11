import 'package:flutter/material.dart';
import 'package:qontact/presentation/theme/app_spacing.dart';

class AppEdgeInset extends EdgeInsets {
  const AppEdgeInset.horizontal({double value = AppSpacing.spacing16})
      : super.symmetric(horizontal: value);
  const AppEdgeInset.vertical({double value = AppSpacing.spacing16})
      : super.symmetric(vertical: value);
  const AppEdgeInset.symmetric(
      {super.horizontal = AppSpacing.spacing16,
      super.vertical = AppSpacing.spacing16})
      : super.symmetric();
  const AppEdgeInset.all({double value = AppSpacing.spacing16})
      : super.all(value);
  const AppEdgeInset.only({
    super.left,
    super.top,
    super.right,
    super.bottom,
  }) : super.only();
}
