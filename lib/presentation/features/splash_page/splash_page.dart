import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qontact/core/constants/locale/locale_keys.g.dart';
import 'package:qontact/core/utils/locale/locale_extention.dart';
import 'package:qontact/presentation/global_widgets/locale_text/locale_text.dart';
import 'package:qontact/presentation/navigation/app_router.gr.dart';
import 'package:qontact/presentation/theme/app_color.dart';
import 'package:qontact/presentation/global_widgets/logo_widget.dart';
import 'package:qontact/presentation/theme/text_styles.dart';

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
          .pushAndPopUntil(const PremiumRoute(), predicate: (_) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LogoWidget(
              fontsize: 120.sp,
              isWhite: false,
            ),
            LocaleText(
                text: LocaleKeys.splash_splashdesc.locale,
                style: AppTextStyles.bodyLarge.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w500,
                )),
            const SizedBox(height: 20),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
