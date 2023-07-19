import 'package:get_it/get_it.dart';

import 'login/login_cubit.dart';

class BlocDependencies {
  static void init(GetIt injector) {
    injector.registerFactory<LoginCubit>(() => LoginCubit());
  }
}
