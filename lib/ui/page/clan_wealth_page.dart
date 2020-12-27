import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:clan_wealth/ui/components/top_bar.dart';
import 'package:clan_wealth/ui/page/login_page.dart';
import 'package:flutter/material.dart';

class ClanWealthPage extends StatefulWidget {
  @override
  _ClanWealthPageState createState() => _ClanWealthPageState();
}

class _ClanWealthPageState extends State<ClanWealthPage> {
  Future<AuthUser> _futureAuthUser;

  @override
  void initState() {
    super.initState();
    _initAuth();
  }

  void _initAuth() {
    _futureAuthUser = Amplify.Auth.getCurrentUser();
    _futureAuthUser.then((authUser) {
      print('Finish loading user:');
      if (authUser == null) {
        _navigateLoginPage(context);
      }
    }).catchError((err) {
      print('Get authUser error: $err');
      _navigateLoginPage(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder(
        future: _futureAuthUser,
        builder: (context, AsyncSnapshot<AuthUser> snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            final AuthUser _authUser = snapshot.data;
            print(_authUser.username);
            return Scaffold(
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TopBar(),
                  Center(child: Text('Abc: ${_authUser.username}')),
                  RaisedButton(
                    onPressed: _signOut,
                    child: Text('Sign out'),
                  )
                ],
              ),
            );
          }
          return Container(
            child: Center(
              child: Text('Waiting....'),
            ),
          );
        },
      ),
    );
  }

  void _navigateLoginPage(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }

  void _signOut() {
    Amplify.Auth.signOut();
    _navigateLoginPage(context);
  }
}
