import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app_dependencies.dart';

import '../../blocs/bottom_bar/bottom_bar_cubit.dart';
import '../../blocs/bottom_bar/bottom_bar_state.dart';
import '../../repositories/bottom_bar/bottom_bar_responsitory.dart';
import 'custom_bottom_bar.dart';

class CustomTabRouter extends StatefulWidget {
  const CustomTabRouter({Key? key, required TabsRouter tabsRouter})
      : _tabsRouter = tabsRouter,
        super(key: key);

  final TabsRouter _tabsRouter;

  @override
  State<CustomTabRouter> createState() => _CustomTabRouterState();
}

class _CustomTabRouterState extends State<CustomTabRouter> {
  final _bottomCubit = AppDependencies.injector.get<BottomBarCubit>();
  final _bottomRepository = AppDependencies.injector.get<BottomBarRepository>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: _bottomCubit,
        builder: (_, BottomBarState state) {
          return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _bottomRepository.getTabs
                  .map((e) => TabItem(
                        item: e,
                        selected: e.tab.index == widget._tabsRouter.activeIndex,
                        onTap: () {
                          widget._tabsRouter.setActiveIndex(e.tab.index);
                          _bottomCubit.updateToggle(e.tab);
                        },
                      ))
                  .toList());
        });
  }
}
