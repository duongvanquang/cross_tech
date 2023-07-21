import 'package:get_it/get_it.dart';

import 'bottom_bar/bottom_bar_responsitory.dart';

class RepositoriesDependencies {
  static bool init(GetIt injector) {
    try {
      injector
          .registerFactory<BottomBarRepository>(() => BottomBarRepository());
    } catch (ex) {
      return false;
    }
    return true;
  }
}
