import 'package:clan_wealth/ui/components/cw_bottom_navigation_bar.dart';
import 'package:clan_wealth/ui/screens/clan_page.dart';
import 'package:clan_wealth/ui/screens/wealth_edit_page.dart';
import 'package:clan_wealth/ui/screens/wealth_list_page.dart';
import 'package:clan_wealth/persistent/wealth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Provider(
      create: (_) => WealthDatabase(),
      child: MaterialApp(
        title: 'Clan of Wealth',
        theme: ThemeData.dark(),
        home: MasterPage(),
      ),
    );
  }
}

class MasterPage extends StatefulWidget {
  @override
  _MasterPageState createState() => _MasterPageState();
}

class _MasterPageState extends State<MasterPage> {
  int _currentIndex = 0;
  final _tabItems = [
    TabItem(
        label: 'Your Wealth',
        icon: Icon(FontAwesomeIcons.wallet),
        page: WealthListPage()),
    TabItem(
        label: 'Clan Wealth',
        icon: Icon(FontAwesomeIcons.layerGroup),
        page: ClanPage()),
  ];

  void _selectTab(int selectedIndex) {
    setState(() {
      _currentIndex = selectedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabItems[_currentIndex].page,
      bottomNavigationBar: CwBottomNavigationBar(
        currentIndex: _currentIndex,
        onSelectTab: _selectTab,
        tabItems: _tabItems,
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
}
