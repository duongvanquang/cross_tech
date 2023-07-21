import 'package:get_it/get_it.dart';

import 'blocs/bloc_dependencies.dart';
import 'model/model_dependencies.dart';
import 'repositories/repository_dependencies.dart';
import 'routes/app_router.dart';

class AppDependencies {
  static GetIt get injector => GetIt.I;
  static Future<bool> appInit() async {
    BlocDependencies.init(injector);
    injector.registerFactory<AppRouter>(() => AppRouter());
    ModelDependencies.init(injector);
    RepositoriesDependencies.init(injector);
    return true;
  }
}
