import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qontact/core/constants/enums/locale_enums.dart';
import 'package:qontact/core/constants/locale/locale_keys.g.dart';
import 'package:qontact/core/utils/locale/locale_extention.dart';
import 'package:qontact/presentation/global_widgets/locale_text/locale_text.dart';
import 'package:qontact/presentation/theme/app_color.dart';
import 'package:qontact/presentation/theme/app_spacing.dart';
import 'package:qontact/presentation/theme/space/app_edgeinsets.dart';
import 'package:qontact/presentation/theme/text_styles.dart';
import 'package:qontact/presentation/theme/theme_notifier.dart';
import 'package:qontact/presentation/global_widgets/buttons/custom_button.dart';
import 'package:qontact/presentation/global_widgets/buttons/custom_icon_button.dart';
import 'package:qontact/presentation/global_widgets/logo_widget.dart';
import 'package:qontact/presentation/theme/space/space_widget.dart';

@RoutePage()
class AuthenticationPage extends ConsumerWidget {
  const AuthenticationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding:
                        const AppEdgeInset.all(value: AppSpacing.spacing20),
                    child: ClipPath(
                      clipper: AuthenticationClipPath(),
                      child: Container(
                        height: 3.h / 5.h,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/images/splash_background1.jpg'),
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
                          padding: const AppEdgeInset.all(
                              value: AppSpacing.spacing20),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: const AppEdgeInset.all(
                                  value: AppSpacing.spacing4),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: LocaleText(
                                      text: LocaleKeys
                                          .authentication_createaccount,
                                      style: AppTextStyles.titleLarge.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Space(height: 20.h),
                                  LocaleText(
                                    text: LocaleKeys
                                        .authentication_createaccountdesc,
                                    style: AppTextStyles.bodyLarge.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding:
                        const AppEdgeInset.all(value: AppSpacing.spacing20),
                    child: Column(
                      children: [
                        CustomButton(
                          onTap: () {
                            ref.read(themeProvider.notifier).toggleTheme();
                          },
                          isFullWidth: true,
                          height: 70.h,
                          isIcon: true,
                          icon: FontAwesomeIcons.envelope,
                          isText: true,
                          text: LocaleKeys.authentication_maillogin.locale,
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          children: [
                            Expanded(
                              child: CustomIconButton(
                                height: 70.h,
                                icon: const Icon(
                                  FontAwesomeIcons.google,
                                  color: Colors.white,
                                ),
                                background: AppColors.google,
                                onTap: () {
                                  context.setLocale(Locales.en.locale);
                                },
                              ),
                            ),
                            SizedBox(width: 20.w),
                            Expanded(
                              child: CustomIconButton(
                                height: 70.h,
                                icon: const Icon(
                                  FontAwesomeIcons.apple,
                                  color: Colors.white,
                                ),
                                background: AppColors.apple,
                                onTap: () {
                                  context.setLocale(Locales.tr.locale);
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        Center(
                          child: SizedBox(
                            width: double.infinity,
                            height: 50.h,
                            child: GestureDetector(
                              onTap: () {
                                context.router.canPop();
                              },
                              child: Center(
                                child: LocaleText(
                                  text: LocaleKeys.authentication_ihaveaccount,
                                  style: AppTextStyles.bodyLarge,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
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
            Positioned(
              top: 50,
              left: 55,
              child: GestureDetector(
                onTap: () {
                  context.router.maybePop();
                },
                child: Container(
                  padding: const AppEdgeInset.all(value: AppSpacing.spacing16),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.secondary),
                  child: const Icon(
                    Icons.arrow_back,
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

class AuthenticationClipPath extends CustomClipper<Path> {
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

    // Alt sol kenar
    path.lineTo(radius, size.height);
    path.quadraticBezierTo(0, size.height, 0, size.height - radius);

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
