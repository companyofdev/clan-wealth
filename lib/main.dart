import 'package:clan_wealth/provider/wealth_provider.dart';
import 'package:clan_wealth/service/auth_service.dart';
import 'package:clan_wealth/service/wealth_service.dart';
import 'package:clan_wealth/ui/page/login_page.dart';
import 'package:clan_wealth/ui/page/master_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        Provider<AuthService>(
          create: (_) => AuthService.instance,
        ),
        Provider<WealthService>(
          create: (context) => WealthService.instance,
        ),
        ChangeNotifierProvider<WealthProvider>(
          create: (_) => WealthProvider(),
        ),
        StreamProvider(
            create: (context) => context.read<AuthService>().authStateChanges),
      ],
      child: MaterialApp(
        title: 'Clan of Wealth',
        theme: ThemeData.dark(),
        home: AuthenticationWrapper(),
        builder: EasyLoading.init(),
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authUser = context.watch<User>();
    if (authUser != null) {
      return MasterPage();
    }
    return LoginPage();
  }
}
