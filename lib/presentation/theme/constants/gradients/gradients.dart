import 'package:flutter/material.dart';

class GradientsConstants {
  static const LinearGradient mainGradient = LinearGradient(
    colors: [
      Color(0xFF536DFE),
      Color(0xFF6B3DE8),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.0, 1.0],
  );
}
