import 'package:clan_wealth/ui/screens/wealth_list_screen.dart';
import 'package:flutter/material.dart';

class YourWealthPage extends StatefulWidget {
  @override
  _YourWealthPageState createState() => _YourWealthPageState();
}

class _YourWealthPageState extends State<YourWealthPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return WealthListScreen();
  }

  @override
  bool get wantKeepAlive => true;
}
