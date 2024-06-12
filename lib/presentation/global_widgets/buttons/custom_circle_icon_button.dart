import 'package:flutter/material.dart';

class CustomCircleIconButton extends StatelessWidget {
  final double padding;
  final Color backgroundColor;
  final IconData icon;
  final Color iconColor;
  final double iconSize;
  final VoidCallback onPressed;

  const CustomCircleIconButton({
    super.key,
    required this.padding,
    required this.backgroundColor,
    required this.icon,
    required this.iconColor,
    required this.iconSize,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: backgroundColor,
        ),
        child: Icon(
          icon,
          color: iconColor,
          size: iconSize,
        ),
      ),
    );
  }
}
