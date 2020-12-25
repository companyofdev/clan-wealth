import 'package:clan_wealth/ui/screens/clan_page.dart';
import 'package:clan_wealth/ui/screens/wealth_list_page.dart';
import 'package:clan_wealth/persistent/wealth.dart';
import 'package:flutter/material.dart';
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
        routes: {
          WealthListPage.pageId: (_) => WealthListPage(),
          ClanPage.pageId: (_) => ClanPage(),
        },
        initialRoute: WealthListPage.pageId,
      ),
    );
  }
}
