import 'package:clan_wealth/service/firebase_auth_service.dart';
import 'package:clan_wealth/ui/common_alerts.dart';
import 'package:clan_wealth/ui/common_navigate.dart';
import 'package:clan_wealth/ui/page/clan_wealth_page.dart';
import 'package:clan_wealth/ui/page/your_wealth_page.dart';
import 'package:clan_wealth/ui/page/wealth_edit_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class MasterPage extends StatefulWidget {
  @override
  _MasterPageState createState() => _MasterPageState();
}

class _MasterPageState extends State<MasterPage> {
  var _pageController = PageController();
  var _currentIndex = 0;

  var _screens = [
    YourWealthPage(),
    ClanWealthPage(),
  ];

  @override
  void initState() {
    super.initState();
  }

  _listenAuth(BuildContext context) {
    User _authUser = context.watch<User>();
    if (_authUser == null) {
      showInfoAlert(
        context: context,
        title: 'Session is expired!',
        onPressed: () {
          navigateResetToLogin(context);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    _listenAuth(context);
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _screens,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.wallet),
            label: 'Your Wealth',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.layerGroup),
            label: 'Clan Wealth',
          ),
        ],
        onTap: _onNavigationTapped,
        currentIndex: _currentIndex,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WealthEditPage(),
            ),
          );
        },
      ),
    );
  }

  void _onPageChanged(int pageIndex) {}

  void _onNavigationTapped(int selectedIndex) {
    setState(() {
      _currentIndex = selectedIndex;
    });
    _pageController.jumpToPage(selectedIndex);
  }
}
