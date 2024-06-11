import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qontact/locator.dart';
import 'package:qontact/presentation/navigation/app_router.dart';
import 'package:qontact/presentation/theme/theme_notifier.dart';

import 'presentation/theme/app_theme.dart';

class QrProject extends ConsumerWidget {
  const QrProject({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    final rootRouter = locator<RootRouter>();

    return ScreenUtilInit(
      //Pixel 7 Pro 412px × 892px
      designSize: const Size(412, 892),
      builder: (context, child) {
        return MaterialApp.router(
          routerConfig: rootRouter.config(),
          title: 'Flutter Theme Example',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeMode,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
        );
      },
    );
  }
}
