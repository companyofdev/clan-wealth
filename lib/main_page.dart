import 'package:clan_wealth/apis/wealth_api.dart';
import 'package:clan_wealth/screens/wealth.dart';
import 'package:clan_wealth/screens/wealth_insert.dart';
import 'package:flutter/material.dart';

import 'components/cw_bottom_navigation_bar.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Wealth> _wealths;

  @override
  void initState() {
    _wealths = getWealths();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: kBackgroundColor,
      appBar: AppBar(
        // backgroundColor: kAppBarBackground,
        title: Text('Clan Wealth'),
        actions: [
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {},
          )
        ],
      ),
      body: WealthScreen(
        wealths: _wealths,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WealthInsertScreen(),
            ),
          ).then((value) {
            setState(() {
              _wealths = getWealths();
            });
          });
        },
      ),
      bottomNavigationBar: CwBottomNavigationBar(),
    );
  }
}
