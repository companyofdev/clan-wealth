import 'package:clan_wealth/colors.dart';
import 'package:clan_wealth/components/cw_bottom_navigation_bar.dart';
import 'package:clan_wealth/main_page.dart';
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
        primaryColor: kPrimaryColor,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainPage(),
    );
  }
}
