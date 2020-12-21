import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  final int selectedIndex;

  final Function onTap;

  const BottomNavigation({this.selectedIndex, this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'Wealth',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.group),
          label: 'Clan',
        ),
      ],
      currentIndex: selectedIndex,
      onTap: onTap,
    );
  }
}
