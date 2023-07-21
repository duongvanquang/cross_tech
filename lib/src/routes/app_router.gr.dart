// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    MainPageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainPage(),
      );
    },
    LoginPageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginPage(),
      );
    },
    HomepageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const Homepage(),
      );
    },
    ContactPageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ContactPage(),
      );
    },
    ProfilePageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfilePage(),
      );
    },
    PlanPageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PlanPage(),
      );
    },
  };
}

/// generated route for
/// [MainPage]
class MainPageRoute extends PageRouteInfo<void> {
  const MainPageRoute({List<PageRouteInfo>? children})
      : super(
          MainPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainPageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginPage]
class LoginPageRoute extends PageRouteInfo<void> {
  const LoginPageRoute({List<PageRouteInfo>? children})
      : super(
          LoginPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginPageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [Homepage]
class HomepageRoute extends PageRouteInfo<void> {
  const HomepageRoute({List<PageRouteInfo>? children})
      : super(
          HomepageRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomepageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ContactPage]
class ContactPageRoute extends PageRouteInfo<void> {
  const ContactPageRoute({List<PageRouteInfo>? children})
      : super(
          ContactPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'ContactPageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfilePage]
class ProfilePageRoute extends PageRouteInfo<void> {
  const ProfilePageRoute({List<PageRouteInfo>? children})
      : super(
          ProfilePageRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfilePageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PlanPage]
class PlanPageRoute extends PageRouteInfo<void> {
  const PlanPageRoute({List<PageRouteInfo>? children})
      : super(
          PlanPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'PlanPageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
