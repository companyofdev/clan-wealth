import 'package:clan_wealth/ui/screens/clan_page.dart';
import 'package:clan_wealth/ui/screens/wealth_list_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const kPageMap = {
  WealthListPage.pageId: 0,
  ClanPage.pageId: 1,
};

class CwBottomNavigationBar extends StatefulWidget {
  @override
  _CwBottomNavigationBarState createState() => _CwBottomNavigationBarState();
}

class _CwBottomNavigationBarState extends State<CwBottomNavigationBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 10.0,
      currentIndex: _selectedIndex,
      items: [
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.wallet),
          label: 'Your Wealth',
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.users),
          label: 'Clan Wealth',
        ),
      ],
      onTap: (int selectedValue) {
        setState(() {
          _selectedIndex = selectedValue;
        });
      },
    );
  }
}
