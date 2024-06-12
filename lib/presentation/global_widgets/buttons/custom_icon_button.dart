import 'package:flutter/material.dart';
import 'package:qontact/presentation/theme/space/sizes.dart';

class CustomIconButton extends StatelessWidget {
  final Widget icon;
  final Color? color;
  final Color? background;
  final double? height;
  final VoidCallback onTap;
  final bool isCircle;

  const CustomIconButton({
    super.key,
    required this.icon,
    this.color,
    this.height,
    required this.onTap,
    this.background,
    this.isCircle = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
          color: background,
          borderRadius: isCircle ? null : BorderRadius.circular(4),
        ),
        child: Padding(
          padding: AppEdgeInset.horizontal(value: Glutter.px8),
          child: icon,
        ),
      ),
    );
  }
}
