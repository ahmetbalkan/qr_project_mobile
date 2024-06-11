import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:qontact/presentation/navigation/app_router.gr.dart';
import 'package:qontact/presentation/theme/constants/gradients/gradients.dart';
import 'package:qontact/presentation/global_widgets/gradient_text.dart';
import 'package:qontact/presentation/global_widgets/logo_widget.dart';
import 'dart:math';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 0), () {
      context.router
          .pushAndPopUntil(const OnboardingRoute(), predicate: (_) => false);
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
