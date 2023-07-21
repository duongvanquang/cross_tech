import 'package:auto_route/auto_route.dart';
import 'package:cross_tech/src/pages/home_page.dart';

import '../pages/contact_page.dart';
import '../pages/login_page.dart';
import '../pages/main_page.dart';
import '../pages/plan_page.dart';
import '../pages/profile_page.dart';
import 'route_keys.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route, Widget')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LoginPageRoute.page, path: "/"),
        AutoRoute(page: MainPageRoute.page, initial: true, children: [
          AutoRoute(
              page: HomepageRoute.page,
              path: RouteKey.homePage,
              children: [AutoRoute(initial: true, page: HomepageRoute.page)]),
          AutoRoute(
              page: ContactPageRoute.page,
              path: RouteKey.contactPage,
              children: [AutoRoute(page: ContactPageRoute.page)]),
          AutoRoute(
              page: ProfilePageRoute.page,
              path: RouteKey.profilePage,
              children: [AutoRoute(page: ProfilePageRoute.page)]),
          AutoRoute(
              page: PlanPageRoute.page,
              path: RouteKey.calendaPage,
              children: [AutoRoute(page: PlanPageRoute.page)]),
        ])
      ];
}
