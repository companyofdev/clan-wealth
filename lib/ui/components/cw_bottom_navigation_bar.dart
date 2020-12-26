import 'package:flutter/material.dart';

class TabItem {
  final Icon icon;
  final String label;
  final Widget page;
  TabItem({this.icon, this.label, this.page});
}

class CwBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function onSelectTab;
  final List<TabItem> tabItems;

  const CwBottomNavigationBar(
      {this.currentIndex, this.onSelectTab, this.tabItems});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 10.0,
      currentIndex: 0,
      items: _buildTabItems(),
      onTap: onSelectTab,
    );
  }

  _buildTabItems() {
    print(tabItems.length);
    return tabItems
        .map((tab) => BottomNavigationBarItem(
              icon: tab.icon,
              label: tab.label,
            ))
        .toList();
  }
}
