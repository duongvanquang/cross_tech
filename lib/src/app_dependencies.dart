import 'package:get_it/get_it.dart';

import 'blocs/bloc_dependencies.dart';

class AppDependencies {
  static GetIt get injector => GetIt.I;
  static Future<bool> appInit() async {
    BlocDependencies.init(injector);
    return true;
  }
}
