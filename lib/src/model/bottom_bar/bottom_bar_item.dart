enum MainTab { homePage, contactpage, profilePage, calendaPage }

class BottomBarItem {
  final MainTab tab;
  final String icon;
  final String text;

  const BottomBarItem(this.tab, this.icon, this.text);
}
