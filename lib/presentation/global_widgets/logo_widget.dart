import 'package:flutter/material.dart';
import 'package:qontact/presentation/theme/constants/gradients/gradients.dart';
import 'package:qontact/presentation/global_widgets/gradient_text.dart';

class LogoWidget extends StatelessWidget {
  final double fontsize;
  final bool isWhite;
  LogoWidget({super.key, required this.fontsize, required this.isWhite});

  @override
  Widget build(BuildContext context) {
    return this.isWhite
        ? Text(
            'QR.',

            style: TextStyle(
                fontSize: fontsize,
                fontWeight: FontWeight.bold,
                letterSpacing: 5,
                fontFamily: "Gellini"),

            //TODO 1: TextStyles belirlendiğinde bunu düzelt.
          )
        : GradientText(
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
