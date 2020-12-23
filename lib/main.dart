import 'package:clan_wealth/main_page.dart';
import 'package:clan_wealth/persistent/wealth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => WealthDatabase().wealthDao,
      child: MaterialApp(
        title: 'Clan of Wealth App',
        theme: ThemeData.dark(),
        home: MainPage(),
      ),
    );
  }
}
