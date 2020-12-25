import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    );
  }
}
