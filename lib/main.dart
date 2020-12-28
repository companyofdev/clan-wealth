import 'package:clan_wealth/ui/page/master_page.dart';
import 'package:clan_wealth/persistent/wealth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
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
    return MultiProvider(
      providers: [
        Provider<WealthDatabase>(create: (_) => WealthDatabase()),
      ],
      child: MaterialApp(
        title: 'Clan of Wealth',
        theme: ThemeData.dark(),
        home: MasterPage(),
        builder: EasyLoading.init(),
      ),
    );
  }
}
