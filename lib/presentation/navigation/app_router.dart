//ignore_for_file: public_member_api_docs
import 'package:auto_route/auto_route.dart';
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
        path: '/authentication', page: AuthenticationRoute.page, children: []),
  ];
}
