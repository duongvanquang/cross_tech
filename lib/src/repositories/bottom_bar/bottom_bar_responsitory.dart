import 'package:easy_localization/easy_localization.dart';

import '../../constances/assets_path.dart';
import '../../model/bottom_bar/bottom_bar_item.dart';

class BottomBarRepository {
  List<BottomBarItem> get getTabs => [
        BottomBarItem(MainTab.homePage, ImageAssetPath.imageApple,
            tr('bottom_bar.potential')),
        BottomBarItem(MainTab.contactpage, ImageAssetPath.logoSignup,
            tr('bottom_bar.target')),
        BottomBarItem(MainTab.profilePage, ImageAssetPath.imageGoogle,
            tr('bottom_bar.plan'))
      ];
}
