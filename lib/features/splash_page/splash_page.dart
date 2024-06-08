import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:qontact/core/theme/constants/gradients/gradients.dart';
import 'package:qontact/features/global_widgets/gradient_text.dart';
import 'package:qontact/features/global_widgets/logo_widget.dart';
import 'dart:math';

import 'package:qontact/features/onboarding_page/onboarding_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 0), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => OnboardingScreen(),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> splashImages = [
      "assets/images/splash_background1.jpg",
      "assets/images/splash_background2.jpg",
      "assets/images/splash_background3.jpg",
    ];

    final String selectedImage =
        splashImages[Random().nextInt(splashImages.length)];

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(selectedImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          color: Colors.black.withOpacity(0.8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LogoWidget(fontsize: 120),
              const GradientText(
                "Connect Instantly with QR.",
                gradient: GradientsConstants.mainGradient,
                style: TextStyle(fontFamily: "Gellini", fontSize: 20),
              ),
              const SizedBox(height: 20),
              const CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
