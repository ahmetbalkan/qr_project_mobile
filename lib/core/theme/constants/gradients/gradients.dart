import 'package:flutter/material.dart';

class GradientsConstants {
  static const LinearGradient mainGradient = LinearGradient(
    colors: [
      Color(0xFF21D4FD),
      Color(0xFFB721FF),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.0, 1.0],
  );
}
