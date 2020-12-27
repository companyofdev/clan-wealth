import 'package:clan_wealth/ui/components/top_bar.dart';
import 'package:flutter/material.dart';

class ClanWealthPage extends StatefulWidget {
  @override
  _ClanWealthPageState createState() => _ClanWealthPageState();
}

class _ClanWealthPageState extends State<ClanWealthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TopBar(),
          Center(
            child: Text('Clan Wealth'),
          ),
        ],
      ),
    );
  }
}
