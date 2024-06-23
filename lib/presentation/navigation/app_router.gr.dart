// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i13;
import 'package:qontact/presentation/features/authentication_features/authentication_page/authentication_page.dart'
    as _i1;
import 'package:qontact/presentation/features/authentication_features/change_password_page/change_password_page.dart'
    as _i2;
import 'package:qontact/presentation/features/authentication_features/forgot_password_page/forgot_password_page.dart'
    as _i4;
import 'package:qontact/presentation/features/authentication_features/login_page/login_page.dart'
    as _i6;
import 'package:qontact/presentation/features/authentication_features/pin_code_page/otp_verification_page.dart'
    as _i8;
import 'package:qontact/presentation/features/authentication_features/register_page/register_page.dart'
    as _i10;
import 'package:qontact/presentation/features/home_page/home_page.dart' as _i5;
import 'package:qontact/presentation/features/onboarding_page/onboarding_page.dart'
    as _i7;
import 'package:qontact/presentation/features/premium_page/premium_page.dart'
    as _i9;
import 'package:qontact/presentation/features/splash_page/splash_page.dart'
    as _i11;
import 'package:qontact/presentation/features/user_information_page/user_information_page.dart'
    as _i12;
import 'package:qontact/presentation/navigation/app_router.dart' as _i3;

abstract class $RootRouter extends _i13.RootStackRouter {
  $RootRouter({super.navigatorKey});

  @override
  final Map<String, _i13.PageFactory> pagesMap = {
    AuthenticationRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AuthenticationPage(),
      );
    },
    ChangePasswordRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.ChangePasswordPage(),
      );
    },
    EmptyAuthenticationRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.EmptyAuthenticationPage(),
      );
    },
    EmptyHomeRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.EmptyHomePage(),
      );
    },
    EmptyPremiumRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.EmptyPremiumPage(),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.ForgotPasswordPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.HomePage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.LoginPage(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.OnboardingPage(),
      );
    },
    OtpVerificationRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.OtpVerificationPage(),
      );
    },
    PremiumRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.PremiumPage(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.RegisterPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.SplashPage(),
      );
    },
    UserInformationRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.UserInformationPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.AuthenticationPage]
class AuthenticationRoute extends _i13.PageRouteInfo<void> {
  const AuthenticationRoute({List<_i13.PageRouteInfo>? children})
      : super(
          AuthenticationRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthenticationRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ChangePasswordPage]
class ChangePasswordRoute extends _i13.PageRouteInfo<void> {
  const ChangePasswordRoute({List<_i13.PageRouteInfo>? children})
      : super(
          ChangePasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChangePasswordRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i3.EmptyAuthenticationPage]
class EmptyAuthenticationRoute extends _i13.PageRouteInfo<void> {
  const EmptyAuthenticationRoute({List<_i13.PageRouteInfo>? children})
      : super(
          EmptyAuthenticationRoute.name,
          initialChildren: children,
        );

  static const String name = 'EmptyAuthenticationRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i3.EmptyHomePage]
class EmptyHomeRoute extends _i13.PageRouteInfo<void> {
  const EmptyHomeRoute({List<_i13.PageRouteInfo>? children})
      : super(
          EmptyHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'EmptyHomeRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i3.EmptyPremiumPage]
class EmptyPremiumRoute extends _i13.PageRouteInfo<void> {
  const EmptyPremiumRoute({List<_i13.PageRouteInfo>? children})
      : super(
          EmptyPremiumRoute.name,
          initialChildren: children,
        );

  static const String name = 'EmptyPremiumRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i4.ForgotPasswordPage]
class ForgotPasswordRoute extends _i13.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i13.PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i5.HomePage]
class HomeRoute extends _i13.PageRouteInfo<void> {
  const HomeRoute({List<_i13.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i6.LoginPage]
class LoginRoute extends _i13.PageRouteInfo<void> {
  const LoginRoute({List<_i13.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i7.OnboardingPage]
class OnboardingRoute extends _i13.PageRouteInfo<void> {
  const OnboardingRoute({List<_i13.PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i8.OtpVerificationPage]
class OtpVerificationRoute extends _i13.PageRouteInfo<void> {
  const OtpVerificationRoute({List<_i13.PageRouteInfo>? children})
      : super(
          OtpVerificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'OtpVerificationRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i9.PremiumPage]
class PremiumRoute extends _i13.PageRouteInfo<void> {
  const PremiumRoute({List<_i13.PageRouteInfo>? children})
      : super(
          PremiumRoute.name,
          initialChildren: children,
        );

  static const String name = 'PremiumRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i10.RegisterPage]
class RegisterRoute extends _i13.PageRouteInfo<void> {
  const RegisterRoute({List<_i13.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i11.SplashPage]
class SplashRoute extends _i13.PageRouteInfo<void> {
  const SplashRoute({List<_i13.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i12.UserInformationPage]
class UserInformationRoute extends _i13.PageRouteInfo<void> {
  const UserInformationRoute({List<_i13.PageRouteInfo>? children})
      : super(
          UserInformationRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserInformationRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}
