import 'package:get_it/get_it.dart';

import 'bottom_bar/bottom_bar_cubit.dart';
import 'login/login_cubit.dart';

class BlocDependencies {
  static void init(GetIt injector) {
    injector.registerFactory<LoginCubit>(() => LoginCubit());
    injector.registerFactory<BottomBarCubit>(() => BottomBarCubit());
  }
}
