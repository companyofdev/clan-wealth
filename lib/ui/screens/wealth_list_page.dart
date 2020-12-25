import 'package:clan_wealth/ui/components/cw_bottom_navigation_bar.dart';
import 'package:clan_wealth/ui/components/wealth_list.dart';
import 'package:clan_wealth/ui/components/wealth_container.dart';
import 'package:clan_wealth/ui/screens/wealth_edit_page.dart';
import 'package:flutter/material.dart';

class WealthListPage extends StatelessWidget {
  static const String pageId = 'wealth_list_page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: WealthContainer(
          body: WealthList(),
        ),
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
      bottomNavigationBar: CwBottomNavigationBar(),
    );
  }
}
