import 'package:flutter/material.dart';
import 'package:qontact/core/theme/constants/gradients/gradients.dart';
import 'package:qontact/features/global_widgets/gradient_text.dart';

class LogoWidget extends StatelessWidget {
  double fontsize;
  LogoWidget({super.key, required this.fontsize});

  @override
  Widget build(BuildContext context) {
    return GradientText(
      'QR.',
      gradient: GradientsConstants.mainGradient,
      style: TextStyle(
          fontSize: fontsize,
          fontWeight: FontWeight.bold,
          letterSpacing: 5,
          fontFamily: "Gellini"),

      //TODO 1: TextStyles belirlendiğinde bunu düzelt.
    );
  }
}
