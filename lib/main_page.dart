import 'package:clan_wealth/colors.dart';
import 'package:clan_wealth/screens/wealth.dart';
import 'package:flutter/material.dart';

import 'components/cw_bottom_navigation_bar.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kAppBarBackground,
        title: Text('Clan Wealth'),
        actions: [
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {},
          )
        ],
      ),
      body: WealthScreen(),
      bottomNavigationBar: CwBottomNavigationBar(),
    );
  }
}
