import 'package:flutter/material.dart';
import 'package:qontact/presentation/theme/app_spacing.dart';

class Space extends StatelessWidget {
  const Space({
    super.key,
    this.width = AppSpacing.spacing16,
    this.height = AppSpacing.spacing16,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
    );
  }
}
