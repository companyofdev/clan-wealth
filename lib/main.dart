import 'package:clan_wealth/components/bottom_navigation.dart';
import 'package:clan_wealth/screens/clan.dart';
import 'package:clan_wealth/screens/home.dart';
import 'package:clan_wealth/screens/wealth.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  static List<Widget> _screens = <Widget>[
    HomeScreen(),
    WealthScreen(),
    ClanScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clan Wealth'),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigation(
        selectedIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            this._selectedIndex = index;
          });
        },
      ),
    );
  }
}
