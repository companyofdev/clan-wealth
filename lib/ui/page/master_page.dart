import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:clan_wealth/ui/page/clan_wealth_page.dart';
import 'package:clan_wealth/ui/page/login_page.dart';
import 'package:clan_wealth/ui/page/your_wealth_page.dart';
import 'package:clan_wealth/ui/page/wealth_edit_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MasterPage extends StatefulWidget {
  @override
  _MasterPageState createState() => _MasterPageState();
}

class _MasterPageState extends State<MasterPage> {
  var _pageController = PageController();
  var _currentIndex = 0;
  Future<AuthUser> _futureAuthUser;

  var _screens = [
    YourWealthPage(),
    ClanWealthPage(),
  ];

  @override
  void initState() {
    super.initState();
    _initAuth();
  }

  void _initAuth() {
    _futureAuthUser = Amplify.Auth.getCurrentUser();
    _futureAuthUser.then((authUser) {
      print('Finish loading user:');
      if (authUser == null) {
        _navigateLoginPage(context);
      }
    }).catchError((err) {
      print('Get authUser error: $err');
      _navigateLoginPage(context);
    });
  }

  void _navigateLoginPage(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
