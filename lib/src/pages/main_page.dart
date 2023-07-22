import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../routes/app_router.dart';
import '../widgets/bottom_bar/custom_bottom_bar.dart';
import '../widgets/bottom_bar/custom_tabs_route.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  static const List<PageRouteInfo> _homeRoutes = [
    HomepageRoute(),
    ContactPageRoute(),
    PlanPageRoute(),
    ProfilePageRoute(),
  ];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: AutoTabsScaffold(
        routes: _homeRoutes,
        bottomNavigationBuilder: (_, tabsRouter) {
          return CustomBottomNavigatorBar(
            child: CustomTabRouter(tabsRouter: tabsRouter),
          );
        },
      ),
    );
  }
}
