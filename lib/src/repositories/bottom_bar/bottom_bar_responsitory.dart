import 'package:easy_localization/easy_localization.dart';

import '../../constances/assets_path.dart';
import '../../model/bottom_bar/bottom_bar_item.dart';

class BottomBarRepository {
  List<BottomBarItem> get getTabs => [
        BottomBarItem(MainTab.homePage, ImageAssetPath.bottomHome,
            tr('bottom_tabbar.home_page')),
        BottomBarItem(MainTab.contactpage, ImageAssetPath.bottomContact,
            tr('bottom_tabbar.contact_page')),
        BottomBarItem(MainTab.calendaPage, ImageAssetPath.bottomCalenda,
            tr('bottom_tabbar.calenda_page')),
        BottomBarItem(MainTab.profilePage, ImageAssetPath.bottomProfile,
            tr('bottom_tabbar.profile_page'))
      ];
}
