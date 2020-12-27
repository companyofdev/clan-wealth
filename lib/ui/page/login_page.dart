import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:clan_wealth/ui/page/clan_wealth_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isSignUpComplete;

  bool _isSignInComplete;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterLogin(
        theme: LoginTheme(
          textFieldStyle: TextStyle(color: Colors.white),
        ),
        onLogin: _onLogin,
        onSignup: _onSignUp,
        onRecoverPassword: (_) => null,
        onSubmitAnimationCompleted: _onAuthCompleted,
        title: 'Clan Wealth',
        showDebugButtons: false,
      ),
    );
  }

  Future<String> _onLogin(LoginData loginData) async {
    try {
      SignInResult res = await Amplify.Auth.signIn(
        username: loginData.name,
        password: loginData.password,
      );
      setState(() {
        _isSignInComplete = res.isSignedIn;
        print(
            "Signed in: " + (_isSignInComplete ? "Complete" : "Not Complete"));
      });
      _onAuthCompleted();
    } on AuthError catch (ex) {
      print(ex.cause);
      return "Sign in error: " + ex.cause;
    }
    return null;
  }

  Future<String> _onSignUp(LoginData loginData) async {
    try {
      Map<String, dynamic> userAttributes = {
        "email": loginData.name,
      };
      SignUpResult res = await Amplify.Auth.signUp(
        username: loginData.name,
        password: loginData.password,
        options: CognitoSignUpOptions(userAttributes: userAttributes),
      );
      setState(() {
        _isSignUpComplete = res.isSignUpComplete;
        print("Sign up: " + (_isSignUpComplete ? "Complete" : "Not Complete"));
      });
      if (_isSignUpComplete)
        Alert(context: context, type: AlertType.success, title: "Login Success")
            .show();
    } on AuthError catch (err) {
      print(err);
      Alert(context: context, type: AlertType.error, title: "Login Failed")
          .show();
      return 'Register error: ${err.cause}';
    }
    return null;
  }

  void _onAuthCompleted() {
    print('_onAuthCompleted');
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => ClanWealthPage(),
      ),
    );
  }
}
