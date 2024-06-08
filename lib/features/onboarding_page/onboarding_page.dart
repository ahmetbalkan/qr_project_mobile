import 'package:flutter/material.dart';
import 'package:qontact/features/authentication_page/authentication_page.dart';
import 'package:qontact/features/global_widgets/logo_widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFfff3eb),
        body: Stack(
          children: [
            PageView(
              controller: _pageController,
              physics:
                  const NeverScrollableScrollPhysics(), // Sağa sola kaydırmayı kapatmak için
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              children: [
                buildOnboardingPage(
                  image: 'assets/images/splash_background1.jpg',
                  title: 'Share Your Recipes',
                  description:
                      'Share your favorite recipes with the world and connect with other food enthusiasts.',
                ),
                buildOnboardingPage(
                  image: 'assets/images/splash_background2.jpg',
                  title: 'Learn to Cook',
                  description:
                      'Learn new cooking techniques and recipes from top chefs.',
                ),
                buildOnboardingPage(
                  image: 'assets/images/splash_background3.jpg',
                  title: 'Become a Master Chef',
                  description:
                      'Improve your cooking skills and become a master chef in your kitchen.',
                ),
                buildOnboardingPage(
                  image: 'assets/images/splash_background4.jpg',
                  title: 'Create an Account',
                  description:
                      'Sign up to save your favorite recipes and share your own.',
                  isLastPage: true,
                ),
              ],
            ),
            Positioned(
              bottom: 70,
              left: 50,
              right: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: LinearProgressIndicator(
                      value: (_currentIndex + 1) / 4,
                      backgroundColor: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      color: const Color(0xFF6A3DE8),
                      minHeight: 10,
                    ),
                  ),
                ],
              ),
            ),
            // LogoWidget'ı notch'un olduğu yere yerleştirme
            Positioned(
              top: 5,
              left: 0,
              right: 0,
              child: Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.only(
                    top: 10), // Notch yüksekliği kadar padding
                child: LogoWidget(
                  fontsize: 40,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOnboardingPage({
    required String image,
    required String title,
    required String description,
    bool isLastPage = false,
  }) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ClipPath(
        clipper: CustomClipPath(),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      const Color(0xFF536DFE).withOpacity(1),
                      const Color(0xFF536DFE).withOpacity(0.9),
                      const Color(0xFF536DFE).withOpacity(0.8),
                      const Color(0xFF536DFE).withOpacity(0.7),
                      const Color(0xFF536DFE).withOpacity(0.6),
                      const Color(0xFF536DFE).withOpacity(0.5),
                      const Color(0xFF536DFE).withOpacity(0.4),
                      const Color(0xFF536DFE).withOpacity(0.3),
                      const Color(0xFF536DFE).withOpacity(0.2),
                      const Color(0xFF536DFE).withOpacity(0.1),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 150,
              left: 20,
              right: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    description,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            if (!isLastPage)
              Positioned(
                bottom: 30,
                right: 30,
                child: GestureDetector(
                  onTap: () {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF6A3DE8),
                    ),
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            if (isLastPage)
              Positioned(
                bottom: 30,
                right: 30,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation1, animation2) =>
                            const AuthenticationScreen(),
                        transitionDuration: Duration.zero,
                        reverseTransitionDuration: Duration.zero,
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF6A3DE8),
                    ),
                    child: const Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(0, size.height, 50, size.height);
    path.lineTo(size.width - 50, size.height);
    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height - 50);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
