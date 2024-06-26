import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:qontact/presentation/navigation/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class RootRouter extends $RootRouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      initial: true,
      path: '/splash',
      page: SplashRoute.page,
    ),
    AutoRoute(
      path: '/onboarding',
      page: OnboardingRoute.page,
    ),
    AutoRoute(
        path: '/emptyauthentication',
        page: EmptyAuthenticationRoute.page,
        maintainState: true,
        children: [
          RedirectRoute(path: '', redirectTo: 'authentication'),
          AutoRoute(
            path: 'authentication',
            page: AuthenticationRoute.page,
          ),
          AutoRoute(
            path: 'register',
            page: RegisterRoute.page,
          ),
          AutoRoute(
            path: 'login',
            page: LoginRoute.page,
          ),
          AutoRoute(
            path: 'forgotpassword',
            page: ForgotPasswordRoute.page,
          ),
          AutoRoute(
            path: 'otpverification',
            page: OtpVerificationRoute.page,
          ),
          AutoRoute(
            path: 'changepassword',
            page: ChangePasswordRoute.page,
          ),
          AutoRoute(
            path: 'userinformation',
            page: UserInformationRoute.page,
          ),
          AutoRoute(
            path: 'premiumpage',
            page: PremiumRoute.page,
          ),
        ]),
    AutoRoute(
        path: '/emptyhomepage',
        page: EmptyHomeRoute.page,
        maintainState: true,
        children: [
          RedirectRoute(path: '', redirectTo: 'homepage'),
          AutoRoute(
            path: 'homepage',
            page: HomeRoute.page,
          ),
        ]),
    AutoRoute(
        path: '/emptypremiumpage',
        page: EmptyPremiumRoute.page,
        maintainState: true,
        children: [
          RedirectRoute(path: '', redirectTo: 'premiumpage'),
          AutoRoute(
            path: 'premiumpage',
            page: PremiumRoute.page,
          ),
        ]),
  ];
}

@RoutePage()
class EmptyAuthenticationPage extends AutoRouter {
  const EmptyAuthenticationPage({super.key});
}

@RoutePage()
class EmptyHomePage extends AutoRouter {
  const EmptyHomePage({super.key});
}

@RoutePage()
class EmptyPremiumPage extends AutoRouter {
  const EmptyPremiumPage({super.key});
}
