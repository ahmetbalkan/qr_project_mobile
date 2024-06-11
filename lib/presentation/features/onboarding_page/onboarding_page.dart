import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qontact/core/constants/locale/locale_keys.g.dart';
import 'package:qontact/core/utils/locale/locale_extention.dart';
import 'package:qontact/presentation/global_widgets/locale_text/locale_text.dart';
import 'package:qontact/presentation/navigation/app_router.gr.dart';
import 'package:qontact/presentation/theme/app_color.dart';
import 'package:qontact/presentation/theme/app_spacing.dart';
import 'package:qontact/presentation/theme/space/app_border_radius.dart';
import 'package:qontact/presentation/theme/space/app_edgeinsets.dart';
import 'package:qontact/presentation/theme/text_styles.dart';
import 'package:qontact/presentation/features/authentication_page/presentation/authentication_page.dart';
import 'package:qontact/presentation/global_widgets/logo_widget.dart';
import 'package:qontact/presentation/theme/space/space_widget.dart';

@RoutePage()
class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              children: [
                buildOnboardingPage(
                  image: 'assets/images/splash_background1.jpg',
                  title: LocaleKeys.onboarding_slide1title.locale,
                  description: LocaleKeys.onboarding_slide1desc,
                ),
                buildOnboardingPage(
                  image: 'assets/images/splash_background2.jpg',
                  title: LocaleKeys.onboarding_slide2title.locale,
                  description: LocaleKeys.onboarding_slide2desc.locale,
                ),
                buildOnboardingPage(
                  image: 'assets/images/splash_background3.jpg',
                  title: LocaleKeys.onboarding_slide3title.locale,
                  description: LocaleKeys.onboarding_slide3desc.locale,
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
                      value: (_currentIndex + 1) / 3,
                      backgroundColor: AppColors.grey,
                      borderRadius: AppBorderRadius.all(12),
                      color: AppColors.primary,
                      minHeight: 10,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 20,
              left: 30,
              right: 0,
              child: Container(
                alignment: Alignment.topCenter,
                padding: const AppEdgeInset.all(value: AppSpacing.spacing12),
                child: LogoWidget(
                  fontsize: 60.sp,
                ),
              ),
            ),
            if (_currentIndex > 0)
              Positioned(
                top: 50,
                left: 55,
                child: GestureDetector(
                  onTap: () {
                    if (_currentIndex > 0) {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    }
                  },
                  child: Container(
                    padding:
                        const AppEdgeInset.all(value: AppSpacing.spacing16),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.secondary,
                    ),
                    child: const Icon(
                      Icons.arrow_back,
                      color: AppColors.white,
                    ),
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
      padding: const AppEdgeInset.all(value: AppSpacing.spacing20),
      child: ClipPath(
        clipper: OnboardingClipPath(),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
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
                  LocaleText(
                      text: title.locale,
                      style: AppTextStyles.titleLarge.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      )),
                  const Space(),
                  LocaleText(
                    text: description,
                    style: AppTextStyles.bodyLarge.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            if (!isLastPage)
              Positioned(
                bottom: 30,
                right: 40,
                child: GestureDetector(
                  onTap: () {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  },
                  child: Container(
                    padding:
                        const AppEdgeInset.all(value: AppSpacing.spacing16),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.transparent,
                    ),
                    child: const Icon(
                      Icons.arrow_forward,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            if (isLastPage)
              Positioned(
                bottom: 30,
                right: 40,
                child: GestureDetector(
                  onTap: () {
                    context.router.push(const AuthenticationRoute());
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.transparent,
                    ),
                    child: const Icon(
                      Icons.check,
                      color: AppColors.white,
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

class OnboardingClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double radius = 50.0;
    Path path = Path();
    // Üst sol çıkıntı
    path.moveTo(0, radius);
    path.quadraticBezierTo(0, 0, radius, 0);
    path.lineTo(120 - radius, 0);
    path.quadraticBezierTo(120, 0, 120, radius);
    path.lineTo(120, 100 - radius);
    path.quadraticBezierTo(120, 100, 120 + radius, 100);
    path.lineTo(size.width - radius, 100); // Üst kenarın geri kalanı
    path.quadraticBezierTo(
        size.width, 100, size.width, 100 + radius); // Sağ üst köşe yuvarlatma

    // Sağ kenar
    path.lineTo(size.width, size.height - radius);
    path.quadraticBezierTo(
        size.width, size.height, size.width - radius, size.height);

    // Alt sağ çıkıntı
    path.lineTo(size.width - 120 + radius, size.height);
    path.quadraticBezierTo(
        size.width - 120, size.height, size.width - 120, size.height - radius);
    path.lineTo(size.width - 120, size.height - 100 + radius);
    path.quadraticBezierTo(size.width - 120, size.height - 100,
        size.width - 120 - radius, size.height - 100);

    // Alt sol kenar
    path.lineTo(radius, size.height - 100);
    path.quadraticBezierTo(0, size.height - 100, 0, size.height - 100 - radius);

    // Sol kenar
    path.lineTo(0, radius);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
