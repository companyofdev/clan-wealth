import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:clan_wealth/amplifyconfiguration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _amplifyConfigured = false;

  // Instantiate Amplify
  Amplify amplifyInstance = Amplify();

  @override
  void initState() {
    super.initState();
    _configureAmplify();
  }

  void _configureAmplify() async {
    if (!mounted) return;
    // Add Pinpoint and Cognito Plugins
    AmplifyAuthCognito authPlugin = AmplifyAuthCognito();
    amplifyInstance.addPlugin(authPlugins: [authPlugin]);

    // Once Plugins are added, configure Amplify
    await amplifyInstance.configure(amplifyconfig);
    try {
      setState(() {
        _amplifyConfigured = true;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FlutterLogin(
        onLogin: _onLogin,
        onSignup: _onSignup,
        onRecoverPassword: (_) => null,
        title: 'Clan Wealth',
      ),
    );
  }

  Future<String> _onLogin(LoginData loginData) {}

  Future<String> _onSignup(LoginData loginData) {}
}
