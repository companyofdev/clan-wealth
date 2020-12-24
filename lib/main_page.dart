import 'package:clan_wealth/ui/components/cw_bottom_navigation_bar.dart';
import 'package:clan_wealth/ui/components/wealth_list.dart';
import 'package:clan_wealth/ui/screens/wealth_edit.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
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
      body: WealthList(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WealthEditScreen(),
            ),
          );
        },
      ),
      bottomNavigationBar: CwBottomNavigationBar(),
    );
  }
}
