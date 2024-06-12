import 'package:flutter/material.dart';
import 'package:qontact/presentation/theme/app_spacing.dart';

class Space extends StatelessWidget {
  const Space({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? AppSpacing.spacing16,
      height: height ?? AppSpacing.spacing16,
    );
  }
}
